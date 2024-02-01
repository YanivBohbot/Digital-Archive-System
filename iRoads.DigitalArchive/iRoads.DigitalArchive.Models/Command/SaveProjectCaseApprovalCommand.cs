using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveProjectCaseApprovalCommand : BaseCommand
    {

        public string ProjectID { get; set; }
        

    }
}
