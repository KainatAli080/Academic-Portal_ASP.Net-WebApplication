<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/StudentLayout.Master" AutoEventWireup="true" CodeBehind="StudentViewFYPGroupDetails.aspx.cs" Inherits="SE_Project1.Pages.StudentViewFYPGroupDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h2>FYP Group Details:</h2>
    <br />
    <p><strong>Group Member 1:</strong></p>
    <label for="groupMember1ID">ID: </label>
    <asp:Label ID="g1ID" runat="server"/>
    <br />
    <label for="groupMember1Name">Name:</label>
    <asp:Label ID="g1Name" runat="server"/>
    <br />
    <label for="groupMember1Dep">Department: </label>
    <asp:Label ID="g1Dep" runat="server"/>
    <br /><br />

    <p><strong>Group Member 2:</strong></p>
    <label for="groupMember2ID">ID: </label>
    <asp:Label ID="g2ID" runat="server"/>
    <br />
    <label for="groupMember2Name">Name:</label>
    <asp:Label ID="g2Name" runat="server"/>
    <br />
    <label for="groupMember2Dep">Department: </label>
    <asp:Label ID="g2Dep" runat="server"/>
    <br/><br />

    <p><strong>Group Member 3:</strong></p>
    <label for="groupMember3ID">ID: </label>
    <asp:Label ID="g3ID" runat="server"/>
    <br />
    <label for="groupMember3Name">Name:</label>
    <asp:Label ID="g3Name" runat="server"/>
    <br />
    <label for="groupMember3Dep">Department: </label>
    <asp:Label ID="g3Dep" runat="server"/>
    <br /><br />

    <p><strong>FYP Supervisor Description</strong></p>
    <label for="supervisor">Supervisor:</label>
    <asp:Label ID="supervisorName" runat="server" />
    <br />

    <label for="coSupervisor">Co-Supervisor:</label>
    <asp:Label ID="coSupervisorName" runat="server" />
    <br /><br />

    <br />
    <br/><br/><br/><br/>

</asp:Content>
