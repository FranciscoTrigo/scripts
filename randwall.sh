#!/bin/bash
##### 
#   Random wallpaper seeter, this scripts runs with the help of Cron
#   so it randomly changes the wallpaper every x time, set by the user.
#   It choses from portrait or landscape wallpapers depending on the 
#   current orientation of the monitor.
#   Ir uses feh, but should be easy to change to other programs.
#   Contact: Yami@yamifrankc.com
#####

# Grab current monitor orientation
status=$(cat ~/.monitorstatus)

if [ $status = portrait ]
	then
		DISPLAY=:0.0 feh --randomize --bg-scale /media/NAS/images/wallpapers/portrait_mode
	else
		DISPLAY=:0.0 feh --randomize --bg-scale /media/NAS/images/wallpapers/landscape
	fi
