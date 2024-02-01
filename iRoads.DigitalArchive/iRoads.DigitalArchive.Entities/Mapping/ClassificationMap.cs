using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ClassificationMap : BaseLookupMapping<Classification> {
        
        public ClassificationMap() : base("Classification")
        {

        }
    }
}
