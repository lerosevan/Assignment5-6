<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="Assignment5_6.LoginControl" %>
<div>
    <!-- Label to display messages to the user -->
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <br />
    <!-- TextBox for the user to enter their username -->
    <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username"></asp:TextBox>
    <br />
    <!-- TextBox for the user to enter their password -->
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
    <br />
    <!-- Button to trigger the login process -->
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
</div>

