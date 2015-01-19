using Raspberry.IO;
using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class MCP3208ADConverter : SpiConnection
    {
        public MCP3208ADConverter(IOutputBinaryPin clockPin, IOutputBinaryPin selectSlavePin, IInputBinaryPin misoPin, IOutputBinaryPin mosiPin)
            : base(clockPin, selectSlavePin, misoPin, mosiPin, Endianness.LittleEndian)
        {

        }

        public ulong ReadConverted(int channel)
        {
            using (SelectSlave())
            {
                byte ch = (byte)channel;
                ch |= 0x18;

                Write(ch, 5);

                Synchronize();

                ulong output = Read(13);
                output &= 0xFFF;

                return output;
            }
        }
    }
}
