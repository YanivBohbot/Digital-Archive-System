using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveLevelApprovalCommand : BaseCommand
    {

        public string ProjectID { get; set; }
        public int LevelCode { get; set; }
        public string UserName { get; set; }
        public string Contracts { get; set; }
        public virtual string IV_CCRN { get; set; }


    }
}
