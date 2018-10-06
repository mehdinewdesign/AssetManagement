<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:DropDownList ID="DdlTheme" runat="server" AutoPostBack="true">
            <asp:ListItem Text="Dark" />
            <asp:ListItem Text="Light" />
        </asp:DropDownList>
    </div>
    <div style="text-align: center">
        Username:<br />
        <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="TxtUserName" runat="server" ErrorMessage="Name Cannot Be Empty"></asp:RequiredFieldValidator><br />
        Password:<br />
        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="TxtPassword" runat="server" ErrorMessage="Password Cannot Be Empty"></asp:RequiredFieldValidator><br />
        <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" /><br />
        <asp:Label ID="LblError" runat="server" ForeColor="Red" Text=""></asp:Label><br />
        <asp:Button ID="BtnNewAccount" runat="server" Text="Create New Account" OnClick="BtnNewAccount_Click" CausesValidation="false" />
    </div>
</asp:Content>

