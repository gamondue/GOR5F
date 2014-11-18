/***********************************************************************************************
 * Based on https://github.com/adafruit/Adafruit_ADS1X15/blob/master/Adafruit_ADS1015.cpp
 * 
 * 
 * 
 ***********************************************************************************************/
using System;
using System.Threading;

namespace i2c
{
    // ReSharper disable once InconsistentNaming
    internal class ADS1115 : ADS1115Base
    {
        public event EventHandler<SingleEndedConversionEventArgs> SingleEndedConversionReading;
        public event EventHandler<ConverterMessageEventArgs> Message;
        public ADS1115(string busid, uint i2CAdd = 0x48) : base(busid, i2CAdd)
        {
            Console.WriteLine("Constructor. BusAddress: {0} DeviceAddress {1}", busid, GetAsHexString(i2CAdd));
            ConversionDelay = GetConstantAsByte("ADS1115_CONVERSIONDELAY");
            Console.WriteLine("Conversion Delay from Dictionary. Value: {0} ms", ConversionDelay);
            BitShift = 0;
        }
        internal override void Start()
        {
            DoWork = true;
            Message(this, new ConverterMessageEventArgs { Message = string.Format("Starting Continous Conversion Readings") });
            ThreadStart s = () =>
            {
                Message(this, new ConverterMessageEventArgs { Message = string.Format("Starting Thread Delegate Method") });
                //startComparator_SingleEnded(0, 1000); // Read A0 @ 3V
                while (DoWork)
                {
                    var data = readADC_SingleEnded(0);
                    //ushort data = getLastConversionResults();
                    var _event = new SingleEndedConversionEventArgs { Data = data };
                    SingleEndedConversionReading(this, _event);
                    Thread.Sleep(1000);
                }
            };
            
            var work = new Thread(s);
            work.Start();
            
        }
               
        public override ushort readADC_SingleEnded(uint channel)
        {
            if (channel > 3)
            {
                return 0;
            }

            var config = Set_Defaults();

            // Set single-ended input channel
            switch (channel)
            {
                case (0):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_0");
                    break;
                case (1):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_1");
                    break;
                case (2):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_2");
                    break;
                case (3):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_3");
                    break;
            }

            // Set 'start single-conversion' bit
            config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_OS_SINGLE");

            return GetReadingFromConverter(config);
        }

        private ushort GetReadingFromConverter(uint config)
        {
            // Write config register to the ADC
            Set16(Busid, GetConstantAsString("ADS1115_ADDRESS"), GetConstantAsString("ADS1115_REG_POINTER_CONFIG"), GetAsHexString(config), 0);

            // Wait for the conversion to complete
            Thread.Sleep(ConversionDelay);

            // Read the conversion results
            // Shift 12-bit results right 4 bits for the ADS1015
            return (UInt16)(GetValue16("ADS1115_ADDRESS", "ADS1115_REG_POINTER_CONVERT") >> BitShift);
        }

