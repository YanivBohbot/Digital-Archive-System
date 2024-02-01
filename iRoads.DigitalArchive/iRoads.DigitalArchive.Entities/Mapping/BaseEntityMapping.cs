using FluentNHibernate.Mapping;
using Ness.Framework.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class BaseEntityMapping<T> : ClassMap<T> where T : EntityBase
    {
      
        public BaseEntityMapping()
        {
            LazyLoad();
            Map(x => x.UpdateDate).Column("UpdateDate").Not.Nullable();
            Map(x => x.IsRowDeleted).Column("IsRowDeleted").Not.Nullable();
        }

    }
}
