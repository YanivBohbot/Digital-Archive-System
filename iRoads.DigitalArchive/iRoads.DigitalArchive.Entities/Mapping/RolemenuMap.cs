using iRoads.DigitalArchive.Entities.Site;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class RolemenuMap : BaseSiteMapping<Rolemenu>
    {

        public RolemenuMap()
        {
            Table("RoleMenu");
            LazyLoad();
            CompositeId().KeyProperty(x => x.RoleCode, "RoleCode")
                         .KeyProperty(x => x.MenuCode, "MenuCode");

        }
    }
}
