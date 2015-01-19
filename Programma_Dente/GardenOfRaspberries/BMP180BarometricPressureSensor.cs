using Raspberry.IO.InterIntegratedCircuit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class BMP180BarometricPressureSensor : Sensor
    {
        // Calibration data.
        private short ac1;
        private short ac2;
        private short ac3;
        private ushort ac4;
        private ushort ac5;
        private ushort ac6;
        private short b1;
        private short b2;
        private short mb;
        private short mc;
        private short md;

        // Connection to the sensor.
        private I2cDeviceConnection conn;

        public int DeviceAddress { get { return conn.DeviceAddress; } }
        public BMP180Accuracy Accuracy { get; set; }

        public BMP180BarometricPressureSensor() : base(true)
        {
            SensorName = "BMP180 Barometric Pressure";
        }

        public BMP180BarometricPressureSensor(int deviceAddress, I2cDriver driver) : base(false)
        {
            conn = driver.Connect(deviceAddress);
            Initialization();
            SensorName = "BMP180 Barometric Pressure";
        }

        public override string Read()
        {
            long pressure;

            long ut = ReadUT();
            long up = ReadUP();

            long x1 = (ut - ac6) * ac5 >> 15;
            long x2 = (mc << 11) / (x1 - md);
            long b5 = x1 + x2;

            long b6 = b5 - 4000;
            x1 = (b2 * ((b6 * b6) >> 12)) >> 11;
            x2 = (ac2 * b6) >> 11;
            long x3 = x1 + x2;
            long b3 = (((ac1 * 4 + x3) << (int)Accuracy) + 2) / 4;
            x1 = (ac3 * b6) >> 13;
            x2 = (b1 * ((b6 * b6) >> 12)) >> 16;
            x3 = ((x1 + x2) + 2) >> 2;
            ulong b4 = (ac4 * (ulong)(x3 + 32768)) >> 15;
            ulong b7 = (ulong)((ulong)(up - b3) * (ulong)(50000UL >> (int)Accuracy));

            if (b7 < 0x80000000)
                pressure = (long)((b7 * 2) / b4);
            else
                pressure = (long)((b7 / b4) * 2);

            x1 = (pressure >> 8) * (pressure >> 8);
            x1 = (x1 * 3038) >> 16;
            x2 = (-7357 * pressure) >> 16;
            pressure = pressure + ((x1 + x2 + 3791) >> 4);

            return pressure.ToString();
        }

        public override Measurement Measure()
        {
            string readVal = Read();

            return new Measurement
            {
                Value = double.Parse(readVal),
                Unit = "[Pa]",
                ReadValue = readVal,
                Name = "Pressure"
            };
        }

        public override void Initialization()
        {
            ac1 = ReadShort(Register.CAL_AC1);
            ac2 = ReadShort(Register.CAL_AC2);
            ac3 = ReadShort(Register.CAL_AC3);
            ac4 = ReadUshort(Register.CAL_AC4);
            ac5 = ReadUshort(Register.CAL_AC5);
            ac6 = ReadUshort(Register.CAL_AC6);
            b1 = ReadShort(Register.CAL_B1);
            b2 = ReadShort(Register.CAL_B2);
            mb = ReadShort(Register.CAL_MB);
            mc = ReadShort(Register.CAL_MC);
            md = ReadShort(Register.CAL_MD);
        }

        private static class Register
        {
            // Calibration data registers.
            public const byte CAL_AC1 = 0xAA;
            public const byte CAL_AC2 = 0xAC;
            public const byte CAL_AC3 = 0xAE;
            public const byte CAL_AC4 = 0xB0;
            public const byte CAL_AC5 = 0xB2;
            public const byte CAL_AC6 = 0xB4;
            public const byte CAL_B1  = 0xB6;
            public const byte CAL_B2  = 0xB8;
            public const byte CAL_MB  = 0xBA;
            public const byte CAL_MC  = 0xBC;
            public const byte CAL_MD  = 0xBE;

            // Read and Control Registers.
            public const byte CONTROL = 0xF4;
            public const byte TEMPDATA = 0xF6;
            public const byte PRESSUREDATA = 0xF6;
            public const byte READTEMPCMD = 0x2E;
            public const byte READPRESSURECMD = 0x34;
        }

        private byte ReadByte(byte address)
        {
            return ReadBytes(address, 1)[0];
        }

        private byte[] ReadBytes(byte address, int byteCount)
        {
            conn.WriteByte(address);
            return conn.Read(byteCount);
        }

        private ushort ReadUshort(byte address)
        {
            var bytes = ReadBytes(address, 2);
            unchecked
            {
                return (ushort)((bytes[0] << 8) + bytes[1]);
            }
        }

        private short ReadShort(byte address)
        {
            var bytes = ReadBytes(address, 2);
            unchecked
            {
                return (short)((bytes[0] << 8) + bytes[1]);
            }
        }

        private void WriteByte(byte address, byte data)
        {
            conn.Write(address, data);
        }

        private long ReadUT()
        {
            WriteByte(Register.CONTROL, Register.READTEMPCMD);

            Thread.Sleep(5);

            long ut = ReadByte(Register.TEMPDATA) << 8 + ReadByte(Register.TEMPDATA + 1);

            return ut;
        }

        private long ReadUP()
        {
            WriteByte(Register.CONTROL, (byte)(Register.READPRESSURECMD + ((int)Accuracy << 6)));

            switch (Accuracy)
            {
                case BMP180Accuracy.Low:
                    Thread.Sleep(5);
                    break;
                case BMP180Accuracy.Standard:
                    Thread.Sleep(8);
                    break;
                case BMP180Accuracy.High:
                    Thread.Sleep(14);
                    break;
                case BMP180Accuracy.UltraHigh:
                    Thread.Sleep(26);
                    break;
            }

            long ut = 0;

            for (byte i = 0; i < 3; i++)
                ut += ReadByte((byte)(Register.PRESSUREDATA + i)) << (8 * (3 - i));

            ut >>= (8 - (int)Accuracy);

            return ut;
        }
    }
}
