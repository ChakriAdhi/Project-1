s<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign-up.aspx.cs" Inherits="Crud_operations.Sign_up" %>

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
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        .form-container {
            width: 100%;
        }

        .text-center {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn-block {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-block:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .feedback-label {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2 class="text-center">Register</h2>
            <form id="registrationForm" runat="server">
                <div class="form-group">
                    <label for="txtFirstName">First Name</label>
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
                    <label for="txtLastName">Last Name</label>
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
                    <label for="txtUsername">Username</label>
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
                    <label for="txtPassword">Password</label>
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
                    <label for="txtConfirmPassword">Confirm Password</label>
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
                    <label for="txtContactNo">Contact No</label>
                    <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" placeholder="Enter contact number"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rfvContactNo" 
                        runat="server" 
                        ControlToValidate="txtContactNo" 
                        ErrorMessage="Contact No is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                    <asp:RegularExpressionValidator 
                        ID="revContactNo" 
                        runat="server" 
                        ControlToValidate="txtContactNo" 
                        ValidationExpression="^(\+91\s?|91\s?)\d{10}$|^(\+1\s?|1\s?)\d{10}$" 
                        ErrorMessage="Please enter a valid 10-digit contact number with country code (+91 for India or +1 for USA)" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email"></asp:TextBox>
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
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"  
                        ErrorMessage="Please enter a valid email address" 
                        CssClass="error" 
                        Display="Dynamic" 
                        ValidationGroup="RegisterGroup" />
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="btnRegister" runat="server" CssClass="btn-block" Text="Register" OnClick="btnRegister_Click" ValidationGroup="RegisterGroup" />
                    <asp:Button ID="btnViewData" runat="server" CssClass="btn-block btn-secondary" Text="View Data" OnClick="btnViewData_Click" ValidationGroup="ViewDataGroup" />
                </div>
                <asp:Label ID="lblFeedback" runat="server" CssClass="feedback-label"></asp:Label>
            </form>
        </div>
    </div>
</body>
</html>
