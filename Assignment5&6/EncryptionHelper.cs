using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Assignment5_6
{
    public static class EncryptionHelper
    {
        // Method to hash a password using SHA-256
        public static string HashPassword(string password)
        {
            // Create a new instance of SHA-256
            using (SHA256 sha256 = SHA256.Create())
            {
                // Compute the hash of the input password
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                // Convert the byte array to a hexadecimal string
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }
    }
}

