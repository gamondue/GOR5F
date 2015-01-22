/********************************************************************************************************
*
* File                : ws_ds2401.h
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

#ifndef _WS_DS2401_H_
#define _WS_DS2401_H_
#include <../../../library/ws_onewire_port.h>

void getDs2401Number(uchar *tmp)
{
	uchar t1;
	resetOnewire();	//先复位onewire
	wOnewire(0x33);	//发"Read_ROM"指令	
	for(t1=0;t1<8;t1++)
	{
		*(tmp + t1) = rOnewire();
	}
}

#endif /*_WS_DS2401_H_*/