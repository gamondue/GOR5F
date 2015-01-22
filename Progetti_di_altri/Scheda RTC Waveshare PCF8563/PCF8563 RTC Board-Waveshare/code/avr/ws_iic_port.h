/********************************************************************************************************
*********************************************************************************************************
*
* File                : ws_iic_port.h
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

#ifndef _WS_IIC_PORT_H_
#define _WS_IIC_PORT_H_

#include <avr/io.h>


void twi_init()	 	 	//TWI(I2C)��ʼ��
{
/*Hardware Environment��DVK501 && M128+ EX*/
#if defined(_DVK501_M128_EX_)
	TWBR = 0X0F;		//����TWI������  
	TWSR &= 0XFC;		//����TWIԤ��Ƶ Ϊ 1

/*Hardware Environment��DVK501 && M16+ EX*/
#elif defined(_DVK501_M16_EX_)
	TWBR = 0X0F;		//����TWI������  
	TWSR &= 0XFC;		//����TWIԤ��Ƶ Ϊ 1

/*Hardware Environment��DVK501 && M48+ EX*/	
#elif defined(_DVK501_M48_EX_)
	TWBR = 0X0F;		//����TWI������  
	TWSR &= 0XFC;		//����TWIԤ��Ƶ Ϊ 1
	
#else
  #warning "iic interface undefined."
#endif
}

#include <ws_iic.h>

#endif /*_WS_IIC_PORT_H_*/
