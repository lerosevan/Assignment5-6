using System;

namespace Assignment5_6
{
    public partial class Login : System.Web.UI.Page
    {
        // This method is called when the page is loaded
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is authenticated
            if (User.Identity.IsAuthenticated)
            {
                // If the user is authenticated, redirect to the Default.aspx page
                Response.Redirect("Default.aspx");
            }
        }
    }
}
