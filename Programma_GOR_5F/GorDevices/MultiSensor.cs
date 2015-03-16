using System;
using System.Collections.Generic;
using System.Text;

namespace Gor.Devices
{
    /// <summary>
    /// Single sensor that can take different measurements, of different quantities
    /// </summary>
    public abstract class MultiSensor
    {
        List<Sensor> sensors;

        public List<Sensor> Sensors
        {
            get { return sensors; }
            set { sensors = value; }
        }

    }
}
