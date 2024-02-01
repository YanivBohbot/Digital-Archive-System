using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class DesignatedSpaceMap : BaseLookupMapping<DesignatedSpace> {
        
        public DesignatedSpaceMap(): base("DesignatedSpace") {
			
        }
    }
}
