#!/usr/bin/env python
from time import sleep
from watchdogdev import *

wd = watchdog('/dev/watchdog')

for i in range(5):
    print "Send Keep alive",i
    wd.keep_alive()
    for j in range(5): #Change to 15 to see RPi reboot ...
        print "... Waiting",j,", Left :",wd.get_time_left()
        sleep(1)

print "Magic Close"        
wd.magic_close()
print "Done !"