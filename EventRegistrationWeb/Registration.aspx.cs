using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventRegistrationWeb.config;
namespace EventRegistrationWeb
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

     
        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            //读XML配置文件
            string configFile = "C:\\config.xml";
            LoginInfo login = ParseXML.getLoginInfo(configFile);
         

            string userName = txtUsername.Value; //PageValidate.InputText(txtUsername.Value.Trim(), 30);
            string Password = txtPass.Value;// PageValidate.InputText(txtPass.Value.Trim(), 30);


            if ((userName == login.User) && (Password == login.Password))
            {
                Response.Redirect("ViewData.aspx");
            }
            else
            {
                string strInfo;
                strInfo = string.Format("{0} , {1}", login.User, login.Password);
                txtUsername.Value = strInfo;
            }
        }
    }
}