        private static uint Set_Defaults()
        {
            // Start with default values
            var config = (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CQUE_NONE") |          // Disable the comparator (default val)
                              (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CLAT_NONLAT") |   // Non-latching (default val)
                              (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CPOL_ACTVLOW") |  // Alert/Rdy active low   (default val)
                              (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CMODE_TRAD") |    // Traditional comparator (default val)
                              (uint)GetConstantAsByte("ADS1115_REG_CONFIG_DR_1600SPS") |    // 1600 samples per second (default)
                              (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MODE_SINGLE");    // Single-shot mode (default)

            // Set PGA/voltage range
            //config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_PGA_6_144V");             // +/- 6.144V range (limited to VDD +0.3V max!)
            config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_PGA_1_024V");             
            return config;
        }

        public override short readADC_Differential_0_1()
        {
            // Start with default values
            var config = Set_Defaults();

            // Set channels
            config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_DIFF_0_1");   // AIN0 = P, AIN1 = N

            // Set 'start single-conversion' bit
            config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_OS_SINGLE");

            return (short)GetReadingFromConverter(config);
        }

        public override short readADC_Differential_2_3()
        {
            // Start with default values
            var config = Set_Defaults();

            // Set channels
            config |= (uint)GetConstantAsByte("ADS1015_REG_CONFIG_MUX_DIFF_2_3"); // AIN2 = P, AIN3 = N

            // Set 'start single-conversion' bit
            config |= (uint)GetConstantAsByte("ADS1015_REG_CONFIG_OS_SINGLE");

            return (short)GetReadingFromConverter(config);
        }

        public override void startComparator_SingleEnded(UInt16 channel, Int16 threshold)
        {
            Message(this, new ConverterMessageEventArgs { Message = string.Format("Starting Continous Readings. Channel: {0} Threshold {1}", channel, threshold) });
            // Start with default values
            var config = (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CQUE_1CONV")   |       // Comparator enabled and asserts on 1 match
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CLAT_LATCH")   |    // Latching mode
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CPOL_ACTVLOW") |    // Alert/Rdy active low   (default val)
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_CMODE_TRAD")   |    // Traditional comparator (default val)
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_DR_1600SPS")   |    // 1600 samples per second (default)
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MODE_CONTIN")  |    // Continuous conversion mode
                            (uint)GetConstantAsByte("ADS1115_REG_CONFIG_PGA_6_144V");       //| // +/- 6.144V range (limited to VDD +0.3V max!)
                            //(uint)GetConstantAsByte("ADS1115_REG_CONFIG_MODE_CONTIN");    // Continuous conversion mode

            // Set single-ended input channel
            switch (channel)
            {
                case (0):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_0");
                    break;
                case (1):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_1");
                    break;
                case (2):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_2");
                    break;
                case (3):
                    config |= (uint)GetConstantAsByte("ADS1115_REG_CONFIG_MUX_SINGLE_3");
                    break;
            }
            // Set the high threshold register
            // Shift 12-bit results left 4 bits for the ADS1015
            Message(this, new ConverterMessageEventArgs { Message = string.Format("Get Device Address. Address: {0}", GetConstantAsString("ADS1115_ADDRESS"))});
            Set16(Busid, GetConstantAsString("ADS1115_ADDRESS"), GetConstantAsString("ADS1115_REG_POINTER_HITHRESH"), GetAsHexString(threshold << BitShift), 0);
              
            // Write config register to the ADC
            Set16(Busid, GetConstantAsString("ADS1115_ADDRESS"), GetConstantAsString("ADS1115_REG_POINTER_CONFIG"), GetAsHexString(config), 0);
        }
        public override ushort GetLastConversionResults()
        {
            // Wait for the conversion to complete
            Thread.Sleep(ConversionDelay);

            // Read the conversion results
            // Shift 12-bit results right 4 bits for the ADS1015
            return (ushort)(GetValue16("ADS1115_ADDRESS", "ADS1115_REG_POINTER_CONVERT") >> BitShift);
        }
    }
}


///**************************************************************************/
///*!
//    @brief  Writes 16-bits to the specified destination register
//*/
///**************************************************************************/
//static void writeRegister(uint8_t i2cAddress, uint8_t reg, uint16_t value) {
//  Wire.beginTransmission(i2cAddress);
//  i2cwrite((uint8_t)reg);
//  i2cwrite((uint8_t)(value>>8));
//  i2cwrite((uint8_t)(value & 0xFF));
//  Wire.endTransmission();
//}

///**************************************************************************/
///*!
//    @brief  Reads 16-bits from the specified source register
//*/
///**************************************************************************/
//static uint16_t readRegister(uint8_t i2cAddress, uint8_t reg) {
//  Wire.beginTransmission(i2cAddress);
//  i2cwrite(ADS1015_REG_POINTER_CONVERT);
//  Wire.endTransmission();
//  Wire.requestFrom(i2cAddress, (uint8_t)2);
//  return ((i2cread() << 8) | i2cread());  
//}

///**************************************************************************/
///*!
//    @brief  Gets a single-ended ADC reading from the specified channel
//*/
///**************************************************************************/
//uint16_t Adafruit_ADS1015::readADC_SingleEnded(uint8_t channel) {
//  if (channel > 3)
//  {
//    return 0;
//  }
  
//  // Start with default values
//  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
//                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
//                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
//                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
//                    ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
//                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

//  // Set PGA/voltage range
//  config |= ADS1015_REG_CONFIG_PGA_6_144V;            // +/- 6.144V range (limited to VDD +0.3V max!)

//  // Set single-ended input channel
//  switch (channel)
//  {
//    case (0):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_0;
//      break;
//    case (1):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_1;
//      break;
//    case (2):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_2;
//      break;
//    case (3):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_3;
//      break;
//  }

//  // Set 'start single-conversion' bit
//  config |= ADS1015_REG_CONFIG_OS_SINGLE;

//  // Write config register to the ADC
//  writeRegister(m_i2cAddress, ADS1015_REG_POINTER_CONFIG, config);

//  // Wait for the conversion to complete
//  delay(m_conversionDelay);

//  // Read the conversion results
//  // Shift 12-bit results right 4 bits for the ADS1015
//  return readRegister(m_i2cAddress, ADS1015_REG_POINTER_CONVERT) >> m_bitShift;  
//}

///**************************************************************************/
///*! 
//    @brief  Reads the conversion results, measuring the voltage
//            difference between the P (AIN0) and N (AIN1) input.  Generates
//            a signed value since the difference can be either
//            positive or negative.
//*/
///**************************************************************************/
//int16_t Adafruit_ADS1015::readADC_Differential_0_1() {
//  // Start with default values
//  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
//                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
//                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
//                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
//                    ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
//                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

//  // Set PGA/voltage range
//  config |= ADS1015_REG_CONFIG_PGA_6_144V;            // +/- 6.144V range (limited to VDD +0.3V max!)

//  // Set channels
//  config |= ADS1015_REG_CONFIG_MUX_DIFF_0_1;          // AIN0 = P, AIN1 = N

//  // Set 'start single-conversion' bit
//  config |= ADS1015_REG_CONFIG_OS_SINGLE;

//  // Write config register to the ADC
//  writeRegister(m_i2cAddress, ADS1015_REG_POINTER_CONFIG, config);

//  // Wait for the conversion to complete
//  delay(m_conversionDelay);

//  // Read the conversion results
//  // Shift 12-bit results right 4 bits for the ADS1015
//  return (int16_t)(readRegister(m_i2cAddress, ADS1015_REG_POINTER_CONVERT) >> m_bitShift);  
//}

///**************************************************************************/
///*! 
//    @brief  Reads the conversion results, measuring the voltage
//            difference between the P (AIN2) and N (AIN3) input.  Generates
//            a signed value since the difference can be either
//            positive or negative.
//*/
///**************************************************************************/
//int16_t Adafruit_ADS1015::readADC_Differential_2_3() {
//  // Start with default values
//  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
//                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
//                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
//                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
//                    ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
//                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

//  // Set PGA/voltage range
//  config |= ADS1015_REG_CONFIG_PGA_6_144V;            // +/- 6.144V range (limited to VDD +0.3V max!)

//  // Set channels
//  config |= ADS1015_REG_CONFIG_MUX_DIFF_2_3;          // AIN2 = P, AIN3 = N

//  // Set 'start single-conversion' bit
//  config |= ADS1015_REG_CONFIG_OS_SINGLE;

//  // Write config register to the ADC
//  writeRegister(m_i2cAddress, ADS1015_REG_POINTER_CONFIG, config);

//  // Wait for the conversion to complete
//  delay(m_conversionDelay);

//  // Shift 12-bit results right 4 bits for the ADS1015
//  return (int16_t)(readRegister(m_i2cAddress, ADS1015_REG_POINTER_CONVERT) >> m_bitShift);  
//}

///**************************************************************************/
///*!
//    @brief  Sets up the comparator to operate in basic mode, causing the
//            ALERT/RDY pin to assert (go from high to low) when the ADC
//            value exceeds the specified threshold.

//            This will also set the ADC in continuous conversion mode.
//*/
///**************************************************************************/
//void Adafruit_ADS1015::startComparator_SingleEnded(uint8_t channel, int16_t threshold)
//{
//  uint16_t value;

//  // Start with default values
//  uint16_t config = ADS1015_REG_CONFIG_CQUE_1CONV   | // Comparator enabled and asserts on 1 match
//                    ADS1015_REG_CONFIG_CLAT_LATCH   | // Latching mode
//                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
//                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
//                    ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
//                    ADS1015_REG_CONFIG_MODE_CONTIN  | // Continuous conversion mode
//                    ADS1015_REG_CONFIG_PGA_6_144V   | // +/- 6.144V range (limited to VDD +0.3V max!)
//                    ADS1015_REG_CONFIG_MODE_CONTIN;   // Continuous conversion mode

//  // Set single-ended input channel
//  switch (channel)
//  {
//    case (0):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_0;
//      break;
//    case (1):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_1;
//      break;
//    case (2):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_2;
//      break;
//    case (3):
//      config |= ADS1015_REG_CONFIG_MUX_SINGLE_3;
//      break;
//  }

//  // Set the high threshold register
//  // Shift 12-bit results left 4 bits for the ADS1015
//  writeRegister(m_i2cAddress, ADS1015_REG_POINTER_HITHRESH, threshold << m_bitShift);

//  // Write config register to the ADC
//  writeRegister(m_i2cAddress, ADS1015_REG_POINTER_CONFIG, config);
//}

///**************************************************************************/
///*!
//    @brief  In order to clear the comparator, we need to read the
//            conversion results.  This function reads the last conversion
//            results without changing the config value.
//*/
///**************************************************************************/
//int16_t Adafruit_ADS1015::getLastConversionResults()
//{
//  // Wait for the conversion to complete
//  delay(m_conversionDelay);

//  // Read the conversion results
//  // Shift 12-bit results right 4 bits for the ADS1015
//  return (int16_t)(readRegister(m_i2cAddress, ADS1015_REG_POINTER_CONVERT) >> m_bitShift);
//}

