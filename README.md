ImageCapture.rb
===============

JUST A ROUGH DRAFT. WILL FIX UP... EVENTUALLY!

A program to capture webcam images "DURING" login failures.

You need to edit your login daemons pam file. I use Linux Mint over Gnome3(not mate). So I modified the gdm-password file in the /etc/pam.d/ directory.

I prepended this line 
auth sufficient pam_listfile.so item=user file=/path/to/userAuthFile sense=allow onerr=succeed

to my gdm-password file. Read here for a breakdown of this pam SO file http://linux.die.net/man/8/pam_listfile

googles GeoLocation API for Ruby https://developers.google.com/api-client-library/ruby/start/get_started

I am renting a web space from a host and have built a page to log geolocation. It is very accurate. The page is a mix of HTML5, JavaScript and PHP. The location is grabbed with HTML and JS and the data is passed to the php file. This is the file http://trutechdesigns.com/ I have included the HTML%/JS file as well as the PHP script. 

The Ruby program opens your broswer with my site and your location is emailed within seconds. The Ruby program then closes the tab. So you have no clue that this just happened.

The program is run as root and in order to run chrome from the command line as root, you need to pass it the --user-data-dir switch. You must point it to a non-root directory. You also need the chrome webdriver binary and add it to your path. Then copy to /usr/bin or where ever you want/need to place it. 

Here is watirs site http://watirwebdriver.com/chrome/

here is the dir that the webdriver binary reside in http://chromedriver.storage.googleapis.com/index.html

Watir is pretty cool! It opens your browser with the supplied url, then closes if specified.


DEPENDENCIES TO GET CHROME TO LAUNCH FROM THE COMMAND LINE

# libudev-dev enables you to launch Google Chrome from the command line.
        sudo apt-get install libudev-dev

# For a 32 bit system. If Google chrome will not launch from the command line then you must install libudev-dev
# as stated above then link the shared object libraries with the following command.
        sudo ln -sf /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0

# .SO linker command for a 64 bit system.
        sudo ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0

To be continued .....
