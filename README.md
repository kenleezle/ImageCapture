ImageCapture.rb
===============

A program to capture webcam images "DURING" login failures.

You need to edit your login daemons pam file. I use Linux Mint over Gnome3(not mate). So I modified the gdm-password file in the /etc/pam.d/ directory.

I prepended this line 
auth sufficient pam_listfile.so item=user file=/path/to/userAuthFile sense=allow onerr=succeed

to my gdm-password file. Read here for a breakdown of this pam SO file http://linux.die.net/man/8/pam_listfile

googles GeoLocation API for Ruby https://developers.google.com/api-client-library/ruby/start/installation

To be continued .....
