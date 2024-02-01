using System;


namespace iRoads.DigitalArchive.Entities.Site
{
    public class Menus : BaseSite
    {
        public Menus() { }
        public virtual int Code { get; set; }
        public virtual string Description { get; set; }
        public virtual DateTime Updatedate { get; set; }
        public virtual bool Isrowdeleted { get; set; }
        public virtual string Apicontroller { get; set; }
    }
}
