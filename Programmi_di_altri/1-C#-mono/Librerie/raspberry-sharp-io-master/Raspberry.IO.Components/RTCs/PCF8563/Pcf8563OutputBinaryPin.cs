namespace Raspberry.IO.Components.Expanders.Pcf8563
{
    /// <summary>
    /// Represents a binary output pin on a MCP23017 I/O expander.
    /// </summary>
    public class Pcf8563OutputBinaryPin : IOutputBinaryPin
    {
        #region Properties

        private readonly Pcf8563I2cConnection connection;
        private readonly Pcf8563Pin pin;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Pcf8563OutputBinaryPin"/> class.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        public Pcf8563OutputBinaryPin(Pcf8563I2cConnection connection, Pcf8563Pin pin)
        {
            this.connection = connection;
            this.pin = pin;

            connection.SetInputPin(pin, false);
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
        }

        #endregion

        #region Methods

        /// <summary>
        /// Writes the value of the pin.
        /// </summary>
        /// <param name="state">if set to <c>true</c>, pin is set to high state.</param>
        public void Write(bool state)
        {
            connection.SetPinStatus(pin, state);
        }

        #endregion
    }
}