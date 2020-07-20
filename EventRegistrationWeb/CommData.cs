using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.IO.Ports;
using EventRegistrationWeb.config;

using System.Data.SqlClient;



namespace EventRegistrationWeb
{   
    public class CommData    
    {
        //读XML配置文件
        static string configFile = "D:\\工作\\config.xml";
        static SerialInfo m_serialInfo = ParseXML.SerialInfo(configFile);

        static SerialPort serialPort;
        static SqlConnection sConn;
        static SqlCommand sCmd;
        static SqlDataReader sdr = null;
        static SqlDataReader sdrTemp = null;
        static byte[] cSend;
        static CommData()     //数据库初始化
        {
            //开启数据库 YYYY
            //string strConnect = "Data Source=MICROSOFT;Initial Catalog=SqlServerTest;User ID=sa;Password=123456";
            string strConnect = "Server =localhost;database=UserDatabase;uid=root;pwd=123";
            try
            {
                sConn = new SqlConnection(strConnect);
            }
            catch (Exception ex)
            {
                sConn = null;
                Console.Write(ex);
            }

            try
            {
                sConn.Open();
            }
            catch (Exception ex)
            {
                sConn = null;
            }
            sCmd = new SqlCommand();
            string sql = "SELECT * FROM dbo.chuanantongxun";
            sCmd = new SqlCommand(sql);

            sCmd.Connection = sConn;
            if (sCmd != null)
            {
                // SqlCommand cd = sCmd;

            }
            else
            {
                sCmd = null;
            }
        }
        public static SqlDataReader GetComData() //数据库读取 YYYY
        {
            if (sCmd == null)
            {
                sCmd = null;
            }
            else
            {
                SqlCommand sqc = sCmd;
            }
            try
            {
                if (sdr != null)
                {
                    sdr.Close();
                }
                sdr = sCmd.ExecuteReader();     //执行命令对象，并用sdr指向结果集的第一条记录。
                sdrTemp = sdr;
            }
            catch (Exception ex)
            {
                ex.GetHashCode();
            }
            //Console.Write(sdr["Force"]);
            //Console.Write(sdr["Wind"]);
            /* while (sdr.Read())
             {
                 Console.Write(sdr["Force"]);

                 Console.Write(sdr["Wind"]);
                 break;
             }*/
            return sdrTemp;
        }
    }
}