using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using SerialTest.config;
using EventRegistrationWeb.config;
class ParseXML
{

    /// <summary>
    /// 从配置文件读取串口信息
    /// </summary>
    /// <param name="xml"></param>
    /// <returns></returns>
    public static List<SerialInfo> SerialInfoList(string xml)
    {
        List<SerialInfo> serialList = new List<SerialInfo>();
        XmlDocument document = new XmlDocument();
        document.Load(xml); //加载xml文件

        //XmlDocument支持使用xpath表达式选择文档中节点，方法：SelectNodes(String expression)
        //SelectNodes 返回符合expression表达式的所有元素，返回值为XmlNodeList,获取serial所有的节点
        XmlNodeList nodeList = document.SelectNodes("config/serialInf/serial");

        //返回的XmlNodeList，我们可以通过循环读取，对于单个XmlNode，我们通过Attributes获取属性值。遍历节点获取节点属性,保存在SerialInfo类中
        foreach (XmlNode node in nodeList)
        {
            SerialInfo serialInfo = new SerialInfo();
            string id = node.SelectSingleNode("id").InnerText; // 返回符合id的第一个节点， InnerText获取标签文本，标签过滤
            //string enabled = node.SelectSingleNode("enabled").InnerText;
            string serialName = node.SelectSingleNode("serialName").InnerText;
            string baudRate = node.SelectSingleNode("baudRate").InnerText;
            string dataBits = node.SelectSingleNode("dataBits").InnerText;
            string stopBits = node.SelectSingleNode("stopBits").InnerText;
            string parity = node.SelectSingleNode("parity").InnerText;
            serialInfo.Id = id;
            //serialInfo.Enabled = enabled.Equals("true") || serialInfo.Equals("yes");
            serialInfo.SerialName = serialName;
            serialInfo.BaudRate = baudRate;
            serialInfo.DataBits = dataBits;
            serialInfo.StopBits = stopBits;
            serialInfo.Parity = parity;
            serialList.Add(serialInfo);

        }
        return serialList;
    }

    public static SerialInfo SerialInfo(string xml)
    {
        XmlDocument document = new XmlDocument();
        document.Load(xml); //加载xml文件


        XmlNode node = document.SelectSingleNode("config/serialInf/serial");
        SerialInfo serialInfo = new SerialInfo();
        string id = node.SelectSingleNode("id").InnerText;
        serialInfo.SerialName = node.SelectSingleNode("serialName").InnerText;
        serialInfo.BaudRate = node.SelectSingleNode("baudRate").InnerText;
        serialInfo.DataBits = node.SelectSingleNode("dataBits").InnerText;
        serialInfo.StopBits = node.SelectSingleNode("stopBits").InnerText;
        serialInfo.Parity = node.SelectSingleNode("parity").InnerText;


        /*string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText;
        string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText;
        string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText;
        string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText;
        string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText; 
        string id = document.SelectSingleNode("config/serialInf/serial/id").InnerText; */
        return serialInfo;

    }

    /// 获取登录配置信息
    public static LoginInfo getLoginInfo(string xml)
    {
        XmlDocument xmlDocument = new XmlDocument();
        xmlDocument.Load(xml);

        LoginInfo loginconfig = new LoginInfo();
        try 
        {
            if (xmlDocument != null)
            {
              string user = xmlDocument.SelectSingleNode("config/loginInfo/user").InnerText;  //读取标签文本
              string password = xmlDocument.SelectSingleNode("config/loginInfo/password").InnerText; //读取标签文本

              loginconfig.User = user;
              loginconfig.Password = password;
            }
         }
        catch (Exception ee)
        {
        }
        return loginconfig;
    }
  
}

