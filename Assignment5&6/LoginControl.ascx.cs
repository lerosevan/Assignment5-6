﻿using System;
using System.Web;
using System.Web.Security;

namespace Assignment5_6
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "admin" && txtPassword.Text == "password")
            {
                // Create an authentication ticket
                FormsAuthentication.SetAuthCookie(txtUsername.Text, false);

                // Redirect to the default page or the requested page
                string redirectUrl = FormsAuthentication.GetRedirectUrl(txtUsername.Text, false);
                Response.Redirect(redirectUrl);
            }
            else
            {
                lblMessage.Text = "Invalid credentials.";
            }
        }
    }
}