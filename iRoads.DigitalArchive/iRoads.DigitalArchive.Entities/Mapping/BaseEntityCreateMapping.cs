using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Lookup;
using Ness.Framework.Entities.Dbo;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class BaseEntityCreateMapping<T> : EntityBaseMap<T> where T : EntityCreateBase
    {
     
        public BaseEntityCreateMapping()
        {
            Map(x => x.CreateDate).Column("CreateDate").Not.Nullable();
            Map(x => x.CreateUser).Column("CreateUser").Not.Nullable();
            Map(x => x.UpdateUser).Column("UpdateUser").Not.Nullable();
        }

    }
}
