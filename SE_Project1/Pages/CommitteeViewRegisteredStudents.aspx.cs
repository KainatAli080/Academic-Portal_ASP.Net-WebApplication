using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class CommitteeViewRegisteredStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // binding data to 
                DBHandlerCommittee fypGroup = new DBHandlerCommittee();
                fypGroup.getFYPGroupData(GridViewStudents);
            }
        }

        protected void GridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Code to handle what happens when "View Details" is clicked
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewStudents.Rows[index];
                string groupID = row.Cells[0].Text;

                DBHandlerCommittee dBHandlerCommittee = new DBHandlerCommittee();

                List<string> idTitle = dBHandlerCommittee.getProjTitle(groupID);
                projectID.Text = idTitle[0];
                projectTitle.Text = idTitle[1];

                groupMember1.Text = row.Cells[1].Text;
                groupMember2.Text = row.Cells[2].Text;
                groupMember3.Text = row.Cells[3].Text;                

                List<string> supCoSup = new List<string>();
                supCoSup = dBHandlerCommittee.getSupTitle(projectID.Text);

                if(supCoSup.Count == 1)
                {
                    supervisor.Text = supCoSup[0];
                    coSupervisor.Text = "No Co-Supervisor Assigned.";
                }
                else if(supCoSup.Count == 2)
                {
                    supervisor.Text = supCoSup[0];
                    coSupervisor.Text = supCoSup[1];
                }
                
            }
        }

    }
}