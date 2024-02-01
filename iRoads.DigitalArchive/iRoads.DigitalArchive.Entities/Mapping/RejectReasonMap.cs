using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class RejectReasonMap : BaseLookupMapping<RejectReason> {
        
        public RejectReasonMap() : base("RejectReason")
        {

        }
    }
}
