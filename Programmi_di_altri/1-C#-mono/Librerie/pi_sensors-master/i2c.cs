using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace RPi.I2C.Net
{
    internal abstract class i2c
    {
        internal static Dictionary<string, int> Constants { get; set; }

        protected static int Set16(string i2Cbusid, string deviceaddress, string dataaddress, string datavalue, int force)
        {
            var value = (UInt16)Convert.ToInt16(datavalue, 16);

            var add1 = (UInt16)Convert.ToInt16(dataaddress, 16);
            var add2 = ++add1;
            
            var msb = GetAsHexString(value >> 8);
            var lsb = GetAsHexString(value & 0xFF);
            Console.WriteLine("16-bit: Writing 16-bit Value: {0} as 2 8-bit values {1} and {2}", GetAsHexString(value), msb, lsb);

            Console.WriteLine("16-bit: Writing {0} to address {1}", msb, GetAsHexString(add1));
            var data = I2CNativeLib.Set(i2Cbusid, deviceaddress, GetAsHexString(add1), msb, force); //set msb byte/8 bits
            Console.WriteLine("16-bit: Response to msb: {0}", data);


            Console.WriteLine("16-bit: Writing {0} to address {1}", lsb, GetAsHexString(add2));
            data |= I2CNativeLib.Set(i2Cbusid, deviceaddress, GetAsHexString(add2), lsb, force); //set lsb byte/8 bits
            Console.WriteLine("16-bit: Response to msb |= lsb: {0}", data);
            return data;
 
        }

        protected static byte Set8(string i2Cbusid, string deviceaddress, string dataaddress, string datavalue, int force)
        {
            Console.WriteLine("8-bit: Writing {0} to address {1}", datavalue, dataaddress);
            //8-bit
            return (byte)I2CNativeLib.Set(i2Cbusid, deviceaddress, dataaddress, datavalue, force);
        }
        protected static byte Get(string i2Cbusid, string deviceaddress, string dataaddress)
        {
            return (byte)I2CNativeLib.Get(i2Cbusid, deviceaddress, dataaddress);
        }

        internal string Busid = string.Empty;
        internal bool DoWork = false;

        protected i2c()
        {
            Constants = new Dictionary<string, int>();
        }
        
        internal static int GetConstantAsByte(string key)
        {
            int value;
            Constants.TryGetValue(key, out value);
            return value;
        }
        internal static string GetConstantAsString(string key)
        {
            int value;
            Constants.TryGetValue(key, out value);
            return "0x" + value.ToString("X").PadLeft(2, '0');
        }
        internal static string GetAsHexString(uint value)
        {
            return "0x" + value.ToString("X").PadLeft(2, '0');
        }
        internal static string GetAsHexString(int value)
        {
            return "0x" + value.ToString("X").PadLeft(2, '0');
        }
        internal byte GetValue8(string deviceAddress, string dataAddress)
        {
            var result = Get(
                Busid,
                GetConstantAsString(deviceAddress),
                GetConstantAsString(dataAddress)
            );
            return result;
        }
        internal UInt16 GetValue16(string deviceAddress, string dataAddress)
        {
            var result = (UInt16)(Get(Busid, GetConstantAsString(deviceAddress), GetConstantAsString(dataAddress)) << 8);
            result |= Get(Busid, GetConstantAsString(deviceAddress), GetConstantAsString(dataAddress));

            return result;
        }
        internal abstract void Start();
        internal virtual void Stop()
        {
            DoWork = false;
        }
        private static class I2CNativeLib
        {
            [DllImport("i2c.so", EntryPoint = "Get", SetLastError = true)]
            public static extern int Get(string i2Cbusid, string deviceaddress, string dataaddress);

            [DllImport("i2c.so", EntryPoint = "Set", SetLastError = true)]
            public static extern int Set(string i2Cbusid, string deviceaddress, string dataaddress, string datavalue, int force);
        }
    }
}
