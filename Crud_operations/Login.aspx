<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Crud_operations.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
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

        .text-center {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-block {
            width: 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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

        .btn-info {
            background-color: #17a2b8;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            display: block;
            width: 100%;
            margin-top: 10px;
            font-size: 16px;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            function disablePaste(e) {
                e.preventDefault();
            }

            var inputs = document.querySelectorAll('input[type="text"], input[type="password"]');
            inputs.forEach(function(input) {
                input.addEventListener('paste', disablePaste);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Login</h2>
            <asp:Panel ID="LoginPanel" runat="server">
                <div class="form-group">
                    <label for="Username">Username</label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Enter username" ValidationGroup="LoginGroup"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ControlToValidate="Username" ErrorMessage="Username is required" CssClass="text-danger" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="UsernameRegexValidator" runat="server" ControlToValidate="Username" ValidationExpression="^[a-zA-Z0-9_]{5,15}$" ErrorMessage="Username must be 5-15 characters long and can contain letters, numbers, and underscores" CssClass="text-danger" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" ValidationGroup="LoginGroup"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="Password" ErrorMessage="Password is required" CssClass="text-danger" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="PasswordRegexValidator" runat="server" ControlToValidate="Password" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$" ErrorMessage="Password must be 8-20 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character" CssClass="text-danger" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RegularExpressionValidator>
                </div>
                <asp:Button ID="btnLogin" runat="server" CssClass="btn-primary btn-block" Text="Login" OnClick="btnLogin_Click" ValidationGroup="LoginGroup" />
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="text-danger" Visible="false"></asp:Label>
                <asp:Button ID="btnForgotPassword" runat="server" CssClass="btn-info btn-block" Text="Forgot Password?" Visible="false" OnClick="btnForgotPassword_Click" />
                <div class="forgot-password">
                    <asp:Button ID="RegisterButton" runat="server" CssClass="btn-info btn-block" Text="Register here" OnClick="RegisterButton_Click" ValidationGroup="RegisterGroup" CausesValidation="false" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
