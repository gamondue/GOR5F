using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class PhotoResistor : Sensor, IMCP3208Convertible
    {
        public int Channel { get; set; }

        public MCP3208ADConverter Connection { get; set; }

        public PhotoResistor() : this(true)
        {

        }

        public PhotoResistor(bool sim) : base(sim)
        {

        }

        public PhotoResistor(int channel) : base(false)
        {
            Channel = channel;
        }

        public override string Read()
        {
            if (Connection == null)
                throw new Exception("Nessuna connessione.");

            double val = Connection.ReadConverted(Channel) * voltage / 4096;

            return val.ToString();
        }

        public override Measurement Measure()
        {
            throw new NotImplementedException();
        }

        public override void Initialization()
        {
            calibration = new Calibration(CalibrationFileName);
        }
    }
}
