using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ClassificationBusinessLevelMap : BaseEntityCreateMapping<ClassificationBusinessLevel> {
        
        public ClassificationBusinessLevelMap() {
			Table("Classification_BusinessLevel");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.ClassificationCode).Column("ClassificationCode");
			Map(x => x.LevelCode).Column("LevelCode");
        }
    }
}
