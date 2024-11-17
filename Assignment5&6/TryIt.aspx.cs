using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment5_6
{
    public partial class TryIt : System.Web.UI.Page
    {
        // Event handler for the Hash button click event
        protected void btnHash_Click(object sender, EventArgs e)
        {
            // Get the input string from the text box
            string input = txtInputString.Text;
            if (!string.IsNullOrEmpty(input))
            {
                // Hash the input string and display the hashed value
                string hashedValue = EncryptionHelper.HashPassword(input);
                lblHashedOutput.Text = $"Hashed Value: {hashedValue}";
            }
            else
            {
                // Display a message if the input string is empty
                lblHashedOutput.Text = "Please enter a string to hash.";
            }
        }

        // Event handler for the Set Cookie button click event
        protected void btnSetCookie_Click(object sender, EventArgs e)
        {
            // Create a new cookie with a test value
            HttpCookie cookie = new HttpCookie("TestCookie");
            cookie.Value = "This is a test cookie!";
            cookie.Expires = DateTime.Now.AddMinutes(5);
            // Add the cookie to the response
            Response.Cookies.Add(cookie);
            lblCookieValue.Text = "Cookie has been set.";
        }

        // Event handler for the Get Cookie button click event
        protected void btnGetCookie_Click(object sender, EventArgs e)
        {
            // Retrieve the cookie from the request
            HttpCookie cookie = Request.Cookies["TestCookie"];
            if (cookie != null)
            {
                // Display the cookie value if it exists
                lblCookieValue.Text = $"Cookie Value: {cookie.Value}";
            }
            else
            {
                // Display a message if the cookie is not found
                lblCookieValue.Text = "No cookie found.";
            }
        }
    }
}

