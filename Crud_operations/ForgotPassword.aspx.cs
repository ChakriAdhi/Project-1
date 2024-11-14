using System;
using System.Data.SqlClient;

namespace Crud_operations
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private string connectionString = "data source=CHAKRI_HP;initial catalog=msmavas;user id=Chakradhar;password=Chakradhar";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlUsername.Visible = false;
                pnlPassword.Visible = false;
                lblMessage.Visible = false;
            }
        }

        protected void ddlRecoveryOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlRecoveryOption.SelectedValue == "Username")
                {
                    pnlUsername.Visible = true;
                    pnlPassword.Visible = false;
                }
                else if (ddlRecoveryOption.SelectedValue == "Password")
                {
                    pnlUsername.Visible = false;
                    pnlPassword.Visible = true;
                }
                else
                {
                    pnlUsername.Visible = false;
                    pnlPassword.Visible = false;
                }

                lblMessage.Visible = false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred while processing your request. Please try again later.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        protected void btnRetrieveUsername_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string securityAnswer = txtSecurityAnswer.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(securityAnswer))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT UserName FROM UserMaster4_New WHERE Email=@Email AND SecurityAnswer=@SecurityAnswer";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@SecurityAnswer", securityAnswer);

                    conn.Open();
                    object username = cmd.ExecuteScalar();

                    if (username != null)
                    {
                        lblMessage.Text = $"Your username is: {username.ToString()}";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "No user found with the provided information.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    lblMessage.Visible = true;
                }
            }
            catch (SqlException sqlEx)
            {
                lblMessage.Text = "A database error occurred while retrieving your username. Please try again later.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred while retrieving your username. Please try again later.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string username = txtPasswordUserName.Text.Trim();
            string securityAnswer = txtPasswordSecurityAnswer.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(securityAnswer))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(1) FROM UserMaster4_New WHERE UserName=@UserName AND SecurityAnswer=@SecurityAnswer";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@SecurityAnswer", securityAnswer);

                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        lblMessage.Text = "Security answer is correct. You can now reset your password.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Visible = true;

                        // Redirect to a new page to reset the password or provide UI to enter a new password
                        Response.Redirect("ResetPassword.aspx?username=" + username);
                    }
                    else
                    {
                        lblMessage.Text = "Incorrect security answer.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                lblMessage.Text = "A database error occurred while processing your request. Please try again later.";
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
