using System;
using System.Collections.Generic;
using System.Threading;

namespace i2c
{
    internal class VCNL4000 : RPi.I2C.Net.i2c
    {
        public event EventHandler<ProximtyEventArgs> ProximityReading;

        // ReSharper disable once InconsistentNaming
        public VCNL4000(string busid, int irCurrent_mA)
        {
            Busid = busid;
            Constants = new Dictionary<string, int> 
            { 
                { "VCNL4000_ADDRESS", 0x13 }, 
                { "VCNL4000_COMMAND", 0x80 },
                { "VCNL4000_PRODUCTID", 0x81},
                { "VCNL4000_IRLED", 0x83},
                { "VCNL4000_AMBIENTPARAMETER", 0x84},
                { "VCNL4000_AMBIENTDATA", 0x85},
                { "VCNL4000_PROXIMITYDATA_1", 0x87},
                { "VCNL4000_PROXIMITYDATA_2", 0x88},
                { "VCNL4000_SIGNALFREQ", 0x89},
                { "VCNL4000_PROXINITYADJUST", 0x8A},
                { "VCNL4000_3M125", 0},
                { "VCNL4000_1M5625", 1},
                { "VCNL4000_781K25", 2},
                { "VCNL4000_390K625", 3},
                { "VCNL4000_MEASUREAMBIENT", 0x10},
                { "VCNL4000_MEASUREPROXIMITY", 0x08},
                { "VCNL4000_AMBIENTREADY", 0x40},
                { "VCNL4000_PROXIMITYREADY", 0x20},
                { "dx" , 5250 },
                { "dy", 2370 }
            };

            var irled = Set8(
                Busid,
                GetConstantAsString("VCNL4000_ADDRESS"),
                GetConstantAsString("VCNL4000_IRLED"),
                irCurrent_mA.ToString(),
                0);
        }

        public UInt16 ProductID { 
            get
            { 
                return GetValue8("VCNL4000_ADDRESS", "VCNL4000_PRODUCTID"); 
            } 
        }

        /// <summary>
        /// Returns a decimal conversion from the VCNL4000's proximity data registers
        /// </summary>
        private Tuple<decimal, int> Proximity { 
            get
            {
                var command = GetValue8("VCNL4000_ADDRESS", "VCNL4000_COMMAND");
                Set8(
                    Busid, 
                    GetConstantAsString("VCNL4000_ADDRESS"), 
                    GetConstantAsString("VCNL4000_COMMAND"),
                    (command | GetConstantAsByte("VCNL4000_MEASUREPROXIMITY")).ToString(),
                    0);

                while (!ProximityReady) { /*wait until proximity data ready*/ }

                var data = (UInt16)(GetValue8("VCNL4000_ADDRESS", "VCNL4000_PROXIMITYDATA_1") << 8);
                data |= GetValue8("VCNL4000_ADDRESS", "VCNL4000_PROXIMITYDATA_2");

                var distance = GetDistance(data);
                return new Tuple<decimal,int>(distance, data);
            } 
        }
        private static decimal GetDistance(UInt16 data)
        {
            // ReSharper disable once InconsistentNaming
            var prox_mm = Convert.ToDecimal(GetConstantAsByte("dx")) / (Convert.ToDecimal(data) - Convert.ToDecimal(GetConstantAsByte("dy")));
            return prox_mm;
        }
        private char[] ReadCommandRegister()
        {
            var s = Convert.ToString(GetValue8("VCNL4000_ADDRESS", "VCNL4000_COMMAND"), 2);
            var bits = s.PadLeft(8, '0').ToCharArray();
            return bits;
        }

        private bool ProximityReady
        {
            get 
            {
                /*
                 * "10100000" = 0xA0
                 * Bit  7(0) - Config_lock - Ignore
                 * Bit  6(1) - als_data_rdy - Ambient Light sensor ready
                 * Bit  5(2) - prox_data_rdy - Promimity Data ready
                 * Bit  4(3) - als_od - Ambient Light Reading On-demand
                 * Bit  3(4) - prox_od - Proximity Reading On-demand
                 * Bit  2(5) - N/A    
                 * Bit  1(6) - N/A    
                 * Bit  0(7) - N/A               
                 */
                var register = ReadCommandRegister();
                return register[2] == '1';
            }
        }
        public bool AmbientLightReady
        {
            get
            {
                /*
                 * "10100000" = 0xA0
                 * Bit  7(0) - Config_lock - Ignore
                 * Bit  6(1) - als_data_rdy - Ambient Light sensor ready
                 * Bit  5(2) - prox_data_rdy - Promimity Data ready
                 * Bit  4(3) - als_od - Ambient Light Reading On-demand
                 * Bit  3(4) - prox_od - Proximity Reading On-demand
                 * Bit  2(5) - N/A    
                 * Bit  1(6) - N/A    
                 * Bit  0(7) - N/A               
                 */
                var register = ReadCommandRegister();
                return register[1] == '1';
            }
        }

        internal override void Start()
        {
            var s = new ThreadStart(ReadProximity);
            var work = new Thread(s);
            work.Start();
        }
        internal override void Stop()
        {
            DoWork = false;
        }

        private void ReadProximity()
        {
            DoWork = true;
            while (DoWork)
            {
                var Event = new ProximtyEventArgs { Proximity = Proximity.Item1, RawValue = Proximity.Item2 };
                ProximityReading(this, Event);
            }
 
        }
    }
    public class ProximtyEventArgs : EventArgs
    {
        public decimal Proximity { get; set; }
        public int RawValue { get; set; }
 
    }
}

        