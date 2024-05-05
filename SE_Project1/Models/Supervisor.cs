using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using SE_Project1.Services;


namespace SE_Project1.Models
{
    public class Supervisor
    {
        private string id;
        private int num_of_projects;

        public Supervisor(string i = "", int n = 0)
        {
            id = i;
            num_of_projects = n;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void setNumOfProjects(int n)
        {
            num_of_projects = n;
        }

        public int getNumOfProjects()
        {
            return num_of_projects;
        }

        public void getGroupsUnderSupervision(GridView grid)
        {
            DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
            dBHandlerSupervisor.getGroupsUnderSupervision(grid, id);
        }

        public DataTable generateReportData()
        {
            DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
            DataTable dataTable = dBHandlerSupervisor.generateReportData();
            return dataTable;
        }

    }
}