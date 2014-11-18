/********************************************************************************************************
*
* File                : ws_PS2_port.h
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

#ifndef _WS_PS2_PORT_H_
#define _WS_PS2_PORT_H_

uchar check(uchar *keyVal);
uchar keyHandle(uchar val);

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)
#define OUT_SDA P2MDOUT |= 0x08;
#define IN_SDA  P2MDOUT &= ~0x08;
#define OUT_SCK P2MDOUT |= 0x04;
#define IN_SCK  P2MDOUT &= ~0x04;
#define PORT P1

sbit SDA = P2^3;
sbit SCK = P2^2;

void PS2_Init(void)
{
	P1MDOUT = 0xFF;	
	IN_SDA;
}

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)
#define OUT_SDA P1MDOUT |= 0x04;
#define IN_SDA  P1MDOUT &= ~0x04;
#define OUT_SCK P1MDOUT |= 0x08;
#define IN_SCK  P1MDOUT &= ~0x08;
#define PORT P2

sbit SDA = P1^2;
sbit SCK = P1^3;

void PS2_Init(void)
{
	P2MDOUT = 0xFF;	
	IN_SDA;
}

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)
#define OUT_SDA P1MDOUT |= 0x01;
#define IN_SDA  P1MDOUT &= ~0x01;
#define OUT_SCK P1MDOUT |= 0x02;
#define IN_SCK  P1MDOUT &= ~0x02;
#define PORT P2

sbit SDA = P1^0;
sbit SCK = P1^1;

void PS2_Init(void)
{
	P2MDOUT = 0xFF;	
	IN_SDA;
}

#else
  #warning "No PS2!"
#endif

bit rcvF;

#include <../../../library/ws_PS2_code.h>
#include <../../../library/ws_PS2.h>

#endif/*_WS_PS2_PORT_H_*/