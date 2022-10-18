#!/bin/bash

#This script is meant to show info about the song mpd is playing.


mpc --format "listens to: %title% - %artist%  #[ %album% #]" | head -n 1
