/********************************************************************************************************
*
* File                : ws_onewire.h
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

#ifndef _WS_ONEWIRE_H_
#define _WS_ONEWIRE_H_

void resetOnewire(void) 
{
	OUT_DQ();
    DQ = 0;
    delay_us(750);
    DQ = 1;
	IN_DQ(); 
	while(DQ);
	while(!DQ);
	OUT_DQ();
}

uchar rOnewire(void)
{
    uchar Data = 0,i = 0;
    for(i=0;i<8;i++)
    {
		Data >>= 1;
		OUT_DQ();
        DQ = 0;
        delay_us(5);
		DQ = 1;
		delay_us(15);
		IN_DQ();
        if(DQ) Data |= 0x80;
        else while(!DQ);
		delay_us(60);
		DQ = 1;
	}
	return(Data);
}

void wOnewire(uchar Data)
{
    uchar i = 0;
	OUT_DQ();
    for(i=0;i<8;i++)
    {
        if(Data & 0x01)
		{
            DQ = 0;
            delay_us(5);
            DQ = 1;
            delay_us(85); 
		}
   	 	else
   	 	{
       		DQ = 0; 
        	delay_us(90); 
        	DQ = 1;
        	delay_us(5);
    	}
    	Data = Data>>1;
    }
}
#endif /*_WS_ONEWIRE_H_*/
