#!/bin/bash

# display usage if full argument isn't given
if [[ -z $@ ]]; then
  echo ' calc "<input>" <*decimals> - command line calculator (-h for example)'
  exit 1
fi

# decimal to be carried out to, uses default (4) unless value is given
if [[ -z $2 ]]; then
  decimals=4; else
  decimals=$2
fi

case $1 in
  -h )  echo ' calc "5*((2^3*2)/1.352)"'
        echo ' calc "p=10; n=9; p*n+10"' ;;
  *  )  echo "scale=$decimals;$1" | bc
esac
