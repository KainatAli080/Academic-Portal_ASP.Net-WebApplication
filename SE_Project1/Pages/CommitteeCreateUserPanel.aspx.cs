using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SE_Project1.Services;

namespace SE_Project1.Pages
{
    public partial class CommitteeCreateUserPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBHandlerPanel panel = new DBHandlerPanel();
                panel.getFacultyData(GridViewFaculty);
            }
            
        }

        protected void btnCreatePanel_Click(object sender, EventArgs e)
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
                        Console.WriteLine(selectedIds.Count);
                    }
                    
                }
                else
                {
                    // Debug: If checkbox is not checked, print information
                    if (checkBox == null)
                    {
                        Console.WriteLine("CheckBox not found in the row.");
                    }
                    else
                    {
                        Console.WriteLine("CheckBox not checked in the row.");
                    }
                }
            }

            foreach (GridViewRow row in GridViewFaculty.Rows)
            {
                CheckBox checkBox = row.FindControl("checkToSelect") as CheckBox;
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        string facultyId = row.Cells[1].Text;
                        selectedIds.Add(facultyId);
                    }
                }
                else
                {
                    // Debug: Print if CheckBox control is not found
                    Console.WriteLine($"CheckBox control not found in row {row.RowIndex}");
                }
            }

            bool created = true;
            if (selectedIds.Count > 1)
            {
                DBHandlerPanel dBHandlerPanel = new DBHandlerPanel();
                created = dBHandlerPanel.createPanel(panelID.Text, selectedIds);
            }
            if (created)
            {
                warningMessage.Text = "Panel Sucessfully Created.";
                warningMessage.Visible = true;
                Response.Redirect("CommitteeHomepage.aspx");
            }
            else
            {
                warningMessage.Text = "Error Creating Panel.";
                warningMessage.Visible = true;
            }
        }
    }
}