#!/bin/bash

# This is a simple script to take screenshots in the SwayWM.
# You need to install grim and swappy
# Once you run it, you will be able to make a rectangular selection of the screen for it to be taken as
# a screen shot. After that a swappy window will open where you will be able to modify it; and then save
# or ocpy to the clipboard.

# Very useful to bind this to a key!

grim -g "$(slurp)" - | swappy -f -
