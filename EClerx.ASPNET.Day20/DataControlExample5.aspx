<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample5.aspx.cs" Inherits="EClerx.ASPNET.Day20.DataControlExample5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetProducts" TypeName="DAL.ProductDetails"></asp:ObjectDataSource>
            <asp:GridView ID="GridProducts" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" PageSize="5"></asp:GridView>
        </div>
    </form>
</body>
</html>
