using Ness.Framework.Models.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ConfigModel : BaseModel
    {
        public virtual string Id { get; set; }
        public virtual string Value { get; set; }
        public virtual string Description { get; set; }
        public virtual byte App { get; set; }
        public virtual byte? SortOrder { get; set; }
    }
}
