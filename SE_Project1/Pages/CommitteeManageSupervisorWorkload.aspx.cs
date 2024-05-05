using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class CommitteeManageSupervisorWorkload : System.Web.UI.Page
    {
        //private string oldSupID;
        //private string projectToRemoveID;
        //private string newSupID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBHandlerCommittee dBHandlerCommittee = new DBHandlerCommittee();
                dBHandlerCommittee.getSupervisorWithMoreThan6Projects(GridViewSupervisor);

                if(GridViewSupervisor.Rows.Count == 0)
                {
                    // meaning no supervisors with more tyan 6 projects
                    GridViewSupervisor.ShowHeaderWhenEmpty = true;
                    emptyListWarning.Text = "No Supervisors Available with more than 6 projects.";
                    emptyListWarning.Visible = true;
                }
            }
        }

        protected void view_supervisor_projects_onBtnClick(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Code to handle what happens when "View Details" is clicked
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewSupervisor.Rows[index];
                string supID = row.Cells[0].Text;
                Session["oldSupID"] = supID;

                DBHandlerCommittee dBHandlerCommittee= new DBHandlerCommittee();
                dBHandlerCommittee.getSupervisesData(supID, GridViewSupervises);
                GridViewSupervises.Visible= true;
            }
        }

        protected void project_selected_toBeRemoved_btn(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Code to handle what happens when "View Details" is clicked
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewSupervises.Rows[index];
                string projectID = row.Cells[0].Text;
                Session["projectToRemoveID"] = projectID;

                DBHandlerCommittee dBHandlerCommittee = new DBHandlerCommittee();
                dBHandlerCommittee.getSupervisorWithLessThan6Projects(GridViewSupervisorLessThan6Projects);
                
                //checking if No Supervisors with less than 6 projects
                if(GridViewSupervisorLessThan6Projects.Rows.Count == 0)
                {
                    GridViewSupervisorLessThan6Projects.ShowHeaderWhenEmpty = true;
                    warningMessage.Text = "No Supervisor with less than 6 projects available. Make more Supervisors.";
                    warningMessage.Visible = true;
                }

                GridViewSupervisorLessThan6Projects.Visible = true;
            }
        }

        protected void select_newSupervisor_toReAssignProject_btn(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewSupervisorLessThan6Projects.Rows[index];
                string newSupID = row.Cells[0].Text;
                string projectToRemoveID = Session["projectToRemoveID"] as String;
                string oldSupID = Session["oldSupID"] as String;
                DBHandlerCommittee dBComm = new DBHandlerCommittee();

                // first updating NumProjects in Supervisor Table
                int updatedOldSupNumProjects = dBComm.decrementNumProjects(oldSupID);

                // updating new Supervisors NumProjects
                int updatedNewSupNumProjects = dBComm.incrementNumProjects(newSupID);

                // updating the Supervises/CoSupervisors Table
                int updatedSupCoSup = dBComm.updateSupIDatProjectID(newSupID, projectToRemoveID);

                if(updatedSupCoSup > 0 && updatedNewSupNumProjects > 0  && updatedOldSupNumProjects > 0) 
                {
                    warningMessage.Text = "Managed Workload of selected Supervisor.";
                    warningMessage.Visible = true;
                    Response.Redirect("CommitteeHomepage.aspx");
                }
                else
                {
                    warningMessage.Text = "Error Managing Workload of selected Supervisor.";
                    warningMessage.Visible = true;
                }
            }
        }
    }
}