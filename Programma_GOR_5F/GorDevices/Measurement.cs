using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public class Measurement
    {
        public double Value { get; set; }           // valore della misurazione (misura) nell'unità di misura 
        public string Name { get; set; }            // nome del sensore
        public string Unit { get; set; }            // unità di misura
        public string DisplayFormat { get; set; }   // formato di visualizzazione
        public string ReadValue { get; set; }
        public DateTime SampleTime { get; set; }    // istante del campionamento
        public int Error { get; set; }              // errore nella misurazione (codice numerico)
        public string ErrorString { get; set; }     // errore nella misurazione (stringa)
        public override string ToString()
        {
            return SampleTime.ToString("yyyy-MM-dd HH:mm:ss") + "\t" + Name + "\t" 
                + Value.ToString(DisplayFormat) + "\t" + Unit;
        }
    }
}
