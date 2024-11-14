using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_operations
{
    public partial class Sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string contactNo = txtContactNo.Text.Trim();
            string email = txtEmail.Text.Trim();

            // Validate passwords match
            if (password != confirmPassword)
            {
                lblFeedback.Text = "Passwords do not match.";
                lblFeedback.ForeColor = System.Drawing.Color.Red;
                lblFeedback.Visible = true;
                return;
            }

            try
            {
                // Call method to register the user
                if (RegisterUser(firstName, lastName, username, password, contactNo, email))
                {
                    lblFeedback.Text = "Registration successful. You can now log in.";
                    lblFeedback.ForeColor = System.Drawing.Color.Green;
                    lblFeedback.Visible = true;

                    // Clear fields after successful registration
                    ClearFields();

                    // Redirect to the login page
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblFeedback.Text = "Registration failed. Please try again.";
                    lblFeedback.ForeColor = System.Drawing.Color.Red;
                    lblFeedback.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Handle unexpected errors
                lblFeedback.Text = "An error occurred: " + ex.Message;
                lblFeedback.ForeColor = System.Drawing.Color.Red;
                lblFeedback.Visible = true;
            }

        }
        private bool RegisterUser(string firstName, string lastName, string username, string password, string contactNo, string email)
        {
            string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO UserMaster4 (FirstName, LastName, UserName, Password, ContactNo, Email) VALUES (@FirstName, @LastName, @UserName, @Password, @ContactNo, @Email)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@ContactNo", contactNo);
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    return result > 0;
                }
                catch (Exception ex)
                {
                    // Log exception here if needed
                    lblFeedback.Text = "An error occurred while registering the user: " + ex.Message;
                    lblFeedback.ForeColor = System.Drawing.Color.Red;
                    lblFeedback.Visible = true;
                    return false;
                }
            }
        }

        private void ClearFields()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }

        protected void btnViewData_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewData.aspx");
        }
    }
}