using System;

namespace Assignment5_6
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in
            if (Session["User"] != null)
            {
                Response.Redirect("Default.aspx"); // Redirect authenticated users to Default.aspx
            }

            // Show a message if redirected here due to lack of authentication
            if (!string.IsNullOrEmpty(Request.QueryString["redirect"]))
            {
                lblRedirectMessage.Text = "Please log in to access that page.";
            }
        }
    }
}
