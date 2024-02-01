using iRoads.DigitalArchive.Entities.Lookup;
using Ness.Framework.Entities.Dbo;
using System;

namespace iRoads.DigitalArchive.Entities.Dbo
{
    public class Taskjobs : EntityBase
    {
        public virtual int Id { get; set; }
        public virtual int TaskTypeCode { get; set; }
        public virtual Tasktypes TaskTypes { get; set; }
        public virtual int? Num { get; set; }
        public virtual int? NumEnd { get; set; }
        public virtual decimal? Total { get; set; }
        public virtual decimal? TotalEnd { get; set; }
        public virtual string Value { get; set; }
        public virtual string Description { get; set; }
        public virtual DateTime? TDate { get; set; }
        public virtual DateTime? TDateEnd { get; set; }
        public virtual string Params { get; set; }
        public virtual int TaskState { get; set; }
        public virtual string Error { get; set; }
        public virtual byte? SortOrder { get; set; }
        #region NHibernate Composite Key Requirements
        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            var t = obj as Taskjobs;
            if (t == null) return false;
            if (Id == t.Id
             && TaskTypeCode == t.TaskTypeCode)
                return true;

            return false;
        }
        public override int GetHashCode()
        {
            int hash = GetType().GetHashCode();
            hash = (hash * 397) ^ Id.GetHashCode();
            hash = (hash * 397) ^ TaskTypeCode.GetHashCode();

            return hash;
        }
        #endregion
    }
}
