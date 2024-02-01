using System.ComponentModel.DataAnnotations;

namespace iRoads.DigitalArchive.Models.Query
{
    public class LoginQuery
    {
        [Required]
        public string UserId { get; set; }
        [Required]
        public string Password { get; set; }
    }
}
