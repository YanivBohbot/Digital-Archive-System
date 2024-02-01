using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class DedicatedDepartmentsManagementMap : BaseLookupMapping<DedicatedDepartmentsManagement> {
        
        public DedicatedDepartmentsManagementMap() : base("DedicatedDepartmentsManagement")
        {

        }
    }
}
