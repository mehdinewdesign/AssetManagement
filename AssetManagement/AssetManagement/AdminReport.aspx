<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminReport.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" offset-3 col-6">
        <h2>Report Query</h2>
        <hr />
        <div class="form-group row">
            <div class="col-3">
                <asp:Label runat="server" ID="LblReport" Text=""></asp:Label>
            </div>
            <%if (Request.QueryString["q"] == "1")
                { %>
            <asp:GridView ID="GVUsers" DataSourceID="DSUsers" AutoGenerateColumns="false" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Name" DataField="name" ReadOnly="true" />
                </Columns>
            </asp:GridView>
            <%} %>
            <%else if (Request.QueryString["q"] == "2")
                { %>
            <asp:GridView ID="GVItems" DataSourceID="DSRequest" AutoGenerateColumns="false" runat="server">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                    <asp:BoundField DataField="itemname" HeaderText="Item Name" ReadOnly="true" />
                    <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" ReadOnly="true" />
                    <asp:BoundField DataField="duedate" HeaderText="Due Date" ReadOnly="true" />
                </Columns>
            </asp:GridView>
            <%} %>
        </div>
        <%--<div class="row offset-4">
            
        </div>--%>
        <asp:SqlDataSource ID="DSUsers" ConnectionString="<%$ConnectionStrings:AssetManagement %>" SelectCommand="SELECT name FROM [User] WHERE admin='false'" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRequest" ConnectionString="<%$ConnectionStrings:AssetManagement %>" SelectCommand="SELECT * FROM AssetRequest WHERE granted='true'" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>

