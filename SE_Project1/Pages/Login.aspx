<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SE_Project1.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Georgia, 'Times New Roman', Times, serif;
            background-color: #f2f2f2; /* Light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
        }
        .left-text {
            flex: 1;
            padding-right: 50px; /* Adjust based on your preference */
        }
        .login-form {
            flex: 1;
        }
        .text-box {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            font-family:Georgia, 'Times New Roman', Times, serif;
        }
        .dropdown-style {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        .login-btn {
            background-color: #3D3A3A; /* Green */
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
            font-size: 18px;
            font-family: Georgia, 'Times New Roman', Times, serif
        }
        .login-btn:hover {
            opacity: 0.8;
        }
        .error-message {
            color: red;
            font-size: 0.8em;
        }
    </style>
</head>
<body>

<div>
    <div class="left-text">
        <h2>Welcome Back!</h2>
        <p>Please login to your account.</p>
        <br /><br />
    </div>
    <div class="login-form">
        <form id="form2" runat="server">
            <label for="searchOption">You are logging in as:</label>
            <asp:DropDownList ID="searchOption" runat="server" CssClass="dropdown-style">
                <asp:ListItem Value="option1">Committee Member</asp:ListItem>
                <asp:ListItem Value="option2">Panel Member</asp:ListItem>
                <asp:ListItem Value="option3">Supervisor</asp:ListItem>
                <asp:ListItem Value="option4">Student</asp:ListItem>
            </asp:DropDownList>


            <label for="id">ID:</label>
            <asp:TextBox ID="id" runat="server" CssClass="text-box"/>
            <asp:RequiredFieldValidator ID="IDCheck" runat="server" ControlToValidate="id"
                                        ErrorMessage="ID is required" Display="Dynamic" CssClass="error-message" />
            <br />
            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" CssClass="text-box" TextMode="Password"/>
            <asp:RequiredFieldValidator ID="PasswordCheck" runat="server" ControlToValidate="password"
                                        ErrorMessage="Password is required" Display="Dynamic" CssClass="error-message" />
            <br /><br />         
          
            <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="login_btn_Click" CssClass="login-btn" />
            <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <!-- <a href="CommitteeHomepage.aspx" class="login-btn">Login</a> -->
            <!-- <asp:Button ID="Button1" runat="server" Text="Login" OnClick="login_btn_Click" CssClass="login-btn" />  -->
            <!-- Any other controls that need to post back to the server should also be inside this form -->          
        </form>
    </div>
</div>

</body>
</html>
