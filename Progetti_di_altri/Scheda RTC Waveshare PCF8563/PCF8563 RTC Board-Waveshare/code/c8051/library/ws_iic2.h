/********************************************************************************************************
*
* File                : ws_iic2.h
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
 
#define  WRITE        0x00        	   	// SMBus WRITE command
#define  READ         0x01             	// SMBus READ command

// Device addresses (7 bits, lsb is a don't care)
#define  SMB_BUS_ERROR  0x00           	// (all modes) BUS ERROR
#define  SMB_START      0x08           	// (MT & MR) START transmitted
#define  SMB_RP_START   0x10           	// (MT & MR) repeated START
#define  SMB_MTADDACK   0x18           	// (MT) Slave address + W transmitted; ACK received
#define  SMB_MTADDNACK  0x20           	// (MT) Slave address + W transmitted; NACK received
#define  SMB_MTDBACK    0x28           	// (MT) data byte transmitted; ACK rec'vd
#define  SMB_MTDBNACK   0x30           	// (MT) data byte transmitted; NACK rec'vd
#define  SMB_MTARBLOST  0x38           	// (MT) arbitration lost
#define  SMB_MRADDACK   0x40           	// (MR) Slave address + R transmitted; ACK received
#define  SMB_MRADDNACK  0x48           	// (MR) Slave address + R transmitted; NACK received
#define  SMB_MRDBACK    0x50           	// (MR) data byte rec'vd; ACK transmitted
#define  SMB_MRDBNACK   0x58           	// (MR) data byte rec'vd; NACK transmitted
// End status vector definition

//-----------------------------------------------------------------------------
// Global VARIABLES
//-----------------------------------------------------------------------------
unsigned char SMB_DATA_IN[3];          	// Global holder for SMBus data
                                       	// All receive data is written here
	
unsigned char SMB_DATA_OUT[2];         	// Global holder for SMBus data.
                                       	// All transmit data is read from here

unsigned char COMMAND,num[2];          	// Target SMBus slave address

bit SMB_BUSY;						   	// Software flag to indicate when the
                                       	// SMB_Read() or SMB_Write() functions have claimed the SMBus

bit SMB_RW;							   	// SMBus READ or WRITE, 0 is READ, 1 is WRITE

//-----------------------------------------------------------------------------
// Check_SDA
//-----------------------------------------------------------------------------
// If slave is holding SDA low because of an improper SMBus reset or error
void Check_SDA(void)
{  	
	uchar i;                    		// Dummy variable counters
	while(!SDA)
   	{
      	// Provide clock pulses to allow the slave to advance out
      	// of its current state. This will allow it to release SDA.
      	XBR1 = 0x40;                    // Enable Crossbar
      	SCL = 0;                        // Drive the clock low
      	for(i = 0; i < 255; i++);       // Hold the clock low
      	SCL = 1;                        // Release the clock
      	while(!SCL);                    // Wait for open-drain
                                       	// clock output to rise
      	for(i = 0; i < 10; i++);        // Hold the clock high
      	XBR1 = 0x00;                    // Disable Crossbar
   	}
}

//-----------------------------------------------------------------------------
// wrDAdr:I2C address
// dat:I2C data
//-----------------------------------------------------------------------------
void SMBus_Write(uint wrDAdr,uchar Data1,uchar Data2,uchar Num)
{
	while(SMB_BUSY);                   	// Wait for SMBus to be free.
	SMB_BUSY = 1;                       // Claim SMBus (set to busy)
	COMMAND = wrDAdr;	
	SMB_DATA_OUT[0] = Data1;
	SMB_DATA_OUT[1] = Data2;
	num[0] = Num;
	SMB_RW = 0;
   	STO = 0;
	STA = 1;                            // Start transfer
	while(SMB_BUSY);                   	// Wait for SMBus to be free.
}

//-----------------------------------------------------------------------------
// wrDAdr:I2C address
//-----------------------------------------------------------------------------
void SMBus_Read(uint wrDAdr,uchar *Data,uchar Num)
{
  	uchar i;
	while(SMB_BUSY);                  // Wait for bus to be free.
  	SMB_BUSY = 1;                     // Claim SMBus (set to busy)
	COMMAND = wrDAdr;
	num[1] = Num;
	SMB_RW = 1;
   	STO = 0;
	STA = 1;                            // Start transfer	
   	while(SMB_BUSY);                  // Wait for transfer to complete
	for(i=0;i<Num;i++)
		Data[i] = SMB_DATA_IN[i];
}

void SMBUS_ISR (void) interrupt 7
{
   	bit FAIL = 0;                       // Used by the ISR to flag failed transfers
   	static uchar sent_byte_counter;
   	static uchar rec_byte_counter;

   	// Status code for the SMBus (SMB0STA register)
   	switch(SMB0STA)
   	{
      	// Master Transmitter/Receiver: START condition transmitted.
      	// Load SMB0DAT with slave device address.
      	case SMB_START:

      	// Master Transmitter/Receiver: repeated START condition transmitted.
      	// Load SMB0DAT with slave device address
      	case SMB_RP_START:
		{
         	SMB0DAT = COMMAND;          // Load address of the slave.
         	SMB0DAT &= 0xFE;            // Clear the LSB of the address for the R/W bit
         	SMB0DAT |= SMB_RW;          // Load R/W bit
         	STA = 0;                    // Manually clear STA bit
         	rec_byte_counter = 1;       // Reset the counter
         	sent_byte_counter = 1;      // Reset the counter
         	break;
		}
      	// Master Transmitter: Slave address + WRITE transmitted.  ACK received.
      	// For a READ: N/A
      	// For a WRITE: Send the first data byte to the slave.
      	case SMB_MTADDACK:
		{
         	SMB0DAT = SMB_DATA_OUT[sent_byte_counter-1];
         	sent_byte_counter++;
	        break;
		}
      	// Master Transmitter: Slave address + WRITE transmitted.  NACK received.
      	// Restart the transfer.
      	case SMB_MTADDNACK:
        { 
		 	STA = 1;                    // Restart transfer
         	break;
		}
      	// Master Transmitter: Data byte transmitted.  ACK received.
      	// For a READ: N/A
		// For a WRITE: Send all data.  After the last data byte, send the stop bit.
      	case SMB_MTDBACK:
		{
         	if (sent_byte_counter <= num[0])
         	{
            	// send data byte
            	SMB0DAT = SMB_DATA_OUT[sent_byte_counter-1];
            	sent_byte_counter++;
         	}
			else
        	{
            	STO = 1;          		// Set STO to terminate transfer
            	SMB_BUSY = 0;    		// And free SMBus interface
        	}
         	break;
		}
      	// Master Transmitter: Data byte transmitted.  NACK received.
      	// Restart the transfer.
      	case SMB_MTDBNACK:
        {
		 	STA = 1;                    // Restart transfer
 	        break;
		}
      	// Master Receiver: Slave address + READ transmitted.  ACK received.
      	// For a READ: check if this is a one-byte transfer. if so, set the
      	//  NACK after the data byte is received to end the transfer. if not,
      	//  set the ACK and receive the other data bytes.
      	// For a WRITE: N/A
      	case SMB_MRADDACK:
		{
         	if (rec_byte_counter == num[1])
         	{
            	AA = 0;         	    // Only one byte in this transfer, send NACK after byte is received
         	}
         	else
         	{
            	AA = 1;                 // More than one byte in this transfer, send ACK after byte is received
         	}
			break;
		}
      	// Master Receiver: Slave address + READ transmitted.  NACK received.
      	// Restart the transfer.
      	case SMB_MRADDNACK:
        {
		 	STA = 1;                    // Restart transfer
         	break;
		}
      	// Master Receiver: Data byte received.  ACK transmitted.
      	// For a READ: receive each byte from the slave.  if this is the last
      	//  byte, send a NACK and set the STOP bit.
      	// For a WRITE: N/A
      	case SMB_MRDBACK:
		{
         	if (rec_byte_counter < num[1])
         	{
            	SMB_DATA_IN[rec_byte_counter-1] = SMB0DAT; // Store received byte
            	AA = 1;                 // Send ACK to indicate byte received
            	rec_byte_counter++;     // Increment the byte counter
         	}
         	else
         	{	
            	AA = 0;                 // Send NACK to indicate last byte of this transfer
         	}
         	break;
		}
      	// Master Receiver: Data byte received.  NACK transmitted.
      	// For a READ: Read operation has completed.  Read data register and send STOP.
      	// For a WRITE: N/A
      	case SMB_MRDBNACK:
		{
         	SMB_DATA_IN[rec_byte_counter-1] = SMB0DAT; // Store received byte
         	STO = 1;
         	SMB_BUSY = 0;
         	AA = 1;                     // Set AA for next transfer
	        break;
		}
      	// Master Transmitter: Arbitration lost.
      	case SMB_MTARBLOST:
		{
			FAIL = 1;                   // Indicate failed transfer and handle at end of ISR
			break;
		}
      	// All other status codes invalid.  Reset communication.
      	default:
        {
		 	FAIL = 1;
         	break;
		}
	}
	if (FAIL)              	            // If the transfer failed,
   	{	
      	SMB0CN &= ~0x40;                // Reset communication
      	SMB0CN |= 0x40;
      	STA = 0;
      	STO = 0;
      	AA = 0;
      	SMB_BUSY = 0;                   // Free SMBus
      	FAIL = 0;
   	}
   SI = 0;                              // Clear interrupt flag
}

void Timer3_ISR (void) interrupt 14
{
   SMB0CN &= ~0x40;                     // Disable SMBus
   SMB0CN |= 0x40;                      // Re-enable SMBus
   TMR3CN &= ~0x80;                     // Clear Timer3 interrupt-pending flag
   SMB_BUSY = 0;                        // Free bus
}

#endif /*_WS_IIC_H_*/
