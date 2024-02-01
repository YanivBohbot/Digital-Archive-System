using Ness.Framework.Razor.Models.Email;

namespace iRoads.DigitalArchive.Razor.Models.Email
{
    public class ResetPassword : BaseEmail
    {
        public ResetPassword()
        {
            //Template FileName
            Template = "ResetPassword.cshtml";
            //Template Title
            Title = "הודעה על איפוס סיסמה";
            //Email Subject
            Subject = "איפוס סיסמה";
        }
        public virtual string NewPassword { get; set; }
    }
}
