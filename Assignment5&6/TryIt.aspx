<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TryIt.aspx.cs" Inherits="Assignment5_6.TryIt" %>
<!DOCTYPE html>
<html>
<head>
    <title>TryIt Page</title>
    <style>
        /* Base Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0078D7;
        }

        h2 {
            margin-top: 40px;
            color: #444;
        }

        .form-group {
            margin: 20px 0;
        }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                font-size: 1.1rem;
            }

            .form-group input,
            .form-group button {
                width: 100%;
                padding: 12px;
                font-size: 1rem;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                margin-bottom: 15px;
            }

            .form-group button {
                background-color: #0078D7;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

                .form-group button:hover {
                    background-color: #0056b3;
                }

        .output {
            margin-top: 15px;
            font-style: italic;
            color: #555;
        }

        /* Section Divider */
        .divider {
            height: 1px;
            background-color: #ddd;
            margin: 40px 0;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9rem;
            color: #777;
        }

            footer a {
                text-decoration: none;
                color: #0078D7;
            }

                footer a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>TryIt Page</h1>

            <!-- Local Encryption Section -->
            <h2>Local Encryption</h2>
            <div class="form-group">
                <label for="txtLocalInput">Enter a string to hash locally:</label>
                <asp:TextBox ID="txtLocalInput" runat="server" Placeholder="Enter string"></asp:TextBox>
                <asp:Button ID="btnLocalHash" runat="server" Text="Hash Locally" OnClick="btnLocalHash_Click" />
                <asp:Label ID="lblLocalOutput" runat="server" CssClass="output"></asp:Label>
            </div>

            <!-- Divider -->
            <div class="divider"></div>

            <!-- Remote Encryption Section -->
            <h2>Remote Encryption (Web Service)</h2>
            <div class="form-group">
                <label for="txtRemoteInput">Enter a string to hash remotely:</label>
                <asp:TextBox ID="txtRemoteInput" runat="server" Placeholder="Enter string"></asp:TextBox>
                <asp:Button ID="btnRemoteHash" runat="server" Text="Hash Remotely" OnClick="btnRemoteHash_Click" />
                <asp:Label ID="lblRemoteOutput" runat="server" CssClass="output"></asp:Label>
            </div>

            <!-- Divider -->
            <div class="divider"></div>

            <!-- Cookie Functionality Section -->
            <h2>Cookie Functionality</h2>
            <div class="form-group">
                <label for="txtCookieValue">Set a cookie value:</label>
                <asp:TextBox ID="txtCookieValue" runat="server" Placeholder="Enter value"></asp:TextBox>
                <asp:Button ID="btnSetCookie" runat="server" Text="Set Cookie" OnClick="btnSetCookie_Click" />

                <label for="lblCookieResult">Retrieve cookie value:</label>
                <asp:Button ID="btnGetCookie" runat="server" Text="Get Cookie" OnClick="btnGetCookie_Click" />
                <asp:Label ID="lblCookieResult" runat="server" CssClass="output"></asp:Label>
            </div>

            <!--Member Page-->
            <h2>Member Page Functionality</h2>
            <div class="form-group">
                <label for="txtMemberUsername">Register as Member:</label>
                <asp:TextBox ID="txtMemberUsername" runat="server" Placeholder="Enter Username"></asp:TextBox>
                <asp:TextBox ID="txtMemberPassword" runat="server" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
                <asp:Button ID="btnMemberRegister" runat="server" Text="Register Member" OnClick="btnMemberRegister_Click" />
                <asp:Label ID="lblMemberResult" runat="server" CssClass="output"></asp:Label>
            </div>

            <!-- Divider -->
            <div class="divider"></div>

            <!-- Staff Page -->
            <h2>Staff Page Functionality</h2>
            <div class="form-group">
                <label for="txtStaffUsername">Login as Staff:</label>
                <asp:TextBox ID="txtStaffUsername" runat="server" Placeholder="Enter Username"></asp:TextBox>
                <asp:TextBox ID="txtStaffPassword" runat="server" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
                <asp:Button ID="btnStaffLogin" runat="server" Text="Login as Staff" OnClick="btnStaffLogin_Click" />
                <asp:Label ID="lblStaffResult" runat="server" CssClass="output"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
