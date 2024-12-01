using System;
using System.Web;
using System.Xml;

namespace Assignment5_6
{
    public partial class TryIt : System.Web.UI.Page
    {
        protected void btnLocalHash_Click(object sender, EventArgs e)
        {
            string input = txtLocalInput.Text;
            if (!string.IsNullOrEmpty(input))
            {
                string hashedValue = LocalEncryption(input);
                lblLocalOutput.Text = $"Local Hashed Value: {hashedValue}";
            }
            else
            {
                lblLocalOutput.Text = "Please enter a string to hash locally.";
            }
        }

        protected void btnRemoteHash_Click(object sender, EventArgs e)
        {
            string input = txtRemoteInput.Text;
            if (!string.IsNullOrEmpty(input))
            {
                try
                {
                    EncryptionServiceReference.EncryptionServiceSoapClient client = new EncryptionServiceReference.EncryptionServiceSoapClient();
                    string hashedValue = client.HashString(input);
                    lblRemoteOutput.Text = $"Remote Hashed Value: {hashedValue}";
                }
                catch (Exception ex)
                {
                    lblRemoteOutput.Text = $"Error: {ex.Message}";
                }
            }
            else
            {
                lblRemoteOutput.Text = "Please enter a string to hash remotely.";
            }
        }

        protected void btnSetCookie_Click(object sender, EventArgs e)
        {
            string cookieValue = txtCookieValue.Text;
            if (!string.IsNullOrEmpty(cookieValue))
            {
                HttpCookie userCookie = new HttpCookie("UserProfile");
                userCookie.Value = cookieValue;
                userCookie.Expires = DateTime.Now.AddMinutes(1);
                Response.Cookies.Add(userCookie);

                lblCookieResult.Text = "Cookie set successfully!";
            }
            else
            {
                lblCookieResult.Text = "Please enter a value for the cookie.";
            }
        }

        protected void btnGetCookie_Click(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["UserProfile"];
            if (userCookie != null)
            {
                lblCookieResult.Text = $"Cookie Value: {userCookie.Value}";
            }
            else
            {
                lblCookieResult.Text = "No cookie found.";
            }
        }
        protected void btnMemberRegister_Click(object sender, EventArgs e)
        {
            string username = txtMemberUsername.Text.Trim();
            string password = txtMemberPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMemberResult.Text = "Please enter both username and password.";
                lblMemberResult.Visible = true;
                return;
            }

            string hashedPassword = LocalEncryption(password);
            string memberFile = Server.MapPath("Member.xml");

            XmlDocument doc = new XmlDocument();
            if (System.IO.File.Exists(memberFile))
            {
                doc.Load(memberFile);
            }
            else
            {
                XmlDeclaration xmlDeclaration = doc.CreateXmlDeclaration("1.0", "utf-8", null);
                XmlElement root = doc.CreateElement("Members");
                doc.AppendChild(root);
                doc.InsertBefore(xmlDeclaration, root);
            }

            XmlElement newUser = doc.CreateElement("User");
            newUser.SetAttribute("Username", username);
            newUser.SetAttribute("Password", hashedPassword);
            doc.DocumentElement.AppendChild(newUser);
            doc.Save(memberFile);

            lblMemberResult.Text = $"Member '{username}' registered successfully! Please log in.";
            lblMemberResult.ForeColor = System.Drawing.Color.Green;
            lblMemberResult.Visible = true;
        }

        protected void btnStaffLogin_Click(object sender, EventArgs e)
        {
            string username = txtStaffUsername.Text.Trim();
            string password = txtStaffPassword.Text.Trim();

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                string staffFile = Server.MapPath("Staff.xml");

                // Ensure the file exists
                if (!System.IO.File.Exists(staffFile))
                {
                    lblStaffResult.Text = "Error: Staff credentials file is missing.";
                    return;
                }

                XmlDocument doc = new XmlDocument();
                doc.Load(staffFile);

                // Ensure the root element and its child nodes exist
                if (doc.DocumentElement == null || doc.DocumentElement.ChildNodes.Count == 0)
                {
                    lblStaffResult.Text = "Error: Staff credentials file is empty.";
                    return;
                }

                foreach (XmlNode userNode in doc.DocumentElement.ChildNodes)
                {
                    if (userNode.Attributes != null &&
                        userNode.Attributes["Username"] != null &&
                        userNode.Attributes["Password"] != null)
                    {
                        string storedUsername = userNode.Attributes["Username"].Value;
                        string storedPassword = userNode.Attributes["Password"].Value;

                        if (storedUsername.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                            VerifyPassword(password, storedPassword))
                        {
                            // Set session variable for logged-in user
                            Session["LoggedInUser"] = username;

                            // Redirect to Staff.aspx
                            Response.Redirect("Staff.aspx");
                            return;
                        }
                    }
                }

                lblStaffResult.Text = "Invalid credentials. Please try again.";
            }
            else
            {
                lblStaffResult.Text = "Please enter both username and password.";
            }
        }

        private string LocalEncryption(string input)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }

        private bool VerifyPassword(string password, string hashedPassword)
        {
            return LocalEncryption(password) == hashedPassword;
        }

        protected void btnMemberLogin_Click(object sender, EventArgs e)
        {
            string username = txtMemberUsername.Text.Trim();
            string password = txtMemberPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMemberResult.Text = "Please enter both username and password.";
                lblMemberResult.Visible = true;
                return;
            }

            string memberFile = Server.MapPath("Member.xml");
            if (!System.IO.File.Exists(memberFile))
            {
                lblMemberResult.Text = "No registered members found. Please register first.";
                lblMemberResult.Visible = true;
                return;
            }

            XmlDocument doc = new XmlDocument();
            doc.Load(memberFile);

            if (doc.DocumentElement == null || doc.DocumentElement.ChildNodes.Count == 0)
            {
                lblMemberResult.Text = "No registered members found. Please register first.";
                lblMemberResult.Visible = true;
                return;
            }

            foreach (XmlNode userNode in doc.DocumentElement.ChildNodes)
            {
                if (userNode.Attributes != null &&
                    userNode.Attributes["Username"] != null &&
                    userNode.Attributes["Password"] != null)
                {
                    string storedUsername = userNode.Attributes["Username"].Value;
                    string storedPassword = userNode.Attributes["Password"].Value;

                    if (storedUsername.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                        VerifyPassword(password, storedPassword))
                    {
                        // Set session for logged-in member
                        Session["LoggedInMember"] = username;

                        // Redirect to Member.aspx
                        Response.Redirect("Member.aspx");
                        return;
                    }
                }
            }

            lblMemberResult.Text = "Invalid username or password. Please try again.";
            lblMemberResult.Visible = true;
        }

    }
}
