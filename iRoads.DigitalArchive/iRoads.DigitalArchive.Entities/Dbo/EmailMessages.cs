using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class EmailMessages : EntityBase{
        public virtual int Id { get; set; }
        public virtual string Subject { get; set; }
        public virtual string Body { get; set; }
    }
}
