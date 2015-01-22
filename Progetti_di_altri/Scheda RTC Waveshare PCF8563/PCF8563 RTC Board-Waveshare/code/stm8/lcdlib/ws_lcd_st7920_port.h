/*
*========================================================================================================
*
* File                : ws_lcd_st7920_port.h
* Hardware Environment:	
* Build Environment   : AVR Studio 4.16 + Winavr 20090313
* Version             : V1.0
* By                  : 
*
*                                  (c) Copyright 2005-2009, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*========================================================================================================
*/

#ifndef _WS_LCD_ST7920_PORT_H
#define _WS_LCD_ST7920_PORT_H

#define LCD_DELAY() _asm("nop");_asm("nop");_asm("nop");_asm("nop");_asm("nop");

#define E_CLK PE_ODR&=(~0x20);
#define E_SET PE_ODR|=0x20;

void SPI_Init(void);
void SPI_sendchar(u8 data);
void sendCodeST7920(u8 Lcd_cmd);
void sendDataST7920(u8 Lcd_data);
void st7920LcdInit(void);
void refreshLCD(const u8 *lcd_stack);
void decToAscii(u8* str,u16 dec,u8 width);
void hexToAscii(u8* str,u16 hex,u8 width);
void showLine(const u8 x,const u8 y,u8* lcd_stack,char * str,...);

u8 lcd_buffer[64];

#include "ws_lcd_st7920.h"

#endif /*_WS_LCD_ST7920_PORT_H*/
