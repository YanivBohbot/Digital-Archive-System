using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class BusinessLevelSubjectMap : BaseLookupMapping<BusinessLevelSubject> {
        
        public BusinessLevelSubjectMap() : base("BusinessLevelSubject")
        {
        Map(x => x.LevelCode).Column("LevelCode").Not.Nullable();

        }
    }
}
