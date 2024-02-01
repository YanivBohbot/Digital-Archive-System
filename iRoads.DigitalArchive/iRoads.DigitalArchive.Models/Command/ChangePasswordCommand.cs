namespace iRoads.DigitalArchive.Models.Command
{
    public class ChangePasswordCommand : BaseCommand
    {
        public string UserName { get; set; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public string Email { get; set; }
    }
}
