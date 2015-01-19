using Raspberry.IO;
using Raspberry.IO.GeneralPurpose;
using Raspberry.IO.InterIntegratedCircuit;
using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    //public class Adc_MCP3208 : SpiConnection
    public class Adc_MCP3208
    {
        const ConnectorPin SPI_SCLK = ConnectorPin.P1Pin23;
        const ConnectorPin SPI_MISO = ConnectorPin.P1Pin21;
        const ConnectorPin SPI_MOSI = ConnectorPin.P1Pin19;
        const ConnectorPin SPI_CS = ConnectorPin.P1Pin24;
        const ConnectorPin I2C_SCL = ConnectorPin.P1Pin05;
        const ConnectorPin I2C_SDA = ConnectorPin.P1Pin03;

        GpioConnectionDriver gpioDriver = new GpioConnectionDriver();
        I2cDriver i2cDriver = new I2cDriver(I2C_SDA.ToProcessor(), I2C_SCL.ToProcessor());

        Adc_MCP3208 converter = new Adc_MCP3208();

        //public Adc_MCP3208(IOutputBinaryPin clockPin, IOutputBinaryPin selectSlavePin, IInputBinaryPin misoPin, IOutputBinaryPin mosiPin)
        //    : base(clockPin, selectSlavePin, misoPin, mosiPin, Endianness.LittleEndian)
        //{

        //}

        public Adc_MCP3208()
        {

        }

        public int Read(int channel) 
        {
            return (int) converter.Read(channel); 
        }

        //public int ReadPoints(int channel) 
        //{
        //    using (SelectSlave())
        //    {
        //        byte ch = (byte)channel;
        //        ch |= 0x18;

        //        Write(ch, 5);

        //        Synchronize();

        //        //ulong output = Read(13);
        //        int output = (int) Read(12);
        //        output &= 0xFFF;

        //        return output;
        //    }
        //}
    }
}
