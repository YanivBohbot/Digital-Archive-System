using System;
using Ness.Framework.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class SoaBusinessLevel : EntityBase{
        public virtual string ProjectId { get; set; }
        public virtual int Id { get; set; }
        public virtual int LevelCode { get; set; }
        public virtual string Contract { get; set; }
        public virtual DateTime StartLevelDate { get; set; }
        public virtual int StatusLevelCode { get; set; }
        public virtual string ManagementStatus { get; set; }
        public virtual string Error { get; set; }
        public virtual string IV_CCRN { get; set; }
        public virtual bool FromInterface { get; set; }
    }
}
