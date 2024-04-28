<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteeCreateUserPanel.aspx.cs" Inherits="SE_Project1.Pages.CommitteeCreateUserPanel" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2><strong>Create New Panel</strong></h2>
    <p>Select facuty members to add to panel!</p>
    <p><small><small>(Remember! Only 6 members max per panel.)</small></small></p>

    <p>Enter Panel ID:</p>
    <asp:TextBox ID="panelID" runat="server" CssClass="text-box"/>

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
    <br />
    <asp:Button ID="btnCreatePanel" runat="server" Text="Create Panel" OnClick="btnCreatePanel_Click" CssClass="createPanel-btn"/>
    <br/>
    <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br/><br/><br/><br/><br/><br/><br/><br/>
</asp:Content>


