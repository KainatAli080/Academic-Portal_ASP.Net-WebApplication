using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace SE_Project1.Services
{
    public class DatabaseConnection
    {
        private string connectionString;
        private SqlConnection connection;

        public DatabaseConnection()
        {
            connectionString = "Data Source=LAPTOP-528IH7DG\\SQLEXPRESS;Initial Catalog=SE_Project;Integrated Security=True;Encrypt=False";
            connection = new SqlConnection(connectionString);
        }

        public void setConnectionString(string c)
        {
            connectionString = c;
        }

        public string getConnectionString()
        {
            return connectionString;
        }

        public void setConnection(SqlConnection c)
        {
            connection = c;
        }

        public SqlConnection GetConnection()
        {
            return connection;
        }

    }
}