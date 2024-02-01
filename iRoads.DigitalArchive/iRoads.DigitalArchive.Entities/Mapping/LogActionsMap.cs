using iRoads.DigitalArchive.Entities.Lookup;
using FluentNHibernate.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping
{


    public class LogActionsMap : BaseLookupMapping<LogActions> {
        
        public LogActionsMap() : base("LogActions")
        {

        }
    }
}
