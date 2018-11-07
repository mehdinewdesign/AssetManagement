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
            <asp:GridView ID="GVReport" runat="server" DataSourceID="DSRequest" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" />
                    <asp:BoundField DataField="itemname" HeaderText="User Name" ReadOnly="true" />
                    <asp:BoundField DataField="allotdate" HeaderText="Allotment Date" ReadOnly="true" />
                    <asp:BoundField DataField="duedate" HeaderText="Due Date" ReadOnly="true" />
                </Columns>
            </asp:GridView>
        </div>
        <%--<div class="row offset-4">
            
        </div>--%>
        <asp:SqlDataSource ID="DSRequest" ConnectionString="<%$ConnectionStrings:AssetManagement %>" runat="server">
            <SelectParameters>
                <asp:QueryStringParameter Name="start" QueryStringField="sd" />
                <asp:QueryStringParameter Name="end" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

