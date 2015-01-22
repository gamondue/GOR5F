/********************************************************************************************************
*
* File                : ws_pcf8563_port.h
* Hardware Environment:	
* Build Environment   : SSilicon LABs 3.42.00 / uVision3 V3.80 20100913
* Version             : 
* By                  : Su Wei Feng
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveshare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#ifndef _WS_PCF8563_PORT_H_
#define _WS_PCF8563_PORT_H_

/*--------------------------------------------------------------------
函数全称：十进制强制转换为十六进制
函数功能：
注意事项：
提示说明：调用changeIntToHex（33），return 0x33
输    入：
返    回：
--------------------------------------------------------------------*/
#define changeIntToHex(dec)		( (((dec)/10) <<4) + ((dec)%10) )
/*--------------------------------------------------------------------
函数全称：十进制化为十六进制，并以十进制格式返回
函数功能：
注意事项：传参必须为 unsigned 类型，否则移位结果可能吓你一跳
提示说明：调用converseIntToHex（33），return 21
输    入：
返    回：
--------------------------------------------------------------------*/
#define converseIntToHex(dec)	( (((dec)>>4) *10) + ((dec)%16) )
/*--------------------------------------------------------------------
函数全称：十六进制强制转换为十进制
函数功能：
注意事项：传参必须为 unsigned 类型，否则移位结果可能吓你一跳
提示说明：调用changeHexToInt（0x33），return 33
输    入：
返    回：
--------------------------------------------------------------------*/
#define changeHexToInt(hex)		( (((hex)>>4) *10 ) + ((hex)%16) )
/*--------------------------------------------------------------------
函数全称：十六进制化为十进制，，并以十六进制格式返回
函数功能：
注意事项：
提示说明：调用converseHexToInt（0x33），return 0x51
输    入：
返    回：
--------------------------------------------------------------------*/
#define converseHexToInt(hex)	( (((hex)/10) <<4 ) + ((hex)%10) )

void WriteAByte(uchar wordAdr,uchar dat);
void ReadNByte(uchar wordAdr,uchar *pRdDat);
void PCF8563_getTime(uchar *buf);
void PCF8563_setTime(uchar hour,uchar minute,uchar second);
void PCF8563_init(void);

#include <ws_pcf8563.h>

#endif /*_WS_PCF8563_PORT_H_*/
