using SE_Project1.Models;
using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class PanelViewMyFYP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // First getting Logged In Member's ID
                PanelMember panelMember = new PanelMember();
                string memberID = Session["panelMemberID"].ToString();
                string panelID = panelMember.getMyPanel(memberID);

                // binding initial data to GridView
                DBHandlerPanel panel = new DBHandlerPanel();
                panel.getMyPanelsFYPGroupData(GridViewMyStudents, panelID);
            }
        }

        public void btnStartSearching(object sender, EventArgs e)
        {
            // First getting Logged In Member's ID
            PanelMember panelMember = new PanelMember();
            string memberID = Session["panelMemberID"].ToString();
            string panelID = panelMember.getMyPanel(memberID);

            panelMember.SetPanelID(panelID);
            panelMember.SetMemberID(memberID);

            string searchText = groupTosearchFor.Text;
            DBHandlerPanel dBHandlerPanel = new DBHandlerPanel();
            dBHandlerPanel.getFYPGroupDataAccordingToSearch(GridViewMyStudents, searchText, panelID);
        }

        protected void GridViewMyStudentsData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Code to handle what happens when "View Details" is clicked
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewMyStudents.Rows[index];
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

                if (supCoSup.Count == 1)
                {
                    supervisor.Text = supCoSup[0];
                    coSupervisor.Text = "No Co-Supervisor Assigned.";
                }
                else if (supCoSup.Count == 2)
                {
                    supervisor.Text = supCoSup[0];
                    coSupervisor.Text = supCoSup[1];
                }

            }
        }
    }
}