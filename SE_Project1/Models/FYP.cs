using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SE_Project1.Models
{
    public class FYP
    {
        private string Project_ID;
        private string Title;

        public FYP(string project_ID = "", string title = "")
        {
            Project_ID = project_ID;
            Title = title;
        }

        // ------------------------------------------------------------ //
        // --------------- Getters and Setters ------------------------ //
        // ------------------------------------------------------------ //

        public void setProjectID(string id)
        {
            this.Project_ID = id;
        }

        public string getProjectID()
        {
            return this.Project_ID;
        }

        public string getTitle()
        {
            return this.Title;
        }

        public void setTitle(string title)
        {
            this.Title = title;
        }

        // ------------------------------------------------------------ //
        // --------------------- DB Handling -------------------------- //
        // ------------------------------------------------------------ //

        public string getGroupID(string memID)
        {
            DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
            List<string> groupData = new List<string>();
            groupData = dBHandlerStudent.getGroupDetails(memID);
            return groupData[0];
        }

        public string getProjID(string groupID)
        {
            DBHandlerStudent student = new DBHandlerStudent();
            string projID = student.getProjID(groupID);
            return projID;
        }

        public string getProjectTitle(string projID)
        {
            DBHandlerStudent student = new DBHandlerStudent();
            string title = student.getProjTitle(projID);
            return title;
        }

    }
}