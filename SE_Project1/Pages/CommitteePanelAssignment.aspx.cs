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
    public partial class CommitteePanelAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
                dBHandlerStudent.getFypGroupData(GridViewFYPGroups);
            }
        }

        // To make sure only one checkbox is checked at a time, 
        // This function would reset the rest to empty
        protected void CheckBox_CheckedIfChanged(object sender, EventArgs e)
        {
            // Get the CheckBox that triggered the event
            CheckBox currentCheckBox = sender as CheckBox;

            // Iterate through each row in the GridView
            foreach (GridViewRow row in GridViewFYPGroups.Rows)
            {
                // Find the CheckBox control in the row
                CheckBox checkBox = row.FindControl("selectGroup") as CheckBox;

                // If this is not the checkbox that triggered the event, uncheck it
                if (checkBox != null && checkBox != currentCheckBox)
                {
                    checkBox.Checked = false;
                }
            }
        }

        protected void assignFYPToPanel(object sender, EventArgs e)
        {
            string gID = "";

            foreach (GridViewRow row in GridViewFYPGroups.Rows)
            {
                CheckBox checkBox = row.FindControl("selectGroup") as CheckBox;
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        gID = row.Cells[1].Text;
                    }

                }
                else
                {
                    // Debug: If checkbox is not checked, print information
                    Console.WriteLine("CheckBox not checked in the row.");
                }
            }

            // meaning no group selected
            if(gID == "")
            {
                warningMessage.Text = "No Group Selected. Kindly select an FYP Group before continuing.";
                warningMessage.Visible = true;
                return;
            }

            string pID = panelID.Text;

            // initializing class to store data and access dbHandler through it
            // Separating DB from UI

            FYPGroupAssignedToPanel group = new FYPGroupAssignedToPanel(gID, pID);
            bool doneCreating = group.assignGroupToFYP();
            if (doneCreating)
            {
                warningMessage.Text = "Group " + gID + " Assigned to " + pID;
                warningMessage.Visible = true;
            }
        }
    }
}