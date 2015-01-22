/********************************************************************************************************
*
* File                : ws_at24cxx_port.h
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

#ifndef _WS_AT24CXX_PORT_H_
#define _WS_AT24CXX_PORT_H_

void Write_AT24Cxx(uchar adr,uchar WrData)
{	
	SMBus_Write(0xA0,adr,WrData,2);
}

void Read_AT24Cxx(uint adr,uchar *RdData)
{
	SMBus_Write(0xA0,adr,0,1);
	SMBus_Read(0xA1,RdData,1);
}

#endif /*_WS_AT24CXX_PORT_H_*/
