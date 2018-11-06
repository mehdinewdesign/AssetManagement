<%@ Page Title="" Language="C#" Culture="en-IN" UICulture="en" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" offset-3 col-6">
        <h2>Notifications</h2>
        <div class="form-group row">
            <asp:GridView ID="GVNotifications" OnRowUpdating="GVNotifications_RowUpdating" OnRowDataBound="GVNotifications_RowDataBound" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="AssetRequestDataSource" runat="server">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                    <asp:BoundField DataField="itemname" HeaderText="Item Name" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Allotment Date">
                        <EditItemTemplate>                            
                            <asp:TextBox ID="TxtAllot" EnableTheming="false" Text='<%#Bind("allotdate")%>' runat="server"></asp:TextBox><br />
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtAllot" Operator="DataTypeCheck" Type="Date" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Enter Date In DD-MM-YYYY Format"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtAllot" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Invalid Allotment Date"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Due Date">
                        <EditItemTemplate>                            
                            <asp:TextBox ID="TxtDue" EnableTheming="false" Text='<%#Bind("duedate")%>' runat="server"></asp:TextBox><br />
                            <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TxtDue" Operator="DataTypeCheck" Type="Date" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Enter Date In DD-MM-YYYY Format"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator3" Operator="GreaterThanEqual" ControlToCompare="TxtAllot" ControlToValidate="TxtDue" Type="Date" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Invalid Due Date"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtDue" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid Due Date"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowEditButton="true" EditText="Enter Dates" UpdateText="Confirm" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" DeleteText="Reject" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="AssetRequestDataSource"
            ConnectionString="<%$connectionStrings:AssetManagement%>"
            runat="server"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='False'"
            UpdateCommand="UPDATE AssetRequest SET allotdate=@allotdate, duedate=@duedate, granted='True' WHERE id=@id"
            DeleteCommand="DELETE FROM AssetRequest WHERE id=@id">
            <UpdateParameters>
                <asp:Parameter Name="allotdate" Type="DateTime" />
                <asp:Parameter Name="duedate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

