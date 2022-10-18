#!/bin/bash

cows=(apt beavis.zen bong bud-frogs bunny cheese cower daemon default dragon dragon-and-cow elephant elephant-in-snake eyes flaming-sheep ghostbusters hellokitty kitty koala kosh luke-koala mech-and-cow meow milk moofasa moose mutilated ren satanic sheep skeleton small stegosaurus stimpy supermilker surgery three-eyes turkey turtle tux udder vader vader-koala www)
random=RANDOM%44
col="\033[1;34m";
norm="\033[0;39m";
echo -e -n $col;
cowsay -f ${cows[random]} `fortune`
echo -e -n $norm;

