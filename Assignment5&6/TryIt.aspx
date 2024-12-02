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
                <asp:Button ID="btnGoToMemberPage" runat="server" Text="Go to Member Page" OnClick="btnGoToMemberPage_Click" />
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

            <asp:Label ID="lblCookieValue" runat="server" CssClass="output-label"></asp:Label>
            <br />
            <!-- Event Handler Section -->
            <h2>Test Global Application Events</h2>
            <div class="form-group">
                <p>The session count and the last visit date and time.</p>
                <asp:Button ID="btnGetSessionCount" runat="server" Text="Get Session Count" OnClick="btnGetSessionCount_Click" />
                <asp:Button ID="btnGetLastVisitTime" runat="server" Text="Get Last Visit Time" OnClick="btnGetLastVisit_Click" />                           
            </div>            
            <asp:Label ID="lblSessionCount" runat="server" />
            <br />
            <asp:Label ID="lblLastVisit" runat="server" />
            <!-- Test Wind Service -->
            <h2>Test Wind Web Service</h2>
            <div class="form-group">
                <p>This service takes in the latitude and longitude and displays the wind speed (m/s).</p>
                <label>Enter latitude: </label>
                <asp:TextBox ID="txtLatitude" runat="server" Width="125"/>
                <br />
                <label>Enter longitude: </label>
                <asp:TextBox ID="txtLongitude" runat="server" Width="125"/>
                <br />
                <br />
                <asp:Button Text="Get Wind Speed" runat="server" ID="getWindBtn" OnClick="getWindBtn_Click" Width="175"/>
            </div>
            <asp:Label ID="LabelResult" runat="server"></asp:Label>   
            
            <!-- User Profile Cookie -->
            <h2>Test User Profile Cookie</h2>
            <div class="form-group">
                <p>Enter your information. The information will be stored in cookies.</p>             
                <!-- User's username, email, phone, and password -->
                <label>Username: </label>
                <asp:TextBox ID="txtUserName" runat="server" Width="201px" />
                    
                <label>Email: </label> 
                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" Width="201px"/> 
                
                <label>Phone: </label> 
                <asp:TextBox ID="txtPhone" TextMode="Phone" runat="server" Width="201px"/>
                <br />
                <asp:Button Text="Submit" runat="server" ID="SubmitBtn" OnClick="UserProfCookieSubmitBtn_Click" />
                <br />
                <br />
                <asp:Label ID="LabelUser" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelPhone" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button Text="Clear Cookie" runat="server" ID="ClearCookieBtn" OnClick="UserProfCookieClearBtn_Click" />
                <br />
                <asp:Label ID="CookieMsg" runat="server"></asp:Label>
            </div>

        </div>
    </form>
</body>
</html>
