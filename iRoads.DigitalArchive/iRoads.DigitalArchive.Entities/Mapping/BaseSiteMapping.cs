using iRoads.DigitalArchive.Entities.Site;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class BaseSiteMapping<T> : EntityBaseMap<T> where T : BaseSite
    {
        public BaseSiteMapping()
        {
            Schema("Site");
        }


    }
}
