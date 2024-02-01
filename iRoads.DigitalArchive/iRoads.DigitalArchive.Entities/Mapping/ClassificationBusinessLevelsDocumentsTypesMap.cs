using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ClassificationBusinessLevelsDocumentsTypesMap : BaseEntityCreateMapping<ClassificationBusinessLevelsDocumentsTypes> {
        
        public ClassificationBusinessLevelsDocumentsTypesMap() {
			Table("Classification_BusinessLevels_DocumentsTypes");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.ClassificationBusinessLevelsCode).Column("ClassificationBusinessLevelsCode");
			Map(x => x.DocType).Column("DocType");
        }
    }
}
