#!/bin/bash

qwerty=$(tail ~/.kb_layout)

if [ $qwerty = dvorak ]; then
:x
else
   xmodmap .xmodmap
fi
