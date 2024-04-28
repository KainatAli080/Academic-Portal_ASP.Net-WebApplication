<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeCreateUser.aspx.cs" Inherits="SE_Project1.Pages.CommitteeCreateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        .login-btn {
            background-color: #252323; /* Green */
            color: white;
            padding: 0px;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 20%;
            border-radius: 4px;
            font-size: 18px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            text-align: center;
        }

        .login-btn a {
            color: white;           /* Makes the text color white */
            text-decoration: none;  /* Removes underline */
            display: block;         /* Ensures the link covers the entire area of the button */
            padding: 14px 20px;     /* Adds padding to make the entire area clickable and visually consistent */
            font-size: 18px;        /* Matches the desired text size */
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <label>What type of user do you want to create?</label><br/>
    <br />
    <div class="login-btn">
        <a href="CommitteeCreateUserPanel.aspx">Create Panel</a>
    </div>
    <br /><br />
    <div class="login-btn">
        <a href="CommitteeCreateUserSupervisor.aspx">Create Supervisor</a>
    </div>
    <br /><br />
    <div class="login-btn">
        <a href="CommitteeCreateUserStudent.aspx">Create Student</a>
    </div>
    <br/><br/><br/><br/>
</asp:Content>

