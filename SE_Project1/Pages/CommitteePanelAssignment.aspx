<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CommitteeLayout.Master" AutoEventWireup="true" CodeBehind="CommitteePanelAssignment.aspx.cs" Inherits="SE_Project1.Pages.CommitteePanelAssignment" %>

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
    <h2><strong>Assign FYP Groups to Panel</strong></h2>

    <p><strong>Enter ID's of Panel and FYP Group to connect.</strong></p>

    <label for="panelID">Panel ID:&nbsp</label><br />
    <small><small>(ID of Panel to Assign FYP to)</small></small>
    <br />
    <asp:TextBox ID="panelID" runat="server" CssClass="text-box"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="panelID"
                                ErrorMessage="Panel ID is required" Display="Dynamic" CssClass="error-message" />
    <br /><br />
    
    <label for="FYPgroupID">Select FYP Group to Assign to Chosen Panel:</label> <br/>
    <br />
    <asp:GridView ID="GridViewFYPGroups" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="selectGroup" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox_CheckedIfChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Group_ID" HeaderText="Group ID" SortExpression="Group_ID" />
            <asp:BoundField DataField="Group_Member1" HeaderText="Group Member 1" SortExpression="Group Member 1" />
            <asp:BoundField DataField="Group_Member2" HeaderText="Group Member 2" SortExpression="Group Member 2" />
            <asp:BoundField DataField="Group_Member3" HeaderText="Group Member 3" SortExpression="Group Member 3" />         
        </Columns>
    </asp:GridView>

    <br /><br />
    <asp:Button ID="assignBtn" runat="server" Text="Assign FYP To Panel" CssClass="submit-btn" onClick="assignFYPToPanel"/>
    <asp:Label ID="warningMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <br /><br />
</asp:Content>
