/********************************************************************************************************
*
* File                : ws_at45dbxxx_port.h
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

#ifndef _WS_AT45DBXXX_PORT_H_
#define _WS_AT45DBXXX_PORT_H_

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)

sbit SS_AT45DB = P0^7;  

void spi_transmit_byte(uchar Data);
uchar spi_receive_byte(void);
void write_buffer(uint BufferOffset,uchar Data);
uchar read_buffer(uint BufferOffset);


void spiInitAt45db(void)
{
	XBR0 = 0x03;
	P0SKIP |= 0x80;
	P0MDOUT |= 0xC1;
	SPI0CFG = 0x40;
	SPI0CN = 0x01;
	SPI0CKR = 0x2F;
}

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)

sbit SS_AT45DB = P0^3;  

void spi_transmit_byte(uchar Data);
void write_buffer(uint BufferOffset,uchar Data);
uchar read_buffer(uint BufferOffset);


void spiInitAt45db(void)
{
	XBR0 = 0x02;
	P0SKIP |= 0x08;
	P0MDOUT |= 0x0D;
	SPI0CFG = 0x40;
	SPI0CN = 0x01;
	SPI0CKR = 0x2F;
}

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)

sbit SS_AT45DB = P1^7;  

void spi_transmit_byte(uchar Data);
void write_buffer(uint BufferOffset,uchar Data);
uchar read_buffer(uint BufferOffset);


void spiInitAt45db(void)
{	
	XBR0 |= 0x06;
	P0MDOUT |= 0x14;
	SPI0CN |= 0x02;
	SPI0CN |= 0x01;
	SPI0CKR = 0x7B;
}

#else
  #warning "AT45DBXXX interface undefined."
#endif

#include <ws_at45dbxxx.h>

#endif /*_WS_AT45DBXXX_PORT_H_*/
