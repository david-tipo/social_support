<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Defualt.aspx.cs" Inherits="Defualt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .question-block {
            border: 3px solid blue;
            border-radius: 4px 4px;
            height: 105px;
            width: 295px;
            padding-top: 10px;
            padding-left: 10px;
            padding-right: 10px;
            align-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\MainDatabase.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
    <div class="question-block">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <%#Eval("title") %>
       <br />
      
            <%#Eval("body") %>
       
      <br />
            <%#Eval("upload_date") %>
         </ItemTemplate>
    
    </asp:DataList>
     </div>
</body>
</html>
