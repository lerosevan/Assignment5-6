<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TryItPage.aspx.cs" Inherits="ASS5_6.TryItPage" %>

<%@ Register src="login.ascx" tagname="login" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:login ID="login1" runat="server" />
        </div>
    </form>
</body>
</html>
