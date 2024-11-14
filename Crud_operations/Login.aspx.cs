using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Crud_operations
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RegisterButton.Visible = true;
                lblErrorMessage.Visible = false; // Hide the error message label initially
                btnForgotPassword.Visible = false; // Hide the "Forgot Password" button initially
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
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
                    lblErrorMessage.Text = "Invalid username or password! If you have forgotten your password, please click the 'Forgot Password?' button. If you are a new user, please click 'Register here'."; lblErrorMessage.Visible = true;

                    // Show the registration button
                    RegisterButton.Visible = true;
                    btnForgotPassword.Visible=true;
                }
            }
            catch (SqlException sqlEx)
            {
                lblErrorMessage.Text = "A database error occurred: " + sqlEx.Message;
                lblErrorMessage.Visible = true;
            }
            catch (Exception ex)
            {
                
                lblErrorMessage.Text = "An error occurred: " + ex.Message;
                lblErrorMessage.Visible = true;
            }
            finally
            {
                
                ClearFields();
            }
        }

        private bool ValidateCredentials(string username, string password)
        {
            string connectionString = "data source=CHAKRI_HP; initial catalog=msmavas; user id=Chakradhar; password=Chakradhar";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM UserMaster4_New WHERE Username = @Username AND Password = @Password";
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
                    catch (SqlException sqlEx)
                    {
                        // Handle SQL-specific errors
                        lblErrorMessage.Text = "A database error occurred while validating credentials: " + sqlEx.Message;
                        lblErrorMessage.Visible = true;
                        return false;
                    }
                    catch (Exception ex)
                    {
                        // Handle general errors
                        lblErrorMessage.Text = "An error occurred while validating credentials: " + ex.Message;
                        lblErrorMessage.Visible = true;
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

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            // Redirect to the password recovery page (not yet implemented)
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}
