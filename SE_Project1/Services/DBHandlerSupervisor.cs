using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace SE_Project1.Services
{
    public class DBHandlerSupervisor
    {
        private DatabaseConnection dbCon;
        private SqlConnection connection;

        public DBHandlerSupervisor()
        {
            dbCon = new DatabaseConnection();
            connection = dbCon.GetConnection();
        }

        public bool supervisorLogin(string id, string pass)
        {
            connection.Open();
            string query2 = "SELECT Faculty_Password FROM Faculty WHERE Faculty_ID='" + id + "'";
            string query1 = "SELECT count(*) FROM Supervisor WHERE Supervisor_ID='" + id + "'";

            SqlCommand SupervisorExists = new SqlCommand(query1, connection);
            SqlCommand checkPassword = new SqlCommand(query2, connection);

            SqlDataReader check = SupervisorExists.ExecuteReader();
            if (check.HasRows)  // meaning supervisor with id exists
            {
                check.Close();
                object obj = checkPassword.ExecuteScalar();
                string p = obj.ToString();

                if (p == pass)
                {
                    check.Close ();
                    connection.Close();
                    return true;
                }

                else
                {
                    check.Close();
                    connection.Close();
                    return false;
                }

            }
            check.Close();
            connection.Close();
            return false;
        }// end of supervisorLogin Function

        // to bind data in table for display
        public void getFacultyData(GridView gridID)
        {
            connection.Open();
            string query = "SELECT Faculty_ID, FName, LName, Department FROM Faculty WHERE commMember=0 and sup=0";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable facultyTable = new DataTable();
            adapter.Fill(facultyTable);

            gridID.DataSource = facultyTable;
            gridID.DataBind();
            connection.Close();
        }

        public bool createSupervisor(List<string> selectedIds)
        {          
            // insert into supervisor table
            // update availability in faculty table
            if (selectedIds.Count == 1)
            {
                connection.Open();
                string id = selectedIds[0].ToString();
                string query = "Insert into Supervisor Values ('" + id + "', 0)";
                SqlCommand creatSup = new SqlCommand(query, connection);
                int rowsAffected = creatSup.ExecuteNonQuery();

                bool check = true;
                // meaning supervisor created successfully
                if (rowsAffected > 0)
                {
                    // Now updating faculty availability
                    string query2 = "Update Faculty set sup=" + 1 + " where Faculty_ID='" + id + "'";
                    SqlCommand update = new SqlCommand(query2, connection);
                    int successfullyChanged = update.ExecuteNonQuery();
                    if (successfullyChanged <= 0)
                    {
                        check = false;
                        connection.Close();
                        return check;
                    }
                }
                connection.Close();
                return check;
            }
            else
            {
                return false;
            }            
        }

        public void getGroupsUnderSupervision(GridView gridID, string supervisorID)
        {
            connection.Open();
            string query = "SELECT grp_id FROM GroupHasProject INNER JOIN Supervises ON Supervises.fyp_id = GroupHasProject.prj_id WHERE Supervises.sup_id = '" + supervisorID + "';";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable deadlinesTable = new DataTable();
            adapter.Fill(deadlinesTable);

            gridID.DataSource = deadlinesTable;
            gridID.DataBind();
            connection.Close();
        }

        public void getNotifications(GridView gridID, string supervisorID)
        {
            connection.Open();
            string query = "SELECT notification_text FROM SupervisorNotifications WHERE sup_ID = '" + supervisorID + "';";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable deadlinesTable = new DataTable();
            adapter.Fill(deadlinesTable);

            gridID.DataSource = deadlinesTable;
            gridID.DataBind();
            connection.Close();
        }

        public bool groupRemovalNotification(string projectID, string supervisorID)
        {
            connection.Open();

            string query = "INSERT INTO SupervisorNotifications(sup_ID,notification_text,status) VALUES(@id,'The project " + projectID + " has been removed from your supervision.','0');";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", supervisorID);
            int found = cmd.ExecuteNonQuery();

            if (found > 0)
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

        public bool groupAssignmentNotification(string projectID, string supervisorID)
        {
            connection.Open();

            string query = "INSERT INTO SupervisorNotifications(sup_ID,notification_text,status) VALUES(@id,'The project " + projectID + " has been assigned under your supervision.','0');";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", supervisorID);
            int found = cmd.ExecuteNonQuery();

            if (found > 0)
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

        public DataTable generateReportData()
        {
            connection.Open();
            string query = "select Supervises.sup_id , Supervisor.NumProjects, Supervises.fyp_id from Supervises INNER JOIN Supervisor ON Supervises.sup_id = Supervisor.Supervisor_ID;";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            connection.Close();
            return dataTable;
        }

    }
}