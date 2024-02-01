using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class EmailAddresses : EntityCreateBase
    {
        public virtual int Id { get; set; }
        public virtual string EmailKey { get; set; }
        public virtual string Email { get; set; }
        public virtual int? ControlManagerCode { get; set; }
    }
}
