/********************************************************************************************************
*
* File                : ws_74hc165_port.h
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

#ifndef _WS_74HC165_PORT_H_
#define _WS_74HC165_PORT_H_

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)

uchar hc165GetDat(void);

sbit HC165_RXD = P0^5;	   
sbit HC165_TXD = P0^4;	   
sbit HC165_PL = P1^0;	  

void hc165Init(void)
{
	P0MDOUT |= 0x10;
	P1MDOUT |= 0x01;
}

/*Hardware Environment£ºDVK501 && F340 EX*/
#elif defined(_DVK501_F340_EX_)

uchar hc165GetDat(void);

sbit HC165_RXD = P0^5;	   
sbit HC165_TXD = P0^4;	   
sbit HC165_PL = P1^0;	  

void hc165Init(void)
{
	P0MDOUT |= 0x10;
	P1MDOUT |= 0x01;
}

/*Hardware Environment£ºDVK501 && F020 EX*/
#elif defined(_DVK501_F020_EX_)

uchar hc165GetDat(void);

sbit HC165_RXD = P0^1;	   
sbit HC165_TXD = P0^0;	   
sbit HC165_PL = P0^6;	  

void hc165Init(void)
{
	P0MDOUT |= 0x41;
}

#else
	#warning "74HC165 interface undefined."
#endif

#include <../../../library/ws_74hc165.h>

#endif /*_WS_74HC165_PORT_H_*/
