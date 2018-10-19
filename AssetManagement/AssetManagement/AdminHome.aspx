<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .FloatLeft{float:left;position:center}
        .FloatRight{float:right;position:center}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Welcome To The Admin Page<br /><br />
    <asp:Panel runat="server" HorizontalAlign="Left" CssClass="FloatLeft">
        Notifications:<br />
        <asp:GridView ID="GVNotifications" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="AssetRequestDataSource" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                <asp:BoundField DataField="itemname" HeaderText="Item Name" ReadOnly="true" />
                <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" ReadOnly="false" DataFormatString="{0:d}" />
                <asp:BoundField DataField="duedate" HeaderText="Due Date" ReadOnly="false" DataFormatString="{0:d}" />
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" DeleteText="Reject" EditText="Enter Dates" UpdateText="Confirm" />
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
            UpdateCommand="UPDATE AssetRequest SET granted=@grant WHERE id=@id"
            DeleteCommand="DELETE FROM AssetRequest WHERE id=@id"
            >
            <UpdateParameters>
                
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel runat="server" HorizontalAlign="Left" CssClass="FloatRight" >
        Available Items:<br />
        <asp:GridView ID="GVItems" DataKeyNames="name" AutoGenerateColumns="False" DataSourceID="ItemsDataSource" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Item Name" />
                <asp:BoundField DataField="quantity" HeaderText="Available Quantity" />
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" EditText="Update Items" DeleteText="Delete Items" />
            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
        Add New Items:<br />
        Name Of Item:<br />
        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox><br />
        Quantity Of Item:<br />
        <asp:TextBox ID="TxtQuantity" runat="server"></asp:TextBox><br />
        <asp:Button ID="BtnInsert" runat="server" Text="Insert" OnClick="BtnInsert_Click" /><br />
        <asp:SqlDataSource ID="ItemsDataSource" 
            ConnectionString="<%$connectionStrings:AssetManagement%>" 
            runat="server"
            SelectCommand="SELECT * FROM [Items]"
            UpdateCommand="UPDATE Items SET quantity=@quantity WHERE name=@name"
            InsertCommand="INSERT INTO Items(name,quantity) VALUES(@name,@quantity)" 
            DeleteCommand="DELETE FROM Items WHERE name=@name" >
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtName" Name="name" Type="String" />
                <asp:ControlParameter ControlID="TxtQuantity" Name="quantity" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

