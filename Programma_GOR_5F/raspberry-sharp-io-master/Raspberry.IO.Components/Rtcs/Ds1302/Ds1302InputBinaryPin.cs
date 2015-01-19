#region References

using System;

#endregion

namespace Raspberry.IO.Components.Rtcs.Ds1302
{
    /// <summary>
    /// Represents a binary intput pin on a Ds1302 I/O expander.
    /// </summary>
    public class Ds1302InputBinaryPin : IInputBinaryPin
    {
        #region Fields

        private readonly Ds1302I2cConnection connection;
        private readonly Ds1302Pin pin;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Ds1302InputBinaryPin"/> class.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        public Ds1302InputBinaryPin(Ds1302I2cConnection connection, Ds1302Pin pin)
        {
            this.connection = connection;
            this.pin = pin;

            connection.SetInputPin(pin, true);
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose(){}

        #endregion

        #region Methods

        /// <summary>
        /// Reads the state of the pin.
        /// </summary>
        /// <returns>
        ///   <c>true</c> if the pin is in high state; otherwise, <c>false</c>.
        /// </returns>
        public bool Read()
        {
            return connection.GetPinStatus(pin);
        }

        /// <summary>
        /// Waits for the specified pin to be in the specified state.
        /// </summary>
        /// <param name="waitForUp">if set to <c>true</c> waits for the pin to be up.</param>
        /// <param name="timeout">The timeout, in milliseconds.</param>
        /// <exception cref="System.TimeoutException">A timeout occurred while waiting for pin status to change</exception>
        public void Wait(bool waitForUp = true, decimal timeout = 0)
        {
            var startWait = DateTime.Now;
            if (timeout == 0)
                timeout = 5000;

            while (Read() != waitForUp)
            {
                if (DateTime.Now.Ticks - startWait.Ticks >= 10000*timeout)
                    throw new TimeoutException("A timeout occurred while waiting for pin status to change");
            }
        }

        #endregion
    }
}