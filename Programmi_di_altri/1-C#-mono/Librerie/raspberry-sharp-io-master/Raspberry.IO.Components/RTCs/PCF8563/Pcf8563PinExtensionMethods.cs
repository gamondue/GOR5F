namespace Raspberry.IO.Components.Expanders.Pcf8563
{
    /// <summary>
    /// Provides extension methods for Pcf8563 pins.
    /// </summary>
    public static class Pcf8563PinExtensionMethods
    {
        #region Methods

        /// <summary>
        /// Creates an output binary pin.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        /// <returns>The pin.</returns>
        public static Pcf8563OutputBinaryPin Out(this Pcf8563I2cConnection connection, Pcf8563Pin pin)
        {
            return new Pcf8563OutputBinaryPin(connection, pin);
        }

        /// <summary>
        /// Creates an input binary pin.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        /// <returns>The pin.</returns>
        public static Pcf8563InputBinaryPin In(this Pcf8563I2cConnection connection, Pcf8563Pin pin)
        {
            return new Pcf8563InputBinaryPin(connection, pin);
        }

        #endregion
    }
}