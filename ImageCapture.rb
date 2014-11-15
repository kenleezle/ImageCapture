#!/usr/bin/ruby-2.0.0-p594

require 'mail'
require 'google/api_client'
require 'hornetseye_v4l2'
require 'hornetseye_xorg'
require 'hornetseye_rmagick'

include Hornetseye

class DataMailer
  require 'mail'
end

class ImageCapture < DataMailer

  def auth(authFile, user)
    if authFile.nil?
      puts "Authorization file was not provided or does not exist."
      return false
    else
      @authFile = authFile
    end

    if user.nil?
      puts "User name was not provided."
      return false
    else
      @user = user
    end
  end

  def eraseFile
    File.open(@authFile, "w") {|file| file.truncate(0)}
  end

  def tail(tailFile, regex)
    if tailFile.nil?
      puts "Please provide a file to tail."  
      return
    else
      f = File.open(tailFile, "r")
      f.seek(0, IO::SEEK_END)

      while true do
      select([f])

      if f.gets =~ regex
        camera = V4L2Input.new '/dev/video0'
        img = camera.read
        img.to_ubytergb.save_ubytergb 'capture.png'
        File.open(@authFile, "w") { |file| file.write("#{@user}\n") }
        break
      end

     end # End of while true do

    end

  end

end

ImgCap = ImageCapture.new
ImgCap.auth("/home/anthony/Documents/Ruby/auth", "anthony")
ImgCap.eraseFile
ImgCap.tail("/var/log/auth.log", /gdm-password:auth.*:\sauthentication\sfailure/)

def dataMailer(port, imgName, imgPath)

  Mail.defaults do
    delivery_method :smtp, address: "localhost", port: port
  end

  mail = Mail.new do
    from     'amboxer21@gmail.com'
    to       'amboxer21@gmail.com'
    subject  'Image Captured'
    body     'Captured image'
    add_file :filename => imgName, :content => File.read(imgPath + imgName)
  end

mail.delivery_method :sendmail
mail.deliver
end
dataMailer(445, 'capture.png', '/home/anthony/Documents/Ruby/')
