
/********************************************************************************************************
*
* File                : PCF8563.c
* Hardware Environment: 
* Build Environment   : ST Visual Develop 4.1.6
* Version             : V1.0
* By                  : Xiao xian hui
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#include <stm8s208mb.h>
#include <system.h>
#include <WS_I2C.h>
#include <ws_pcf8563.h>
#include <ws_lcd_st7920.h>

main()
{
	u8 time[3],tmp=0;
	PCF8563_init(10,54,00);   //初始化PCF8563
	st7920LcdInit();
	showLine(0,0,lcd_buffer,"PCF8563 Example");
	showLine(0,1,lcd_buffer,"Set Time: OK");
	showLine(0,2,lcd_buffer,"Read Time:");
	refreshLCD(lcd_buffer); //刷新LCD
	while(1)
	{
		PCF8563_getTime(time);
		if(time[0]!=tmp)
		{
			showLine(8,3,lcd_buffer,"%d2:%d2:%d2",(u16)time[2],(u16)time[1],(u16)time[0]);
			refreshLCD(lcd_buffer); /*刷新LCD*/
		}
		tmp=time[0];
	}
}