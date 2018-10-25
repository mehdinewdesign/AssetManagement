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
        <asp:GridView ID="GVCart" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Item Name" />
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel runat="server" >
        Assets Currently Holding:<br />
        <asp:GridView ID="GVAsset" DataSourceID="AssetRequestDataSource" OnRowDataBound="GVAsset_RowDataBound" DataKeyNames="id" runat="server" AutoGenerateColumns="False" OnRowDeleting="GVAsset_RowDeleting">
            <Columns>
                <asp:BoundField DataField="itemname" HeaderText="Item Name" />
                <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="duedate" HeaderText="Due Date" DataFormatString="{0:d}" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="true" DeleteText="Release Item" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="AssetRequestDataSource"
            runat="server"
            ConnectionString="<%$connectionStrings:AssetManagement %>"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='True' AND username=@name"
            DeleteCommand="DELETE AssetRequest WHERE id=@id"     
            >
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="u" Name="name" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>

</asp:Content>

