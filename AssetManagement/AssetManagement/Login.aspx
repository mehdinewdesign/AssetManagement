<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" offset-3 col-6">
        <h2>Login</h2>
        <div class="row">
            <asp:Label runat="server" ID="err" CssClass="alert-danger offset-3" />
        </div>
        <hr />
        <div class="form-group row">
            <div class="col-3">
                <label for="username">Username</label>
            </div>
            <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control col-7" />
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="TxtUsername" 
                ErrorMessage="*Required Field" Display="Static" CssClass="text-danger offset-3" />
        </div>
        <div class="form-group row">
            <div class="col-3">
                <label for="pwd">Password</label>
            </div>
            <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control col-7" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfv1" runat="server" Display="Static" ErrorMessage="*Required Field" 
                 ControlToValidate="TxtPassword" CssClass="text-danger offset-3" />
        </div>
        <br />
        <div class="row offset-4">
            <asp:Label ID="LblError" runat="server" ForeColor="Red" Text=""></asp:Label><br />
        </div>
        <div class="row offset-4">
            <asp:Button ID="BtnLogin" runat="server" CssClass="btn btn-primary" OnClick="BtnLogin_Click" Text="Enter" />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
            <asp:Button ID="BtnNewAccount" runat="server" CssClass="btn btn-primary" OnClick="BtnNewAccount_Click" CausesValidation="false" Text="New Account" />
        </div>
    </div>
</asp:Content>