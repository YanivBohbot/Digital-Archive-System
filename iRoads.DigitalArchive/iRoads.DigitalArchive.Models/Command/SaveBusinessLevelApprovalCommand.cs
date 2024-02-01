using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveBusinessLevelApprovalCommand : BaseCommand
    {

        public string ProjectID { get; set; }
        public int LevelCode { get; set; }
        public string Contracts { get; set; }

    }
}
