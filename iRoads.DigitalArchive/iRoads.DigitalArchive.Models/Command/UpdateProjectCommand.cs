using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class UpdateProjectCommand : BaseCommand
    {
        public string ProjectID { get; set; }
        public string GeneralNote { get; set; }
        public string ControlManager { get; set; }
        public string Merchav_Agaf { get; set; }
    }
}
