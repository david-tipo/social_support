<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:SqlDataSource ID="catrgories" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\MainDatabase.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
    <form id="form1" runat="server" >
    <div>
        <asp:DropDownList ID="DropDownList1" DataSourceID="catrgories" runat="server" DataTextField="name" DataValueField="id"></asp:DropDownList>
        <br />
        כותרת:
        <asp:TextBox ID="title" runat="server"></asp:TextBox>
        <br />
        תיאור הקושי:
         <asp:TextBox ID="body" runat="server"></asp:TextBox> <br />
        <asp:Button ID="submit" runat="server" Text="הוספת שאלה" OnClick="submit_Click" />
    </div>
    </form>
    
</body>
</html>
