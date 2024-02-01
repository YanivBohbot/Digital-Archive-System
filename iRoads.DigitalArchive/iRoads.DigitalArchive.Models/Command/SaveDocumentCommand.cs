using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Command
{
    public class SaveDocumentCommand:BaseCommand
    {
        public string ProjectId { get; set; }
        public int? LevelCode { get; set; }
        public string Contract { get; set; }
        public int? DocId { get; set; }
        public string SourceDocId { get; set; }
        public string ManhapComments { get; set; }
        public int? DocStatus { get; set; }
        public int? RejectReasonCode { get; set; }
        public string ControlComments { get; set; }
        public string DocType { get; set; }
        public string DocURL { get; set; }
        public string Discipline { get; set; }
    }
}
