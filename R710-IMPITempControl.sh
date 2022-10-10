#!/bin/bash

#--------------------------------
# This is script is very geared towards me only.
# It sets the fans on my Dell R710 to a lower speed to that it is less noisy.
# You can use this script as long as your R710 has an idrac6 module.
# You have to change IPMIHOST to the IP of the Idrac6 module (not the server itself), root and calvin are
# the default credentials. You may need to change them.
#
# This script may be compatible with other devices but I cannot test it.
#
# code@trigomijes.com
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
