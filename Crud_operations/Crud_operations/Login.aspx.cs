using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Crud_operations
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure the registration button is hidden initially
            if (!IsPostBack)
            {
                RegisterButton.Visible = true;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text.Trim();
            string password = Password.Text.Trim();

            try
            {
                if (ValidateCredentials(username, password))
                {
                    // Redirect to the main page after successful login
                    Response.Redirect("Sample.aspx");
                }
                else
                {
                    // Show error message and activate the registration button
                    ErrorMessage.Text = "Invalid username or password! If you are a new user, please register.";
                    ErrorMessage.Visible = true;

                    // Show the registration button
                    RegisterButton.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Handle any unexpected errors
                ErrorMessage.Text = "An error occurred: " + ex.Message;
                ErrorMessage.Visible = true;
            }
            finally
            {
                // Clear the input fields regardless of the outcome
                ClearFields();
            }
        }

        private bool ValidateCredentials(string username, string password)
        {
            string connectionString = "data source=CHAKRI_HP; initial catalog=msmavas; user id=Chakradhar; password=Chakradhar";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM UserMaster4 WHERE Username = @Username AND Password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();
                        return count > 0;
                    }
                    catch (Exception ex)
                    {
                        // Handle any database-related errors
                        ErrorMessage.Text = "An error occurred while validating credentials: " + ex.Message;
                        ErrorMessage.Visible = true;
                        return false;
                    }
                }
            }
        }

        private void ClearFields()
        {
            Username.Text = string.Empty;
            Password.Text = string.Empty;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Redirect to the registration page
            Response.Redirect("Sign-up.aspx");
        }
    }
}
