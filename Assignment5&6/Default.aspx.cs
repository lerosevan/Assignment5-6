using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Assignment5_6
{
    public partial class Default : System.Web.UI.Page
    {
        // Event handler for page load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServiceDirectoryRepeater.DataSource = new[]
                {
                    new { ServiceName = "EncryptionService", Description = "Remote service for hashing strings" },
                    new { ServiceName = "Local Encryption", Description = "Hashing function in TryIt page" },
                    new { ServiceName = "Cookies", Description = "Manages temporary user states in TryIt page" }
                };
                ServiceDirectoryRepeater.DataBind();
            }
        }

        // Event handler for Staff button click
        protected void StaffButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff.aspx");
        }

        // Event handler for Member button click
        protected void MemberButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Member.aspx");
        }

        protected void TryItButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TryIt.aspx");
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear session data
            Response.Redirect("Default.aspx");
        }

        // Method to load the service directory from an XML file
        private void LoadServiceDirectory()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ServiceName");
            dt.Columns.Add("Description");

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/ServiceDirectory.xml"));

            foreach (XmlNode node in xmlDoc.SelectNodes("//Service"))
            {
                DataRow row = dt.NewRow();
                row["ServiceName"] = node["Name"].InnerText;
                row["Description"] = node["Description"].InnerText;
                dt.Rows.Add(row);
            }

            ServiceDirectoryRepeater.DataSource = dt;
            ServiceDirectoryRepeater.DataBind();
        }
    }
}
