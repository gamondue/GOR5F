//Dente Francesco

using Raspberry.IO.InterIntegratedCircuit;
using System;
using System.Diagnostics;
using System.Threading;

namespace Gor.Devices
{
    public class Rtc_PCF8563
    {
        private I2cDeviceConnection connection;

        public int DeviceAddress { get { return connection.DeviceAddress; } }

        public Rtc_PCF8563(int deviceAddress, I2cDriver driver)
        {
            connection = driver.Connect(deviceAddress);
        }

        public DateTime ReadDate()
        {
            connection.Write();

            return new DateTime();
        }

        private class Register
        {
            public const byte CONTROL_STATUS_1 = 0x00;
            public const byte CONTROL_STATUS_2 = 0x01;
            public const byte CLKOUT_CONTROL = 0x0D;

            public const byte VL_SECONDS = 0x02;
            public const byte MINUTES = 0x03;
            public const byte HOURS = 0x04;
            public const byte DAYS = 0x05;
            public const byte WEEKDAYS = 0x06;
            public const byte CENTURY_MONTHS = 0x07;
            public const byte YEARS = 0x08;

            public const byte MINUTE_ALARM = 0x09;
            public const byte HOUR_ALARM = 0x0A;
            public const byte DAY_ALARM = 0x0B;
            public const byte WEEKDAY_ALARM = 0x0C;

            public const byte TIMER_CONTROL = 0x0E;
            public const byte TIMER = 0x0F;
        }
    }
}