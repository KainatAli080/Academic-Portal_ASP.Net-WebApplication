using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class StudentLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogOut(object sender, EventArgs e)
        {
            // Clear all session variables
            Session.Abandon();

            // Redirect user to login page or another desired page
            Response.Redirect("Login.aspx");
        }
    }
}