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
using System.Data;
using System.Diagnostics;

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

        public void getFypGroupData(GridView gridID)
        {
            connection.Open();
            string query = "SELECT * FROM FYPGroup WHERE IsAssignedToPanel = 0";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable studentTable = new DataTable();
            adapter.Fill(studentTable);

            gridID.DataSource = studentTable;
            gridID.DataBind();
            connection.Close();
        }

        public List<string> getStudentData(string id)
        {
            connection.Open();
            List<string> data = new List<string>();

            string query = "Select Fname, Lname, department, Grade from Student where Roll_No=@roll";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            sqlCommand.Parameters.AddWithValue("@roll", id);
            SqlDataReader reader = sqlCommand.ExecuteReader(); // getting row of Data
            
            if(reader.Read())
            {
                string fname = reader.GetString(0);
                string lname = reader.GetString(1);
                string dep = reader.GetString(2);
                string grade;
                // Check if the data in the fourth column is not null
                if (!reader.IsDBNull(3))  
                {
                    // Data is not null, retrieve the string value
                    grade = reader.GetString(3);
                }
                else
                {
                    // Data is null, handle it accordingly
                    grade = null;  // You can also assign a default value if needed
                }

                data.Add(fname + " " + lname);
                data.Add(dep);
                data.Add(grade);
            }

            reader.Close();
            connection.Close();
            return data;
        }

        public List<string> getGroupDetails(string memberID)
        {
            connection.Open();
            List<string> data = new List<string>();

            string query = "select * from FYPGroup where Group_Member1 = @id or Group_Member2 = @id or Group_Member3 = @id";
            SqlCommand cmd = new SqlCommand(query, connection); 
            cmd.Parameters.AddWithValue("@id", memberID);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string gID = reader.GetString(0);
                string member1 = reader.GetString(1);
                string member2 = reader.GetString(2);
                string member3 = reader.GetString(3);

                data.Add(gID);
                data.Add(member1);
                data.Add(member2);
                data.Add(member3);
            }

            reader.Close();
            connection.Close();
            return data;
        }

        public string getProjID(string gID)
        {
            connection.Open();
            string query = "select prj_id from GroupHasProject where grp_id=@gid";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@gid", gID);

            object val = cmd.ExecuteScalar();
            string pID = val.ToString();

            connection.Close();
            return pID;
        }

        public List<string> getSupCoSup(string pID)
        {
            connection.Open();
            // 0 index has sup and 1 index has coSup (if it exists)
            List<string> supCoSup = new List<string>();

            string query = "select sup_id, coSup from Supervises where fyp_id=@pid";
            SqlCommand s1 = new SqlCommand(query, connection);
            s1.Parameters.AddWithValue("@pid", pID);
            SqlDataReader sqlData = s1.ExecuteReader(); // should have 2 values

            // Variables to hold the data
            string sID = "";
            int coSupExists = 0;

            // Checking if there are rows and reading the first row
            if (sqlData.Read())
            {
                sID = sqlData["sup_id"].ToString();
                // if true? do this : else do this 
                coSupExists = sqlData["coSup"] != DBNull.Value ? Convert.ToInt32(sqlData["coSup"]) : 0;
            }

            // Always close the SqlDataReader and the connection
            sqlData.Close();

            // Got Supervisors ID
            supCoSup.Add(sID);

            // Now checking and fetching CoSupervisors ID
            if (coSupExists != 0)
            {
                // getting CoSup ID
                string q2 = "select coSup_id from CoSupervisor where fyp_id=@projID";
                SqlCommand s2 = new SqlCommand(q2, connection);
                s2.Parameters.AddWithValue("@projID", pID);
                object val11 = s2.ExecuteScalar();
                string coSupID = val11.ToString();
                supCoSup.Add(coSupID);

                connection.Close();
                return supCoSup;
            }
            else
            {
                connection.Close();
                return supCoSup;
            }
        }

        public string getSupName(string fID)
        {
            connection.Open();
            string query = "select Fname, Lname from Faculty where Faculty_ID=@fid";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@fid", fID);

            string supName = "";
            SqlDataReader val = cmd.ExecuteReader();
            if(val.Read())
            {
                string fname = val[0].ToString();
                string lname = val[1].ToString();

                supName = fname + " " + lname;
            }

            val.Close();
            connection.Close();
            return supName;
        }

    }
}