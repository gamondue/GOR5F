using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class RelativeHumidity_HIH4000 : Sensor, IMCP3208Convertible
    {
        public int Channel { get; set; }
        public Adc_MCP3208 Connection { get; set; }

        public RelativeHumidity_HIH4000() : this(true)
        {

        }

        public RelativeHumidity_HIH4000(bool sim) : base(sim)
        {

        }

        public RelativeHumidity_HIH4000(int channel) : base(false)
        {
            Channel = channel;
        }

        private double _startRead = 2;

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
            calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
