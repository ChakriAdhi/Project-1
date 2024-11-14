using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Crud_operations
{
    public partial class ViewData : System.Web.UI.Page
    {
        string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM UserMaster4", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle exception (log it, show a message to the user, etc.)
                Response.Write("An error occurred: " + ex.Message);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write("An error occurred while editing: " + ex.Message);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string firstName = (row.Cells[1].Controls[0] as TextBox).Text;
                string lastName = (row.Cells[2].Controls[0] as TextBox).Text;
                string userName = (row.Cells[3].Controls[0] as TextBox).Text;
                string password = (row.Cells[4].Controls[0] as TextBox).Text;
                string contactNo = (row.Cells[5].Controls[0] as TextBox).Text;
                string email = (row.Cells[6].Controls[0] as TextBox).Text;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE UserMaster4 SET FirstName=@FirstName, LastName=@LastName, UserName=@UserName, Password=@Password, ContactNo=@ContactNo, Email=@Email WHERE Id=@Id", con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@ContactNo", contactNo);
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                GridView1.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write("An error occurred while updating: " + ex.Message);
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write("An error occurred while canceling edit: " + ex.Message);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM UserMaster4 WHERE Id=@Id", con);
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                BindGrid();
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write("An error occurred while deleting: " + ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Add logic if needed
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    }
}
