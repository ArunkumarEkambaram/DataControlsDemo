<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample.aspx.cs" Inherits="EClerx.ASPNET.Day20.DataControlExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT * FROM [Position]" 
                InsertCommand="Insert Position(cPositionCode, vDescription, iBudgetedStrength, iCurrentStrength, siYear)
values (@cPositionCode, @vDescription, @iBudgetedStrength, @iCurrentStrength, @siYear)" UpdateCommand="Update Position SET siYear=@siYear Where cPositionCode=@cPositionCode">
                <InsertParameters>
                    <asp:Parameter Name="cPositionCode" />
                    <asp:Parameter Name="vDescription" />
                    <asp:Parameter Name="iBudgetedStrength" />
                    <asp:Parameter Name="iCurrentStrength" />
                    <asp:Parameter Name="siYear" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="siYear" />
                    <asp:Parameter Name="cPositionCode" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridPosition" runat="server" AutoGenerateColumns="False" DataKeyNames="cPositionCode" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="cPositionCode" HeaderText="Position Code" ReadOnly="True" SortExpression="cPositionCode" />
                    <asp:BoundField DataField="vDescription" HeaderText="Description" SortExpression="vDescription" />
                    <asp:BoundField DataField="iBudgetedStrength" HeaderText="Budgeted Strength" />
                    <asp:BoundField DataField="siYear" HeaderText="Year"  />
                    <asp:BoundField DataField="iCurrentStrength" HeaderText="Current Strength" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
            </asp:GridView>
            <hr />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="cPositionCode" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    cPositionCode:
                    <asp:Label ID="cPositionCodeLabel1" runat="server" Text='<%# Eval("cPositionCode") %>' />
                    <br />
                    vDescription:
                    <asp:TextBox ID="vDescriptionTextBox" runat="server" Text='<%# Bind("vDescription") %>' />
                    <br />
                    iBudgetedStrength:
                    <asp:TextBox ID="iBudgetedStrengthTextBox" runat="server" Text='<%# Bind("iBudgetedStrength") %>' />
                    <br />
                    siYear:
                    <asp:TextBox ID="siYearTextBox" runat="server" Text='<%# Bind("siYear") %>' />
                    <br />
                    iCurrentStrength:
                    <asp:TextBox ID="iCurrentStrengthTextBox" runat="server" Text='<%# Bind("iCurrentStrength") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    cPositionCode:
                    <asp:TextBox ID="cPositionCodeTextBox" runat="server" Text='<%# Bind("cPositionCode") %>' />
                    <br />
                    vDescription:
                    <asp:TextBox ID="vDescriptionTextBox" runat="server" Text='<%# Bind("vDescription") %>' />
                    <br />
                    iBudgetedStrength:
                    <asp:TextBox ID="iBudgetedStrengthTextBox" runat="server" Text='<%# Bind("iBudgetedStrength") %>' />
                    <br />
                    siYear:
                    <asp:TextBox ID="siYearTextBox" runat="server" Text='<%# Bind("siYear") %>' />
                    <br />
                    iCurrentStrength:
                    <asp:TextBox ID="iCurrentStrengthTextBox" runat="server" Text='<%# Bind("iCurrentStrength") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    cPositionCode:
                    <asp:Label ID="cPositionCodeLabel" runat="server" Text='<%# Eval("cPositionCode") %>' />
                    <br />
                    vDescription:
                    <asp:Label ID="vDescriptionLabel" runat="server" Text='<%# Bind("vDescription") %>' />
                    <br />
                    iBudgetedStrength:
                    <asp:Label ID="iBudgetedStrengthLabel" runat="server" Text='<%# Bind("iBudgetedStrength") %>' />
                    <br />
                    siYear:
                    <asp:Label ID="siYearLabel" runat="server" Text='<%# Bind("siYear") %>' />
                    <br />
                    iCurrentStrength:
                    <asp:Label ID="iCurrentStrengthLabel" runat="server" Text='<%# Bind("iCurrentStrength") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
