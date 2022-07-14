<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample2.aspx.cs" Inherits="EClerx.ASPNET.Day20.DataControlExample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table, tr, th, td {
            padding: 5px;
        }

        .font14 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <lable class="font14">Select a City </lable>
                        <asp:DropDownList CssClass="font14" ID="DdlCity" runat="server"></asp:DropDownList>
                        <asp:Button CssClass="font14" Text="Get Data" ID="btnGetData" runat="server" OnClick="btnGetData_Click" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridEmployee" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
