using System;

namespace iRoads.DigitalArchive.Models.Model
{
    public class DocumentModel :BaseModel
    {
        public int? DocId { get; set; }
        public string SourceDocId { get; set; }
        public int LevelCode { get; set; }
        public string Type { get; set; }
        public string URL { get; set; }
        public string WBS { get; set; }
        public string AttachedProcess { get; set; }
        public DateTime? AttachedDate { get; set; }
        public string AttachedBy { get; set; }
        public string DocSubject { get; set; }
        public string Info { get; set; }
        public string Discipline { get; set; }
        public string Element { get; set; }
        //public DateTime Date { get; set; }
        //public string User { get; set; }
        public string SogBakara { get; set; }
        public int? DocStatusCode { get; set; }
        public string DocStatusDesc { get; set; }
        public int? ReasonRejectCode { get; set; }
        public string ReasonRejectDesc { get; set; }
        public string ControlComments { get; set; }
        public DateTime? ControlDate { get; set; }
        public string ControlerName { get; set; }
        public string ManhapComments { get; set; }
        public string FileName { get; set; }

    }
}
