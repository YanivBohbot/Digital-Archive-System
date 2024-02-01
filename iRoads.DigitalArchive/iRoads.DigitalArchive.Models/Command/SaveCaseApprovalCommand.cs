using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveCaseApprovalCommand : BaseCommand
    {

        public string ProjectID { get; set; }
        public int CaseControlStatusCode { get; set; }
        public string UserName { get; set; }
        

    }
}
