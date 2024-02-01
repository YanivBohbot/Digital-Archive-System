using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class ProjectTypeClassification: EntityBase
    {
        public virtual int ClassificationCode { get; set; }
        public virtual int ProjectTypeCode { get; set; }
        #region NHibernate Composite Key Requirements
        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            var t = obj as ProjectTypeClassification;
            if (t == null) return false;
            if (ClassificationCode == t.ClassificationCode
             && ProjectTypeCode == t.ProjectTypeCode)
                return true;

            return false;
        }
        public override int GetHashCode()
        {
            int hash = GetType().GetHashCode();
            hash = (hash * 397) ^ ClassificationCode.GetHashCode();
            hash = (hash * 397) ^ ProjectTypeCode.GetHashCode();

            return hash;
        }
        #endregion
    }

}
