using iRoads.DigitalArchive.Models.Model;

namespace iRoads.DigitalArchive.Models.Query
{
    public class BaseQuery
    {
        public User User { get; set; }
        public BaseQuery()
        {
            User = new User();
        }
    }
}
