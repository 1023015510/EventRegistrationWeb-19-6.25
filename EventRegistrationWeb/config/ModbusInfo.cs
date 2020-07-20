using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SerialTest.config
{
    public class ModbusInfo
    {

        private string host;

        public string Host
        {
            get { return host; }
            set { host = value; }
        }

        private int port;

        public int Port
        {
            get { return port; }
            set { port = value; }
        }

        private byte slaveId;

        public byte SlaveId
        {
            get { return slaveId; }
            set { slaveId = value; }
        }


    }
}
