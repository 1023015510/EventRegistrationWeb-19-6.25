using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


  public  class SerialInfo
    {
        private string id;

        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        private bool enabled;

        public bool Enabled
        {
            get { return enabled; }
            set { enabled = value; }
        }

        private string serialName;

        public string SerialName
        {
            get { return serialName; }
            set { serialName = value; }
        }

        private string baudRate;

        public string BaudRate
        {
            get { return baudRate; }
            set { baudRate = value; }
        }

        private string dataBits;

        public string DataBits
        {
            get { return dataBits; }
            set { dataBits = value; }
        }

        private string stopBits;

        public string StopBits
        {
            get { return stopBits; }
            set { stopBits = value; }
        }

        private string parity;

        public string Parity
        {
            get { return parity; }
            set { parity = value; }
        }

    }

