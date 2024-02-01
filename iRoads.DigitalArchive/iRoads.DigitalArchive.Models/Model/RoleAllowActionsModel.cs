using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class RoleAllowActionsModel:BaseModel
    {
        public List<ActionModel> AllowActions { get; set; }
    }
    public class ActionModel
    {
        public int Code { get; set; }
        public string Description { get; set; }
    }
}
