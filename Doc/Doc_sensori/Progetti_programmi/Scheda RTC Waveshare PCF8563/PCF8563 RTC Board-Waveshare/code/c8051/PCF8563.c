/********************************************************************************************************
*
* File                : PCF8563.c
* Hardware Environment:	DVK501 && F320 EX
* Build Environment   : uVision3 V3.80 20100913
* Version             : 
* By                  : Su Wei Feng
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveshare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#define _DVK501_F320_EX_ 

#include <c8051f320.h>
#include <ws_clock.h>
#include <ws_delay.h>
#include <ws_iic_port.h>
#include <ws_pcf8563_port.h>
#include <ws_lcd_st7920_port.h>

void main(void)
{	
	uchar time[3],tmp=0;
	PCA0MD &= ~0x40;            // Clear watchdog timer enable
   	clock_external();			// Set oscillator in external,the clock is 12M
	delay_ms(100);
   	Check_SDA();	
	XBR1 = 0x40;                // Enable crossbar and weak pull-ups
	SPI_Init();
	st7920LcdInit();
	showLine(0,0,lcd_buffer,"PCF8563 Example");
	showLine(0,1,lcd_buffer,"Set Time: OK");
	showLine(0,2,lcd_buffer,"Read Time:");
	refreshLCD(lcd_buffer); 

	SMBus_Init();
	Enb_Interrupt(); 
	PCF8563_init();	
	PCF8563_setTime(12,0,0); 
	delay_ms(10);

	while(1)
	{	
		PCF8563_getTime(time);
		if(time[0]!=tmp)
		{
			showLine(8,3,lcd_buffer,"%d2:%d2:%d2",time[2],time[1],time[0]);
			refreshLCD(lcd_buffer);
		}
		tmp=time[0];
	}
}
