using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Assignment5_6
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Initialize session counter to 0 when application starts
            Application["SessionCounter"] = 0;
            // Last vistited time and date
            Application["LastVisited"] = DateTime.Now;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Increment session counter when a new session is started
            int count = (int)Application["SessionCounter"];
            count++;
            Application["SessionCounter"] = count;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Decrements the session counter when a session ends
            int count = (int)Application["SessionCounter"];
            count--;
            Application["SessionCounter"] = count;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}