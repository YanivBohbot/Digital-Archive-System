using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class RolesMap : BaseLookupMapping<Roles> {
        
        public RolesMap() : base("Roles")
        {

        }
    }
}
