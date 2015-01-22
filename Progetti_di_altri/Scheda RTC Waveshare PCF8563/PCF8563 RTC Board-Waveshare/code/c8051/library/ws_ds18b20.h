/********************************************************************************************************
*
* File                : ws_ds18b20.h
* Hardware Environment:	
* Build Environment   : Silicon LABs 3.42.00 / uVision3 V3.80 20100913
* Version             : 
* By                  : Su Wei Feng
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveshare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#ifndef _WS_DS18B20_H_
#define _WS_DS18B20_H_
#include <../../../library/ws_onewire_port.h>

void convertDs18b20(void) 
{ 
    resetOnewire(); 
    wOnewire(0xcc); 
    wOnewire(0x44); 
} 

uchar readTemp(void) 
{ 
	uchar temp1,temp2;
	convertDs18b20();
    resetOnewire(); 
    wOnewire(0xcc); 
    wOnewire(0xbe); 	
    temp1 = rOnewire(); 
    temp2 = rOnewire(); 
	temp2 <<= 4;
	temp1 >>= 4;
	temp2 |= temp1;

	return (temp2 & 0x7F);
}

#endif /*_WS_DS18B20_H_*/