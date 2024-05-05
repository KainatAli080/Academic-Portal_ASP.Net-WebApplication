using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Drawing;
using SE_Project1.Services;

namespace SE_Project1.Models
{
    public class FYPGroup
    {
        private string id;
        private string member1;
        private string member2;
        private string member3;

        public FYPGroup(string i="",string m1 ="",string m2="",string m3="")
        {
            id = i;
            member1 = m1;
            member2 = m2;
            member3 = m3;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void getDeadlinesInformation(GridView grid)
        {
            DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
            dBHandlerStudent.getDeadlinesInformation(grid, id);
        }

        public List<string> getGroupMembers()
        {
            DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
            List<string> groupMembers = dBHandlerStudent.getGroupMembers(id);
            return groupMembers;
        }
    }
}