using Ness.Framework.Razor.Models.Email;

namespace iRoads.DigitalArchive.Razor.Models.Email
{
    public class TestMail : BaseEmail
    {
        public TestMail()
        {
            Template = "TestTemplate.cshtml";
            Title = "הודעה על בדיקת שליחת מייל במערכת";
            Subject = "בדיקת שליחת מייל";
        }

    }
}
