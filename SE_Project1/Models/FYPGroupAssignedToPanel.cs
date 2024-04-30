using SE_Project1.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SE_Project1.Models
{
    public class FYPGroupAssignedToPanel
    {
        private string group_ID;
        private string panel_ID;

        public FYPGroupAssignedToPanel(string groupID, string panelID)
        {
            group_ID = groupID;
            panel_ID = panelID;
        }
        // ------------------------------------------------------------ //
        // --------------- Getters and Setters ------------------------ //
        // ------------------------------------------------------------ //
        public string GetGroupID() {
            return group_ID;
        }
        public void SetGroupID(string groupID) {
            group_ID = groupID;
        }
        public string GetPanelID() {
            return panel_ID;
        }
        public void SetPanelID(string panelID) {
            panel_ID = panelID;
        }

        // ------------------------------------------------------------ //
        // --------------------- DB Handling -------------------------- //
        // ------------------------------------------------------------ //

        public bool assignGroupToFYP()
        {
            DBHandlerCommittee dBHandler = new DBHandlerCommittee();
            bool created = dBHandler.assignGroupToPanel(group_ID, panel_ID);
            return created;
        }
    }

}