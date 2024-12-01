<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Assignment5_6.Staff" %>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Page</title>
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
            <h2>Staff Login</h2>
            <p>Only authorized staff members can access this page. Please log in below.</p>

            <!-- Login Panel -->
            <asp:Panel ID="LoginPanel" runat="server">
                <div class="form-group">
                    <asp:Label ID="LoginError" runat="server" CssClass="output" ForeColor="Red" Visible="false"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="Username" runat="server" Placeholder="Username"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                </div>
            </asp:Panel>

            <!-- Content Panel -->
            <asp:Panel ID="ContentPanel" runat="server" Visible="false">
                <h3>Welcome to the Staff Area</h3>
                <p>This section contains staff-only content and features.</p>
                <asp:Button ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
