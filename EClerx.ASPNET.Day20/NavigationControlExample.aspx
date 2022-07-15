<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NavigationControlExample.aspx.cs" Inherits="EClerx.ASPNET.Day20.NavigationControlExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="TreeView1" runat="server">
                <Nodes>
                    <asp:TreeNode Text="Home" Value="Home">
                        <asp:TreeNode Text="Electronics" Value="Electronics">
                            <asp:TreeNode NavigateUrl="~/Television.aspx" Text="Television" Value="Television"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/MobilePhone.aspx" Text="MobilePhone" Value="MobilePhone"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/SmartWatch.aspx" Text="Smart Watch" Value="Smart Watch"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Home &amp; Office" Value="Home &amp; Office">
                            <asp:TreeNode NavigateUrl="~/Pen.aspx" Text="Pen" Value="Pen"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Fans.aspx" Text="Fan" Value="Fan"></asp:TreeNode>
                        </asp:TreeNode>
                    </asp:TreeNode>
                </Nodes>
            </asp:TreeView>
        </div>
    </form>
</body>
</html>
