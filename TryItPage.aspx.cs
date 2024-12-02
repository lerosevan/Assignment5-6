using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASS5_6
{
    public partial class TryItPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Write(Session["name"].ToString() + "<br />");
                Response.Write("Count: " + Application["count"].ToString());
            }
        }
    }
}