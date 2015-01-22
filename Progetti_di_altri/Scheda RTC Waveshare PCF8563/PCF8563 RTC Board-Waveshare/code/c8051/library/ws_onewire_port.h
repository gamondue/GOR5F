/********************************************************************************************************
*
* File                : ws_onewire_port.h
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

#ifndef WS_ONEWIRE_PORT_H
#define WS_ONEWIRE_PORT_H

void resetOnewire(void);
uchar rOnewire(void);
void wOnewire(uchar Data);

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)	
#define OUT_DQ() P1MDOUT |= 0x20;
#define IN_DQ()  P1MDOUT &= ~0x20;
sbit DQ = P1^5;

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)	
#define OUT_DQ() P1MDOUT |= 0x10;
#define IN_DQ()  P1MDOUT &= ~0x10;
sbit DQ = P1^4;

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)	
#define OUT_DQ() P1MDOUT |= 0x08;
#define IN_DQ()  P1MDOUT &= ~0x08;
sbit DQ = P1^3;

#else
  #warning "Onewire interface undefined."
#endif

#include <../../../library/ws_onewire.h>

#endif /*WS_ONEWIRE_PORT_H*/
