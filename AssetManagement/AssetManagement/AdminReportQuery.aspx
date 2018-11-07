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
            <asp:RadioButtonList ID="RBtnQueries" runat="server" CssClass="table table-borderless">
                <asp:ListItem Text=" Allotment Date" Value="1"></asp:ListItem>
                <asp:ListItem Text=" Due Date" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="Rfv1" ControlToValidate="RBtnQueries" runat="server" ForeColor="Red" ErrorMessage="Enter Query Type"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group row">
            <div class="col-3">
                <label for="date1">Start Date</label>
            </div>
            <asp:TextBox ID="TxtStartDate" TextMode="Date" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Rfv2" ControlToValidate="TxtStartDate" runat="server" ForeColor="Red" ErrorMessage="Enter Start Date"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group row">
            <div class="col-3">
                <label for="date1">End Date</label>
            </div>
            <asp:TextBox ID="TxtEndDate" TextMode="Date" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Rfv3" ControlToValidate="TxtEndDate" runat="server" ForeColor="Red" ErrorMessage="Enter End Date"></asp:RequiredFieldValidator>
        </div>
        <div class="row offset-4">
            <asp:Button ID="BtnSubmit" OnClick="BtnSubmit_Click" runat="server" Text="Generate Report" />
        </div>
    </div>
</asp:Content>

