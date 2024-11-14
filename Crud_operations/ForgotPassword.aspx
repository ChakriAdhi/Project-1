<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Crud_operations.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            background-image: url('/images/background.jpg');
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

        .text-success {
            color: #28a745;
            font-size: 0.875em;
            display: block;
            margin-top: 10px;
        }

        .form-title {
            text-align: center;
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="form-title">Forgot Password</h2>
            <div class="form-group">
                <label for="ddlRecoveryOption">Select an option</label>
                <asp:DropDownList ID="ddlRecoveryOption" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlRecoveryOption_SelectedIndexChanged">
                    <asp:ListItem Text="Select an option" Value="" />
                    <asp:ListItem Text="Forgot Username" Value="Username" />
                    <asp:ListItem Text="Forgot Password" Value="Password" />
                </asp:DropDownList>
            </div>

            <!-- Panel for retrieving Username -->
            <asp:Panel ID="pnlUsername" runat="server">
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSecurityAnswer">Security Answer</label>
                    <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="form-control" placeholder="Enter your security answer"></asp:TextBox>
                </div>
                <asp:Button ID="btnRetrieveUsername" runat="server" CssClass="btn-primary" Text="Retrieve Username" OnClick="btnRetrieveUsername_Click" />
            </asp:Panel>

            <!-- Panel for resetting Password -->
            <asp:Panel ID="pnlPassword" runat="server">
                <div class="form-group">
                    <label for="txtPasswordUserName">Username</label>
                    <asp:TextBox ID="txtPasswordUserName" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPasswordSecurityAnswer">Security Answer</label>
                    <asp:TextBox ID="txtPasswordSecurityAnswer" runat="server" CssClass="form-control" placeholder="Enter your security answer"></asp:TextBox>
                </div>
                <asp:Button ID="btnResetPassword" runat="server" CssClass="btn-primary" Text="Reset Password" OnClick="btnResetPassword_Click" />
            </asp:Panel>

            <!-- Label to display messages -->
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        </div>
    </form>
</body>
</html>
