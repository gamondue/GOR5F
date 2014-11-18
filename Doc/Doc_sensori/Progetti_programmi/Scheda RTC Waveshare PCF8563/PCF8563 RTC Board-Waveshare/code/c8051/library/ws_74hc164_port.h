/********************************************************************************************************
*
* File                : ws_74hc164_port.h
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

#ifndef _WS_74HC164_PORT_H_
#define _WS_74HC164_PORT_H_

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)

void hc164SetDat(uchar dat);

sbit HC164_DATA = P1^6;
sbit HC164_CLK = P1^7;

void hc164Init(void)
{
	P1MDOUT |= 0xC0;
}

/*Hardware Environment£ºDVK501 && F340 EX*/
#elif defined(_DVK501_F340_EX_)

void hc164SetDat(uchar dat);

sbit HC164_DATA = P1^7;
sbit HC164_CLK = P1^6;

void hc164Init(void)
{
	P1MDOUT |= 0xC0;
}

/*Hardware Environment£ºDVK501 && F020 EX*/
#elif defined(_DVK501_F020_EX_)

void hc164SetDat(uchar dat);

sbit HC164_DATA = P1^4;
sbit HC164_CLK = P1^5;

void hc164Init(void)
{
	P1MDOUT |= 0x30;
}

#else
	#warning "74HC164 interface undefined."
#endif

#include <../../../library/ws_74hc164.h>

#endif /*_74HC164_PORT_H_*/