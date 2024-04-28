<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeHomepage.aspx.cs" Inherits="SE_Project1.Pages.CommitteeHomepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
    <h2>Committee Dashboard</h2>
    <p>
        <strong>Name:</strong> <asp:Label ID="CommName" runat="server"></asp:Label>
    </p>
    <p>
        <strong>ID:</strong> <asp:Label ID="CommID" runat="server"></asp:Label>
    </p>
    <p>
        <strong>Active Session:</strong> Spring 2024
    </p>
</asp:Content>