<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TryIt.aspx.cs" Inherits="Assignment5_6.TryIt" %>

<!DOCTYPE html>
<html>
<head>
    <title>TryIt Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin: 20px 0;
        }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group input, .form-group button {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form-group button {
                background-color: #007bff;
                color: white;
                cursor: pointer;
                border: none;
                transition: background-color 0.3s;
            }

                .form-group button:hover {
                    background-color: #0056b3;
                }

        .output-label {
            display: block;
            margin-top: 10px;
            font-style: italic;
            color: #555;
        }

        .cookie-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>TryIt Page</h1>

            <!-- Encryption Test Section -->
            <h2>Test Encryption Function</h2>
            <div class="form-group">
                <label for="txtInputString">Enter a string to hash:</label>
                <asp:TextBox ID="txtInputString" runat="server" Placeholder="Enter string"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnHash" runat="server" Text="Hash String" OnClick="btnHash_Click" />
            </div>
            <asp:Label ID="lblHashedOutput" runat="server" CssClass="output-label"></asp:Label>

            <!-- Cookie Test Section -->
            <h2>Test Cookie Functionality</h2>
            <div class="cookie-buttons">
                <asp:Button ID="btnSetCookie" runat="server" Text="Set Cookie" OnClick="btnSetCookie_Click" />
                <asp:Button ID="btnGetCookie" runat="server" Text="Get Cookie" OnClick="btnGetCookie_Click" />
            </div>
            <asp:Label ID="lblCookieValue" runat="server" CssClass="output-label"></asp:Label>
        </div>
    </form>
</body>
</html>
