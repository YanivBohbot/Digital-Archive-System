using Ness.Framework.Models.Command;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveSoaDocumentStatusCommand : BaseCommand
    {

        public string ProjectID { get; set; }
        public int DocumentStatusCode { get; set; }
        public string Contract { get; set; }
        public string DocId { get; set; }
        public string TableName { get; set; }


    }
}
