using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using SE_Project1.Models;
using SE_Project1.Pages;
using System.Security.Cryptography;

namespace SE_Project1.Services
{
    public class DBHandlerStudent
    {
        private DatabaseConnection dbCon;
        private SqlConnection connection;

        public DBHandlerStudent()
        {
            dbCon = new DatabaseConnection();
            connection = dbCon.GetConnection();
        }

        public bool studentLogin(string roll, string pass)
        {
            connection.Open();
            string query = "select Student_Password FROM Student WHERE Roll_No='" + roll + "'";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlCommand checkIfEmpty = new SqlCommand("SELECT count(*) FROM Student WHERE Roll_No='" + roll + "' and Student_Password='" + pass + "'", connection);
            
            SqlDataReader check = checkIfEmpty.ExecuteReader();
            if(check.HasRows)
            {
                check.Close();
                object obj = cmd.ExecuteScalar();
                string p = obj.ToString();

                if(p == pass)
                {
                    connection.Close();
                    return true;
                }

                else
                {
                    connection.Close();
                    return false;
                }

            }
            connection.Close();
            return false;
        }// end of StudentLogin Function     

    }
}