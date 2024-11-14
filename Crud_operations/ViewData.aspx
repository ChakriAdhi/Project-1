<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewData.aspx.cs" Inherits="Crud_operations.ViewData" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Data</title>
    <style>
      * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #eaeaea;
    color: #333;
    line-height: 1.6;
    padding: 20px;
}

.container {
    width: 80%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden; /* Ensures content doesn't overflow */
}

h1 {
    font-size: 28px;
    color: #333;
    margin-bottom: 20px;
    border-bottom: 2px solid #0078d4;
    padding-bottom: 10px;
}

.gridview-container {
    overflow-x: auto; /* Enable horizontal scrolling */
}

.gridview {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    min-width: 1000px; /* Ensures table is wide enough for all columns */
}

.gridview th, .gridview td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: left;
    word-wrap: break-word; /* Ensures long text wraps properly */
}

.gridview th {
    background-color: #f0f0f0;
    color: #333;
    font-weight: bold;
}

.gridview tr:nth-child(even) {
    background-color: #f9f9f9;
}

.gridview tr:hover {
    background-color: #f0f0f0;
}

.gridview .edit-button, .gridview .delete-button {
    border: none;
    padding: 6px 12px;
    color: #fff;
    cursor: pointer;
    border-radius: 4px;
    font-size: 14px;
}

.gridview .edit-button {
    background-color: #0056a0; /* Darker blue for a professional look */
    color: #ffffff; /* White text for contrast */
    border: 1px solid #004494; /* Darker border to match */
}

.gridview .edit-button:hover {
    background-color: #003d7a; /* Even darker blue on hover */
    border-color: #002a5a; /* Darker border on hover */
}

.gridview .delete-button {
    background-color: #e74c3c; /* Slightly softer red for professionalism */
    color: #ffffff; /* White text for contrast */
    border: 1px solid #c0392b; /* Darker red border to match */
}

.gridview .delete-button:hover {
    background-color: #c0392b; /* Darker red on hover */
    border-color: #a93226; /* Even darker red border on hover */
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>View Registered Data</h1>
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" CssClass="gridview" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="UserName" HeaderText="Username" />
                        <asp:BoundField DataField="Password" HeaderText="Password" />
                        <asp:BoundField DataField="ContactNo" HeaderText="Contact No" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="SecurityQuestion" HeaderText="Security Question" />
                        <asp:BoundField DataField="SecurityAnswer" HeaderText="Security Answer" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="delete-button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
