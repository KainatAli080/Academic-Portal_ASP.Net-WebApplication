﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE_Project1.Pages
{
    public partial class CommitteeHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CommName.Text = Session["committeeName"].ToString();
                CommName.Visible = true;

                CommID.Text = Session["committeeID"].ToString();
                CommID.Visible = true;
            }
        }
    }
}