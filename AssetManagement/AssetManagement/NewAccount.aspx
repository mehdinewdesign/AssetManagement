<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewAccount.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    Username:<br />
    <asp:TextBox ID="TxtName" runat="server"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="TxtName" runat="server" ErrorMessage="Name Cannot Be Empty"></asp:RequiredFieldValidator><br />
    <br />
    Password:<br />
    <asp:TextBox ID="TxtPassword1" runat="server" TextMode="Password"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="TxtPassword1" runat="server" ErrorMessage="Password Cannot Be Empty"></asp:RequiredFieldValidator><br />
    <br />
    Confirm Password:<br />
    <asp:TextBox ID="TxtPassword2" runat="server" TextMode="Password"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="TxtPassword2" runat="server" ErrorMessage="Password Cannot Be Empty"></asp:RequiredFieldValidator><br />
    <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="TxtPassword2" ControlToCompare="TxtPassword1" runat="server" ErrorMessage="Passwords do not match"></asp:CompareValidator><br />
    <br />
    <asp:Button ID="BtnSubmit" runat="server" Text="Confirm" OnClick="BtnSubmit_Click" /><br />
    <asp:Label ID="LblError" runat="server" ForeColor="Red" Text=""></asp:Label><br />
</asp:Content>

