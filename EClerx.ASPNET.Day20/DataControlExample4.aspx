<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample4.aspx.cs" Inherits="EClerx.ASPNET.Day20.DataControlExample4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DataList Example</title>
    <style>
        /*Element Selector*/
        img {
            width: 200px;
            height: 200px;
        }

        /*Class Selector*/
        .table {
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="Both">
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Image ID="ImgProduct" runat="server" ImageUrl='<%#Eval("ImagePath") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text='<%#Eval("ProductName") %>' ID="LblProductName" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text='<%#Eval("Price","{0:c}") %>' ID="LblPrice" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button Text="Add to Cart" ID="BtnAdd" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <hr />
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table border="1" style="padding: 15px">
                        <tr>
                            <th>Product Name
                            </th>
                            <th>Description
                            </th>
                            <th>Price
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label Text='<%#Eval("ProductName") %>' runat="server" />
                        </td>
                        <td>
                            <asp:Label Text='<%#Eval("Description") %>' runat="server" />
                        </td>
                        <td>
                            <asp:Label Text='<%#Eval("Price") %>' runat="server" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </form>
</body>
</html>
