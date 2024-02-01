using iRoads.DigitalArchive.Entities.Lookup;
using Ness.Framework.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Dbo
{
    public class Tasktriggers : EntityBase
    {
        public virtual int TaskTypeCode { get; set; }
        public virtual int DayOfWeek { get; set; }
        public virtual string StartHour { get; set; }
        public virtual string EndHour { get; set; }
        public virtual Tasktypes TaskTypes { get; set; }
        public virtual byte? SortOrder { get; set; }
        #region NHibernate Composite Key Requirements
        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            var t = obj as Tasktriggers;
            if (t == null) return false;
            if (TaskTypeCode == t.TaskTypeCode
             && DayOfWeek == t.DayOfWeek
             && StartHour == t.StartHour
             && EndHour == t.EndHour)
                return true;

            return false;
        }
        public override int GetHashCode()
        {
            int hash = GetType().GetHashCode();
            hash = (hash * 397) ^ TaskTypeCode.GetHashCode();
            hash = (hash * 397) ^ DayOfWeek.GetHashCode();
            hash = (hash * 397) ^ StartHour.GetHashCode();
            hash = (hash * 397) ^ EndHour.GetHashCode();

            return hash;
        }
        #endregion
    }
}
