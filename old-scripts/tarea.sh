#!/bin/bash

##
#This script is to remind me to do homework
# o.o
# ##

DAY=$(date +%A)
MONTH=$(date +%B)
DAYN=$(date +%d)
HOUR=$(date +%H)
MIN=$(date +%M)
MONTHN=$(date +%m)
YEAR=$(date +%Y)

echo "Have you done your homework today?"
echo "Today is $DAY $DAYN of $MONTH ( $DAYN/$MONTHN/$YEAR ) and its $HOUR:$MIN"
echo "Go check your notebook before going in IRC!"
echo " "
echo " "
###
# Here it should tell me the schedule of today, and tomorrow

horario
echo " "
echo " "
