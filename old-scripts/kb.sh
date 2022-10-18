#!/bin/bash

layout=$(tail ~/.kb_layout)

if [ $layout = qwerty ]; then
   xmodmap .xmodmap-dvorak; sed s/qwerty/dvorak/ -i ~/.kb_layout
else
   xmodmap .xmodmap;sed s/dvorak/qwerty/ -i ~/.kb_layout
fi
