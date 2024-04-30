<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeCreateUserStudent.aspx.cs" Inherits="SE_Project1.Pages.CommitteeCreateUserStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        .text-box {
            width: 30%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        .submit-btn {
            background-color: #2b2727;
            color: white;
            padding: 0px;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 40%;
            height: 40px;
            border-radius: 4px;
            font-size: 18px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            text-align: center;
        }
        /*.submit-btn a {
            text-align: center;
            color: white;
            text-decoration: none;
            display: block;
            padding: 14px 20px;
            font-size: 15px;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }*/
        .error-message {
            color: red;
            font-size: 0.8em;
        }
        .white-data{
            color:white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2><strong>Create New FYP Project</strong></h2>
    
    <p><strong>FYP Project Description</strong></p>
    <label for="projectTitle">Project ID:</label><br />
    <asp:TextBox ID="projectID" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="projectID"
                                ErrorMessage="Project ID is required" Display="Dynamic" CssClass="error-message" />
    <br />
    <label for="projectTitle">Project Title:</label><br />
    <asp:TextBox ID="projectTitle" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="projectTitleCheck" runat="server" ControlToValidate="projectTitle"
                                ErrorMessage="Project Title is required" Display="Dynamic" CssClass="error-message" />
    <br /><br />

    <p><strong>Group Members Details</strong></p>
    <label for="groupMember1">ID Group Member 1</label><br />
    <asp:TextBox ID="groupMember1" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="groupMember1Check" runat="server" ControlToValidate="groupMember1"
                                ErrorMessage="Group Member 1 ID is required" Display="Dynamic" CssClass="error-message" />
    <br />
    <label for="groupMember2">ID Group Member 2</label><br />
    <asp:TextBox ID="groupMember2" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="groupMember2Check" runat="server" ControlToValidate="groupMember2"
                                ErrorMessage="Group Member 2 ID is required" Display="Dynamic" CssClass="error-message" />
    <br/>

    <label for="groupMember3">ID Group Member 3</label><br />
    <asp:TextBox ID="groupMember3" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="groupMember3Check" runat="server" ControlToValidate="groupMember3"
                            ErrorMessage="Group Member 3 ID is required" Display="Dynamic" CssClass="error-message" />
    <br /><br />

    <p><strong>FYP Supervisor Description</strong></p>
    <label for="supervisor">Supervisor:</label><br />
    <asp:TextBox ID="supervisor" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="supervisorCheck" runat="server" ControlToValidate="supervisor"
                                ErrorMessage="Supervisor is required" Display="Dynamic" CssClass="error-message" />
    <br /><br />

    <label for="coSupervisor">Co-Supervisor (optional):</label><br />
    <asp:TextBox ID="coSupervisor" runat="server" CssClass="text-box"/>
    <br /><br />

    <asp:Button ID="btnCreateProject" runat="server" Text="Create Project Group" OnClick="btnCreateProject_Click" CssClass="submit-btn" />
    <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br/><br/><br/><br/><br />
    <p class ="white-data"><small>...</small></p>
</asp:Content>
