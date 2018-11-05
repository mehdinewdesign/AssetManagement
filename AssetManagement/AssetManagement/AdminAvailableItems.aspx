<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminAvailableItems.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" offset-3 col-6">
        <h2>Available Items</h2>
        <div class="form-group row">
            <asp:GridView ID="GVItems" DataKeyNames="name" AutoGenerateColumns="False" DataSourceID="ItemsDataSource" runat="server">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Item Name" ReadOnly="true" />
                    <asp:BoundField DataField="quantity" HeaderText="Available Quantity" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" EditText="Update Items" DeleteText="Delete Items" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="ItemsDataSource"
            ConnectionString="<%$connectionStrings:AssetManagement%>"
            runat="server"
            SelectCommand="SELECT * FROM [Items]"
            UpdateCommand="UPDATE Items SET quantity=@quantity WHERE name=@name"
            InsertCommand="INSERT INTO Items(name,quantity) VALUES(@name,@quantity)"
            DeleteCommand="DELETE FROM Items WHERE name=@name">
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtName" Name="name" Type="String" />
                <asp:ControlParameter ControlID="TxtQuantity" Name="quantity" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

