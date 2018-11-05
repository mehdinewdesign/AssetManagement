<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserNewRequest.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" offset-3 col-6">
        <h2>Request Item</h2>
        <div class="form-group row">
            <div class="col-3">
                <label for="itemname">Item Name</label>
            </div>
            <asp:DropDownList ID="DdlItemName" runat="server"></asp:DropDownList>
        </div>
        <div class="form-group row">
            <div class="row offset-4">
                <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="BtnSearch_Click"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="row offset-4">
                <asp:Label ID="LblAvailable" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row offset-4">
            <asp:Button ID="BtnRequest" runat="server" Text="Request" CssClass="btn btn-primary" OnClick="BtnRequest_Click" />
        </div>
    </div>
</asp:Content>

