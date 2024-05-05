using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Drawing;
using SE_Project1.Services;


namespace SE_Project1.Models
{
    public class Panel
    {
        private string id;
        private int num_of_members;
        Faculty[] panelmembers;

        public Panel(string i="", int n=0)
        {
            id = i;
            num_of_members = n;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void setNumOfMembers(int n)
        {
            num_of_members = n;
        }

        public int getNumOfMembers()
        {
            return num_of_members;
        }

        
        public void getDeadlinesInformation(GridView grid)
        {
            DBHandlerPanel dBHandler = new DBHandlerPanel();
            dBHandler.getDeadlinesInformation(grid, id);
        }
    }
}