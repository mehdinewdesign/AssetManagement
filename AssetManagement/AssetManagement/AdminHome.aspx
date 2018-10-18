<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel runat="server">
        Welcome To The Admin Page<br /><br />
        Notifications:<br />
        <asp:GridView ID="GVNotifications" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="AssetRequestDataSource" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="UserName" ReadOnly="true" />
                <asp:BoundField DataField="itemname" HeaderText="ItemName" ReadOnly="true" />
                <asp:BoundField DataField="granted" HeaderText="Status" />
                <asp:CommandField ButtonType="Button" ShowEditButton="true" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView><br />
        <asp:SqlDataSource ID="AssetRequestDataSource"
            ConnectionString="<%$connectionStrings:AssetManagement%>" 
            runat="server"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='False'"
            UpdateCommand="UPDATE AssetRequest SET granted='True' WHERE id=@id"
            ></asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

