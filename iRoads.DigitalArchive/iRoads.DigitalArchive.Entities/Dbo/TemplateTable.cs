using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class TemplateTable : EntityCreateBase
    {
        public virtual int TemplateTableId { get; set; }
        public virtual string Field1 { get; set; }
        public virtual int? Field2 { get; set; }
    }
}
