using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SE_Project1.Services;

namespace SE_Project1.Models
{
    public class Assesment
    {
        private string id;
        private string title;
        private string deadline;
        private int marks;
        private string type;

        public Assesment(string i = "", string t = "",  string d = "", int m = 0, string ty = "")
        {
            id = i;
            title = t;
            deadline = d;
            marks = m;
            type = ty;
        }

        public void setID(string i)
        {
            id = i;
        }

        public string getID()
        {
            return id;
        }

        public void setTitle(string t)
        {
            title = t;
        }

        public string getTitle()
        {
            return title;
        }

        public void setDeadline(string d)
        {
            deadline = d;
        }

        public string getDeadline()
        {
            return deadline;
        }

        public void setMarks(int m)
        {
            marks = m;
        }

        public int getMarks()
        {
            return marks;
        }

        public void setType(string t)
        {
            type = t;
        }

        public string getType()
        {
            return type;
        }

        public bool createNewAssesment()
        {
            DBHandlerCommittee db = new DBHandlerCommittee();
            if (db.createAssesmentDeadline(id, title, deadline, marks, type))
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