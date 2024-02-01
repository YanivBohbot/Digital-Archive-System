using iRoads.DigitalArchive.Entities.Lookup;
using Ness.Framework.Entities.Dbo;
using System;

namespace iRoads.DigitalArchive.Entities.Dbo
{
    public class Taskschedular : EntityBase
    {
        public virtual int TaskTypeCode { get; set; }
        public virtual Tasktypes TaskTypes { get; set; }
        public virtual DateTime NextRunTime { get; set; }
        public virtual DateTime? LastRunTime { get; set; }
        public virtual string Error { get; set; }
        public virtual string Params { get; set; }
        public virtual int TaskState { get; set; }
        public virtual bool TaskStatus { get; set; }
        public virtual byte? SortOrder { get; set; }
    }
}
