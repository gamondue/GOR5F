/********************************************************************************************************
*
* File                : ws_at45dbxxx.h
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

#ifndef _WS_AT45DBXXX_H_
#define _WS_AT45DBXXX_H_

void spi_transmit_byte(uchar Data)
{	
	SPIF = 0;
	SPI0DAT = Data;								
    while(!SPIF);
}

void write_buffer(uint BufferOffset,uchar Data)
{			
	SS_AT45DB = 0;
	delay_us(10);		
	spi_transmit_byte(0x84);			  						
	spi_transmit_byte(0xff);						
	spi_transmit_byte((uchar)BufferOffset>>8);	
	spi_transmit_byte((uchar)BufferOffset);		
	spi_transmit_byte(Data);
	delay_us(10);		
	SS_AT45DB = 1;	
}

uchar read_buffer(uint BufferOffset)
{		
    uchar temp;
	SS_AT45DB = 0;
	delay_us(10);
 	spi_transmit_byte(0xD4);
	spi_transmit_byte(0xff);
	spi_transmit_byte((uchar)BufferOffset>>8);
	spi_transmit_byte((uchar)BufferOffset);
	spi_transmit_byte(0xff);
	spi_transmit_byte(0xff);
	temp = SPI0DAT;	  
	delay_us(10);
	SS_AT45DB = 1;
    return temp;								
}
#endif /*_WS_AT45DBXXX_H_*/
