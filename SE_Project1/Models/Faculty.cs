using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SE_Project1.Services;

namespace SE_Project1.Models
{
    public class Faculty
    {
        private string id;
        private string fname;
        private string lname;
        private string password;
        private string department;

        public Faculty(string i = "", string f = "", string l = "", string pass = "", string dept = "")
        {
            id = i;
            fname = f;
            lname = l;
            pass = password;
            department = dept;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void setFName(string f)
        {
            fname = f;
        }

        public string getFName()
        {
            return fname;
        }

        public void setLName(string l)
        {
            lname = l;
        }

        public string getLName()
        {
            return lname;
        }

        public void setPassword(string p)
        {
            password = p;
        }

        public string getPassword()
        {
            return password;
        }

        public void setDepartment(string d)
        {
            department = d;
        }

        public string getDepartment()
        {
            return department;
        }

        public string getPanelID()
        {
            DBHandlerPanel dBHandlerPanel = new DBHandlerPanel();
            string panelID = dBHandlerPanel.getPanelIdFromMemberId(id);
            return panelID;
        }
    }
}