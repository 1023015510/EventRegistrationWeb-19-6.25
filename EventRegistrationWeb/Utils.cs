using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;


    class Utils
    {

        private static String HexString = "0123456789ABCDEF";

        //  private const char[] hex = HexString.ToCharArray();


        public static string ToHexString(byte[] bytes)
        {
            return BitConverter.ToString(bytes).Replace("-", " ");
        }

        public static string ToHexStringW(byte[] bytes)
        {
            return BitConverter.ToString(bytes).Replace("-", "");
        }


        public static int byteToInt(byte bye)
        {

            return (int)bye & 0xff;

        }

        public static byte[] hexStringToBytes(String hexString)
        {
            if (hexString == null || hexString.Equals(""))
            {
                return null;
            }
            hexString = hexString.ToUpperInvariant();
            int length = hexString.Length / 2;
            char[] hexChars = hexString.ToCharArray();
            byte[] d = new byte[length];
            for (int i = 0; i < length; i++)
            {
                int pos = i * 2;
                d[i] = (byte)(charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));

            }
            return d;
        }
        private static byte charToByte(char c)
        {
            return (byte)HexString.IndexOf(c);
        }


        private const String FORMAT = "yyyy-MM-dd HH:mm:ss.S";

        public static String foramtDate(long time)
        {
            DateTime dateTime = new DateTime(time * 10000);
            return dateTime.ToString(FORMAT);
        }


        // Compute the MODBUS RTU CRC
        public static byte[] ModRTU_CRC(byte[] buf)
        {
            int len = buf.Length;

            UInt16 crc = 0xFFFF;

            for (int pos = 0; pos < len; pos++)
            {
                crc ^= (UInt16)buf[pos];          // XOR byte into least sig. byte of crc

                for (int i = 8; i != 0; i--)
                {    // Loop over each bit
                    if ((crc & 0x0001) != 0)
                    {      // If the LSB is set
                        crc >>= 1;                    // Shift right and XOR 0xA001
                        crc ^= 0xA001;
                    }
                    else                            // Else LSB is not set
                        crc >>= 1;                    // Just shift right
                }
            }
            // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
            return BitConverter.GetBytes(crc);
        }


        public static byte UbyteToByte(byte bye){ 
          if(bye>=128){
              bye =(byte)( bye - 128);
          }
          return bye;
        }

        public static string listToString(List<ushort> list)
        {

            StringBuilder builder = new StringBuilder();
            builder.Append("[");
            foreach (ushort sh in list)
            {
                builder.Append(sh).Append(",");
            }
            builder.Append("]");

            return builder.ToString();

        }


        public static string toBinaryString(ushort value){
            string valueString = Convert.ToString(value,2);
            while(valueString.Length<16){
                valueString = '0' + valueString;
            }
            return valueString;
        }


        public static bool BitArrayValue(BitArray bitArray){
            bool result = false;
            foreach(bool bit in bitArray){
                result = result || bit;
            
            }
            return result;
        }

        public static byte[] int2bytes2(int value)
        {
            byte[] ret = new byte[2];
            ret[1] = (byte)(value & 0xFF);// 低位
            value = value >> 8;
            ret[0] = (byte)(value & 0xFF);// 高位
            return ret;
        }


   
    }