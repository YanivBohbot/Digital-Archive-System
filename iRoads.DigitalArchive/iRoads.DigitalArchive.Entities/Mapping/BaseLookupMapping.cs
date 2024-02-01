using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Lookup;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class BaseLookupMapping<T> : ClassMap<T> where T : BaseLookup
    {
        public BaseLookupMapping()
        {
            Schema("LOOKUP");
        }
        public BaseLookupMapping(string tableName)
        {
            Schema("LOOKUP");
            Table(tableName);
            LazyLoad();
            Id(x => x.Code).GeneratedBy.Assigned().Column("Code");
            Map(x => x.Description).Column("Description").Not.Nullable();
            Map(x => x.UpdateDate).Column("UpdateDate").Not.Nullable();
            Map(x => x.IsRowDeleted).Column("IsRowDeleted").Not.Nullable();
        }

    }
}
