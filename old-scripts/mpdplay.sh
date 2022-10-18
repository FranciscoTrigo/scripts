#!/bin/bash

###This script show the song MPD is playing in the " %artist - %title [%album]" format.
##Ill add suport to select how to display it.
##This script was meant for irssi mostly.

mpc --format "Now playing %artist% - %title% #[%album%#]" | head -n 1 
