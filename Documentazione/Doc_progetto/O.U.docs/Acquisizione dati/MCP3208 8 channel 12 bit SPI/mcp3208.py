# taken from http://pi.gids.nl:81/adc/
# Gabriele Monti: ITT Cesena
#!/usr/bin/env python
#
#
import time
import os
import sys
import RPi.GPIO as GPIO
from decimal import *
import atexit
import signal
import subprocess

CONTROL_C = False

def program_exit():
    # You may do some clean-up here, but you don't have to.
    print "\n"
    print "Exiting application... Thnxs                                             "
    GPIO.cleanup()
    subprocess.call('setterm -cursor on', shell=True)
    subprocess.call('spincl -ib', shell=True) 
    print " "
       
def ctrlCHandler(*whatever):
    # Just sets the value of CONTROL_C
    global CONTROL_C
    CONTROL_C = True
                 
THREEPLACES = Decimal(10) ** -3

GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)

subprocess.call('setterm -cursor off', shell=True)
subprocess.call('spincl -ib', shell=True) 

# read SPI data from MCP3208 chip, 8 possible adc's (0 thru 7)
def readadc(adcnum, clockpin, mosipin, misopin, cspin):
        if ((adcnum > 7) or (adcnum < 0)):
                return -1
        GPIO.output(cspin   , True)

        GPIO.output(clockpin, False)  # start clock low
        GPIO.output(cspin   , False)  # bring CS low

        commandout = adcnum
        commandout |= 0x18            # start bit + single-ended bit
        commandout <<= 3              # we only need to send 5 bits here
        for i in range(5):
                if (commandout & 0x80):
                        GPIO.output(mosipin, True )
                else:
                        GPIO.output(mosipin, False)
                commandout <<= 1
                GPIO.output(clockpin, True )
                GPIO.output(clockpin, False)

        adcout = 0

        # read in one empty bit, one null bit and 12 ADC bits
        # pro desetibitovy prevodnik tu bylo puvodne cislo 12
        for i in range(14):
                GPIO.output(clockpin, True )
                GPIO.output(clockpin, False)
                adcout <<= 1
                if (GPIO.input(misopin)):
                        adcout |= 0x1

        GPIO.output(cspin, True)
        
        adcout >>= 1 # first bit is 'null' so drop it
        return adcout

# change these as desired - they're the pins connected from the SPI port on the ADC to the RPi
SPICLK  = 11
SPIMISO = 9
SPIMOSI = 10
SPICS   = 8

# set up the SPI interface pins

GPIO.setup(SPIMOSI, GPIO.OUT)
GPIO.setup(SPIMISO, GPIO.IN )
GPIO.setup(SPICLK,  GPIO.OUT)
GPIO.setup(SPICS,   GPIO.OUT)

# 10k trim pot connected to adc #0
potentiometer_adc = 0;

subprocess.call('clear', shell=True)

# You must check CONTROL_C in your program

# call this procedure, if control-c is pressed.
signal.signal(signal.SIGINT, ctrlCHandler)

# program_exit is called, when sys.exit is executed.
atexit.register(program_exit)

print " "
print "CTRL-C to exit"
print " "

while True:
        trim_pot = readadc(potentiometer_adc, SPICLK, SPIMOSI, SPIMISO, SPICS)
        voltage = 3.3 * trim_pot / 4096 
        print "Digital:", trim_pot , "\t Voltage:", Decimal(voltage).quantize(THREEPLACES), "V                 ",
        time.sleep(0.001)
        print "\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r",
        if CONTROL_C: sys.exit(0)
exit (0)