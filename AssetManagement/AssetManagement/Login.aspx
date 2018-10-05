<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Username:
    <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox><br />
    Password:
    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
    <asp:Button ID="BtnLogin" runat="server" Text="Button" OnClick="BtnLogin_Click" />
    <asp:Button ID="BtnNewAccount" runat="server" Text="Create New Account" OnClick="BtnNewAccount_Click" />
</asp:Content>

