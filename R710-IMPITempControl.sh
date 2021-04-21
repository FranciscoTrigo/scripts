#!/bin/bash

# ----------------------------------------------
#  This script checks the temperature using the ambient temperature sensor
#  and if it is high it will run IPMI command to re enable dynamic control of fan
#  otherwise it sets the fan tho low speed to be less loud
#  Requires ipmitool to be installed
# -------------------------------------------

# IPMI settings
# set these variables please!
IPMIHOST=192.168.1.7
IPMIUSER=root
IPMIPW=calvin

# disable automatic control of fans
ipmitool -I lanplus -H $IPMIHOST -U $IPMIUSER -P $IPMIPW raw 0x30 0x30 0x01 0x00

# set fans to 3%
ipmitool -I lanplus -H $IPMIHOST -U $IPMIUSER -P $IPMIPW raw 0x30 0x30 0x02 0xff 0x3
