<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeManageSupervisorWorkload.aspx.cs" Inherits="SE_Project1.Pages.CommitteeManageSupervisorWorkload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        .details-btn {
            background-color: #2b2828; 
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 50%;
            border-radius: 4px;
            font-size: 18px;
            font-family: Georgia, 'Times New Roman', Times, serif
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2><strong>Manage Supervisor Workload</strong></h2>
    <p>Let's make sure no supervisor has more than 6 FYP's to manage!</p>
    <asp:GridView ID="GridViewSupervisor" runat="server" AutoGenerateColumns="False" Visible="true" OnRowCommand="view_supervisor_projects_onBtnClick">
        <Columns>
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="NumProjects" HeaderText="Number of Projects" SortExpression="NumProjects" />         
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="View Supervisors Projects"/>
        </Columns>
    </asp:GridView>

    <br />
    <p><strong>Current projects of Supervisor:</strong></p>
    <asp:GridView ID="GridViewSupervises" runat="server" AutoGenerateColumns="False" Visible="false" OnRowCommand="project_selected_toBeRemoved_btn">
        <Columns>
            <asp:BoundField DataField="fyp_id" HeaderText="Project ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="coSup" HeaderText="Co-Supervisor on Project" SortExpression="NumProjects" />         
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Remove"/>
        </Columns>
    </asp:GridView>

    <br />
    <p><strong>Reassign to which supervisor?</strong></p>
    <asp:GridView ID="GridViewSupervisorLessThan6Projects" runat="server" AutoGenerateColumns="False" Visible="false" ShowHeaderWhenEmpty="true" OnRowCommand="select_newSupervisor_toReAssignProject_btn">
        <Columns>
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="NumProjects" HeaderText="Number of Projects" SortExpression="NumProjects" />         
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="ReAssign"/>
        </Columns>
    </asp:GridView>
    <br/><br/>
    <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br/><br /><br />
</asp:Content>
