using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
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

        // Method to load the service directory from an XML file
        private void LoadServiceDirectory()
        {
            // Create a DataTable to hold the service data
            DataTable dt = new DataTable();
            dt.Columns.Add("ServiceName");
            dt.Columns.Add("Description");

            // Load the XML document containing the service directory
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/ServiceDirectory.xml"));
            // Iterate through each service node in the XML document
            foreach (XmlNode node in xmlDoc.SelectNodes("//Service"))
            {
                // Create a new DataRow and populate it with data from the XML node
                DataRow row = dt.NewRow();
                row["ServiceName"] = node["Name"].InnerText;
                row["Description"] = node["Description"].InnerText;
                dt.Rows.Add(row);
            }

            // Bind the DataTable to the repeater control to display the service data
            ServiceDirectoryRepeater.DataSource = dt;
            ServiceDirectoryRepeater.DataBind();
        }
    }
}

