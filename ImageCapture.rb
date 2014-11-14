#!/usr/bin/ruby-2.0.0-p594

require 'hornetseye_v4l2'
require 'hornetseye_xorg'
require 'hornetseye_rmagick'

include Hornetseye

File.open("/home/anthony/Documents/Ruby/auth","w") {|file| file.truncate(0)}
# Writing my own function for TAIL
def tail(file, pattern)
  f = File.open(file,"r")
  # Since this file exists and is growing, seek to the end of the most recent entry
  f.seek(0, IO::SEEK_END)

  count = 0
  while true do
  # Poll for data
  select([f])

  count = 0
  if f.gets =~ pattern
    #File.open("/home/anthony/Documents/Ruby/tmpCount", File::RDWR) {|wrt| wrt.write "Failed attempt\n"}
    camera = V4L2Input.new '/dev/video0'
    img = camera.read
    img.to_ubytergb.save_ubytergb 'capture.png'
    File.open("/home/anthony/Documents/Ruby/auth", "w") { |file| file.write("anthony\n") }
    break
   end
  end
end
tail("/var/log/auth.log", /gdm-password:auth.*:\sauthentication\sfailure/)
