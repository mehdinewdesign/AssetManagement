<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewAccount.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Username:<br />
    <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
    <br />Password:<br />
    <asp:TextBox ID="TxtPassword1" runat="server" TextMode="Password"></asp:TextBox>
    <br />Confirm Password:<br />
    <asp:TextBox ID="TxtPassword2" runat="server" TextMode="Password"></asp:TextBox><br />
    <br /><asp:Button ID="BtnSubmit" runat="server" Text="Confirm" OnClick="BtnSubmit_Click" />
</asp:Content>

