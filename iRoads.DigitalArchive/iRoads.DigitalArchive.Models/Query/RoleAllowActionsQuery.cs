using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Query
{
    public class RoleAllowActionsQuery:BaseQuery
    {
        public string ProjectID { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
    }
}
