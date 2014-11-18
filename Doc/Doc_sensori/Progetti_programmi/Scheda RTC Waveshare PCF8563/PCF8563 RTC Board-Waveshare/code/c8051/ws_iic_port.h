/********************************************************************************************************
*
* File                : ws_iic_port.h
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

#ifndef _WS_IIC_PORT_H_
#define _WS_IIC_PORT_H_

#define  SMB_FREQUENCY  100000         // Target SCL clock rate
                                       // This example supports in 100kHz
void SMBus_Init(void);
void Check_SDA(void);
void SMBus_Write(uint wrDAdr,uchar Data1,uchar Data2,uchar Num);
void SMBus_Read(uint wrDAdr,uchar *Data,uchar Num);

/*Hardware Environment£ºDVK501 && F320+ EX*/
#if defined(_DVK501_F320_EX_)

void Timer1_Init(void);
void Timer3_Init(void);
void Enb_Interrupt(void);
void SMBus_ISR(void);
void Timer3_ISR(void);

// 16-bit SFR declarations
sfr16 TMR3RL   = 0x92;                 // Timer3 reload registers
sfr16 TMR3     = 0x94;                 // Timer3 counter registers

sbit SDA = P1^0;                       // SMBus on P1.0
sbit SCL = P1^1;                       // and P1.1

void SMBus_Init(void)	 	 	
{
	XBR0 |= 0x07;                      // Enable SMBus pins
	P1MDOUT = 0x00;                    // All P1 pins open-drain output
   	P1 = 0xFF;
	SMB0CF = 0x5D;                     // Use Timer1 overflows as SMBus clock source;
                                       // Disable slave mode;
                                       // Enable setup & hold time extensions;
                                       // Enable SMBus Free timeout detect;
                                       // Enable SCL low timeout detect;

   	SMB0CF |= 0x80;                    // Enable SMBus	
	Timer1_Init();
	Timer3_Init();
}

void Timer1_Init(void)
{
	// Make sure the Timer can produce the appropriate frequency in 8-bit mode
	// Supported SMBus Frequencies range from 10kHz to 100kHz.  The CKCON register
	// settings may need to change for frequencies outside this range.
	#if ((SYSCLK/SMB_FREQUENCY/3) < 255)
	#define SCALE 1
		CKCON |= 0x08;                  // Timer1 clock source = SYSCLK
	#elif ((SYSCLK/SMB_FREQUENCY/4/3) < 255)
	#define SCALE 4
		CKCON |= 0x01;
    	CKCON &= ~0x0A;                 // Timer1 clock source = SYSCLK / 4
	#endif
	
   	TMOD = 0x20;                        // Timer1 in 8-bit auto-reload mode

   	// Timer1 configured to overflow at 1/3 the rate defined by SMB_FREQUENCY
   	TH1 = -(SYSCLK/SMB_FREQUENCY/SCALE/3);
   	TL1 = TH1;                          // Init Timer1
   	TR1 = 1;                           	// Timer1 enabled
}

void Timer3_Init(void)
{
   	TMR3CN = 0x00;                      // Timer3 configured for 16-bit auto-
                                       	// reload, low-byte interrupt disabled

   	CKCON &= ~0x40;                     // Timer3 uses SYSCLK/12
   	TMR3RL = -(SYSCLK/12/40);           // Timer3 configured to overflow after
   	TMR3 = TMR3RL;                      // ~25ms (for SMBus low timeout detect):
                                       	// 1/.025 = 40

   	EIE1 |= 0x80;                       // Timer3 interrupt enable
   	TMR3CN |= 0x04;                     // Start Timer3
}

void Enb_Interrupt(void)
{
   	EIE1 |= 0x01;                       // Enable the SMBus interrupt
   	EA = 1;                             // Global interrupt enable
}

#include <ws_iic.h>

/*Hardware Environment£ºDVK501 && F340+ EX*/
#elif defined(_DVK501_F340_EX_)

void Timer1_Init(void);
void Timer3_Init(void);
void Enb_Interrupt(void);
void SMBus_ISR(void);
void Timer3_ISR(void);

// 16-bit SFR declarations
sfr16 TMR3RL   = 0x92;                 // Timer3 reload registers
sfr16 TMR3     = 0x94;                 // Timer3 counter registers

sbit SDA = P1^0;                       // SMBus on P1.0
sbit SCL = P1^1;                       // and P1.1

