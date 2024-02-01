using System;

namespace iRoads.DigitalArchive.Models.Model
{
    public class TaskJob
    {
        public virtual int Id { get; set; }
        public virtual int TaskTypeCode { get; set; }
        public virtual int? Num { get; set; }
        public virtual int? NumEnd { get; set; }
        public virtual decimal? Total { get; set; }
        public virtual decimal? TotalEnd { get; set; }
        public virtual string Value { get; set; }
        public virtual string Description { get; set; }
        public virtual DateTime? TDate { get; set; }
        public virtual DateTime? TDateEnd { get; set; }
        public virtual string Params { get; set; }
    }
}
