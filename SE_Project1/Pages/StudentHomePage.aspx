<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/StudentLayout.Master" AutoEventWireup="true" CodeBehind="StudentHomePage.aspx.cs" Inherits="SE_Project1.Pages.StudentHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        .warning{
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br/>
    <h2>Student Homepage</h2>

    <p>
        <strong>ID:</strong> <asp:Label ID="rollNo" runat="server"></asp:Label>
    </p>
    <p>
        <strong>Name:</strong> <asp:Label ID="fullName" runat="server"></asp:Label>
    </p>
    <p>
        <strong>Department:</strong> <asp:Label ID="dep" runat="server"></asp:Label>
    </p>
    <p>
        <strong>Grade For FYP-1:</strong> <asp:Label ID="grade" runat="server"></asp:Label>
    </p>
    <p> <strong>Active Session:</strong>  Spring 2024 </p>

</asp:Content>
