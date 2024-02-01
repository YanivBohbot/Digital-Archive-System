namespace iRoads.DigitalArchive.Entities.Site
{
    public class Users : BaseSite
    {
        public virtual int UserId { get; set; }
        public virtual string UserName { get; set; }
        public virtual string Password { get; set; }
        public virtual string Salt { get; set; }
        public virtual string FullName { get; set; }
        public virtual string Email { get; set; }
        public virtual string Phone { get; set; }
        public virtual int RoleCode { get; set; }
        public virtual int UpdateUser { get; set; }
        public virtual int? DefaultMenuCode { get; set; }
    }
}
