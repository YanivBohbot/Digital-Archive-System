using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ProjectDocumentsModel:BaseModel
    {
        public int Id { get; set; }
        public string SourceDocId { get; set; }
        public string ProjectId { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
        public string DocumentType { get; set; }
        public string DocumentName { get; set; }
        public string Discipline { get; set; }
        public string Element { get; set; }
        public string AttachedProcess { get; set; }
        public DateTime? AttachedDate { get; set; }
        public string AttachedBy { get; set; }
        public int? DocStatusCode { get; set; }
        public int? ReasonRejectCode { get; set; }
        public string ControlComments { get; set; }
        public DateTime? ControlDate { get; set; }
        public string ControlerName { get; set; }
        public string ManhapComments { get; set; }
        public DateTime ManhapDate { get; set; }
    }
}
