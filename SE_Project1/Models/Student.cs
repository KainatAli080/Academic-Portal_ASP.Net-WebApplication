using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SE_Project1.Models
{
    public class Student
    {
        private string roll_no;
        private string fname;
        private string lname;
        private string password;
        private string grade;
        private string department;

        public Student(string dep, string r="",string f="",string l="",string pass="",string g="")
        {
            roll_no = r;
            fname = f;
            lname = l;
            password = pass;
            grade = g;
            department = dep;
        }

        public string getRoll()
        {
            return roll_no;
        }

        public void setRoll(string val)
        {
            roll_no = val;
        }

        public string getPass()
        {
            return password;
        }

        public void setPass(string val)
        {
            password = val;
        }
    }
}