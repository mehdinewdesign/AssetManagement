<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminReportQuery.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" offset-3 col-6">
        <h2>Report Query</h2>
        <hr />
        <div class="form-group row">
            <div class="col-3">
                <label for="query">Queries</label>
            </div>
            <asp:RadioButtonList ID="RBtnQueries" AutoPostBack="true" OnSelectedIndexChanged="RBtnQueries_SelectedIndexChanged" runat="server">
                <asp:ListItem Text="List of Users" Value="1"></asp:ListItem>
                <asp:ListItem Text="Items held by Users" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <%--<div class="row offset-4">
            
        </div>--%>
    </div>
</asp:Content>

