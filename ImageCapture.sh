#!/bin/bash

while true; do

        if [[ `ps aux | grep "ruby ImageCapture.rb" | awk 'END {print NR}'` -ne 2 ]]; then

                ruby /home/anthony/Documents/Ruby/ImageCapture.rb;

                #find / -name "ImageCapture.rb" -exec ruby {} \;

        fi

    sleep 2;

done
