using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class FavoriteProjects : EntityBase
    {
        public virtual string ProjectId { get; set; }
        public virtual int LevelCode { get; set; }
        public virtual string Contract { get; set; }
        public virtual int ControlManager { get; set; }
        public virtual DateTime CreateDate { get; set; }
        public virtual string CreateUser { get; set; }
        public virtual string UpdateUser { get; set; }

    }
}
