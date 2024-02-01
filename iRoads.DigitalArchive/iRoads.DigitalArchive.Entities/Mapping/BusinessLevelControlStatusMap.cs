using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class BusinessLevelControlStatusMap : BaseLookupMapping<BusinessLevelControlStatus> {
        
        public BusinessLevelControlStatusMap() : base("BusinessLevelControlStatus")
        {

        }
    }
}
