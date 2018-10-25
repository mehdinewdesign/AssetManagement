<%@ Page Title="" Language="C#" Culture="en-IN" UICulture="en" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_Default" %>

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
        <asp:GridView ID="GVNotifications" OnRowUpdating="GVNotifications_RowUpdating" OnRowUpdated="GVNotifications_RowUpdated" OnRowDataBound="GVNotifications_RowDataBound" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="AssetRequestDataSource" runat="server">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                <asp:BoundField DataField="itemname" HeaderText="Item Name" ReadOnly="true" />
               <asp:TemplateField>
                    <EditItemTemplate>
                        Allotment Date:<br />
                        <asp:TextBox ID="TxtAllot" Text='<%#Bind("allotdate")%>' runat="server"></asp:TextBox><br />
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtAllot" Operator="DataTypeCheck" Type="Date" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Enter Date In DD-MM-YYYY Format"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtAllot" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Invalid Allotment Date"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        Due Date:<br />
                        <asp:TextBox ID="TxtDue" Text='<%#Bind("duedate")%>' runat="server"></asp:TextBox><br />
                        <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TxtDue" Operator="DataTypeCheck" Type="Date" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Enter Date In DD-MM-YYYY Format"></asp:CompareValidator>
                        <asp:CompareValidator ID="CompareValidator3" Operator="GreaterThanEqual" ControlToCompare="TxtAllot" ControlToValidate="TxtDue" Type="Date" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Invalid Due Date"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtDue" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid Due Date"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="true"  EditText="Enter Dates" UpdateText="Confirm" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="true" DeleteText="Reject" />
            </Columns>
        </asp:GridView><br />
        <asp:SqlDataSource ID="AssetRequestDataSource"
            ConnectionString="<%$connectionStrings:AssetManagement%>" 
            runat="server"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='False'"
            UpdateCommand="UPDATE AssetRequest SET allotdate=@allotdate, duedate=@duedate, granted='True' WHERE id=@id"
            DeleteCommand="DELETE FROM AssetRequest WHERE id=@id"
            >
            <UpdateParameters>
                <asp:Parameter Name="allotdate" Type="DateTime" />
                <asp:Parameter Name="duedate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel runat="server" HorizontalAlign="Left" CssClass="FloatRight" >
        Available Items:<br />
        <asp:GridView ID="GVItems" DataKeyNames="name" AutoGenerateColumns="False" DataSourceID="ItemsDataSource" runat="server">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Item Name" />
                <asp:BoundField DataField="quantity" HeaderText="Available Quantity" />
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" EditText="Update Items" DeleteText="Delete Items" />
            </Columns>
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

