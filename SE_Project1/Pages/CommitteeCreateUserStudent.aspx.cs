using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class CommitteeCreateUserStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateProject_Click(object sender, EventArgs e)
        {
            // Project Details FYP(Project_ID, Title)
            string pID = projectID.Text;
            string pTitle = projectTitle.Text;

            DBHandlerCommittee dBHandlerStudent = new DBHandlerCommittee();
            bool check = dBHandlerStudent.createFYP(pID, pTitle);
            if (check == false)
            {
                warningMessage.Text = "FYP Group could not be created.";
                warningMessage.Visible = true;
                return;
            }

            // to store ID's of selected students for FYP group
            // FYPGroup (Group_ID, Group_Member1, Group_Member2, Group_Member3)
            List<string> studentIDs = new List<string>();
            studentIDs.Add(groupMember1.Text);
            studentIDs.Add(groupMember2.Text);
            studentIDs.Add(groupMember3.Text);
            bool check2 = dBHandlerStudent.createFYPGroup(studentIDs);
            if (!check2)
            {
                warningMessage.Text = "Error in Creating FYP Group.";
                warningMessage.Visible = true;
                return;
            }

            // GroupHasProject(grp_id, prj_id)  where groupID is groupmember 1 +...
            string groupID = "G";
            foreach (string id in studentIDs)
            {
                groupID += "_";
                groupID += id;
            }
            bool doneInsertion = dBHandlerStudent.groupHasProject(groupID, pID);
            if (doneInsertion == false)
            {
                warningMessage.Text = "Error in Creating GroupHasFYP row.";
                warningMessage.Visible = true;
                return;
            }

            // Supervises sup_id, fyp_id, coSup
            string supID = supervisor.Text;
            int coSupExists = 0;
            string coSupID = "";
            if(!string.IsNullOrWhiteSpace(coSupervisor.Text))
            {
                coSupExists = 1;
                coSupID = coSupervisor.Text;
            }

            bool updatedSup_coSup = dBHandlerStudent.supervisesTableUpdate(supID, pID, coSupExists, coSupID);
            if (!updatedSup_coSup)
            {
                warningMessage.Text = "Error in Creating Supervisor/CoSupervisor.";
                warningMessage.Visible = true;
                return;
            }

            // update Supervisor's NumOfProjects
            bool check4 = dBHandlerStudent.updateNumProjects(supID, coSupID);
            if (!check4)
            {
                warningMessage.Text = "Error in Updating Number of Projects of Supervisor/CoSupervisor.";
                warningMessage.Visible = true;
                return;
            }
            else
            {
                warningMessage.Text = "Successfully created and updated FYP groups and Supervisors.";
                warningMessage.Visible = true;
            }

            //Response.Redirect("CommitteeHomepage.aspx");
        }
    }
}