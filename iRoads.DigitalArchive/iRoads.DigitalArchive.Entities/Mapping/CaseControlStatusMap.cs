using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Lookup;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class CaseControlStatusMap : BaseLookupMapping<CaseControlStatus> {
        
        public CaseControlStatusMap() : base("CaseControlStatus")
        {

        }
    }
}
