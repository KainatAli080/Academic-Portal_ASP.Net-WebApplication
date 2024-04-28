using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class CommitteeCreateUserSupervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // binding data to 
                DBHandlerSupervisor sup = new DBHandlerSupervisor();
                sup.getFacultyData(GridViewFaculty);
            }
        }

        protected void btnCreateSupervisor_Click(object sender, EventArgs e)
        {
            // Capture the selected faculty IDs
            List<string> selectedIds = new List<string>();

            foreach (GridViewRow row in GridViewFaculty.Rows)
            {
                CheckBox checkBox = row.FindControl("checkToSelect") as CheckBox;
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        string facultyId = row.Cells[1].Text; // Assuming Faculty_ID is in the second cell
                        selectedIds.Add(facultyId);
                    }

                }
                else
                {
                    // Debug: If checkbox is not checked, print information
                    Console.WriteLine("CheckBox not checked in the row.");
                }
            }

            bool created = false;
            if (selectedIds.Count == 1)
            {
                DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
                created = dBHandlerSupervisor.createSupervisor(selectedIds);
            }
            else
            {
                warningMessage.Text = "You must select only 1 faculty member to create a supervisor.";
                warningMessage.Visible = true;
            }

            // result from execution
            if (created)
            {
                warningMessage.Text = "Superviosr Sucessfully Created.";
                warningMessage.Visible = true;
                //Response.Redirect("CommitteeHomepage.aspx");
            }
            //else
            //{
            //    warningMessage.Text = "Error Creating Supervisor.";
            //    warningMessage.Visible = true;
            //}
        }
    }
}