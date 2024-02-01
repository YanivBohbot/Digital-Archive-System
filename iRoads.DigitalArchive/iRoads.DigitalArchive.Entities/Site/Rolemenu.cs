namespace iRoads.DigitalArchive.Entities.Site
{
    public class Rolemenu : BaseSite
    {
        public virtual int RoleCode { get; set; }
        public virtual int MenuCode { get; set; }
        public virtual bool IsDefault { get; set; }
        #region NHibernate Composite Key Requirements
        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            var t = obj as Rolemenu;
            if (t == null) return false;
            if (RoleCode == t.RoleCode
             && MenuCode == t.MenuCode)
                return true;

            return false;
        }
        public override int GetHashCode()
        {
            int hash = GetType().GetHashCode();
            hash = (hash * 397) ^ RoleCode.GetHashCode();
            hash = (hash * 397) ^ MenuCode.GetHashCode();

            return hash;
        }
        #endregion
    }
}
