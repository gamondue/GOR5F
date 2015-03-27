#region References

using System;
using System.Globalization;
using Raspberry.IO.InterIntegratedCircuit;

#endregion

namespace Raspberry.IO.Components.Rtcs.Ds1302
{
    /// <summary>
    /// Represents a I2C connection to a Ds1302 Real time clock
    /// </summary>
    /// <remarks>See <see cref="http://www.ti.com/lit/ds/symlink/Ds1302.pdf"/> for more information.</remarks>
    public class Ds1302I2cConnection
    {
        #region Fields

        private readonly I2cDeviceConnection connection;

        private byte inputPins;
        private byte currentStatus;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Ds1302I2cConnection"/> class.
        /// </summary>
        /// <param name="connection">The connection.</param>
        public Ds1302I2cConnection(I2cDeviceConnection connection)
        {
            this.connection = connection;
            connection.WriteByte(0);
        }

        #endregion

        #region Methods
        
        /// <summary>
        /// Sets the pin status.
        /// </summary>
        /// <param name="pin">The pin.</param>
        /// <param name="enabled">if set to <c>true</c>, specified pin is enabled.</param>
        public void SetPinStatus(Ds1302Pin pin, bool enabled)
        {
            var bit = GetPinBit(pin);
            if ((inputPins & bit) != 0x00)
                throw new NotSupportedException(string.Format(CultureInfo.InvariantCulture, "Cannot set value of input pin {0}", pin));

            var status = currentStatus;
            var newStatus = (byte)(enabled
                ? status | bit
                : status & ~bit);

            connection.Write(newStatus);
            currentStatus = newStatus;
        }

        /// <summary>
        /// Gets the pin status.
        /// </summary>
        /// <param name="pin">The pin.</param>
        /// <returns></returns>
        public bool GetPinStatus(Ds1302Pin pin)
        {
            var bit = GetPinBit(pin);
            if ((inputPins & bit) == 0x00)
                throw new NotSupportedException(string.Format(CultureInfo.InvariantCulture, "Cannot get value of input pin {0}", pin));

            var status = connection.ReadByte();
            return (status & bit) != 0x00;
        }

        /// <summary>
        /// Toogles the specified pin.
        /// </summary>
        /// <param name="pin">The pin.</param>
        public void Toogle(Ds1302Pin pin)
        {
            var bit = GetPinBit(pin);
            if ((inputPins & bit) != 0x00)
                throw new NotSupportedException(string.Format(CultureInfo.InvariantCulture, "Cannot set value of input pin {0}", pin));
            
            var status = currentStatus;

            var bitEnabled = (status & bit) != 0x00;
            var newBitEnabled = !bitEnabled;

            var newStatus = (byte)(newBitEnabled
                ? status | bit
                : status & ~bit);

            connection.Write(newStatus);
            currentStatus = newStatus;
        }

        #endregion

        #region Internal Helpers

        internal void SetInputPin(Ds1302Pin pin, bool isInput)
        {
            var bit = GetPinBit(pin);
            inputPins = (byte) (isInput
                ? inputPins | bit
                : inputPins & ~bit);
        }

        #endregion

        #region Private Helpers

        private static byte GetPinBit(Ds1302Pin pin)
        {
            return (byte) (int) pin;
        }

        #endregion

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
            return rd[0]; // masks most sign digit due to 
        }
    }
}