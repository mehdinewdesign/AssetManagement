<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class=" offset-3 col-6">
        <h2>Current Assets</h2>
        <div class="form-group row">
            <asp:GridView ID="GVAsset" DataSourceID="AssetRequestDataSource" OnRowDataBound="GVAsset_RowDataBound" DataKeyNames="id" runat="server" AutoGenerateColumns="False" OnRowDeleting="GVAsset_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="itemname" HeaderText="Item Name" />
                    <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="duedate" HeaderText="Due Date" DataFormatString="{0:d}" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" DeleteText="Release Item" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="AssetRequestDataSource"
            runat="server"
            ConnectionString="<%$connectionStrings:AssetManagement %>"
            SelectCommand="SELECT * FROM AssetRequest WHERE granted='True' AND username=@name"
            DeleteCommand="DELETE AssetRequest WHERE id=@id">
            <SelectParameters>
                <asp:SessionParameter Name="name" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

