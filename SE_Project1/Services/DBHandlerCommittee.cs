using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SE_Project1.Services
{
    public class DBHandlerCommittee
    {
        private DatabaseConnection dbCon;
        private SqlConnection connection;

        public DBHandlerCommittee()
        {
            dbCon = new DatabaseConnection();
            connection = dbCon.GetConnection();
        }

        public bool committeeMemberLogin(string roll, string pass)
        {
            connection.Open();
            string query = "select password FROM FYPCommittee WHERE Member_ID=@roll";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@roll", roll);
            SqlCommand checkIfEmpty = new SqlCommand("SELECT count(*) FROM FYPCommittee WHERE Member_ID='" + roll + "' and password='" + pass + "'", connection);

            SqlDataReader check = checkIfEmpty.ExecuteReader();
            bool see = false;
            if (check.HasRows)
            {
                see = true;
            }
            check.Close ();
            connection.Close();
            return see;
        }// end of committeeLogin Function

        public string getCommMemberName(string id)
        {
            connection.Open ();
            string name = "";
            string query = "Select Member_Name from FYPCommittee where Member_ID='" + id +"'";
            SqlCommand getName = new SqlCommand(query, connection);
            SqlDataReader getData = getName.ExecuteReader();
            while(getData.Read())
            {
                name = getData["Member_Name"].ToString();
                break;
            }
            getData.Close ();
            connection.Close();
            return name;
        }

        public bool createFYP(string pID, string pTitle)
        {
            connection.Open();
            string query = "Insert into FYP Values('" + pID + "', '" + pTitle + "')";
            SqlCommand insertNewFYP = new SqlCommand(query, connection);
            int check = insertNewFYP.ExecuteNonQuery();
            if (check > 0)
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

        public bool createFYPGroup(List<string> selectedIDs)
        {
            string groupID = "G";
            foreach (string id in selectedIDs)
            {
                groupID += "_";
                groupID += id;
            }

            connection.Open();
            bool check = false;
            // only handline the case where FYP has 3 members
            string query = "Insert into FYPGroup (Group_ID, Group_Member1, Group_Member2, Group_Member3) Values (@groupID, @member1ID, @member2ID, @member3ID)";
            SqlCommand createGroup = new SqlCommand(query, connection);
            createGroup.Parameters.AddWithValue("@groupID", groupID);
            createGroup.Parameters.AddWithValue("@member1ID", selectedIDs[0]);
            createGroup.Parameters.AddWithValue("@member2ID", selectedIDs[1]);
            createGroup.Parameters.AddWithValue("@member3ID", selectedIDs[2]);

            int inserted = createGroup.ExecuteNonQuery();
            if (inserted > 0)
            {
                connection.Close();
                check = true;
            }

            return check;
        }

        public bool groupHasProject(string gid, string pid)
        {
            connection.Open();
            string query = "Insert into GroupHasProject Values (@groupID, @projectID)";
            SqlCommand createGroup = new SqlCommand(query, connection);
            createGroup.Parameters.AddWithValue("@groupID", gid);
            createGroup.Parameters.AddWithValue("@projectID", pid);

            int inserted = createGroup.ExecuteNonQuery();
            if (inserted > 0)
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

        public bool supervisesTableUpdate(string supID, string pID, int coSup, string coSupID)
        {
            connection.Open();
            string query = "Insert into Supervises Values (@sID, @projectID, @coSupExists)";
            SqlCommand createGroup = new SqlCommand(query, connection);
            createGroup.Parameters.AddWithValue("@sID", supID);
            createGroup.Parameters.AddWithValue("@projectID", pID);
            createGroup.Parameters.AddWithValue("@coSupExists", coSup);
            int inserted = createGroup.ExecuteNonQuery();
            if (inserted > 0)
            {
                if (coSup != 0)//meaning co-supervisor exists
                {
                    string q2 = "Insert into coSupervisor Values (@coSupID, @projectID)";
                    SqlCommand createCoSup = new SqlCommand(q2, connection);
                    createCoSup.Parameters.AddWithValue("@coSupID", coSupID);
                    createCoSup.Parameters.AddWithValue("@projectID", pID);
                    int addedCoSup = createCoSup.ExecuteNonQuery();
                    if (addedCoSup > 0)
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
                return true;
            }
            connection.Close();
            return false;
        }

        public bool updateNumProjects(string sup, string coSup)
        {
            connection.Open();

            // Query 1" getting Supervisorsproject count
            string query1 = "select NumProjects from Supervisor where Supervisor_ID=@supID";
            SqlCommand getNumProjects = new SqlCommand(query1, connection);
            getNumProjects.Parameters.AddWithValue("@supID", sup);
            object val = getNumProjects.ExecuteScalar();
            int numProjectsSupervisor = Convert.ToInt32(val);

            // Start of query 2: updating Supervisors project count
            numProjectsSupervisor++;
            string query2 = "UPDATE Supervisor SET NumProjects = @newValue WHERE Supervisor_ID = @supID";
            SqlCommand setNumProjectsSupervisor = new SqlCommand(query2, connection);
            setNumProjectsSupervisor.Parameters.AddWithValue("@newValue", numProjectsSupervisor);
            setNumProjectsSupervisor.Parameters.AddWithValue("@supID", sup);
            int updated = setNumProjectsSupervisor.ExecuteNonQuery();

            if (updated > 0)
            {
                if (!string.IsNullOrEmpty(coSup))
                {
                    // Query 3: Getting coSups project count
                    string query3 = "select NumProjects from Supervisor where Supervisor_ID=@coSupID";
                    SqlCommand getCoNumProjects = new SqlCommand(query3, connection);
                    getCoNumProjects.Parameters.AddWithValue("@coSupID", coSup);
                    object val2 = getCoNumProjects.ExecuteScalar();
                    int numProjectsCoSupervisor = Convert.ToInt32(val2);

                    // Start of query 4: updating CoSupervisors project count
                    numProjectsCoSupervisor++;
                    string query4 = "UPDATE Supervisor SET NumProjects = @newValue WHERE Supervisor_ID = @coSupID";
                    SqlCommand setNumProjectsCoSupervisor = new SqlCommand(query4, connection);
                    setNumProjectsCoSupervisor.Parameters.AddWithValue("@newValue", numProjectsCoSupervisor);
                    setNumProjectsCoSupervisor.Parameters.AddWithValue("@coSupID", coSup);
                    int updatedCoSup = setNumProjectsCoSupervisor.ExecuteNonQuery();
                    if (updatedCoSup > 0)
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
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }

        public void getFYPGroupData(GridView gridID)
        {
            connection.Open();
            string query = "SELECT * FROM FYPGroup";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable studentTable = new DataTable();
            adapter.Fill(studentTable);

            gridID.DataSource = studentTable;
            gridID.DataBind();
            connection.Close();
        }

        public List<string> getProjTitle(string gID)
        {
            // first find projectID from GroupHasProject
            // then get projectTitle from FYP
            connection.Open ();
            string q1 = "Select prj_id from GroupHasProject where grp_id=@gid";
            SqlCommand sqlCommand = new SqlCommand(q1, connection);
            sqlCommand.Parameters.AddWithValue ("@gid", gID);
            object val2 = sqlCommand.ExecuteScalar();
            string pID = val2.ToString();
            List<string> idTitle = new List<string>();
            idTitle.Add(pID);

            string query = "Select Title from FYP where Project_ID=@pid";
            SqlCommand cmd = new SqlCommand (query, connection);
            cmd.Parameters.AddWithValue("@pid", pID);
            object val = cmd.ExecuteScalar();
            string title = val.ToString();
            idTitle.Add(title);

            connection.Close();
            return idTitle;
        }

        public List<string> getSupTitle(string pID)
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
            if(coSupExists != 0)
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

        public void getSupervisorWithMoreThan6Projects(GridView gridID)
        {
            connection.Open();
            string query = "select * from Supervisor where Supervisor.NumProjects > 6";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable supervisorTable = new DataTable();
            adapter.Fill(supervisorTable);

            gridID.DataSource = supervisorTable;
            gridID.DataBind();
            connection.Close();
        }

        public void getSupervisorWithLessThan6Projects(GridView gridID)
        {
            connection.Open();
            string query = "select * from Supervisor where Supervisor.NumProjects < 6";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable supervisorTable = new DataTable();
            adapter.Fill(supervisorTable);

            gridID.DataSource = supervisorTable;
            gridID.DataBind();
            connection.Close();
        }

        public void getSupervisesData(string supID, GridView gridSupervises)
        {
            connection.Open();
            string query = "select fyp_id, coSup from Supervises where sup_id=@supid";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@supid", supID);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable supervisorTable = new DataTable();
            adapter.Fill(supervisorTable);

            gridSupervises.DataSource = supervisorTable;
            gridSupervises.DataBind();
            connection.Close();
        }

        public int decrementNumProjects(string sup)
        {
            connection.Open();

            // Query 1" getting Supervisorsproject count
            string query1 = "select NumProjects from Supervisor where Supervisor_ID=@supID";
            SqlCommand getNumProjects = new SqlCommand(query1, connection);
            getNumProjects.Parameters.AddWithValue("@supID", sup);
            object val = getNumProjects.ExecuteScalar();
            int numProjectsSupervisor = Convert.ToInt32(val);

            // Start of query 2: updating Supervisors project count
            numProjectsSupervisor--;
            string query2 = "UPDATE Supervisor SET NumProjects = @newValue WHERE Supervisor_ID = @supID";
            SqlCommand setNumProjectsSupervisor = new SqlCommand(query2, connection);
            setNumProjectsSupervisor.Parameters.AddWithValue("@newValue", numProjectsSupervisor);
            setNumProjectsSupervisor.Parameters.AddWithValue("@supID", sup);
            int updated = setNumProjectsSupervisor.ExecuteNonQuery();

            connection.Close();
            return updated;
        }

        public int incrementNumProjects(string sup)
        {
            connection.Open();

            // Query 1" getting Supervisorsproject count
            string query1 = "select NumProjects from Supervisor where Supervisor_ID=@supID";
            SqlCommand getNumProjects = new SqlCommand(query1, connection);
            getNumProjects.Parameters.AddWithValue("@supID", sup);
            object val = getNumProjects.ExecuteScalar();
            int numProjectsSupervisor = Convert.ToInt32(val);

            // Start of query 2: updating Supervisors project count
            numProjectsSupervisor++;
            string query2 = "UPDATE Supervisor SET NumProjects = @newValue WHERE Supervisor_ID = @supID";
            SqlCommand setNumProjectsSupervisor = new SqlCommand(query2, connection);
            setNumProjectsSupervisor.Parameters.AddWithValue("@newValue", numProjectsSupervisor);
            setNumProjectsSupervisor.Parameters.AddWithValue("@supID", sup);
            int updated = setNumProjectsSupervisor.ExecuteNonQuery();

            connection.Close();
            return updated;
        }

        public int updateSupIDatProjectID(string newSupID, string projectID)
        {
            connection.Open();

            string query = "Update Supervises set sup_id=@newsup_id where fyp_id=@projID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@newsup_id", newSupID);
            cmd.Parameters.AddWithValue("@projID", projectID);
            int found = cmd.ExecuteNonQuery();

            if(found == 0)
            {
                // meaning that this supervisor was not in the Supervisor table
                // then he should be in the CoSupervisor table
                string query2 = "Update CoSupervisor set coSup_id=@newsup_id where fyp_id=@projID";
                SqlCommand cmd2 = new SqlCommand(query2, connection);
                cmd.Parameters.AddWithValue("@newsup_id", newSupID);
                cmd.Parameters.AddWithValue("@projID", projectID);
                int foundFinally = cmd2.ExecuteNonQuery();

                connection.Close ();
                return foundFinally;
            }
            else
            {
                connection.Close();
                return found;
            }      
        }

        public bool assignGroupToPanel(string gID, string pID)
        {
            connection.Open();
            string query = "Insert into FYPGroupAssignedToPanel Values (@groupID, @panelID)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@groupID", gID);
            cmd.Parameters.AddWithValue("@panelID", pID);
            int found = cmd.ExecuteNonQuery();

            if(found > 0)
            {
                connection.Close();
                updateGroupAvailabilityForPanel(gID);
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }

        public void updateGroupAvailabilityForPanel(string gID)
        {
            connection.Open();
            string query = "Update FYPGroup set IsAssignedToPanel=1 where Group_ID=@gid";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            sqlCommand.Parameters.AddWithValue("@gid", gID);
            int found2 = sqlCommand.ExecuteNonQuery();

            connection.Close();
            return;
        }

        public bool createEvaluationDeadline(string ID, string Title, string Deadline, string Type)
        {
            connection.Open();
            List<string> panelIDs = new List<string>();
            string query = "INSERT INTO EvaluationDeadline(Deadline_ID,Deadline_Title,Deadline,Deadline_Type) VALUES(@id,@title,@deadline,@type);";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@title", Title);
            cmd.Parameters.AddWithValue("@deadline", Deadline);
            cmd.Parameters.AddWithValue("@type", Type);
            int found = cmd.ExecuteNonQuery();


            if (found > 0)
            {
                string queryForPanels = "SELECT Panel_ID FROM Panel;";
                SqlCommand cmdPanels = new SqlCommand(queryForPanels, connection);
                int found2 = 0;
                SqlDataReader dataReader = cmdPanels.ExecuteReader();
                while (dataReader.Read())
                {
                    string id = dataReader["Panel_ID"].ToString();
                    if (id == "")
                    {
                        dataReader.Close();
                        connection.Close();
                        return false;
                    }
                    panelIDs.Add(id);
                }
                dataReader.Close();
                foreach (string panelID in panelIDs)
                {
                    SqlCommand command = new SqlCommand("INSERT INTO PanelHasDeadline(panel_ID,deadline_ID,deadline_title,due_date,status) VALUES(@pnl_id,@id,@dtitle,@ddate,@status);", connection);
                    command.Parameters.AddWithValue("@pnl_id", panelID);
                    command.Parameters.AddWithValue("@id", ID);
                    command.Parameters.AddWithValue("@dtitle", Title);
                    command.Parameters.AddWithValue("@ddate", Deadline);
                    command.Parameters.AddWithValue("@status", "0");
                    found2 += command.ExecuteNonQuery();
                    command.Parameters.Clear();
                }

                if (found2 > 0)
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
            else
            {
                connection.Close();
                return false;
            }
        }

        public bool createAssesmentDeadline(string ID, string Title, string Deadline, int Marks, string Type)
        {
            connection.Open();
            List<string> groupIDs = new List<string>();
            string query = "INSERT INTO Assesment(Assesment_ID,Assesment_Title,Deadline,Assesment_Marks,Assesment_Type) VALUES(@id,@title,@deadline,@marks,@type);";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@title", Title);
            cmd.Parameters.AddWithValue("@deadline", Deadline);
            cmd.Parameters.AddWithValue("@marks", Marks);
            cmd.Parameters.AddWithValue("@type", Type);
            int found = cmd.ExecuteNonQuery();

            if (found > 0)
            {
                string queryForGroups = "SELECT Group_ID FROM FYPGroup;";
                SqlCommand cmdGroups = new SqlCommand(queryForGroups, connection);
                int found2 = 0;
                SqlDataReader dataReader = cmdGroups.ExecuteReader();
                while (dataReader.Read())
                {
                    string id = dataReader["Group_ID"].ToString();
                    if (id == "")
                    {
                        dataReader.Close();
                        connection.Close();
                        return false;
                    }
                    groupIDs.Add(id);
                }
                dataReader.Close();
                foreach (string groupID in groupIDs)
                {
                    SqlCommand command = new SqlCommand("INSERT INTO GroupHasAssesment(group_ID,assesment_ID,assesment_title,due_date,status) VALUES(@grp_id,@id,@atitle,@adate,@status);", connection);
                    command.Parameters.AddWithValue("@grp_id", groupID);
                    command.Parameters.AddWithValue("@id", ID);
                    command.Parameters.AddWithValue("@atitle", Title);
                    command.Parameters.AddWithValue("@adate", Deadline);
                    command.Parameters.AddWithValue("@status", "0");
                    found2 += command.ExecuteNonQuery();
                    command.Parameters.Clear();
                }

                if (found2 > 0)
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
            else
            {
                connection.Close();
                return false;
            }
        }

    }
}