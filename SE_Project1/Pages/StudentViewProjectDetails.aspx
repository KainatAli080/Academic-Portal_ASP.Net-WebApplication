<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/StudentLayout.Master" AutoEventWireup="true" CodeBehind="StudentViewProjectDetails.aspx.cs" Inherits="SE_Project1.Pages.StudentViewProjectDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2><strong>Project Details</strong></h2>
    <p>
        <b><label for="projectID">Project ID: </label></b>
        <asp:Label ID="projectID" runat="server"/>
        <br />
        <b><label for="projectTitle">Project Title:</label></b>
        <asp:Label ID="projectTitle" runat="server"/>
    </p>
    <br /><br />

</asp:Content>
