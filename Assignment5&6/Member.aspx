<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Assignment5_6.Member" %>

<!DOCTYPE html>
<html>
<head>
    <title>Member Page</title>
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

        /* Logout Button Styles */
        .logout-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

            .logout-btn:hover {
                background-color: #d32f2f;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Member Page</h1>
            <p>Register to become a member and access exclusive content!</p>

            <!-- Registration Panel -->
            <asp:Panel ID="RegistrationPanel" runat="server">
                <h2>Register</h2>
                <div class="form-group">
                    <asp:Label ID="RegisterMessage" runat="server" CssClass="output" ForeColor="Red" Visible="false"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="RegisterUsername" runat="server" Placeholder="Username"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="RegisterPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <!-- Image Verifier -->
                    <asp:Image ID="CaptchaImage" runat="server" />
                    <asp:TextBox ID="CaptchaInput" runat="server" Placeholder="Enter Captcha"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
                </div>
            </asp:Panel>

            <!-- Login Panel -->
            <asp:Panel ID="LoginPanel" runat="server" Visible="false">
                <h2>Login</h2>
                <div class="form-group">
                    <asp:Label ID="LoginMessage" runat="server" CssClass="output" ForeColor="Red" Visible="false"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="LoginUsername" runat="server" Placeholder="Username"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="LoginPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                </div>
            </asp:Panel>

            <!-- Content Panel -->
            <asp:Panel ID="ContentPanel" runat="server" Visible="false">
                <h2>Welcome to the Member Area</h2>
                <asp:Label ID="lblWelcomeMessage" runat="server" CssClass="output"></asp:Label>
                <p>You have access to exclusive content and features.</p>
                <asp:Button ID="LogoutButton" runat="server" Text="Logout" CssClass="logout-btn" OnClick="LogoutButton_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
