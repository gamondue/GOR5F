/********************************************************************************************************
*
* File                : ws_usart.h
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

#ifndef _WS_USART_H_
#define _WS_USART_H_

void putUsart(uchar a,uchar c)
{ 
	uchar UART;
	UART = a;
	if (UART == 0)
   	{
      	if(c == '\n')                      // If carriage return
      	{	
         	while (!TI0);
         	TI0 = 0;
         	SBUF0 = 0x0D;                  // Output CR
      	}
      	while (!TI0);                      // Wait for transmit complete
      	TI0 = 0;
      	SBUF0 = c;                         // Send character
   	}
   	#if defined(_DVK501_F320_EX_)
	#else
	else if(UART == 1)
   	{
      	if (c == '\n')                     // If carriage return
      	{
         	while ((SCON1 & 0x02) == 0);   // Wait for the transmit to complete
         	SCON1 &= ~0x02;                // Clear TI1
         	SBUF1 = 0x0D;                  // Output CR
      	}
      	while ((SCON1 & 0x02) == 0);       // Wait for the transmit to complete
      	SCON1 &= ~0x02;                    // Clear TI1
      	SBUF1 = c;                         // Send character
   	}
	#endif
}

char getUsart(uchar a)
{
    char c,UART;
	UART = a;
   	if (UART == 0)
   	{
      	while(!RI0);                       // Wait for byte to be received
      	c = SBUF0;                         // Read the byte
		RI0 = 0;                           // clear UART0 receive interrupt flag
   	}
	#if defined(_DVK501_F320_EX_)
	#else
   	else if (UART == 1)
   	{
      	while ((SCON1 & 0x01) == 0);       // Wait for the reception to complete
      	c = SBUF1;                         // Read the byte
		SCON1 &= ~0x01; 
   	}
	#endif
   	return c;
}

#endif /*_WS_USART_H_*/
