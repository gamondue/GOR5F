/********************************************************************************************************
*
* File                : ws_74hc165.h
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

#ifndef _WS_74HC165_H_
#define _WS_74HC165_H_

uchar hc165GetDat(void)
{
	uchar i,dat=0;
	HC165_PL = 0;
	HC165_PL = 1;
	for(i=0;i<8;i++)
	{
		HC165_TXD = 0;
		dat = dat<<1;
		if(HC165_RXD)
			dat |= 0x01;
		HC165_TXD = 1;
	}
	return dat;
} 		      

#endif /*_WS_74HC165_H_*/
