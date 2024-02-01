using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class ClassificationBusinessLevelsDocumentsTypes : EntityCreateBase
    {
        public virtual int Id { get; set; }
        public virtual int ClassificationBusinessLevelsCode { get; set; }
        public virtual string DocType { get; set; }
        
    }
}
