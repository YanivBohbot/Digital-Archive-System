using iRoads.DigitalArchive.Entities.Site;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class MenusMap : BaseSiteMapping<Menus>
    {
        public MenusMap()
        {
            Table("Menus");
            LazyLoad();
            Id(x => x.Code).GeneratedBy.Assigned().Column("Code");
            Map(x => x.Description).Column("Description").Not.Nullable();

        }
    }
}
