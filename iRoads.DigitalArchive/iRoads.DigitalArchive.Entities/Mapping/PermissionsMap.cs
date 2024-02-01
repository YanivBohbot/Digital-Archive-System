using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class PermissionsMap : BaseEntityCreateMapping<Permissions> {
        
        public PermissionsMap() {
			Table("Permissions");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.RoleCode).Column("RoleCode");
			Map(x => x.ActionCode).Column("ActionCode");
        }
    }
}
