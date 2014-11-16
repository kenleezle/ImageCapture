ImageCapture.rb
===============

A program to capture webcam images "DURING" login failures.

You need to edit your login daemons pam file. I use Linux Mint over Gnome3(not mate). So I modified the gdm-password file in the /etc/pam.d/ directory.

I prepended this line 
auth sufficient pam_listfile.so item=user file=/path/to/userAuthFile sense=allow onerr=succeed

to my gdm-password file. Read here for a breakdown of this pam SO file http://linux.die.net/man/8/pam_listfile

googles GeoLocation API for Ruby https://developers.google.com/api-client-library/ruby/start/get_started

I am renting a web space from a host and have built a page to log geolocation. It is very accurate. The page is a mix of HTML5, JavaScript and PHP. The location is grabbed with HTML and JS and the data is passed to the php file. This is the file http://trutechdesigns.com/ I have included the HTML%/JS file as well as the PHP script. 

The Ruby program opens your broswer with my site and your location is emailed within seconds. The Ruby program then closes the tab. So you have no clue that this just happened.

To be continued .....
