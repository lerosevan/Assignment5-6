using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Assignment5_6
{
    [WebService(Namespace = "http://assignment5_6.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class EncryptionService : WebService
    {
        [WebMethod]
        public string HashString(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return "Input cannot be null or empty.";
            }

            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }
    }
}