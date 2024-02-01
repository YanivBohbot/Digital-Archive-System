using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Lookup;

namespace iRoads.DigitalArchive.Entities.Mapping
{


    public class BusinessLevelMap : BaseLookupMapping<BusinessLevel>
    {
        public BusinessLevelMap() : base("BusinessLevel")
        {
            Map(x => x.SoaUrl).Column("SOAUrl");
        }
    }
}
