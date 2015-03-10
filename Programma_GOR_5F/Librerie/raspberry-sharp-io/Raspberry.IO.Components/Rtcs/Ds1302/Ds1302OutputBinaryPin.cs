namespace Raspberry.IO.Components.Rtcs.Ds1302
{
    /// <summary>
    /// Represents a binary output pin on a MCP23017 I/O expander.
    /// </summary>
    public class Ds1302OutputBinaryPin : IOutputBinaryPin
    {
        #region Properties

        private readonly Ds1302I2cConnection connection;
        private readonly Ds1302Pin pin;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Ds1302OutputBinaryPin"/> class.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        public Ds1302OutputBinaryPin(Ds1302I2cConnection connection, Ds1302Pin pin)
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