using System;
using System.Data.SqlClient;
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
            string middleName = txtMiddleName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string countryCode = ddlCountry.SelectedValue;
            string contactNo = txtContactNo.Text.Trim();
            string email = txtEmail.Text.Trim();
            string securityQuestion = ddlSecurityQuestion.SelectedValue;
            string securityAnswer = txtSecurityAnswer.Text.Trim();

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
                if (RegisterUser(firstName, middleName, lastName, username, password, contactNo, email, securityQuestion, securityAnswer))
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

        private bool RegisterUser(string firstName, string middleName, string lastName, string username, string password, string contactNo, string email, string securityQuestion, string securityAnswer)
        {
            string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = @"INSERT INTO UserMaster4_New 
                                     (FirstName, MiddleName, LastName, UserName, Password, ContactNo, Email, SecurityQuestion, SecurityAnswer) 
                                     VALUES 
                                     (@FirstName, @MiddleName, @LastName, @UserName, @Password, @ContactNo, @Email, @SecurityQuestion, @SecurityAnswer)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@MiddleName", middleName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@ContactNo", contactNo);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@SecurityQuestion", securityQuestion);
                    command.Parameters.AddWithValue("@SecurityAnswer", securityAnswer);

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
            txtMiddleName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            ddlCountry.SelectedIndex = 0;
            txtContactNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlSecurityQuestion.SelectedIndex = 0;
            txtSecurityAnswer.Text = string.Empty;
        }

        protected void btnViewData_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewData.aspx");
        }
    }
}
