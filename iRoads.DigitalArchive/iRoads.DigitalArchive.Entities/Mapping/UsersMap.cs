using iRoads.DigitalArchive.Entities.Site;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class UsersMap : BaseSiteMapping<Users>
    {
        public UsersMap()
        {
            Table("Users");
            LazyLoad();
            Id(x => x.UserId).GeneratedBy.Identity().Column("UserId");
            Map(x => x.RoleCode).Column("RoleCode");
            Map(x => x.DefaultMenuCode).Column("DefaultMenuCode");
            Map(x => x.UserName).Column("UserName").Not.Nullable();
            Map(x => x.Password).Column("Password").Not.Nullable();
            Map(x => x.Salt).Column("Salt").Not.Nullable();
            Map(x => x.FullName).Column("FullName").Not.Nullable();
            Map(x => x.Email).Column("Email");
            Map(x => x.Phone).Column("Phone");
            Map(x => x.UpdateUser).Column("UpdateUser").Not.Nullable();
        }
    }
}
