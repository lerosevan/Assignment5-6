<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment5_6.Login" %>
<%@ Register Src="~/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        /* Reset and Base Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

            .login-container h1 {
                color: #333;
                font-size: 2rem;
                margin-bottom: 20px;
            }

            .login-container form {
                margin-top: 20px;
            }

            .login-container .btn {
                display: block;
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                color: #fff;
                background-color: #0078D7;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
                transition: background-color 0.3s ease;
            }

                .login-container .btn:hover {
                    background-color: #0056b3;
                }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 15px;
                box-sizing: border-box;
            }

            .login-container .error-message {
                color: #FF4D4D;
                font-size: 0.9rem;
                margin-top: 10px;
            }

        footer {
            margin-top: 20px;
            font-size: 0.8rem;
            color: #777;
        }

            footer a {
                color: #0078D7;
                text-decoration: none;
            }

                footer a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <!-- Login Container -->
    <div class="login-container">
        <h1>Login</h1>
        <p>Please use the following credentials to login and test:</p>
        <p>Username: <strong>admin</strong></p>
        <p>Password: <strong>password</strong></p>
        <form id="form1" runat="server">
            <!-- Custom Login Control -->
            <uc:LoginControl ID="LoginControl" runat="server" />
            <asp:Label ID="lblRedirectMessage" runat="server" CssClass="error-message"></asp:Label>
        </form>
    </div>
</body>
</html>
