using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public interface IMCP3208Convertible
    {
        int channel { get; set; }
        Adc_MCP3208 adc { get; set; }
    }
}
