using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EnergyManagement.RTU
{
    /// <summary>
    /// 写寄存器地址 0x03 ,0x06,0x10
    /// </summary>
    class WriteMessage
    {
        /// <summary>
        /// 从机地址
        /// </summary>
        private byte address;

        public byte Address
        {
            get { return address; }
            set { address = value; }
        }

        /// <summary>
        /// 函数功能码
        /// </summary>
        private byte functionCode;

        public byte FunctionCode
        {
            get { return functionCode; }
            set { functionCode = value; }
        }

        /// <summary>
        /// 起始地址
        /// </summary>
        private short firstRegister;

        public short FirstRegister
        {
            get { return firstRegister; }
            set { firstRegister = value; }
        }

        /// <summary>
        /// 寄存器个数
        /// </summary>
        private short numOfRegister;

        public short NumOfRegister
        {
            get { return numOfRegister; }
            set { numOfRegister = value; }
        }

        /// <summary>
        /// 数据长度
        /// </summary>
        private byte dataLength;

        public byte DataLength
        {
            get { return dataLength; }
            set { dataLength = value; }
        }

        /// <summary>
        /// 数据
        /// </summary>
        private List<short> dataList = new List<short>();

        public List<short> DataList
        {
            get { return dataList; }
            set { dataList = value; }
        }

        public  byte[] createMessage(){
            ByteBuffer buffer = null;
            switch(FunctionCode){
                case 0x03:
                    byte length = 1 + 1 + 2 + 2 ;
                    buffer = ByteBuffer.Allocate(length);
                    buffer.WriteByte(address);
                    buffer.WriteByte(functionCode);
                    buffer.WriteShort(firstRegister);
                    buffer.WriteShort(numOfRegister);
                    break;
                case 0x06:
                    length = 1 + 1 + 2 + 2;
                    buffer = ByteBuffer.Allocate(length);
                    buffer.WriteByte(address);
                    buffer.WriteByte(functionCode);
                    buffer.WriteShort(firstRegister);
                    buffer.WriteShort(dataList[0]);
                    break;
                case 0x10:
                    length = (byte)(1 + 1 + 2 + 2 + 1 + dataLength);
                    buffer = ByteBuffer.Allocate(length);
                    buffer.WriteByte(address);
                    buffer.WriteByte(functionCode);
                    buffer.WriteShort(firstRegister);
                    buffer.WriteShort(numOfRegister);
                    buffer.WriteByte(dataLength);
                    int index = 0;
                    for (int i = 0; i < dataLength / 2;i++ ){
                        buffer.WriteShort(dataList[index]);
                        index++;
                    }
                    break;
                default:
                    break;
            }

            byte[] dataBytes = buffer.ToArray();

            byte[] crcData = Utils.ModRTU_CRC(dataBytes);

            int totalLength=dataBytes.Length+2;

            byte[] newData = new byte[totalLength];


            newData[totalLength - 2] = crcData[0];
            newData[totalLength - 1] = crcData[1];

            Array.Copy(dataBytes, 0, newData, 0, dataBytes.Length);

            return newData;

        } 
    }
}
