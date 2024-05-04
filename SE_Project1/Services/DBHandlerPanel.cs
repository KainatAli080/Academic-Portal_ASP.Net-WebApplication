using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SE_Project1.Services
{
    public class DBHandlerPanel
    {
        private DatabaseConnection dbCon;
        private SqlConnection connection;

        public DBHandlerPanel()
        {
            dbCon = new DatabaseConnection();
            connection = dbCon.GetConnection();
        }

        public bool panelMemberLogin(string id, string pass)
        {
            connection.Open();
            string query2 = "SELECT Faculty_Password FROM Faculty WHERE Faculty_ID='" + id + "'";
            string query1 = "SELECT count(*) FROM PanelMember WHERE PMember_ID='" + id + "'";

            SqlCommand panelMemberExists = new SqlCommand(query1, connection);
            SqlCommand checkPassword = new SqlCommand(query2, connection);

            SqlDataReader check = panelMemberExists.ExecuteReader();
            if (check.HasRows)  // meaning supervisor with id exists
            {
                check.Close();
                object obj = checkPassword.ExecuteScalar();
                string p = obj.ToString();

                if (p == pass)
                {
                    check.Close();
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
            check.Close() ;
            connection.Close();
            return false;
        }// end of panelMemberLogin Function

        public void getFacultyData(GridView gridID)
        {
            connection.Open();
            string query = "SELECT Faculty_ID, FName, LName, Department FROM Faculty WHERE available=1";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable facultyTable = new DataTable();
            adapter.Fill(facultyTable);

            gridID.DataSource = facultyTable;
            gridID.DataBind();
            connection.Close() ;
        }

        public string getMyPanelID(string memID)
        {
            connection.Open();
            string query = "select pnl_id from PanelMember where PMember_ID=@id";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", memID);

            object obj = cmd.ExecuteScalar();
            string p = obj.ToString();

            connection.Close();
            return p;   
        }

        public void getMyPanelsFYPGroupData(GridView gridID, string panelID)
        {
            // Open the database connection
            connection.Open();

            // Define the SQL query
            string query = @"
            SELECT fg.Group_ID, fg.Group_Member1, fg.Group_Member2, fg.Group_Member3
            FROM FYPGroup fg
            JOIN FYPGroupAssignedToPanel fgap ON fg.Group_ID = fgap.Group_ID
            WHERE fgap.Panel_ID = @panelId";

            // Create a SqlCommand with the query and connection
            SqlCommand cmd = new SqlCommand(query, connection);

            // Add the parameters
            cmd.Parameters.AddWithValue("@panelId", panelID);

            // Create a SqlDataAdapter with the command
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            // Create a DataTable to hold the query results
            DataTable studentTable = new DataTable();

            // Fill the DataTable with the query results
            adapter.Fill(studentTable);

            // Bind the DataTable to the GridView
            gridID.DataSource = studentTable;
            gridID.DataBind();

            // Close the database connection
            connection.Close();
        }

        public void getFYPGroupDataAccordingToSearch(GridView gridID, string searchString, string panelID)
        {
            // Open the database connection
            connection.Open();

            // Define the SQL query
            string query = @"
            SELECT fg.Group_ID, fg.Group_Member1, fg.Group_Member2, fg.Group_Member3
            FROM FYPGroup fg
            JOIN FYPGroupAssignedToPanel fgap ON fg.Group_ID = fgap.Group_ID
            WHERE fgap.Panel_ID = @panelId
            AND fg.Group_ID LIKE @search";

            // Create a SqlCommand with the query and connection
            SqlCommand cmd = new SqlCommand(query, connection);

            // Add the parameters
            cmd.Parameters.AddWithValue("@panelId", panelID);
            cmd.Parameters.AddWithValue("@search", "%" + searchString + "%");

            // Create a SqlDataAdapter with the command
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            // Create a DataTable to hold the query results
            DataTable studentTable = new DataTable();

            // Fill the DataTable with the query results
            adapter.Fill(studentTable);

            // Bind the DataTable to the GridView
            gridID.DataSource = studentTable;
            gridID.DataBind();

            // Close the database connection
            connection.Close();
        }

        public bool createPanel(string panelID, List<string> selectedIds)
        {
            connection.Open();
            string query = "Insert into Panel(Panel_ID, NumMembers) Values ('" + panelID + "', " + selectedIds.Count + ")";
            SqlCommand createPanel = new SqlCommand(query, connection);
            // executeNonQuery returns number of rows affected and not data, ideal for update, delete, insert queries
            int rowsAffected = createPanel.ExecuteNonQuery();
            bool check = true;
            if (rowsAffected > 0)   // meaning panel created
            {
                foreach (string facultyid in selectedIds)
                {
                    // updating availability status of faculty to be made into panel member
                    string q3 = "Update Faculty set available = 0 where Faculty_ID='" + facultyid + "'";
                    SqlCommand updateAvailability = new SqlCommand(q3, connection);
                    int successChange = updateAvailability.ExecuteNonQuery();
                    
                    // creating memberID in Panel_Member
                    string q2 = "Insert into PanelMember(pnl_id, PMember_ID) Values('"+ panelID +"', '"+ facultyid +"')";
                    SqlCommand createPanelMember = new SqlCommand(q2, connection);
                    int success = createPanelMember.ExecuteNonQuery();
                    if (success <= 0)
                    {
                        check = false;
                        break;
                    }
                }
            }
            connection.Close();
            return check;
        }

    }
}