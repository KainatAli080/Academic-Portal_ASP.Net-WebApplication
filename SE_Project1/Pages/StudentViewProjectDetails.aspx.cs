using SE_Project1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class StudentViewProjectDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDetails();
            }
        }

        public void getDetails()
        {
            FYP studentFYP = new FYP();
            string memID = Session["studentID"].ToString();

            // getting students Group ID, projID, projTitle
            string gID = studentFYP.getGroupID(memID);
            string projID = studentFYP.getProjID(gID);
            string projTitle = studentFYP.getProjectTitle(projID);

            // setting values
            projectID.Text = projID;
            projectTitle.Text = projTitle;
        }
    }
}