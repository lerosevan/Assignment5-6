<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment5_6.Login" %>
<%@ Register Src="~/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <!-- Main form for the login page -->
    <form id="form1" runat="server">
        <h1>Login</h1>
        <!-- Custom user control for login functionality -->
        <uc:LoginControl ID="LoginControl" runat="server" />
    </form>
</body>
</html>
