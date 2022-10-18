#!/usr/bin/python

import os

username="YamiFrankc@gmail.com"
password="leet1337"
com="wget -q -O - https://"+username+":"+password+"@mail.google.com/mail/feed/atom--no-check-certificate"

temp=os.popen(com)
msg=temp.read()
index=msg.find("<fullcount>")
index2=msg.find("</fullcount>")
fc=int(msg[index+11:index2])

if fc==0:
       print "0 new"
else:
       print str(fc)+" new"

