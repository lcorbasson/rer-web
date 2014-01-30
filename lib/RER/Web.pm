package RER::Web;
use Dancer ':syntax';

use RER::Transilien;
use RER::Trains;
use RER::Gares;
use RER::DataSource::Transilien;
use RER::DataSource::TransilienGTFS;
use RRD::Simple;
use Data::Dumper;
use Storable qw(dclone);

our $VERSION = '0.1';



my %train_obj;
my %train_obj_last_update;

my %stats;


sub check_code {
    my ($code) = @_;

    return undef unless $code;

    $code = uc $code;

    if($code =~ /^(?:[A-Z]{1,3}|NC[1-6])$/) {
        return $code;
    }
    else {
        return undef;
    }
}


sub rrd_update {
    my $rrd = RRD::Simple->new(file => config->{'rrd_file'});
    if (! -e config->{'rrd_file'}) {
        $rrd->create(
            'week',
            api_call       => 'ABSOLUTE',
            api_failure    => 'ABSOLUTE'
        );
    }

    eval {
        $rrd->update(time,
                     api_call    => $stats{api_call} || 0,
                     api_failure => $stats{api_failure} || 0,
                     users       => (exists $stats{users}) ? scalar @{$stats{users}} : 0,
                 );
    };
}

sub stats_add {
    my ($key, $value) = @_;

    if (!defined ($value)) {
        $stats{$key}++;
    } else {
        $stats{$key} = $value;
    }

    rrd_update;

    %stats = ();
}



hook 'before' => sub {
    $RER::Gares::config{dsn} = config->{'db_dsn'};
    $RER::Gares::config{username} = config->{'db_username'};
    $RER::Gares::config{password} = config->{'db_password'};
    RER::Gares::db_connect();
};

get '/' => sub {
    # rediriger (302) vers l'url /?s=<blah> si l'user a sauvegardé sa dernière gare
    if (cookie("station") && ! defined params->{'s'})
    {
        redirect "?s=" . cookie("station");
    }

    # sinon, examiner le header http
    my $origin_code = check_code(params->{'s'});
    $origin_code ||= 'EVC';

    my $origin_station = RER::Gares::find(code => $origin_code)->name;
    utf8::decode($origin_station);

    # positionner le cookie (valable 4 semaines)
    # on y touche dans le code js, donc http_only = 0
    cookie "station" => check_code($origin_code), 
        expires => '4w', 
        http_only => 0;

    template 'rer', {
    	origin_station => $origin_station,
        origin_code => $origin_code,
        dmaj     => RER::Gares::get_last_update(),
        stations => RER::Gares::get_stations(),
    };
};

get '/json' => sub {
    header 'Cache-Control' => 'no-cache';

    set serializer => 'JSON';

    my $code = check_code(params->{'s'}) || 'EVC';
    my $line = params->{'l'};

    my $ds  = RER::DataSource::Transilien->new(
        url         => config->{'sncf_url'},
        username    => config->{'sncf_username'},
        password    => config->{'sncf_password'});
    my $ds2 = RER::DataSource::TransilienGTFS->new(
        dsn		=> config->{'db_dsn'},
        username	=> config->{'db_username'},
        password	=> config->{'db_password'});

    if (config->{restrict_lines}) {
        if (! grep /^[CL]$/, @{RER::Gares::get_lines(RER::Gares::find(code => $code))}) {
            return ( { 
                       trains => [], 
                       info => [ "Pas d'informations sur cette gare. Seules les gares des lignes C et L sont prises en charge pour le moment." ] 
                   } );  
        }
    }

    if (!defined $train_obj_last_update{$code} 
        || time - $train_obj_last_update{$code} > 10) {

        stats_add 'api_call';
        if ( ! exists $stats{'users'} ) {
            stats_add 'users', [ request->address() ];
        } elsif ( ! grep { $_ eq request->address() } @{$stats{'users'}}) {
            push @{$stats{'users'}}, request->address();
        }


        eval {
            $train_obj{$code} = RER::Transilien::new(
                from => $code,
                ds   => [ $ds, $ds2 ],
            );
        };
        if (my $err = $@) {
            status 503;
            stats_add 'api_failure';
            $train_obj_last_update{$code} = undef;

            # log error
            error "$code: $err";

            # return error to client
            return { error => $err };
        } else {
            $train_obj_last_update{$code} = time;
        }
    }

    # Filtrer par ligne si cela est désiré
    my $ret = dclone($train_obj{$code});

    if ($line) {
        @{$ret->{trains}} = grep { $_->{ligne} && $_->{ligne} eq $line } @{$ret->{trains}};
    }
    # Limiter à 6 le nombre de trains renvoyés
    if (scalar @{$ret->{trains}} > 6) {
        @{$ret->{trains}} = @{$ret->{trains}}[0..5];
    }
    
    return $ret;
};

get '/autocomp' => sub {
    header 'Cache-Control' => 'no-cache';

    set serializer => 'JSON';

    my $str = params->{'s'} || '';

    return RER::Gares::get_autocomp($str);
};

true;

# vi:ts=4:sw=4:et:
