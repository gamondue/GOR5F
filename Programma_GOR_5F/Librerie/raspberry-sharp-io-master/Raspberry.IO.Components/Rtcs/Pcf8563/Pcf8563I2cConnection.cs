#region References

using System;
using System.Globalization;
using Raspberry.IO.InterIntegratedCircuit;

#endregion

namespace Raspberry.IO.Components.Rtcs.Pcf8563
{
    /// <summary>
    /// Represents a I2C connection to a Pcf8563 Real Time Clock.
    /// </summary>
    /// <remarks>See <see cref="www.nxp.com/documents/data_sheet/PCF8563.pdf"/> for more information.</remarks>
    public class Pcf8563I2cConnection
    {
        #region Fields

        private readonly I2cDeviceConnection connection;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Pcf8563I2cConnection"/> class.
        /// </summary>
        /// <param name="connection">The connection.</param>
        public Pcf8563I2cConnection(I2cDeviceConnection connection)
        {
            this.connection = connection;
        }

        #endregion

        #region Methods
        

        public string ReadDateAndTime()
        {
            byte[] rd = connection.Read(4); 
    //        returndata = self._bus.read_byte_data(self._addr, data)
    //#print "addr = 0x%x data = 0x%x %i returndata = 0x%x %i " % (self._addr, data, data, returndata, _bcd_to_int(returndata))
    //    return returndata 
            return "2014-11-04 22:24:51"; 
        }

        public int ReadSeconds()
        {
            byte[] rd = connection.Read(2); // (Register.REG_SECONDS); 

        //            int s = Int32.Parse(d.Substring(2, 1), 
        //    System.Globalization.NumberStyles.AllowHexSpecifier);
        //// mette a zero il bit più significativo di questo nibble 
        //s &= 0x7;
        //s *= 10; 
        //// nibble meno significativo
        //s += Int32.Parse(d.Substring(3, 1),
        //    System.Globalization.NumberStyles.AllowHexSpecifier)
            return bcd_to_int(rd[0]) & 0x7F; // masks most sign digit due to 
        }

        public byte RawRead()
        {
            return connection.ReadByte(); 
        }

        public void WriteDateTime(DateTime ToSet)
        {

        }

        public void SetLinuxClockWithRtc()
        {

        }

        #endregion

        #region Internal Helpers

        internal int bcd_to_int(int bcd)
        {
            // Decode a 2x4bit BCD to a integer.
            int outN = bcd;
            //int out = 0; 
            //for d in (bcd >> 4, bcd):
            //    for p in (1, 2, 4 ,8):
            //        if d & 1:
            //            out += p
            //        d >>= 1
            //    out *= 10
            //return out / 10; 
            int p = bcd & 0xFF; 
            for (int i=0; i < 4; i++)
            {
                bcd >>= 4; 
                p += bcd & 0xFF * 10; 
            }
            return p; 
        }

        private byte ReadByte(byte address)
        {
            return ReadBytes(address, 1)[0];
        }

        private byte[] ReadBytes(byte address, int byteCount)
        {
            connection.WriteByte(address);
            return connection.Read(byteCount);
        }

        private ushort ReadUInt16(byte address)
        {
            var bytes = ReadBytes(address, 2);
            unchecked
            {
                return (ushort)((bytes[0] << 8) + bytes[1]);
            }
        }

        private short ReadInt16(byte address)
        {
            var bytes = ReadBytes(address, 2);
            unchecked
            {
                return (short)((bytes[0] << 8) + bytes[1]);
            }
        }

        private void WriteByte(byte address, byte data)
        {
            connection.Write(address, data);
        }

        internal int int_to_bcd(int n)
        {
            int outBcd = n; 
            //    """Encode a one or two digits number to the BCD.
            //    """
            //    bcd = 0
            //    for i in (n // 10, n % 10):
            //        for p in (8, 4, 2, 1):
            //            if i >= p:
            //                bcd += 1
            //                i -= p
            //            bcd <<= 1
            //    return bcd >> 1 
            return outBcd; 
        }

        #endregion

        #region Private Helpers

        private enum Register
        {
            REG_CONTROL_1 = 0x00,
            REG_CONTROL_2 = 0x01,
            REG_SECONDS = 0x02,
            REG_MINUTES = 0x03,
            REG_HOURS = 0x04,
            REG_DAY = 0x06,
            REG_DATE = 0x05,
            REG_MONTH = 0x07,
            REG_YEAR = 0x08,
        }

        #endregion
    }
}