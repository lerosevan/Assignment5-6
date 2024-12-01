using System;
using System.Web;

namespace Assignment5_6
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session and cookies
            Session.Clear();
            Session.Abandon();

            // Expire all cookies
            foreach (string key in Request.Cookies.AllKeys)
            {
                HttpCookie cookie = new HttpCookie(key)
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookie);
            }

            // Use complete URL for redirect
            Response.Redirect("~/Login.aspx", true);
        }
    }
}
