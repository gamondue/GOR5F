/********************************************************************************************************
*
* File                : ws_PCF8563.c
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

#ifndef _WS_PCF8563_H_
#define _WS_PCF8563_H_

//器件地址：
#ifndef WD_DADR 
	#define WD_DADR		0xA2	//write device-address 
#endif
#ifndef RD_DADR 
	#define RD_DADR		0xA3	//read device-address
#endif


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

//changeIntToHex（33），return 0x33
//传参必须为 unsigned 类型
#define changeIntToHex(dec)		( ( ((dec)/10) <<4 ) + ((dec)%10) )

//调用changeHexToInt（0x33），return 33
//传参必须为 unsigned 类型
#define changeHexToInt(hex)		( ( ((hex)>>4) *10 ) + ((hex)%16) )


void WriteAByte(u8 wordAdr,u8 dat)
{
	I2C_Start();
	I2C_SendDAdr(WD_DADR);
	I2C_SendDat(wordAdr);
	I2C_SendDat(dat);
	I2C_stop();
}

void PCF8563_getTime(u8 *buf)
{  
	u8 i;
	I2C_Start();
	I2C_SendDAdr(WD_DADR);
	I2C_SendDat(SECOND_DATA_BUF);
	I2C_Start();
	I2C_SendDAdr(RD_DADR);
	for(i=0;i<2;i++)
	{
		buf[i]=I2C_RcvDat();
	}
	I2C_NAck();
	buf[i]=I2C_RcvDat();
	I2C_stop();
	I2C_Ack();

	buf[0]=buf[0]&0x7f;		//get second data
	buf[1]=buf[1]&0x7f;		//get minute data
	buf[2]=buf[2]&0x3f;		//get hour data
	
	buf[0]=changeHexToInt(buf[0]);
	buf[1]=changeHexToInt(buf[1]);
	buf[2]=changeHexToInt(buf[2]);
}

void PCF8563_setTime(u8 hour,u8 minute,u8 second)
{
	hour=changeIntToHex(hour);		//将数据的Dex格式转换为Hex格式
	minute=changeIntToHex(minute);
	second=changeIntToHex(second);

	WriteAByte(HOUR_DATA_BUF,hour);
	WriteAByte(MINUTE_DATA_BUF,minute);
	WriteAByte(SECOND_DATA_BUF,second);
}

void PCF8563_init(u8 hour,u8 mintue,u8 second)
{
	I2C_Init();
	WriteAByte(CTRL_BUF1,0x00);			//basic setting
	WriteAByte(CTRL_BUF2,0x00);
	PCF8563_setTime(hour,mintue,second);
	//WriteAByte(CTRL_BUF2,0x12);			//alarm enable
	//WriteAByte(HOUR_AE_BUF,0x09);		//set alarm hour at 9:00
	//WriteAByte(CLK_FRQ_BUF,0xf0);		//set clkout frequency
}

#endif /*_WS_PCF8563_H_*/
