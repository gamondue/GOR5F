/********************************************************************************************************
*
* File                : ws_74hc164.h
* Hardware Environment:
* Build Environment   : Silicon LABs 3.42.00 / uVision3 V3.80 20100913
* Version             : 
* By                  : Su Wei Feng
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveshare.net
*                                          All Rights Reserved
*
********************************************************************************************************/

#ifndef _WS_74HC164_H_
#define _WS_74HC164_H_

void hc164SetDat(uchar dat)
{
	uchar i;
	for(i=0;i<8;i++)
	{
		HC164_CLK = 0;
		if(dat & 0x80)
			HC164_DATA = 1;
		else
			HC164_DATA = 0;
		HC164_CLK = 1;
		dat = dat<<1;
	}
}

#endif /*_74HC164_H_*/
