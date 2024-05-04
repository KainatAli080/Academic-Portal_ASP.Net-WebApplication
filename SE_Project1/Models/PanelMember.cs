using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SE_Project1.Models
{
    public class PanelMember
    {
        private string panelID;
        private string memberID;

        public PanelMember(string panelID = "", string memberID = "")
        {
            this.panelID = panelID;
            this.memberID = memberID;
        }

        // ------------------------------------------------------------ //
        // --------------- Getters and Setters ------------------------ //
        // ------------------------------------------------------------ //

        public string getPanelID () { return panelID; } 
        public string getMemberID () { return memberID; } 

        public void SetPanelID(string panelID) {  this.panelID = panelID; }
        public void SetMemberID(string memID) {  this.memberID = memID; }

        // ------------------------------------------------------------ //
        // --------------------- DB Handling -------------------------- //
        // ------------------------------------------------------------ //

        public string getMyPanel(string ID)
        {
            DBHandlerPanel dBHandlerPanel = new DBHandlerPanel();
            string panelID = dBHandlerPanel.getMyPanelID(ID);
            return panelID; 
        }

    }
}