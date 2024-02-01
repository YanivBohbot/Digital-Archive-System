namespace iRoads.DigitalArchive.Entities.Site
{
    public class Roles : BaseSite
    {
        public Roles() { }
        public virtual int Code { get; set; }
        public virtual string Description { get; set; }
        public virtual Menus Menus { get; set; }
    }
}
