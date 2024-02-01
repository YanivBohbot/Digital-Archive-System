using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class TemplateTableMap : BaseEntityCreateMapping<TemplateTable> {
        
        public TemplateTableMap() {
			Table("TemplateTable");
			Id(x => x.TemplateTableId).GeneratedBy.Identity().Column("TemplateTableID");
			Map(x => x.Field1).Column("Field1");
			Map(x => x.Field2).Column("Field2");
        }
    }
}
