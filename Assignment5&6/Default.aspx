<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment5_6.Default" %>
<!DOCTYPE html>
<html>
<head>
    <title>Default Page</title>
    <style>
        /* Reset and Base Styles */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        h1, h2 {
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #0078D7;
        }

        h2 {
            margin-top: 30px;
            font-size: 1.8rem;
            color: #444;
        }

        p {
            text-align: center;
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #555;
        }

        /* Navigation Bar Styles */
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
        }

            .nav a {
                text-decoration: none;
                color: #0078D7;
                font-weight: bold;
                padding: 10px 20px;
                border: 2px solid #0078D7;
                border-radius: 5px;
                transition: all 0.3s ease-in-out;
            }

                .nav a:hover {
                    background-color: #0078D7;
                    color: #fff;
                }

                .nav a.logout {
                    color: #FF4D4D;
                    border-color: #FF4D4D;
                }

                    .nav a.logout:hover {
                        background-color: #FF4D4D;
                        color: #fff;
                    }

        /* Service Directory Section */
        .service-directory {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

            .service-directory ul {
                list-style-type: none;
                padding: 0;
            }

            .service-directory li {
                font-size: 1rem;
                margin: 10px 0;
                padding: 10px;
                border-bottom: 1px solid #ddd;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

                .service-directory li:last-child {
                    border-bottom: none;
                }

                .service-directory li span {
                    font-weight: bold;
                    color: #333;
                }

                .service-directory li:hover {
                    background-color: #f1f1f1;
                }

        /* Footer Styles */
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

        /* Test Case Styles */
        .test-cases {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

            .test-cases ul {
                list-style-type: none;
                padding: 0;
            }

            .test-cases li {
                font-size: 1rem;
                margin: 10px 0;
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

                .test-cases li:last-child {
                    border-bottom: none;
                }
    </style>
</head>
<body>
    <h1>Welcome to Our Web Application</h1>
    <p>This application demonstrates the use of web services, encryption, and access controls.</p>

    <!-- Navigation Links -->
    <div class="nav">
        <a href="TryIt.aspx">Go to TryIt Page</a>
        <!--For Assignment 6, please ignore-->
        <a href="Member.aspx">Go to Member Page</a>
        <!--For Assignment 6, please ignore-->
        <a href="Staff.aspx">Go to Staff Page</a>
        <a href="Logout.aspx" class="logout">Logout</a>
    </div>

    <!-- Service Directory Section -->
    <div class="service-directory">
        <h2>Service Directory</h2>
        <asp:Repeater ID="ServiceDirectoryRepeater" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <span><%# Eval("ServiceName") %>:</span> <%# Eval("Description") %>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <!-- Test Case Examples Section -->
    <div class="test-cases">
        <h2>Test Case Examples</h2>
        <ul>
            <li><strong>Local Encryption:</strong> Input "Hello World" → Output: (hashed string)</li>
            <li><strong>Remote Encryption:</strong> Input "Test123" → Output: (hashed string)</li>
            <li><strong>Cookie Functionality:</strong> Input "User123" → Output: "Cookie set successfully"</li>
            <li><strong>Global Application Events: </strong> Click buttons to get Session Count and Last Visited Time and Date </li>
            <li><strong>Wind Web Service: </strong>Input Latitude="40.7128" and Longitude="-74.0060" → Output: wind speed m/s </li>
            <li><strong>User Profile Cookie: </strong>Input Username="Bob", Email="bob123@abc.com", Phone="123-456-7891" → Output: "User profile stored in cookies"</li>
        </ul>
    </div>

    <footer>
        <p>2024 Assignment 5 & 6 For CSE 445</p>
    </footer>
</body>
</html>
