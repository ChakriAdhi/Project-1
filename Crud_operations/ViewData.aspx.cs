using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Crud_operations
{
    public partial class ViewData : System.Web.UI.Page
    {
        // Connection string to the SQL Server database
        string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid(); // Bind the GridView with data on initial page load
            }
        }

        private void BindGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM UserMaster4_New WHERE is_active = 1", con); // Fetch data from UserMaster4_New table
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt; // Set the GridView data source
                    GridView1.DataBind(); // Bind the data to the GridView
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during data binding
                Response.Write("An error occurred: " + ex.Message);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex; // Set the row to edit mode
                BindGrid(); // Re-bind the GridView to display the data in edit mode
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during row editing
                Response.Write("An error occurred while editing: " + ex.Message);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex]; // Get the row being updated
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]); // Get the ID of the row
                string firstName = (row.Cells[1].Controls[0] as TextBox).Text;
                string middleName = (row.Cells[2].Controls[0] as TextBox).Text;
                string lastName = (row.Cells[3].Controls[0] as TextBox).Text;
                string userName = (row.Cells[4].Controls[0] as TextBox).Text;
                string password = (row.Cells[5].Controls[0] as TextBox).Text;
                string contactNo = (row.Cells[6].Controls[0] as TextBox).Text;
                string email = (row.Cells[7].Controls[0] as TextBox).Text;
                string securityQuestion = (row.Cells[8].Controls[0] as TextBox).Text;
                string securityAnswer = (row.Cells[9].Controls[0] as TextBox).Text;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE UserMaster4_New SET FirstName=@FirstName, MiddleName=@MiddleName, LastName=@LastName, UserName=@UserName, Password=@Password, ContactNo=@ContactNo, Email=@Email, SecurityQuestion=@SecurityQuestion, SecurityAnswer=@SecurityAnswer WHERE Id=@Id", con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@MiddleName", middleName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@ContactNo", contactNo);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@SecurityQuestion", securityQuestion);
                    cmd.Parameters.AddWithValue("@SecurityAnswer", securityAnswer);

                    con.Open(); // Open the database connection
                    cmd.ExecuteNonQuery(); // Execute the update query
                    con.Close(); // Close the connection
                }

                GridView1.EditIndex = -1; // Exit edit mode
                BindGrid(); // Re-bind the GridView to show updated data
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during row updating
                Response.Write("An error occurred while updating: " + ex.Message);
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = -1; // Cancel the edit mode
                BindGrid(); // Re-bind the GridView to revert any changes
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while canceling edit: " + ex.Message);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]); // Get the ID of the row to delete

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE UserMaster4_New SET is_active = 0 WHERE Id=@Id", con); // Ensure you delete from the correct table
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open(); // Open the database connection
                    cmd.ExecuteNonQuery(); // Execute the delete query
                    con.Close(); // Close the connection
                }

                BindGrid(); // Re-bind the GridView to reflect the deletion
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during row deletion
                Response.Write("An error occurred while deleting: " + ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Implement any logic needed when a row is selected
            // Currently not utilized but can be customized if needed
        }
    }
}
