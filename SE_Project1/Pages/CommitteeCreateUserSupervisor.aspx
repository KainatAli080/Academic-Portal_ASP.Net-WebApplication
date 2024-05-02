<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeCreateUserSupervisor.aspx.cs" Inherits="SE_Project1.Pages.CommitteeCreateUserSupervisor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        .createPanel-btn {
            background-color: #2b2828; 
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            width: 30%;
            border-radius: 4px;
            font-size: 18px;
            font-family: Georgia, 'Times New Roman', Times, serif
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2><strong>Create New Supervisor</strong></h2>
    <p>Select only 1 faculty member to make them a supervisor.</p>


    <asp:GridView ID="GridViewFaculty" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="checkToSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Faculty_ID" HeaderText="ID" SortExpression="FacultyID" />
            <asp:BoundField DataField="Fname" HeaderText="First Name" SortExpression="First Name" />
            <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Last Name" />
            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="Department" />         
        </Columns>
    </asp:GridView>
    <asp:Label ID="emptyTableWarning" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br />
    <asp:Button ID="btnCreateSupervisor" runat="server" Text="Create Supervisor" OnClick="btnCreateSupervisor_Click" CssClass="createPanel-btn"/>
    <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br/><br/><br/><br/><br/><br/><br/><br/>
</asp:Content>

