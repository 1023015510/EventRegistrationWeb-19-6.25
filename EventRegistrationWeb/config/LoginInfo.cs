using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventRegistrationWeb.config
{
    public class LoginInfo
    {
        private string user;
        public string User
        {
            get { return user; }
            set { user = value; }
        }

        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}