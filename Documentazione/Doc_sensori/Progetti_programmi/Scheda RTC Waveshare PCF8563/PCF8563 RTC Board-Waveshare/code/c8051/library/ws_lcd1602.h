/********************************************************************************************************
*
* File                : ws_lcd1602.h
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

#ifndef _WS_LCD1602_H_
#define _WS_LCD1602_H_

bit lcd1602_busy(void)
{
	bit result;
	RS = 0;
	RW = 1;
	E = 1;
	delay_us(500);
	IO_IN;
	result = (PORT & 0x80);
	E = 0;
	return result;
}

void lcd1602_write_com(uchar com)
{
	while(lcd1602_busy());
	RS = 0;
	RW = 0;
	E = 0;
	IO_OUT;
	PORT = com;
	E = 1;
	delay_us(500);
	E = 0;
}

void lcd1602_write_data(uchar dat)
{
	while(lcd1602_busy());
	RS = 1;
	RW = 0;
	E = 0;
	IO_OUT;
	PORT = dat;
	E = 1;
	delay_us(500);
	E = 0;
}

void lcd1602_gotoxy(uchar x,uchar y)
{
	uchar add;
	if(y==0)
		add = 0x80 + x;
	else
		add = 0xc0 + x;
	lcd1602_write_com(add);
	
}

void lcd1602_init(void)
{
	lcd1602_write_com(0x38);
	lcd1602_write_com(0x0c);
	lcd1602_write_com(0x06);
	lcd1602_write_com(0x01);
}

void lcd1602_display(uchar *str)
{
	while(*str)
	{
		lcd1602_write_data(*str);
		str++;
		delay_us(500);
	}
}

void lcd1602_setGCRAM(uchar add,uchar *str)
{
	uchar i;
	lcd1602_write_com(0x40|(add<<3));
	for(i=0;i<8;i++)
	{
		lcd1602_write_data(*str);
		str++;
	}
	delay_us(500);
}

#endif /*_WS_LCD1602_H_*/