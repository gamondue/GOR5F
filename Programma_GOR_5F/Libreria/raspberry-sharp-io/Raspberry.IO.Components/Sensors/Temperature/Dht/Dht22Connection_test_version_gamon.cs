#region References

using System;
using System.Globalization;
using Common.Logging;
using Raspberry.IO.GeneralPurpose;
using Raspberry.Timers;
using UnitsNet;

#endregion

namespace Raspberry.IO.Components.Sensors.Temperature.Dht
{
    /// <summary>
    /// Represents a connection to DHT-22 humidity / temperature sensor (also known as AM2302).
    /// </summary>
    /// <remarks>
    /// Requires a fast input/output switch (such as <see cref="MemoryGpioConnectionDriver"/>).
    /// Based on <see href="https://www.virtuabotix.com/virtuabotix-dht22-pinout-coding-guide/"/>, <see cref="https://github.com/RobTillaart/Arduino/tree/master/libraries/DHTlib"/>
    /// Datasheet : <see cref="METTERCELO!!!!!!!!"/>.
    /// </remarks>
    public class Dht22Connection : IDisposable
    {
        #region Fields
        private decimal startLowTime = 18m;     // [ms] 
        private long thresholdTimeZeroOne = 610;   // [hundred ns] (ticks) (26+70)/2 = 61 micro s
        private long errTime = 2000;            // [hundred ns] (ticks)

        private long twoSeconds = 20000000;     // [hundred ns] (ticks)

        private long ticksAtLastSample;         // memorized to wait at least 2 s
		private readonly IInputOutputBinaryPin pin;

        private DateTime previousRead;
        private bool started;

        const int maxRetries = 10;

        const int timeOutms = 100;              // timeout in milliseconds [ms]
        
        private static readonly TimeSpan timeout = TimeSpan.FromMilliseconds(100);

        /// <summary>
        /// The minimum sampling interval (1s).
        /// </summary>
        public static readonly TimeSpan MinimumSamplingInterval = TimeSpan.FromSeconds(1);

        private static readonly long timeOutTicks = timeOutms * 100; // [hundred ns] (ticks)

        #endregion

        #region Instance Management

        /// <summary>
        /// Initializes a new instance of the <see cref="Dht22Connection"/> class.
        /// </summary>
        /// <param name="pin">The pin.</param>
        /// <param name="autoStart">if set to <c>true</c>, DHT is automatically started. Default value is <c>true</c>.</param>
        public Dht22Connection(IInputOutputBinaryPin pin, bool autoStart = true)
        {
            this.pin = pin;

            if (autoStart)
                Start();
            else
                Stop(); 
        } 

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            Close();
        }

        #endregion

        #region Methods

        /// <summary>
        /// Starts the DHT sensor. If not called, sensor will be automatically enabled before getting data.
        /// </summary>
        public void Start()
        {
            started = true;
            pin.Write(true);
            previousRead = DateTime.UtcNow;
        }

        /// <summary>
        /// Stops the DHT sensor. If not called, sensor will be automatically disabled after getting data.
        /// </summary>
        public void Stop()
        {
            pin.Write(false);
            started = false;
        }

        /// <summary>
        /// Gets the data.
        /// </summary>
        /// <returns>The DHT data.</returns>
        public DhtData GetData()
        {
            if (!started)
            {
                pin.Write(true);
                previousRead = DateTime.UtcNow;
            }

            DhtData data = null;
            var tryCount = 0;
            while (data == null && tryCount++ <= maxRetries)
            {
                try
                {
                    data = TryGetData();
                    data.AttemptCount = tryCount;
                }
                catch (Exception ex)
                {
                    var logger = LogManager.GetLogger<DhtConnection>();
                    logger.Error(
                        CultureInfo.InvariantCulture,
                        h => h("Failed to read data from DHT11, try {0}", tryCount), 
                        ex);
                }
            }

            if (!started)
                pin.Write(false);
        
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
            // Prepare buffer
            var data = new byte[5];
            for (var i = 0; i < 5; i++)
                data[i] = 0;

            var remainingSamplingInterval = MinimumSamplingInterval - (DateTime.UtcNow - previousRead);
            if (remainingSamplingInterval > TimeSpan.Zero)
                HighResolutionTimer.Sleep((int)remainingSamplingInterval.TotalMilliseconds);

            // Measure required by host : startLowTime ms down, then up
            pin.Write(false);
            HighResolutionTimer.Sleep(startLowTime);
            pin.Write(true);

            // Prepare for reading
            //pin.AsInput();

            int cnt = 7;
            int idx = 0;
            var bit = -1;
            int errCode = -1; 
            string errString = ""; 
            bool err = false;
            try
            {
                // Read acknowledgement from DHT
                pin.Wait(true, timeout);

                errCode = 20;
                pin.Wait(false, timeout);

                // Read 40 bits input, or time-out
                cnt = 7;
                idx = 0;
                for (bit = 0; bit < 40; bit++)
                {
                    errCode = 30;
                    pin.Wait(true, timeout); 
                        
                    errCode = 40;
                    var start = DateTime.UtcNow.Ticks;
                    pin.Wait(false, timeout);

                    var ticksLevelOn = (DateTime.UtcNow.Ticks - start);
                    if (ticksLevelOn > thresholdTimeZeroOne)
                            data[idx] |= (byte)(1 << cnt); 
                    if (cnt == 0)
                    {
                        idx++;   // next byte
                        cnt = 7; // restart at MSB
                    }
                    else
                        cnt--;
                } // for
            }
            catch (Exception ex) 
            {
                // error decode based on last errCode value
                err = true;
                switch (errCode)
                {
                    case 10:
                        {
                            errString = "Ack.HIGH level timeout";
                            break;
                        }
                    case 20:
                        {
                            errString = "Ack.LOW level timeout";
                            break;
                        }
                    case 30:
                        {
                            errString = "Byte " + idx + " bit " + bit + " Timeout receiving HIGH level";
                            break;
                        }
                    case 40:
                        {
                            errString = "Byte " + idx + " bit " + bit + " Timeout receiving LOW level";
                            break;
                        }
                }
                //throw new Exception(errString + "\n" + ex.Message);
                throw new Exception(errString);
            }
            finally
            {
                // Prepare for next reading
                previousRead = DateTime.UtcNow;
                pin.Write(true);
            }
            if (!err)
            {
				// these bits are always zero, masking them reduces errors. 
	            data[0] &= 0x7F;
	            data[2] &= 0x7F;
	
	            var humidity = data[0];     // data[1] always 0; 
	            var temperature = data[2];  // data[3] always 0; 
	
	            var checkSum = data[0] + data[2]; // data[1] and data[3] always 0 
	            if (checkSum != data[4])
	                throw new InvalidChecksumException("Invalid checksum on DHT data", data[4], checkSum);

            /*
                throw new InvalidChecksumException("Invalid checksum on DHT data", data[4], (checkSum & 0xff));

                var humidity = ((data[0] << 8) + data[1]) * 0.1m;    // here DHT22 is different from DHT11

                var sign = 1;
                if ((data[2] & 0x80) != 0) // negative temperature
                {
                    data[2] = (byte)(data[2] & 0x7F);
                    sign = -1;
                }
                var temperature = sign * ((data[2] << 8) + data[3]) * 0.1m; // here DHT22 is different from DHT11
                */

                return new DhtData
                {
                    RelativeHumidity = Ratio.FromPercent((double)humidity),
                    Temperature = UnitsNet.Temperature.FromDegreesCelsius((double)temperature)
                };
            }
            else
                return null; 
        }
        #endregion
    }
}