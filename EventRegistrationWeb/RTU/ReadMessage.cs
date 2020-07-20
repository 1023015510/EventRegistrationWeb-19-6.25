using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EnergyManagement.RTU
{
    /// <summary>
    /// 0X03 读单个、多个寄存器 返回内容
    /// </summary>
  public  class ReadMessage
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
        /// 功能码 03
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
        private List<ushort> dataList = new List<ushort>();

        public List<ushort> DataList
        {
            get { return dataList; }
            set { dataList = value; }
        }


        /// <summary>
        /// CRC校验码
        /// </summary>
        private short crcCode;

        public short CrcCode
        {
            get { return crcCode; }
            set { crcCode = value; }
        }

        /// <summary>
        /// 解析收到的数据
        /// </summary>
        /// <param name="message"></param>
        public void parse(byte[] message,int perDataLength){
            ByteBuffer buffer =ByteBuffer.Allocate(message);
            this.Address = buffer.ReadByte();
            this.functionCode = buffer.ReadByte();
            this.dataLength = buffer.ReadByte();
            for (int i = 0; i < dataLength / perDataLength; i++)
            {
                ushort data = buffer.ReadUshort();
                dataList.Add(data);
                //if (perDataLength==2){
                //    short data = buffer.ReadShort();
                //    dataList.Add(data);
                //}
                //else if (perDataLength == 4){
                //    int data = buffer.ReadInt();
                //    dataList.Add(data);
                //} 
            }
            this.crcCode = buffer.ReadShort();
        }

        /// <summary>
        /// 解析收到的数据
        /// </summary>
        /// <param name="message"></param>
        public void parse(byte[] message)
        {
            parse(message,2);
        }
    }
}
