<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .FloatLeft{float:left}
        .FloatRight{float:right;
            margin-left: 129px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Panel runat="server" CssClass="FloatLeft" Height="214px" Width="505px">
        <asp:Label ID="LblName" runat="server" Text="Welcome To The User Home Page,"></asp:Label><br />
        Add Item To Cart:<br />
        <asp:DropDownList ID="DdlItemName" runat="server"></asp:DropDownList>
        <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" Width="60px" /><br />
        <asp:Label ID="LblAvailable" runat="server" Text=""></asp:Label><br />
        <asp:Button ID="BtnCart" runat="server" Text="Add To Cart" OnClick="BtnCart_Click" />
        <br />Cart:<br />
        <asp:GridView ID="GVCart" runat="server"></asp:GridView>
    </asp:Panel>

    <asp:Panel runat="server" CssClass="FloatRight">
        Assets Currently Holding:<br />
        <asp:GridView ID="GVAsset" DataSourceID="AssetRequestDataSource" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="itemname" HeaderText="Item Name" />
                <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="duedate" HeaderText="Due Date" DataFormatString="{0:d}" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="AssetRequestDataSource"
            runat="server"
            ConnectionString="<%$connectionStrings:AssetManagement %>"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='True' AND username=@name">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="u" Name="name" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>

</asp:Content>

