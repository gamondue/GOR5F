using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class PhotoResistor : Sensor, IMCP3208Convertible
    {
        public int Channel { get; set; }

        public Adc_MCP3208 Connection { get; set; }

        //public PhotoResistor() : this(true)
        //{

        //}

        public PhotoResistor(bool sim) : base(sim)
        {

        }

        public PhotoResistor(int channel, Adc_MCP3208 adc) : base(false)
        {
            Channel = channel;
        }

        public override string Read()
        {
            if (Connection == null)
                throw new Exception("Nessuna connessione.");

            double val = Connection.Read(Channel) * voltage / 4096;

            return val.ToString();
        }

        public override int ReadInt()
        { return -1; }

        public override Measurement Measure()
        {
            throw new NotImplementedException();
        }

        public override void Initialization()
        {
            // NO!! non deve fare la taratura tutte le volte. Solo una volta
            calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
