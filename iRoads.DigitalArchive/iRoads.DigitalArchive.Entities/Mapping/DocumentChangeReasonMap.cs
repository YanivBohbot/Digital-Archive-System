using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class DocumentChangeReasonMap : BaseLookupMapping<DocumentChangeReason> {
        
        public DocumentChangeReasonMap() : base("DocumentChangeReason")
        {

        }
    }
}
