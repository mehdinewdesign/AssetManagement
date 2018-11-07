<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminNewItem.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" offset-3 col-6">
        <h2>New Item</h2>
        <div class="form-group row">
            <div class="col-3">
                <label for="itemname">Item Name</label>
            </div>
            <asp:TextBox ID="TxtName" runat="server" CssClass="form-control col-7"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="TxtName" Display="Static" runat="server" ErrorMessage="Name Cannot Be Empty"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group row">
            <div class="col-3">
                <label for="itemquantity">Item Quantity</label>
            </div>
            <asp:TextBox ID="TxtQuantity" runat="server" CssClass="form-control col-7"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="TxtQuantity" Display="Static" runat="server" ErrorMessage="Quantity Cannot Be Empty"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="[0-9]+" ForeColor="Red" ControlToValidate="TxtQuantity" Display="Static" runat="server" ErrorMessage="Enter Numeric Value"></asp:RegularExpressionValidator>
        </div>
        <div class="row offset-4">
            <asp:Button ID="BtnInsert" runat="server" OnClick="BtnInsert_Click" CssClass="btn btn-primary" Text="Insert" />
        </div>
        <div class="row offset-4">
            <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
        </div>
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
    </div>
</asp:Content>

