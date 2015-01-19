namespace Raspberry.IO.Components.Rtcs.Ds1302
{
    /// <summary>
    /// Provides extension methods for Ds1302 pins.
    /// </summary>
    public static class Ds1302PinExtensionMethods
    {
        #region Methods

        /// <summary>
        /// Creates an output binary pin.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        /// <returns>The pin.</returns>
        public static Ds1302OutputBinaryPin Out(this Ds1302I2cConnection connection, Ds1302Pin pin)
        {
            return new Ds1302OutputBinaryPin(connection, pin);
        }

        /// <summary>
        /// Creates an input binary pin.
        /// </summary>
        /// <param name="connection">The connection.</param>
        /// <param name="pin">The pin.</param>
        /// <returns>The pin.</returns>
        public static Ds1302InputBinaryPin In(this Ds1302I2cConnection connection, Ds1302Pin pin)
        {
            return new Ds1302InputBinaryPin(connection, pin);
        }

        #endregion
    }
}