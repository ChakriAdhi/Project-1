using System;
using System.Data.SqlClient;

namespace Crud_operations
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlPassword.Visible = true; // Always show the password reset panel
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string newPassword = NewPassword.Text.Trim();
                string username = Request.QueryString["username"]; // Username should be passed in query string

                if (string.IsNullOrEmpty(newPassword))
                {
                    lblMessage.Text = "New Password is required.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                    return;
                }

                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "UPDATE UserMaster4_New SET Password=@Password WHERE UserName=@UserName";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Password", newPassword);
                        cmd.Parameters.AddWithValue("@UserName", username);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Password has been successfully updated.";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "No user found with the provided username.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        lblMessage.Visible = true;
                    }
                }
                catch (SqlException sqlEx)
                {
                    lblMessage.Text = "A database error occurred while updating your password. Please try again later.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred while processing your request. Please try again later.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
