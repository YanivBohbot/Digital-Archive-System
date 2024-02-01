using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class DocumentTypesMap : BaseLookupMapping<DocumentTypes> {
        
        public DocumentTypesMap() : base("DocumentTypes")
        {

        }
    }
}
