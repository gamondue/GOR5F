using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public interface IMCP3208Convertible
    {
        int Channel { get; set; }
        MCP3208ADConverter Connection { get; set; }
    }
}
