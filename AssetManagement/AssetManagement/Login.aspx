<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Username:<br />
    <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox><br />
    Password:<br />
    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
    <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" /><br /><br />
    <asp:Button ID="BtnNewAccount" runat="server" Text="Create New Account" OnClick="BtnNewAccount_Click" />
</asp:Content>

