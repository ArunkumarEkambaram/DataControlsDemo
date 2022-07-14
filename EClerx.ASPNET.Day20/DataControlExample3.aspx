<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample3.aspx.cs" Inherits="EClerx.ASPNET.Day20.DataControlExample3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridEmployee" AutoGenerateColumns="false" runat="server" AllowPaging="True" OnPageIndexChanging="GridEmployee_PageIndexChanging" PageSize="5"
                OnRowEditing="GridEmployee_RowEditing" OnRowUpdating="GridEmployee_RowUpdating" OnRowCancelingEdit="GridEmployee_RowCancelingEdit">                
                <Columns>
                    <asp:TemplateField HeaderText="Employee Code">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("cEmployeeCode") %>' ID="lblEmpCode" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("vFirstName") %>' ID="lblFirstName" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFirstName" runat="server" Text='<%#Bind("vFirstName") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("cCity") %>' ID="lblCity" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtCity" Text='<%#Bind("cCity") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action(s)">
                        <ItemTemplate>
                            <asp:Button Text="Edit" ID="BtnEdit" runat="server" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button Text="Update" ID="BtnUpdate" runat="server" CommandName="Update" />
                            <asp:Button Text="Cancel" ID="BtnCancel" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
