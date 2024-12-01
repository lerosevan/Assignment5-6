using System;
using System.Web.UI;
using System.Xml;

namespace Assignment5_6
{
    public partial class Staff : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text.Trim();
            string password = Password.Text.Trim();

            string staffFile = Server.MapPath("Staff.xml");
            if (!System.IO.File.Exists(staffFile))
            {
                LoginError.Text = "Error: Staff credentials file is missing.";
                LoginError.Visible = true;
                return;
            }

            XmlDocument doc = new XmlDocument();
            doc.Load(staffFile);

            foreach (XmlNode userNode in doc.DocumentElement.ChildNodes)
            {
                if (userNode.Attributes != null &&
                    userNode.Attributes["Username"] != null &&
                    userNode.Attributes["Password"] != null)
                {
                    string storedUsername = userNode.Attributes["Username"].Value;
                    string storedPassword = userNode.Attributes["Password"].Value;

                    if (storedUsername.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                        EncryptionHelper.VerifyPassword(password, storedPassword))
                    {
                        ContentPanel.Visible = true;
                        LoginPanel.Visible = false;
                        LoginError.Visible = false;
                        return;
                    }
                }
            }

            LoginError.Text = "Invalid username or password. Please try again.";
            LoginError.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] == null)
            {
                // Redirect to TryIt.aspx if not logged in
                Response.Redirect("TryIt.aspx");
            }
            else
            {
                // Show logged-in user's information
                string username = Session["LoggedInUser"].ToString();
                ContentPanel.Visible = true;
                LoginPanel.Visible = false;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear all session variables
            Response.Redirect("TryIt.aspx"); // Redirect to TryIt.aspx
        }

    }
}
