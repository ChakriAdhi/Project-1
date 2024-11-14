<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Crud_operations.ResetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <style>
        body {
            background-image: url('/images/gol.jpg');
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

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .text-danger {
            color: #dc3545;
            font-size: 0.875em;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Reset Password</h2>

            <!-- Panel for Forgot Password -->
            <asp:Panel ID="pnlPassword" runat="server">
                <div class="form-group">
                    <label for="NewPassword">New Password</label>
                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter new password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewPasswordValidator" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="NewPasswordRegexValidator" runat="server" ControlToValidate="NewPassword" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$" ErrorMessage="Password must be 8-20 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="ConfirmPassword">Confirm Password</label>
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm new password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordValidator" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Please confirm your password" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="ComparePasswordValidator" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword" ErrorMessage="Passwords do not match" CssClass="text-danger"></asp:CompareValidator>
                </div>
                <asp:Button ID="btnSave" runat="server" CssClass="btn-primary" Text="Save Changes" OnClick="btnSave_Click" />
            </asp:Panel>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
