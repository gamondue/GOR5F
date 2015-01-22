/********************************************************************************************************
*
* File                : ws_iic.h
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

#ifndef _WS_IIC_H_
#define _WS_IIC_H_

//-----------------------------------------------------------------------------
// Global CONSTANTS
//-----------------------------------------------------------------------------
 
#define  WRITE        0x00            			// SMBus WRITE command
#define  READ         0x01            			// SMBus READ command

// Status vector - top 4 bits only
#define  SMBus_MTSTA  0xE0             			// (MT) start transmitted
#define  SMBus_MTDB   0xC0             			// (MT) data byte transmitted
#define  SMBus_MRDB   0x80             			// (MR) data byte received
// End status vector definition

//-----------------------------------------------------------------------------
// Global VARIABLES
//-----------------------------------------------------------------------------
unsigned char SMBus_DATA_IN[3];             	// Global holder for SMBus data
                                       			// All receive data is written here

unsigned char SMBus_DATA_OUT[2];            	// Global holder for SMBus data.
                                       			// All transmit data is read from here

unsigned char COMMAND,num[2];                  	// Target SMBus slave address

bit SMBus_BUSY;           		                // Software flag to indicate when the
                                       			// SMB_Read() or SMB_Write() functions
                                       			// have claimed the SMBus
bit SMBus_WR;									// SMBus READ or WRITE, 0 is READ, 1 is WRITE

//-----------------------------------------------------------------------------
// Check_SDA
//-----------------------------------------------------------------------------
// If slave is holding SDA low because of an improper SMBus reset or error
void Check_SDA(void)
{  	
	uchar i;                    			    // Dummy variable counters
	while(!SDA)
   	{
      	// Provide clock pulses to allow the slave to advance out
      	// of its current state. This will allow it to release SDA.
      	XBR1 = 0x40;                    		// Enable Crossbar
      	SCL = 0;                        		// Drive the clock low
      	for(i = 0; i < 255; i++);       		// Hold the clock low
      	SCL = 1;                        		// Release the clock
      	while(!SCL);                    		// Wait for open-drain
                                       			// clock output to rise
      	for(i = 0; i < 10; i++);        		// Hold the clock high
      	XBR1 = 0x00;                    		// Disable Crossbar
   	}
}

//-----------------------------------------------------------------------------
// wrDAdr:I2C address
// dat:I2C data
//-----------------------------------------------------------------------------
void SMBus_Write(uint wrDAdr,uchar Data1,uchar Data2,uchar Num)
{
	while(SMBus_BUSY);                   		// Wait for SMBus to be free.
	SMBus_BUSY = 1;                       		// Claim SMBus (set to busy)
	COMMAND = wrDAdr;	
	SMBus_DATA_OUT[0] = Data1;
	SMBus_DATA_OUT[1] = Data2;
	num[0] = Num;
	SMBus_WR = 0;
   	STO = 0;
	STA = 1;                            		// Start transfer
	while(SMBus_BUSY);                   		// Wait for SMBus to be free.
}

//-----------------------------------------------------------------------------
// wrDAdr:I2C address
//-----------------------------------------------------------------------------
void SMBus_Read(uint wrDAdr,uchar *Data,uchar Num)
{
  	uchar i;
	while(SMBus_BUSY);                   		// Wait for bus to be free.
  	SMBus_BUSY = 1;                       		// Claim SMBus (set to busy)
	COMMAND = wrDAdr;
	num[1] = Num;
	SMBus_WR = 1;
   	STO = 0;
	STA = 1;                            		// Start transfer	
   	while(SMBus_BUSY);                   		// Wait for transfer to complete
	for(i=0;i<Num;i++)
		Data[i] = SMBus_DATA_IN[i];
}

void SMBus_ISR(void) interrupt 7
{
   	bit FAIL = 0;                       		// Used by the ISR to flag failed transfers
	static uchar sent_byte_counter,rec_byte_counter;

   	if (ARBLOST == 0)                   		// Check for errors
   	{
      	// Normal operation
      	switch (SMB0CN & 0xF0)          		// Status vector
      	{
         	// Master Transmitter/Receiver: START condition transmitted.
         	case SMBus_MTSTA:
			{
				SMB0DAT = COMMAND;       		// Load address of the target slave
            	STA = 0;                	    // Manually clear START bit
				sent_byte_counter = 1;
				rec_byte_counter = 1;     
            	break;
			}
         	// Master Transmitter: Data byte transmitted
         	case SMBus_MTDB:
            {
				if (ACK)                   	    // Slave ACK?
            	{
					if (SMBus_WR == WRITE)      // If this transfer is a WRITE,
               		{
                  		if (sent_byte_counter <= num[0])
                  		{
                     		// send data byte
                     		SMB0DAT = SMBus_DATA_OUT[sent_byte_counter-1];
                     		sent_byte_counter++;
                  		}
                  		else
                  		{
                     		STO = 1;            // Set STO to terminate transfer
                     		SMBus_BUSY = 0;     // And free SMBus interface
                  		}
               		}
            	}
            	else                       		// If slave NACK,
            	{
              		STO = 1;                	// Send STOP condition, followed
               		STA = 1;                	// By a START
            	}
            	break;
			}
         	// Master Receiver: byte received
         	case SMBus_MRDB:
            {	
				if (rec_byte_counter < num[1])
            	{
               		SMBus_DATA_IN[rec_byte_counter-1] = SMB0DAT; // Store received byte
               		ACK = 1;                	// Send ACK to indicate byte received
               		rec_byte_counter++;     	// Increment the byte counter
            	}
            	else
            	{
               		SMBus_DATA_IN[rec_byte_counter-1] = SMB0DAT; // Store received byte
               		SMBus_BUSY = 0;          		// Free SMBus interface
               		ACK = 0;                	// Send NACK to indicate last byte of this transfer
					STO = 1;                	// Send STOP to terminate transfer
            	}
            	break;
			}
         	default:
            {
				FAIL = 1;                  		// Indicate failed transfer and handle at end of ISR
            	break;
			}
		} // end switch
   	}
   	else
   	{
      	// ARBLOST = 1, error occurred... abort transmission
      	FAIL = 1;
   	} // end ARBLOST if

   	if (FAIL)                           		// If the transfer failed,
   	{
      	SMB0CF &= ~0x80;                 		// Reset communication
      	SMB0CF |= 0x80;
      	STA = 0;
      	STO = 0;
      	ACK = 0;

      	SMBus_BUSY = 0;                    		// Free SMBus
	}

   	SI = 0;                             		// Clear interrupt flag
}

void Timer3_ISR(void) interrupt 14
{
   	SMB0CF &= ~0x80;                    		// Disable SMBus
   	SMB0CF |= 0x80;                     		// Re-enable SMBus
   	TMR3CN &= ~0x80;                    		// Clear Timer3 interrupt-pending flag
   	STA = 0;
   	SMBus_BUSY = 0;                       		// Free SMBus
}

#endif /*_WS_IIC_H_*/
