<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="Crud_operations.Sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Information Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            max-width: 400px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <h2>Car Information</h2>
        <div>
            <label for="make">Make:</label>
            <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="model">Model:</label>
            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="year">Year:</label>
            <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="vin">VIN:</label>
            <asp:TextBox ID="txtVIN" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="color">Color:</label>
            <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
        </div>
    </form>
</body>
</html>
