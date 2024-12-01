using System;
using System.Security.Cryptography;
using System.Text;

namespace Assignment5_6
{
    public static class EncryptionHelper
    {
        // Method to hash a password using SHA-256
        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }

        // Method to verify if a plain text password matches a hashed password
        public static bool VerifyPassword(string plainTextPassword, string hashedPassword)
        {
            string hashedInput = HashPassword(plainTextPassword);
            return string.Equals(hashedInput, hashedPassword, StringComparison.OrdinalIgnoreCase);
        }
    }
}
