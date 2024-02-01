using System;
using System.Collections.Generic;
using System.Text;
using iRoads.DigitalArchive.Models.Query;

namespace iRoads.DigitalArchive.Models.Command
{
    public class GenerateReportCommand : BaseQuery
    {
        public string MamapUserName { get; set; }
    }
}
