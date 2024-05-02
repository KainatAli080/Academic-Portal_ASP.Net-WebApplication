using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SE_Project1.Models;
using SE_Project1.Services;

namespace SE_Project1.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            string type = searchOption.SelectedItem.Text;
            string ID = id.Text;
            string pass = password.Text;

            if(type == "Student")
            {
                DBHandlerStudent studentHandler = new DBHandlerStudent();
                bool success = studentHandler.studentLogin(ID, pass);
                if(success)
                {
                    Session["studentID"] = ID;
                    Response.Redirect("StudentHomePage.aspx");
                }
                else
                {
                    warningMessage.Text = "Login Unsuccessful. Password or ID are incorrect.";
                    warningMessage.Visible = true;
                }
            }

            else if (type == "Supervisor")
            {
                DBHandlerSupervisor supervisorHandler = new DBHandlerSupervisor();
                bool success = supervisorHandler.supervisorLogin(ID, pass);
                if (success)
                {
                    Session["supervisorID"] = ID;
                    Response.Redirect("SupervisorHomePage.aspx");
                }
                else
                {
                    warningMessage.Text = "Login Unsuccessful. Password or ID are incorrect.";
                    warningMessage.Visible = true;
                }
            }

            else if (type == "Panel Member")
            {
                DBHandlerPanel panelMemberHandler = new DBHandlerPanel();
                bool success = panelMemberHandler.panelMemberLogin(ID, pass);
                if (success)
                {
                    Session["panelMemberID"] = ID;
                    Response.Redirect("PanelHomePage.aspx");
                }
                else
                {
                    warningMessage.Text = "Login Unsuccessful. Password or ID are incorrect.";
                    warningMessage.Visible = true;
                }
            }

            else if (type == "Committee Member")
            {
                DBHandlerCommittee commHandler = new DBHandlerCommittee();
                bool success = commHandler.committeeMemberLogin(ID, pass);
                if (success)
                {
                    Session["committeeID"] = ID;
                    Session["committeeName"] = commHandler.getCommMemberName(ID);
                    Response.Redirect("CommitteeHomepage.aspx");
                }
                else
                {
                    warningMessage.Text = "Login Unsuccessful. Password or ID are incorrect.";
                    warningMessage.Visible = true;
                }
            }

        }
    }
}