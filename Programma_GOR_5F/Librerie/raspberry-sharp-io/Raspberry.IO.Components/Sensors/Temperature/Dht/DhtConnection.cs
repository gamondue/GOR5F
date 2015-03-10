#region References

using System;
using Raspberry.IO.GeneralPurpose;
using Raspberry.Timers;

#endregion

namespace Raspberry.IO.Components.Sensors.Temperature.Dht
{
    /// <summary>
    /// Represents a connection to a DHT-11 or DHT-22 (also known as Am2302) humidity / temperature sensor.
    /// </summary>
    /// <remarks>
    /// Requires a fast IO connection (such as <see cref="MemoryGpioConnectionDriver"/>).
    /// Based on <see href="https://www.virtuabotix.com/virtuabotix-dht22-pinout-coding-guide/"/>.
    /// </remarks>
    public class DhtConnection : IDisposable
    {   
        #region fields
        private decimal startLowTime = 18m;     // [ms] 
        private long middleTimeZeroOne = 500;   // [hundred ns] (ticks)
        private long errTime = 2000;            // [hundred ns] (ticks)
        private decimal timeOutDecimal = 100m;  // [ms]
        private long timeOutTicks;              // [hundred ns] (ticks)

        private long twoSeconds = 20000000;     // [hundred ns] (ticks)

        private long lastSampleTicks;           // ticks at last sample

        const int maxRetries = 10;
        #endregion

        #region References

        private readonly IInputOutputBinaryPin pin;

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="DhtConnection"/> class.
        /// </summary>
        /// <param name="pin">The pin.</param>
        public DhtConnection(IInputOutputBinaryPin pin)
        {
            this.pin = pin;
            pin.AsOutput();
            timeOutTicks = (long)timeOutDecimal * 100;
            lastSampleTicks = DateTime.UtcNow.Ticks + twoSeconds;
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            Close();
        }

        #endregion

        #region Method

        /// <summary>
        /// Gets the data.
        /// </summary>
        /// <returns>The Dht data. Null if error</returns>
        public DhtData GetData(ref int retries)
        {
            DhtData data = null;
            var retryCount = maxRetries;
            retries = 0;
            while (data == null && retryCount-- > 0)
            {
                long ticksFromLastSample = DateTime.UtcNow.Ticks - lastSampleTicks;
                //Console.Write(ticksFromLastSample.ToString() + " ");

                // DHT22: wait until 2 s from last sample (requirement from productor's data sheet)
                HighResolutionTimer.Sleep((decimal)((twoSeconds - ticksFromLastSample) / 10000));
                try
                {
                    data = TryGetData();
                }
                catch (Exception ex)
                {
                    retries = maxRetries - retryCount;
                    Console.WriteLine("Retry: " + retries.ToString() + " " + ex.Message); 
                    data = null;
                }
                lastSampleTicks = DateTime.UtcNow.Ticks;
            }
            return data;
        }

        /// <summary>
        /// Closes this instance.
        /// </summary>
        public void Close()
        {
            pin.Dispose();
        }

        #endregion

        #region Private Helpers

        private DhtData TryGetData()
        {
            // Prepare bugger
            var data = new byte[5];
            for (var i = 0; i < 5; i++)
                data[i] = 0;

            pin.Write(true);
            HighResolutionTimer.Sleep(100m);

            // Measure required by host : startLowTime ms down
            pin.Write(false);
            HighResolutionTimer.Sleep(startLowTime);
            pin.Write(true);

            // Prepare for reading
            pin.AsInput();

            try
            {
                // Read acknowledgement from DHT
                pin.Wait(true, 100m);
                pin.Wait(false, 100m);

                // Read 40 bits output, or time-out
                var cnt = 7;
                var idx = 0;
                for (var i = 0; i < 40; i++)
                {
                    pin.Wait(true, 100m);
                    var start = DateTime.UtcNow.Ticks;
                    pin.Wait(false, 100m);
                    var ticks = (DateTime.UtcNow.Ticks - start);
                    if (ticks > 400)
                        data[idx] |= (byte) (1 << cnt);

                    if (cnt == 0)
                    {
                        idx++; // next byte
                        cnt = 7; // restart at MSB
                    }
                    else
                        cnt--;
                }
            }
            finally
            {
                // Prepare for next reading
                pin.Write(true);
            }

            var checkSum = data[0] + data[1] + data[2] + data[3];
            if ((checkSum & 0xff) != data[4])
                return null;

            //var humidity = ((data[0] << 8) + data[1]) / 256m;   // DHT11
            var humidity = ((data[0] << 8) + data[1]) * 0.1m;    // DHT22

            var sign = 1;
            if ((data[2] & 0x80) != 0) // negative temperature
            {
                data[2] = (byte) (data[2] & 0x7F);
                sign = -1;
            }
            //var temperature = sign * ((data[2] << 8) + data[3]) / 256m; // DHT11
            var temperature = sign*((data[2] << 8) + data[3]) * 0.1m; // DHT22

            return new DhtData
            {
                Humidity = humidity,
                Temperature = temperature
            };
        }

        #endregion
    }
}