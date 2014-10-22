#!/usr/bin/perl

package RER::Transilien;

use strict;
use warnings;
use utf8;
use 5.010;

use JSON::XS;
use RER::Results;
use RER::Gares;
use List::Util qw(min);
use Dancer qw(:syntax config debug error);




sub new {
    my %param = @_;

    my @trains;

    # Obtention des trigrammes correspondant aux gares recherchées
    my $gare_from;

    $gare_from = RER::Gares::find(code => $param{'from'})
        || die $param{'from'} . ": gare non trouvée\n";

    if (! defined $param{ds}) {
        die "Pas de datasources passés en argument à RER::Transilien::new()\n";
    }
    my @ds = @{$param{ds}};

    my @messages = ();

    my $data = eval { 
        for my $i (0..$#ds) { 
            if (($i == 0)
                && (! grep /^[CL]$/, @{RER::Gares::get_lines($gare_from)})
                && config->{restrict_lines}) {
                next;
            }
            if ($i == 1) {
                push @messages, "Attention, les horaires affichés sont théoriques. "
                        . "Renseignez-vous en gare pour vérifier si votre train est "
                        . "à l'heure et n'est pas supprimé.";
                push @messages, "Les horaires temps réel sont uniquement disponibles "
                        . "pour les gares des lignes C et L du Transilien.  Ils seront "
                        . "accessibles pour l'ensemble des gares Transilien avant fin "
                        . "février 2014.";
            }

            my $data = eval { $ds[$i]->get_next_trains($gare_from); };
            error $@ if $@;
            return $data unless $@;
        }
    };

    for (my $i = 0; $i < scalar(@$data); $i++) {
        my $train = $data->[$i];
        next if ! defined $train;

        my $today = ($train->real_time) ? $train->real_time->ymd('-') 
            : ($train->due_time) ? $train->due_time->ymd('-')
            : `date +'%Y-%m-%d'`;

        my $train2 = $ds[1]->get_info_for_train($today, $gare_from->code, $train->number);
        if ($train2 && $train2->[0]) {
            $train = $train->merge($train2->[0]);
        }

        my $terminus_name = ($train->terminus) ? $train->terminus->name : "?";

        my $time = ($train->real_time) ? $train->real_time->time :
            ($train->due_time) ? $train->due_time->time :
            "--:--";
        $time = substr $time, 0, 5;



        my ($delay, $delay_str);
        if ($train->real_time && $train->due_time) {
            $delay = $train->real_time - $train->due_time;
            $delay = $delay->in_units('minutes');

            $delay_str = sprintf "%+d h %02d", 
                        (int($delay / 60)),
                        (abs($delay % 60))  if abs $delay >= 60;
            $delay_str = sprintf "%+d min", $delay if abs $delay < 60;
            $delay_str = "à l'heure" if $delay == 0;
        }

        my @arr_dessertes;
        my $dessertes = "Desserte indisponible";
        if ($train->stations) {
            @arr_dessertes = map { $_ ? ($_->name || $_->uic) : "Gare non trouvée" } @{$train->stations};
            $dessertes = join ' &bull; ', @arr_dessertes;
        }


        # L'attribut "status" indique si le train est retardé, supprimé...
        my $time_info;
        my $trainclass;
        my $col2class;
        given ($train->status) {
            when ('N') { # rien = Normal
                $time_info = $time;
                $trainclass = 'train';
                $col2class = 'col2';
            }; 
            when ('R') { 
                $time_info = 'Retardé'; 
                $trainclass = 'train delayed';
                $col2class = 'col2 texte';
            };
            when ('S') { 
                $time_info = 'Supprimé';
                $trainclass = 'train canceled';
                $col2class = 'col2 texte';
            };
            when ('P') { 
                $time_info = 'À l\'approche';
                $trainclass = 'train';
                $col2class = 'col2 approche';
            };
            when ('Q') { 
                $time_info = 'À quai';
                $trainclass = 'train';
                $col2class = 'col2 texte';
            };
            default { 
                $time_info = "$time (MENTION '" . ($train->status || 'undef') . "' INCONNUE)"; 
                $trainclass = 'train';
                $col2class = 'col2 texte';
            };
        }

        push @trains, { 
            mission => $train->code, 
            numero  => $train->number,
            time    => $time_info,
            destination => $terminus_name,
            dessertes   => $dessertes,
            platform => $train->platform,
            col2class => $col2class,
            trainclass => $trainclass,
            retard => $delay_str,
            ligne => $train->line,
        };
    }

    return RER::Results->new(
        from => $gare_from,
        trains => \@trains,
        messages => \@messages
    );
}




1;

# vi:ts=4:sw=4:et
