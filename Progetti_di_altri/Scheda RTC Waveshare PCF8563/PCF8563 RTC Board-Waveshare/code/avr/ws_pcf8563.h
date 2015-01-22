/********************************************************************************************************
*********************************************************************************************************
*
* File                : ws_pcf8563.h
* Hardware Environment:
* Build Environment   : AVR Studio 4.16 + Winavr 20090313
* Version             : V1.0
* By                  : Wu Ze
*
*                                  (c) Copyright 2005-2009, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*********************************************************************************************************
********************************************************************************************************/

#ifndef _WS_PCF8563_H_
#define _WS_PCF8563_H_

//������ַ��A0 A1 A2 = 0 0 0

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

#define PCF8563_ERR		0
#define PCF8563_CRR		1

/*--------------------------------------------------------------------
�������ƣ�
�������ܣ�д 1�� Byte ����Ӧ�ļĴ���
ע�����
��ʾ˵����
��    �룺
��    �أ�
--------------------------------------------------------------------*/
uint8_t WriteAByte(uint8_t wordAdr,uint8_t dat)
{
	if( I2C_Write(WR_DADR,wordAdr,dat)==I2C_ERR )
		return I2C_ERR;
	return I2C_CRR;
}
/*--------------------------------------------------------------------
�������ƣ�
�������ܣ��� N�� Byte ����Ӧ�ļĴ���
ע�����
��ʾ˵����
��    �룺
��    �أ�
--------------------------------------------------------------------*/
uint8_t ReadNByte(uint8_t wordAdr,uint8_t *pRdDat,uint8_t num)
{  
	if( I2C_Read_(WR_DADR,wordAdr,RD_DADR,pRdDat,num)==I2C_ERR )
		return I2C_ERR;
	return I2C_CRR;
}
/*--------------------------------------------------------------------
�������ƣ�
�������ܣ���ȡPCF8563��ʱ��
ע�����
��ʾ˵����
��    �룺
��    �أ�
--------------------------------------------------------------------*/
void PCF8563_getTime(uint8_t *buf)
{
	ReadNByte(SECOND_DATA_BUF,buf,3);
	buf[0]=buf[0]&0x7f;		//get second data
	buf[1]=buf[1]&0x7f;		//get minute data
	buf[2]=buf[2]&0x3f;		//get hour data

	buf[0]=changeHexToInt(buf[0]);
	buf[1]=changeHexToInt(buf[1]);
	buf[2]=changeHexToInt(buf[2]);
}
/*--------------------------------------------------------------------
�������ƣ�
�������ܣ�����PCF8563��ʱ��
ע�����
��ʾ˵����
��    �룺
��    �أ�
--------------------------------------------------------------------*/
void PCF8563_setTime(uint8_t hour,uint8_t minute,uint8_t second)
{
	hour=changeIntToHex(hour);		//�����ݵ�Dex��ʽת��ΪHex��ʽ
	minute=changeIntToHex(minute);
	second=changeIntToHex(second);

	WriteAByte(HOUR_DATA_BUF,hour);
	WriteAByte(MINUTE_DATA_BUF,minute);
	WriteAByte(SECOND_DATA_BUF,second);
}

/*--------------------------------------------------------------------
�������ƣ�
�������ܣ���ʼ��PCF8563
ע�����
��ʾ˵����
��    �룺
��    �أ�
--------------------------------------------------------------------*/
void PCF8563_init()
{
	WriteAByte(CTRL_BUF1,0x00);			//basic setting
	WriteAByte(CTRL_BUF2,0x12);			//alarm enable
}

#endif /*_WS_PCF8563_H_*/
