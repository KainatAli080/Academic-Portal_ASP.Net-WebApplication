using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Drawing;
using SE_Project1.Services;

namespace SE_Project1.Models
{
    public class Notifications
    {
        private string id;
        private string text;
        private string status;

        public Notifications(string i ="",string t="",string s="")
        {
            id = i;
            text = t;
            status = s;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void setText(string t)
        {
            text = t;
        }

        public string getText()
        {
            return text;
        }

        public void setStatus(string s)
        {
            status = s;
        }

        public string getStatus()
        {
            return status;
        }

        public void getSupervisorNotifications(GridView grid,string supID)
        {
            DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
            dBHandlerSupervisor.getNotifications(grid, supID);
        }

        public void getStudentNotifications(GridView grid, string stuID)
        {
            DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
            dBHandlerStudent.getNotifications(grid, stuID);
        }

        public bool groupRemovedFromSupervision(string prjID, string supID)
        {
            DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
            if (dBHandlerSupervisor.groupRemovalNotification(prjID, supID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool groupAddedUnderSupervision(string prjID, string supID)
        {
            DBHandlerSupervisor dBHandlerSupervisor = new DBHandlerSupervisor();
            if (dBHandlerSupervisor.groupAssignmentNotification(prjID, supID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool projectSupervisorChanged(string prjID, string supID)
        {
            DBHandlerStudent dBHandlerStudent = new DBHandlerStudent();
            if (dBHandlerStudent.supervisorUpdateNotification(prjID,supID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}