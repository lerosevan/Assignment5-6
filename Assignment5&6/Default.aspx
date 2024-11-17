<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment5_6.Default" %>
<!DOCTYPE html>
<html>
<head>
    <title>Default Page</title>
</head>
<body>
    <!-- Header section of the default page -->
    <h1>Welcome to Our Web Application</h1>
    
    <!-- Brief description of the application -->
    <p>This application demonstrates the use of web services, encryption, and access controls.</p>
    
    <!-- Navigation links to other pages -->
    <a href="TryIt.aspx">Go to TryIt Page</a> <!-- Link to TryIt page -->
    
    <!-- Section for displaying the service directory -->
    <h2>Service Directory</h2>
    <asp:Repeater ID="ServiceDirectoryRepeater" runat="server">
        <!-- Header template: Defines the start of the unordered list -->
        <HeaderTemplate><ul></HeaderTemplate>
        
        <!-- Item template: Displays each service as a list item -->
        <ItemTemplate>
            <li>
                <%# Eval("ServiceName") %>: <%# Eval("Description") %>
            </li>
        </ItemTemplate>
        
        <!-- Footer template: Closes the unordered list -->
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
</body>
</html>
