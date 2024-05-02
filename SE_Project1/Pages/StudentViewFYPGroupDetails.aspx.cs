using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class StudentViewFYPGroupDetails : System.Web.UI.Page
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
            string memID = Session["studentID"].ToString();
            DBHandlerStudent student = new DBHandlerStudent();
           
            // Getting Group ID and Group Members IDs
            List<string> GroupDetails = new List<string>();
            GroupDetails = student.getGroupDetails(memID);
            string gID = GroupDetails[0];
            string member1 = GroupDetails[1];
            string member2 = GroupDetails[2];
            string member3 = GroupDetails[3];

            // getting the project ID, we can get Group Details from this
            string projID = student.getProjID(gID);

            List<string> member1Details = new List<string>();
            List<string> member2Details = new List<string>();
            List<string> member3Details = new List<string>();
            List<string> supCoSup = new List<string>();

            //Getting Individual Members Details
            member1Details = student.getStudentData(member1);
            member2Details = student.getStudentData(member2);
            member3Details = student.getStudentData(member3);

            // Member 1 details display
            g1ID.Text = member1;
            g1Name.Text = member1Details[0];
            g1Dep.Text = member1Details[1];

            // Member 2 details display
            g2ID.Text = member2;
            g2Name.Text = member2Details[0];
            g2Dep.Text = member2Details[1];

            // Member 3 details display
            g3ID.Text = member3;
            g3Name.Text = member3Details[0];
            g3Dep.Text = member3Details[1];

            // getting supervisors ID's
            supCoSup = student.getSupCoSup(projID);
            if(supCoSup.Count == 1)
            {
                // meaning no co-Sup
                coSupervisorName.Text = "No CoSupervisor.";
                supervisorName.Text = student.getSupName(supCoSup[0]);
            }
            else if(supCoSup.Count == 2)
            {
                // meaning coSupervisor Exists
                supervisorName.Text = student.getSupName(supCoSup[0]);
                coSupervisorName.Text = student.getSupName(supCoSup[1]);
            }
        }
    }
}