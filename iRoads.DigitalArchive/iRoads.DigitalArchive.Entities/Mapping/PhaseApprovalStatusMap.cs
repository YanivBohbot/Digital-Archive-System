using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class PhaseApprovalStatusMap : BaseLookupMapping<PhaseApprovalStatus> {
        
        public PhaseApprovalStatusMap() : base("PhaseApprovalStatus")
        {

        }
    }
}
