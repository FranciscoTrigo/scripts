#!/bin/bash

layout=$(tail ~/.kb_layout)

if [ $layout = Qwerty ]; then
   echo "Qwerty"
else
   echo "Dvorak"
fi

