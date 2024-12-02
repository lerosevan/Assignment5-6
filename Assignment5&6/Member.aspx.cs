using System;
using System.Xml;

namespace Assignment5_6
{
    public partial class Member : System.Web.UI.Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = RegisterUsername.Text.Trim();
            string password = RegisterPassword.Text.Trim();
            string captchaInput = CaptchaInput.Text.Trim();

            // Validate captcha
            if (Session["Captcha"] == null || captchaInput != Session["Captcha"].ToString())
            {
                RegisterMessage.Text = "Invalid captcha. Please try again.";
                RegisterMessage.Visible = true;
                GenerateCaptcha(); // Regenerate captcha on failure
                return;
            }

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                RegisterMessage.Text = "Username and password are required.";
                RegisterMessage.Visible = true;
                return;
            }

            // Hash the password and store credentials
            string hashedPassword = EncryptionHelper.HashPassword(password);
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

            RegisterMessage.Text = "Registration successful! You can now log in.";
            RegisterMessage.ForeColor = System.Drawing.Color.Green;
            RegisterMessage.Visible = true;

            // Switch to login panel
            RegistrationPanel.Visible = false;
            LoginPanel.Visible = true;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = LoginUsername.Text.Trim();
            string password = LoginPassword.Text.Trim();

            string memberFile = Server.MapPath("Member.xml");

            // Check if Member.xml exists
            if (!System.IO.File.Exists(memberFile))
            {
                LoginMessage.Text = "No registered members found.";
                LoginMessage.Visible = true;
                return;
            }

            XmlDocument doc = new XmlDocument();
            doc.Load(memberFile);

            // Check if DocumentElement and ChildNodes exist
            if (doc.DocumentElement == null || doc.DocumentElement.ChildNodes.Count == 0)
            {
                LoginMessage.Text = "No registered members found.";
                LoginMessage.Visible = true;
                return;
            }

            // Iterate through user nodes
            foreach (XmlNode userNode in doc.DocumentElement.ChildNodes)
            {
                // Ensure the node has the required attributes
                if (userNode.Attributes != null &&
                    userNode.Attributes["Username"] != null &&
                    userNode.Attributes["Password"] != null)
                {
                    string storedUsername = userNode.Attributes["Username"].Value;
                    string storedPassword = userNode.Attributes["Password"].Value;

                    // Compare username and verify password
                    if (storedUsername.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                        EncryptionHelper.VerifyPassword(password, storedPassword))
                    {
                        ContentPanel.Visible = true;
                        LoginPanel.Visible = false;
                        LoginMessage.Visible = false;
                        return;
                    }
                }
            }

            // If no match was found
            LoginMessage.Text = "Invalid username or password.";
            LoginMessage.Visible = true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInMember"] == null)
                {
                    RegistrationPanel.Visible = true;
                    LoginPanel.Visible = false;
                    ContentPanel.Visible = false;
                    GenerateCaptcha();
                }
                else
                {
                    // Show content panel for logged-in users
                    string username = Session["LoggedInMember"].ToString();
                    lblWelcomeMessage.Text = $"Welcome, {username}!";
                    RegistrationPanel.Visible = false;
                    LoginPanel.Visible = false;
                    ContentPanel.Visible = true;
                }
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear session variables
            Response.Redirect("TryIt.aspx"); // Redirect to TryIt.aspx
        }

        private void GenerateCaptcha()
        {
            string captchaCode = new Random().Next(1000, 9999).ToString(); // Generate a random 4-digit code
            Session["Captcha"] = captchaCode; // Store it in session for validation

            // Create an image with the captcha code
            System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(100, 30);
            using (System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage(bitmap))
            {
                graphics.Clear(System.Drawing.Color.White);
                using (System.Drawing.Font font = new System.Drawing.Font("Arial", 16))
                {
                    graphics.DrawString(captchaCode, font, System.Drawing.Brushes.Black, 10, 5);
                }
            }

            // Save the image in memory and display it on the page
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                string base64Image = Convert.ToBase64String(stream.ToArray());
                CaptchaImage.ImageUrl = "data:image/png;base64," + base64Image;
            }
        }
    }
}
