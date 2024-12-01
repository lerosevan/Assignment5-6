using System;
using System.Web;

namespace Assignment5_6
{
    public partial class TryIt : System.Web.UI.Page
    {
        protected void btnLocalHash_Click(object sender, EventArgs e)
        {
            string input = txtLocalInput.Text; // Matches the ID in TryIt.aspx
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
            string input = txtRemoteInput.Text; // Matches the ID in TryIt.aspx
            if (!string.IsNullOrEmpty(input))
            {
                try
                {
                    // Use the remote encryption service
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

        private string LocalEncryption(string input)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }

        protected void btnSetCookie_Click(object sender, EventArgs e)
        {
            string cookieValue = txtCookieValue.Text;
            if (!string.IsNullOrEmpty(cookieValue))
            {
                // Create a new cookie and set its value
                HttpCookie userCookie = new HttpCookie("UserProfile");
                userCookie.Value = cookieValue;
                userCookie.Expires = DateTime.Now.AddMinutes(1); // Expires in 10 minutes
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
            // Retrieve the cookie
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
    }
}
