using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class UserActionsMap : BaseLookupMapping<UserActions> {
        
        public UserActionsMap() : base("UserActions")
        {

        }
    }
}
