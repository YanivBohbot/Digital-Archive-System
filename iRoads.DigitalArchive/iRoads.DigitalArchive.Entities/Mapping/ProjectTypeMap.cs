using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ProjectTypeMap : BaseLookupMapping<ProjectType> {
        
        public ProjectTypeMap() : base("ProjectType")
        {

        }
    }
}
