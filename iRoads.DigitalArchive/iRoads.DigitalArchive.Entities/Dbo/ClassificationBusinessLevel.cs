using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class ClassificationBusinessLevel : EntityCreateBase
    {
        public virtual int Id { get; set; }
        public virtual int? ClassificationCode { get; set; }
        public virtual int? LevelCode { get; set; }
    }
}
