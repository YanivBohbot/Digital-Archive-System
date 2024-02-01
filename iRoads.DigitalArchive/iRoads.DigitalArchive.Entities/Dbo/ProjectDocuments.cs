using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class ProjectDocuments : EntityCreateBase
    {
        public ProjectDocuments() { }
        public virtual int Id { get; set; }
        public virtual string SourceDocId { get; set; }
        public virtual string ProjectId { get; set; }
        public virtual int LevelCode { get; set; }
        public virtual string Contract { get; set; }
        public virtual string DocType { get; set; }
        public virtual string DocName { get; set; }
        public virtual string Discipline { get; set; }
        public virtual string Element { get; set; }
        public virtual string AttachedProcess { get; set; }
        public virtual DateTime? AttachedDate { get; set; }
        public virtual string AttachedBy { get; set; }
        public virtual int? DocumentStatusCode { get; set; }
        public virtual int? ReasonRejectCode { get; set; }
        public virtual string ControlComments { get; set; }
        public virtual DateTime? ControlDate { get; set; }
        public virtual string ControlerName { get; set; }
        public virtual string ManhapComments { get; set; }
        public virtual DateTime? ManhapDate { get; set; }
    }
}
