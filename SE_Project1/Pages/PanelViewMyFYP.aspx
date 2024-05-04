<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/PanelLayout.Master" AutoEventWireup="true" CodeBehind="PanelViewMyFYP.aspx.cs" Inherits="SE_Project1.Pages.PanelViewMyFYP" %>
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

        .login-btn {
            background-color: #252323; /* Green */
            color: white;
            padding: 5px;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 10%;
            height:auto;
            border-radius: 4px;
            font-size: 17px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2><strong>My FYP Groups</strong></h2>

    <p>
        Input Group Member ID:
        <asp:TextBox runat="server" ID="groupTosearchFor" CssClass="text-box" />
        <asp:Button ID="btnStartSearch" runat="server" Text="search" OnClick="btnStartSearching" CssClass="login-btn"/>
    </p>

    <asp:GridView ID="GridViewMyStudents" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewMyStudentsData_RowCommand" Visible="true">
        <Columns>
            <asp:BoundField DataField="Group_ID" HeaderText=" Group ID " />
            <asp:BoundField DataField="Group_Member1" HeaderText=" Group Member 1 " />
            <asp:BoundField DataField="Group_Member2" HeaderText=" Group Member 2 " />
            <asp:BoundField DataField="Group_Member3" HeaderText=" Group Member 3 " />
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="View Details" />
        </Columns>
    </asp:GridView>

    <br />
    <p><strong>Project Details</strong></p>
    <p>
        <label for="projectTitle">Project ID: </label>
        <asp:Label ID="projectID" runat="server"/>
        <br />
        <label for="projectTitle">Project Title:</label>
        <asp:Label ID="projectTitle" runat="server"/>
    </p>
    <br /><br />

    <p><strong>Group Members Details</strong></p>
    <label for="groupMember1">ID Group Member 1: </label>
    <asp:Label ID="groupMember1" runat="server"/>
    <br />
    <label for="groupMember2">ID Group Member 2: </label>
    <asp:Label ID="groupMember2" runat="server"/>
    <br/>
    <label for="groupMember3">ID Group Member 3: </label>
    <asp:Label ID="groupMember3" runat="server"/>
    <br /><br />

    <p><strong>FYP Supervisor Description</strong></p>
    <label for="supervisor">Supervisor:</label>
    <asp:Label ID="supervisor" runat="server" />
    <br />

    <label for="coSupervisor">Co-Supervisor:</label>
    <asp:Label ID="coSupervisor" runat="server" />
    <br /><br />

    <br />
    <br/><br/><br/><br/>

</asp:Content>
