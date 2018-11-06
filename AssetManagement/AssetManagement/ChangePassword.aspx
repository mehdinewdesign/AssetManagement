<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" offset-3 col-6">
        <h2>Update Password</h2>
        <hr />
        <div class="form-group row">
            <div class="col-3">
                <label for="newpwd">New Password</label>
            </div>
            <asp:TextBox ID="TxtPwd" runat="server" CssClass="form-control col-7" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="TxtPwd" 
                ErrorMessage="*Required Field" Display="Static" CssClass="text-danger offset-3" />
        </div>
        <div class="form-group row">
            <div class="col-3">
                <label for="confpwd">Confirm Password</label>
            </div>
            <asp:TextBox ID="TxtConfPwd" runat="server" CssClass="form-control col-7" TextMode="Password" />
            <asp:CompareValidator ID="rfv1" runat="server" Display="Static" ErrorMessage="Passwords Do Not Match" 
                 ControlToValidate="TxtConfPwd" ControlToCompare="TxtPwd" Type="String" Operator="Equal" CssClass="text-danger offset-3" />
        </div>
        <%--<br />
        <div class="row offset-4">
            <asp:Label ID="LblError" runat="server" ForeColor="Red" Text=""></asp:Label><br />
        </div>--%>
        <div class="row offset-4">
            <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-primary" Text="Confirm" OnClick="BtnSubmit_Click" />
        </div>
    </div>
</asp:Content>

