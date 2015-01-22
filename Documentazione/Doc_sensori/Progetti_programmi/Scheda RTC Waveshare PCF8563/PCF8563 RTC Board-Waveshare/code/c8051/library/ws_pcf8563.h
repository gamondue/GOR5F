/********************************************************************************************************
*
* File                : ws_pcf8563.h
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

#ifndef _WS_PCF8563_H_
#define _WS_PCF8563_H_

#define CTRL_BUF1		0x00
#define CTRL_BUF2		0x01

#define SECOND_DATA_BUF	0x02
#define MINUTE_DATA_BUF	0x03
#define HOUR_DATA_BUF	0x04

#define DAY_DATA_BUF	0x05
#define WEEK_DATA_BUF	0x06
#define MONTH_DATA_BUF	0x07
#define YEAR_DATA_BUF	0x08

#define MINUTE_AE_BUF	0x09
#define HOUR_AE_BUF		0x0A
#define DAY_AE_BUF		0x0B
#define WEEK_AE_BUF		0x0C

#define CLK_FRQ_BUF		0x0D
#define TIMER_CTRL_BUF	0x0E
#define COUNT_VAL_BUF	0x0F

void WriteAByte(uchar wordAdr,uchar dat)
{
	SMBus_Write(0xA2,wordAdr,dat,2);
}

void ReadNByte(uchar wordAdr,uchar *pRdDat)
{  
	SMBus_Write(0xA2,wordAdr,0,1);
	SMBus_Read(0xA3,pRdDat,4);
}

void PCF8563_getTime(uchar *buf)
{
	ReadNByte(SECOND_DATA_BUF,buf);
	buf[0] = buf[0] & 0x7f;		//get second data
	buf[1] = buf[1] & 0x7f;		//get minute data
	buf[2] = buf[2] & 0x3f;		//get hour data

	buf[0] = changeHexToInt(buf[0]);
	buf[1] = changeHexToInt(buf[1]);
	buf[2] = changeHexToInt(buf[2]);
}

void PCF8563_setTime(uchar hour,uchar minute,uchar second)
{
	hour = changeIntToHex(hour);		//将数据的Dex格式转换为Hex格式
	minute = changeIntToHex(minute);
	second = changeIntToHex(second);

	WriteAByte(HOUR_DATA_BUF,hour);
	WriteAByte(MINUTE_DATA_BUF,minute);
	WriteAByte(SECOND_DATA_BUF,second);
}

void PCF8563_init(void)
{
	WriteAByte(CTRL_BUF1,0x00);			//basic setting
	WriteAByte(CTRL_BUF2,0x12);			//alarm enable
}

#endif /*_WS_PCF8563_H_*/
