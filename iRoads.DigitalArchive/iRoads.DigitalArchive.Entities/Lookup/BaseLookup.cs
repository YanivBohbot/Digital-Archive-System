using System;

namespace iRoads.DigitalArchive.Entities.Lookup
{
    public class BaseLookup
    {
        public virtual int Code { get; set; }
        public virtual string Description { get; set; }
        public virtual DateTime UpdateDate { get; set; }
        public virtual bool IsRowDeleted { get; set; }
    }
}
