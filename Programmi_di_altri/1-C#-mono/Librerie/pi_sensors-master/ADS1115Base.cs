/**********************************************************************************************
 * Based on https://github.com/adafruit/Adafruit_ADS1X15/blob/master/Adafruit_ADS1015.h
 * 
 * 
 * 
 ***********************************************************************************************/
using System;
using System.Collections.Generic;

namespace i2c
{
    // ReSharper disable once InconsistentNaming
    internal abstract class ADS1115Base : RPi.I2C.Net.i2c
    {
        public ADS1115Base(string busid, uint i2CAdd)
        {
            Console.WriteLine("Setting up. BusID: {0}, DeviceAddress: {1}", busid, GetAsHexString(i2CAdd));
            I2CAddress = i2CAdd;
            Busid = busid;
            Constants = new Dictionary<string, int> 
            { 
                { "ADS1115_ADDRESS", (int)i2CAdd },
                { "ADS1015_CONVERSIONDELAY", 0x01 }, // delay in ms
                { "ADS1115_CONVERSIONDELAY", 0x08 }, // delay in ms
                //Pointer Register
                { "ADS1115_REG_POINTER_MASK", 0x03 },
                { "ADS1115_REG_POINTER_CONVERT", 0x00 },
                { "ADS1115_REG_POINTER_CONFIG", 0x01 },
                { "ADS1115_REG_POINTER_LOWTHRESH", 0x02 },
                { "ADS1115_REG_POINTER_HITHRESH", 0x03 },
                //Config Register
                { "ADS1115_REG_CONFIG_OS_MASK", 0x8000 },
                { "ADS1115_REG_CONFIG_OS_SINGLE", 0x8000 },     // Write: Set to start a single-conversion
                { "ADS1115_REG_CONFIG_OS_BUSY", 0x0000 },       // Read: Bit = 0 when conversion is in progress
                { "ADS1115_REG_CONFIG_OS_NOTBUSY", 0x8000 },    // Read: Bit = 1 when device is not performing a conversion
                
                { "ADS1115_REG_CONFIG_MUX_MASK", 0x7000 },
                { "ADS1115_REG_CONFIG_MUX_DIFF_0_1", 0x0000 },  // Differential P = AIN0, N = AIN1 (default)
                { "ADS1115_REG_CONFIG_MUX_DIFF_0_3", 0x1000 },  // Differential P = AIN0, N = AIN3
                { "ADS1115_REG_CONFIG_MUX_DIFF_1_3", 0x2000 },  // Differential P = AIN1, N = AIN3
                { "ADS1115_REG_CONFIG_MUX_DIFF_2_3", 0x3000 },  // Differential P = AIN2, N = AIN3
                { "ADS1115_REG_CONFIG_MUX_SINGLE_0", 0x4000 },  // Single-ended AIN0
                { "ADS1115_REG_CONFIG_MUX_SINGLE_1", 0x5000 },  // Single-ended AIN1
                { "ADS1115_REG_CONFIG_MUX_SINGLE_2", 0x6000 },  // Single-ended AIN2
                { "ADS1115_REG_CONFIG_MUX_SINGLE_3", 0x7000 },  // Single-ended AIN3

                { "ADS1115_REG_CONFIG_PGA_MASK",    0x0E00 },
                { "ADS1115_REG_CONFIG_PGA_6_144V",  0x0000 }, // +/-6.144V range
                { "ADS1115_REG_CONFIG_PGA_4_096V",  0x0200 }, // +/-4.096V range
                { "ADS1115_REG_CONFIG_PGA_2_048V",  0x0400 }, // +/-2.048V range (default)
                { "ADS1115_REG_CONFIG_PGA_1_024V",  0x0600 }, // +/-1.024V range
                { "ADS1115_REG_CONFIG_PGA_0_512V",  0x0800 }, // +/-0.512V range
                { "ADS1115_REG_CONFIG_PGA_0_256V",  0x0A00 }, // +/-0.256V range

                { "ADS1115_REG_CONFIG_MODE_MASK",   0x0100 }, 
                { "ADS1115_REG_CONFIG_MODE_CONTIN", 0x0000 }, // Continuous conversion mode
                { "ADS1115_REG_CONFIG_MODE_SINGLE", 0x0100 }, // Power-down single-shot mode (default)

                { "ADS1115_REG_CONFIG_DR_MASK",     0x0E00 },
                { "ADS1115_REG_CONFIG_DR_128SPS",   0x0000 }, // 128 samples per second
                { "ADS1115_REG_CONFIG_DR_250SPS",   0x0020 }, // 250 samples per second
                { "ADS1115_REG_CONFIG_DR_490SPS",   0x0040 }, // 490 samples per second
                { "ADS1115_REG_CONFIG_DR_920SPS",   0x0050 }, // 920 samples per second
                { "ADS1115_REG_CONFIG_DR_1600SPS",  0x0080 }, // 1600 samples per second (default)
                { "ADS1115_REG_CONFIG_DR_2400SPS",  0x00A0 }, // 2400 samples per second
                { "ADS1115_REG_CONFIG_DR_3300SPS",  0x00C0 }, // 3300 samples per second

                { "ADS1115_REG_CONFIG_CMODE_MASK",      0x0010 }, 
                { "ADS1115_REG_CONFIG_CMODE_TRAD",      0x0000 }, // Traditional comparator with hysteresis (default)
                { "ADS1115_REG_CONFIG_CMODE_WINDOW",    0x0010 }, // Window comparator

                { "ADS1115_REG_CONFIG_CPOL_MASK",       0x0008 }, 
                { "ADS1115_REG_CONFIG_CPOL_ACTVLOW",    0x0000 }, // ALERT/RDY pin is low when active (default)
                { "ADS1115_REG_CONFIG_CPOL_ACTVHI",     0x0008 }, // ALERT/RDY pin is high when active

                { "ADS1115_REG_CONFIG_CLAT_MASK",   0x0004 }, // Determines if ALERT/RDY pin latches once asserted
                { "ADS1115_REG_CONFIG_CLAT_NONLAT", 0x0000 }, // Non-latching comparator (default)
                { "ADS1115_REG_CONFIG_CLAT_LATCH",  0x0004 }, // Latching comparator

                { "ADS1115_REG_CONFIG_CQUE_MASK",   0x0003 }, 
                { "ADS1115_REG_CONFIG_CQUE_1CONV",  0x0000 }, // Assert ALERT/RDY after one conversions
                { "ADS1115_REG_CONFIG_CQUE_2CONV",  0x0001 }, // Assert ALERT/RDY after two conversions
                { "ADS1115_REG_CONFIG_CQUE_4CONV",  0x0002 }, // Assert ALERT/RDY after four conversions
                { "ADS1115_REG_CONFIG_CQUE_NONE",   0x0003 }, // Disable the comparator and put ALERT/RDY in high state (default)
                
            };
        }

        private uint I2CAddress { get; set; }
        protected int ConversionDelay { get; set; }
        protected byte BitShift { get; set; }

        public abstract UInt16 readADC_SingleEnded(uint channel);
        public abstract Int16 readADC_Differential_0_1();
        public abstract Int16 readADC_Differential_2_3();

        public abstract void startComparator_SingleEnded(UInt16 channel, Int16 threshold);
        public abstract UInt16 GetLastConversionResults();
    }
    internal class SingleEndedConversionEventArgs : EventArgs
    {
        public ushort Data { get; set; }
    }
    internal class ConverterMessageEventArgs : EventArgs
    {
        public string Message { get; set; }
    }
}