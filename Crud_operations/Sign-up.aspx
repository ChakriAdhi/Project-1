<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign-up.aspx.cs" Inherits="Crud_operations.Sign_up" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
<style>
        body {
            background-image: url('/images/background_3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .container {
            background: rgba(255, 255, 255, 0.95); /* Increased opacity for a cleaner look */
            padding: 40px; /* Increased padding for more space */
            border-radius: 15px; /* Slightly more rounded corners */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Softer shadow */
            width: 100%;
            max-width: 420px; /* Slightly wider for better alignment */
            box-sizing: border-box;
        }

        .text-center {
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: bold;
            color: #444; /* Darker shade for contrast */
        }

        .form-group {
            margin-bottom: 5px; /* Increased margin for more spacing */
        }

        .form-control {
            width: 100%;
            padding: -5px; /* More padding for a spacious input */
            margin-top: 8px;
            border: 1px solid #ccc; /* Lighter border for inputs */
            border-radius: -8px; /* Rounded corners for inputs */
            font-size: 14px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1); /* Inner shadow for depth */
            transition: border-color 0.3s ease; /* Smooth transition on focus */
        }

        .form-control:focus {
            border-color: #007bff; /* Blue border on focus */
            outline: none; /* Remove default outline */
        }

        .btn-block {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 10px; /* Rounded corners for buttons */
            background-color: #007bff;
            color: white;
            font-size: 10px;
            cursor: pointer;
            margin-top: -18px; /* Increased margin for spacing */
            transition: background-color 0.3s ease; /* Smooth hover transition */
        }

        .btn-block:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .error {
            color: red;
            font-size: 13px; /* Slightly larger error text */
            margin-top: 5px;
        }

        .feedback-label {
            color: green;
            font-weight: bold;
            margin-top: 15px; /* Increased margin for spacing */
        }

        .required {
            color: red; /* Red asterisk for required fields */
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2 class="text-center">Register</h2>
            <form id="registrationForm" runat="server">
                <div class="form-group">
                    <label for="txtFirstName">First Name<span class="required">*</span></label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvFirstName" 
                        runat="server" 
                        ControlToValidate="txtFirstName" 
                        ErrorMessage="First Name is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revFirstName" 
                        runat="server" 
                        ControlToValidate="txtFirstName" 
                        ValidationExpression="^[a-zA-Z\s\-]+$" 
                        ErrorMessage="First name can only contain letters, spaces, and hyphens" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtMiddleName">Middle Name</label>
                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" placeholder="Enter middle name (optional)"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtLastName">Last Name<span class="required">*</span></label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvLastName" 
                        runat="server" 
                        ControlToValidate="txtLastName" 
                        ErrorMessage="Last Name is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revLastName" 
                        runat="server" 
                        ControlToValidate="txtLastName" 
                        ValidationExpression="^[a-zA-Z\s\-]+$" 
                        ErrorMessage="Last name can only contain letters, spaces, and hyphens" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtUsername">Username<span class="required">*</span></label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvUsername" 
                        runat="server" 
                        ControlToValidate="txtUsername" 
                        ErrorMessage="Username is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revUsername" 
                        runat="server" 
                        ControlToValidate="txtUsername" 
                        ValidationExpression="^[a-zA-Z0-9_]{5,15}$" 
                        ErrorMessage="Username must be 5-15 characters long and can contain letters, numbers, and underscores" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password<span class="required">*</span></label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$" 
                        ErrorMessage="Password must be 8-20 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtConfirmPassword">Confirm Password<span class="required">*</span></label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm your password"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvConfirmPassword" 
                        runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ErrorMessage="Confirm Password is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:CompareValidator 
                        ID="cvPassword" 
                        runat="server" 
                        ControlToCompare="txtPassword" 
                        ControlToValidate="txtConfirmPassword" 
                        ErrorMessage="Passwords do not match" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="ddlCountry">Country<span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Country" Value="" />
                        <asp:ListItem Text="India" Value="+91"></asp:ListItem>
                        <asp:ListItem Text="USA" Value="USA" />
                        <asp:ListItem Text="Canada" Value="Canada" />
                        <asp:ListItem Text="Afghanistan" Value="+93"></asp:ListItem>
                        <asp:ListItem Text="Australia" Value="+61"></asp:ListItem>
                        <asp:ListItem Text="China" Value="+86"></asp:ListItem>
                        <asp:ListItem Text="Germany" Value="+49"></asp:ListItem>
                        <asp:ListItem Text="Russia" Value="+7"></asp:ListItem>
                        <asp:ListItem Text="United Kingdom" Value="+44"></asp:ListItem>
                        <asp:ListItem Text="United States" Value="+1"></asp:ListItem>
                        <asp:ListItem Text="Japan" Value="+81"></asp:ListItem>
                        <asp:ListItem Text="Mexico" Value="+52"></asp:ListItem>
                        <asp:ListItem Text="Brazil" Value="+55"></asp:ListItem>
                        <asp:ListItem Text="Nigeria" Value="+234"></asp:ListItem>
                        <asp:ListItem Text="France" Value="+33"></asp:ListItem>
                        <asp:ListItem Text="South Africa" Value="+27"></asp:ListItem>
                        <asp:ListItem Text="South Korea" Value="+82"></asp:ListItem>
                        <asp:ListItem Text="Egypt" Value="+20"></asp:ListItem>
                        <asp:ListItem Text="Argentina" Value="+54"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="rfvCountry" 
                        runat="server" 
                        ControlToValidate="ddlCountry" 
                        InitialValue="" 
                        ErrorMessage="Please select a country" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtContactNo">Contact Number<span class="required">*</span></label>
                    <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" placeholder="Enter contact number"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvContactNo" 
                        runat="server" 
                        ControlToValidate="txtContactNo" 
                        ErrorMessage="Contact number is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revContactNo" 
                        runat="server" 
                        ControlToValidate="txtContactNo" 
                        ValidationExpression="^\+\d{1,3}\d{6,12}$" 
                        ErrorMessage="Contact number must include a country code and be 6-12 digits long" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email Address<span class="required">*</span></label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email address"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" 
                        ErrorMessage="Please enter a valid email address" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="ddlSecurityQuestion">Security Question<span class="required">*</span></label>
                    <asp:DropDownList ID="ddlSecurityQuestion" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select a security question" Value="" />
                        <asp:ListItem Text="What is your pet's name?" Value="pet_name" />
                        <asp:ListItem Text="What is your mother's maiden name?" Value="mother_maiden" />
                        <asp:ListItem Text="What was the name of your first school?" Value="first_school" />
                        <asp:ListItem Text="What is your favorite book?" Value="favorite_book" />
                        <asp:ListItem Text="What is your favorite movie?" Value="favorite_movie" />
                        <asp:ListItem Text="What is your favorite color?" Value="favorite_color" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="rfvSecurityQuestion" 
                        runat="server" 
                        ControlToValidate="ddlSecurityQuestion" 
                        InitialValue="" 
                        ErrorMessage="Please select a security question" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="txtSecurityAnswer">Security Answer<span class="required">*</span></label>
                    <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="form-control" placeholder="Enter security answer"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvSecurityAnswer" 
                        runat="server" 
                        ControlToValidate="txtSecurityAnswer" 
                        ErrorMessage="Security answer is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>

                <asp:Label ID="lblFeedback" runat="server" CssClass="feedback-label"></asp:Label>

                <div class="form-group">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-block" OnClick="btnRegister_Click" ValidationGroup="RegisterGroup" />
<asp:Button ID="btnViewData" runat="server" CssClass="btn-block btn-secondary" Text="View Data" OnClick="btnViewData_Click" ValidationGroup="ViewDataGroup" />                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var countryDropdown = document.getElementById('<%= ddlCountry.ClientID %>');
            var contactNoInput = document.getElementById('<%= txtContactNo.ClientID %>');

            countryDropdown.addEventListener("change", function () {
                var countryCode = countryDropdown.options[countryDropdown.selectedIndex].value;
                // Set the country code as a prefix in the contact number input
                if (countryCode) {
                    contactNoInput.value = countryCode + " "; // Set country code with a space
                    contactNoInput.focus(); // Focus on the input field
                }
            });
        });
    </script>
</body>
</html>
