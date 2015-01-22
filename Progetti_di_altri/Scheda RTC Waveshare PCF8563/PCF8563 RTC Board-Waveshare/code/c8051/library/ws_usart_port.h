/********************************************************************************************************
*
* File                : ws_usart_port.h
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

#ifndef _WS_USART_PORT_H_
#define _WS_USART_PORT_H_

void putUsart(uchar a,uchar c);
char getUsart(uchar a);

/****************************************************

USART0/1 initialization
Communication Parameters: 8 Data, 1 Stop, No Parity
USART0/1 Baud Rate: 9600

****************************************************/
#define BAUDRATE     9600      // Baud rate of UART in bps

/*Hardware Environment£ºDVK501 && F320 EX*/
#if defined(_DVK501_F320_EX_)
void usartInit(void)
{
	XBR0 |= 0x01;
	P0MDOUT |= 0x10;
	SCON0 |= 0x10;                                                            
	CKCON &= ~0x0B;            // T1M = 0; SCA1:0 = 01                  
    CKCON |=  0x01;
   	TH1 = 0x64;		
   	TL1 = TH1;                         
   	TMOD &= ~0xf0;             // TMOD: timer 1 in 8-bit autoreload
    TMOD |=  0x20;                      
   	TR1 = 1;                           
   	TI0 = 1; 
}

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)
sfr16 SBRL1 = 0xB4;

void usartInit0(void)
{
	XBR0 |= 0x01;
	P0MDOUT |= 0x10;
	SCON0 |= 0x10;                                                            
	CKCON &= ~0x0B;            // T1M = 0; SCA1:0 = 01                  
    CKCON |=  0x01;
   	TH1 = -(SYSCLK/BAUDRATE/2/4);		
   	TL1 = TH1;                         
   	TMOD &= ~0xf0;             // TMOD: timer 1 in 8-bit autoreload
    TMOD |=  0x20;                      
   	TR1 = 1;                           
   	TI0 = 1; 
}

void usartInit1(void)
{
	XBR0 |= 0x07;	
	XBR2 |= 0x01;
	P1MDOUT |= 0x40;
	SMOD1 = 0x0C;
	SCON1 |= 0x10;
	SBRL1 = -(SYSCLK/BAUDRATE/2);
    SBCON1 |= 0x03;            // set prescaler to 1                                                            
	SCON1 |= 0x02;             // indicate ready for TX
    SBCON1 |= 0x40;            // enable baud rate generator 
}

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)
sfr16 RCAP2    = 0xca;         // Timer2 capture/reload
sfr16 TMR2     = 0xcc;         // Timer2

void usartInit0(void)
{
	XBR0 |= 0x04;              // Enable UART0
   	XBR1 = 0x00;
   	XBR2 = 0x40;               // Enable crossbar and weak pull-up
   	P0MDOUT |= 0x01;           // Set TX pin to push-pull
   	CKCON = 0x20;              // Timer2 uses the system clock
   	T2CON = 0x34;              // Timer2 used for TX and RX, enabled
   	RCAP2 = - ((long)(SYSCLK/BAUDRATE)/32);
   	TMR2 = RCAP2;
   	TR2= 1;                    // Start Timer2
   	SCON0 = 0x50;              // 8-bit variable baud rate; 9th bit ignored; RX enabled clear all flags
   	TI0     = 1;               // Indicate TX0 ready
}

void usartInit1(void)
{
	XBR0 = 0x07;
   	XBR1 = 0x00;
   	XBR2 = 0x44;               // Enable crossbar and weak pull-up Enable UART1
   	P1MDOUT = 0x01;            // Set TX pin to push-pull 
   	SCON1 = 0x50;              // SCON1: mode 1, 8-bit UART, enable RX
   	TMOD &= ~0xF0;
   	TMOD |=  0x20;             // TMOD: timer 1, mode 2, 8-bit reload
   	PCON |= 0x10;              // SMOD1 (PCON.4) = 1 --> UART1 baudrate divide-by-two disabled
    CKCON |= 0x10;             // Timer1 uses the SYSCLK
    TH1 = - ((SYSCLK/BAUDRATE)/16);
   	TL1 = TH1;                 // Initialize Timer1
   	TR1 = 1;                   // Start Timer1
   	SCON1 |= 0x02;             // Indicate TX1 ready (TI1=1) 
}

#else
  #warning "USART interface undefined."
#endif

#include <../../../library/ws_usart.h>

#endif /*_WS_USART_PORT_H_*/
