using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class AlarmEventArgs : EventArgs
    {
        public Sensor Sensor { get; private set; }
        public AlarmType Type { get; private set; }

        public AlarmEventArgs(Sensor s, AlarmType type)
        {
            Sensor = s;
            Type = type;
        }
    }
}
