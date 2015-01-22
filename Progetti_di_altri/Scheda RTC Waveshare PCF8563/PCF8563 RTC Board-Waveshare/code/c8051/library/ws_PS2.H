/********************************************************************************************************
*
* File                : ws_PS2.h
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

#ifndef _WS_PS2_H_
#define _WS_PS2_H_ 		

uchar check(uchar *keyVal)
{
    static uchar rcvBits = 0;	
	OUT_SCK; 		   			
	delay_us(4);
	SCK = 1;				
	delay_us(4);
	IN_SCK;					
	delay_us(4);

	if(!SCK)
	{
		if((rcvBits > 0) && (rcvBits < 9))
		{ 
			*keyVal >>= 1; 	
			if(SDA) *keyVal |= 0x80; 
		}
		rcvBits++;
		while(!SCK); 	
		if(rcvBits > 10)
		{
			rcvBits = 0; 		
			rcvF = 1; 		
		}
	}
	return rcvF;
}

uchar keyHandle(uchar val) 
{
	uchar i;
	static bit isUp = 0;		
	static bit shift = 0;	
	rcvF = 0; 
	if(val != 0xF0)	PORT = val;
	if(!isUp)
	{
		switch(val)
		{
			case 0xF0 :			// a relase action
			{
				isUp = 1;
				break;
			}
			case 0x12 :			// Left shift
			{
				shift = 1;
				break;
			}
			case 0x59 :			// Right shift
			{	
				shift = 1;
				break;
			}
			default:
			{
				if(!shift)		// If shift not pressed
				{ 
					for(i=0;i<59;i++) 
					{
						if(unshifted[i][0] == val) 
						{
							val = unshifted[i][1];
							return val;
						}
					}
				} 
				else			// If shift pressed
				{			
					for(i=0;i<59;i++)
					{
						if(shifted[i][0] == val) 
						{
							val = shifted[i][1];
							return val;
						}
					}
				}
				break;
			}
		}
	}
	else 
	{
		isUp=0;					
		switch(val)
		{
			case 0x12 :			// Left SHIFT
			{
				shift = 0;
				break;
			}
			case 0x59 :			// Right SHIFT
			{
				shift = 0;
				break;
			}
			default:break;
		}
	}
	return 0xff;
}  

#endif/*_WS_PS2_H_*/
