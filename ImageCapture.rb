#!/usr/bin/ruby

# Perls use equivalent
require 'net/smtp'
require 'rubygems'
require 'hornetseye_v4l2'
require 'hornetseye_xorg'
require 'hornetseye_rmagick'

include Hornetseye

attachment = 'perp.png'

# Def is the same as Perl's sub. Writing our own function.
def watch_for(file,pattern)
	f = File.open(file,"r")

	# Since this file exists and is growing, seek to the end of the most recent entry
	f.seek(0, IO::SEEK_END)

while true do

	# Poll for data
	select([f])

	if f.gets =~ pattern
		#File.open("/home/anthony/Documents/Ruby/tmpCount", File::RDWR) {|wrt| wrt.write "Failed attempt\n"}
		camera = V4L2Input.new '/dev/video0'
		img = camera.read
		img.to_ubytergb.save_ubytergb 'perp.png'
	

	 exit

	end
 end

end

fileName = "/var/log/auth.log"
regex = "/.*sudo.*auth.*authentication.*failure/"

watch_for(fileName, /sudo:auth.*:\sauthentication\sfailure/)
