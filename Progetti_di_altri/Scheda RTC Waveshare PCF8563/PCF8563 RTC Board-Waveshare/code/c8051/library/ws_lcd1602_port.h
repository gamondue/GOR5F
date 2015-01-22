/********************************************************************************************************
*
* File                : ws_lcd1602_port.h
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

#ifndef _WS_LCD1602_PORT_H_
#define _WS_LCD1602_PORT_H_

bit lcd1602_busy(void);
void lcd1602_write_com(uchar com);
void lcd1602_write_data(uchar dat);
void lcd1602_gotoxy(uchar x,uchar y);
void lcd1602_init(void);
void lcd1602_display(uchar *str);
void lcd1602_setGCRAM(uchar add,uchar *str);

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)
#define IO_OUT P1MDOUT = 0xFF;P1 = 0xFF;
#define IO_IN  P1MDOUT = 0x00;P1 = 0xFF;
#define PORT P1

sbit E  = P0^0;
sbit RW = P0^6;
sbit RS = P0^7;

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)
#define IO_OUT P2MDOUT = 0xFF;P2 = 0xFF;
#define IO_IN  P2MDOUT = 0x00;P2 = 0xFF;
#define PORT P2

sbit E  = P0^0;
sbit RW = P0^2;
sbit RS = P1^5;

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)
#define IO_OUT P2MDOUT = 0xFF;P2 = 0xFF;
#define IO_IN  P2MDOUT = 0x00;P2 = 0xFF;
#define PORT P2

sbit E  = P0^2;
sbit RW = P0^4;
sbit RS = P1^2;

#else
  #warning "No 1602!"
#endif

#include <../../../library/ws_lcd1602.h>

#endif /*_WS_LCD1602_PORT_H_*/