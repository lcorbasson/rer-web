# RER::Web

![Screenshot](http://van-der.iiens.net/blogstuff/rer-web.png)

This web app is yet another variation on the "how can I possibly display the
timetable for the 6 next trains in any way I can imagine" theme.  Only this
time, it tries to be classy.  It is primarily intended for display on medium
(tablet/desktop) or large screens (TVs), while trying not to break too badly on
cellphones.

See it in action at [http://x0r.fr/rer](http://x0r.fr/rer).

I know the SNCF's website does the same thing, but let's face it, this
interface is sexier.  Also, because this was an AJAX and Javascript exercise
for myself, please try not to be too harsh on the "but this is useless"
remarks.

# Installing

Initialize the station database as follows:

	% sqlite3 gares.db < db.sql

Then, deploy it as you would any Perl Dancer application.  If you really
have no idea, read the [Dancer::Deployment Perldoc](https://metacpan.org/module/Dancer::Deployment).
