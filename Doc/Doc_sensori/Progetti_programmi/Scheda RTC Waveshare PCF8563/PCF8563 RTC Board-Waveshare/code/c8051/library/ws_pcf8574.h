/********************************************************************************************************
*
* File                : ws_pcf8574.h
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

#ifndef _WS_PCF8574_H_
#define _WS_PCF8574_H_

void Write_PCF8574(uchar Data)
{
	SMBus_Write(0x40,Data,0,1);
}

void Read_PCF8574(uchar *Data)
{
	SMBus_Read(0x41,Data,1);
}

#endif /*_WS_PCF8574_H_*/
