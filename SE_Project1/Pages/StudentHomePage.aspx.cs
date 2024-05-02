using SE_Project1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class StudentHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                rollNo.Text = Session["studentID"].ToString();
                getDisplayData(rollNo.Text);
            }
        }

        public void getDisplayData(string id)
        {
            Student student = new Student();
            student.setRoll(id);

            List<string> data = new List<string>();
            data = student.getProfileData();

            fullName.Text = data[0];
            dep.Text = data[1];
            grade.Text = data[2];
            if (data[2] == null)
            {
                grade.Text = "  Grade has not been assigned for now. Kindly wait...";
                grade.CssClass = "warning";
            }
        }
    }
}