using System;
using System.Collections.Generic;
using System.Text;
using Ness.Framework.Razor.Models;
using Ness.Framework.Razor.Models.Email;

namespace iRoads.DigitalArchive.Razor.Models.Email
{
    public class EmailModel : BaseEmail
    {
        public IEnumerable<string> Attachments { get; set; }
        public IList<string> Emails { get; set; }
        public EmailModel() 
        {
            this.Attachments = new List<string>();
            this.Emails = new List<string>();
        }
       

    }
}
