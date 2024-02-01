using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class Permissions : EntityCreateBase
    {
        public virtual int Id { get; set; }
        public virtual int? RoleCode { get; set; }
        public virtual int? ActionCode { get; set; }
    }
}
