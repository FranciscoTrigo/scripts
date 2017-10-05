#!/bin/bash
#
# Script to exectute after starting X. I have problems with some WM if i execute these commands before the WM in .xinitrc.


#Setting monitor and capture output to 1080p and mirror
#xrandr --output HDMI-1 --mode 1920x1080
#xrandr --output VGA-1  --mode 1920x1080
#mons -d

#feh --bg-scale /media/NAS/images/wallpapers/rem.jpg

#Transparency
compton -b