void SMBus_Init(void)	 	 	
{
	XBR0 |= 0x07;                      // Enable SMBus pins
	P1MDOUT = 0x00;                    // All P1 pins open-drain output
   	P1 = 0xFF;
	SMB0CF = 0x5D;                     // Use Timer1 overflows as SMBus clock source;
                                       // Disable slave mode;
                                       // Enable setup & hold time extensions;
                                       // Enable SMBus Free timeout detect;
                                       // Enable SCL low timeout detect;

   	SMB0CF |= 0x80;                    // Enable SMBus	
	Timer1_Init();
	Timer3_Init();
}

void Timer1_Init(void)
{
	// Make sure the Timer can produce the appropriate frequency in 8-bit mode
	// Supported SMBus Frequencies range from 10kHz to 100kHz.  The CKCON register
	// settings may need to change for frequencies outside this range.
	#if ((SYSCLK/SMB_FREQUENCY/3) < 255)
	#define SCALE 1
		CKCON |= 0x08;                  // Timer1 clock source = SYSCLK
	#elif ((SYSCLK/SMB_FREQUENCY/4/3) < 255)
	#define SCALE 4
		CKCON |= 0x01;
    	CKCON &= ~0x0A;                 // Timer1 clock source = SYSCLK / 4
	#endif
	
   	TMOD = 0x20;                        // Timer1 in 8-bit auto-reload mode

   	// Timer1 configured to overflow at 1/3 the rate defined by SMB_FREQUENCY
   	TH1 = -(SYSCLK/SMB_FREQUENCY/SCALE/3);
   	TL1 = TH1;                          // Init Timer1
   	TR1 = 1;                           	// Timer1 enabled
}

void Timer3_Init(void)
{
   	TMR3CN = 0x00;                      // Timer3 configured for 16-bit auto-
                                       	// reload, low-byte interrupt disabled

   	CKCON &= ~0x40;                     // Timer3 uses SYSCLK/12
   	TMR3RL = -(SYSCLK/12/40);           // Timer3 configured to overflow after
   	TMR3 = TMR3RL;                      // ~25ms (for SMBus low timeout detect):
                                       	// 1/.025 = 40

   	EIE1 |= 0x80;                       // Timer3 interrupt enable
   	TMR3CN |= 0x04;                     // Start Timer3
}

void Enb_Interrupt(void)
{
   	EIE1 |= 0x01;                       // Enable the SMBus interrupt
   	EA = 1;                             // Global interrupt enable
}

#include <../../../library/ws_iic.h>

/*Hardware Environment£ºDVK501 && F020+ EX*/
#elif defined(_DVK501_F020_EX_)

void Timer3_Init(void);
void Enb_Interrupt(void);
void SMBus_ISR(void);
void Timer3_ISR(void);

// 16-bit SFR declarations
sfr16 TMR3RL   = 0x92;                 // Timer3 reload registers
sfr16 TMR3     = 0x94;                 // Timer3 counter registers

sbit SDA = P0^6;                       // SMBus on P0.6
sbit SCL = P0^7;                       // and P0.7

void SMBus_Init(void)	 	 	
{
	XBR0 |= 0x07;                      // Enable SMBus on the crossbar
	P0MDOUT = 0x00;                    // All P0 pins open-drain output
    P0 = 0xFF;
   	SMB0CN = 0x07;                     // Assert Acknowledge low (AA bit = 1b);
                                       // Enable SMBus Free timeout detect;
                                       // Enable SCL low timeout detect

   // SMBus clock rate (derived approximation from the Tlow and Thigh equations
   // in the SMB0CR register description)
   	SMB0CR = 257 - (SYSCLK / (2 * SMB_FREQUENCY));
  	SMB0ADR = 0x02;                    // Set own slave address.
   	SMB0CN |= 0x40;                    // Enable SMBus;	
	Timer3_Init();
}

void Timer3_Init (void)
{
   	TMR3CN = 0x00;                     // Timer3 uses SYSCLK/12
   	TMR3RL = -(SYSCLK/12/40);          // Timer3 configured to overflow after
   	TMR3 = TMR3RL;                     // ~25ms (for SMBus low timeout detect)
   	EIE2 |= 0x01;                      // Timer3 interrupt enable
   	TMR3CN |= 0x04;                    // Start Timer3
}

void Enb_Interrupt(void)
{
	EIE1 |= 0x02;                      // Enable the SMBus interrupt
   	EA = 1;                            // Global interrupt enable
   	SI = 0;                            // Global interrupt enable
}

#include <../../../library/ws_iic2.h>

#else
  #warning "iic interface undefined."
#endif

#endif /*_WS_IIC_PORT_H_*/
