using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ProjectDocumentsMap : BaseEntityCreateMapping<ProjectDocuments> {
        
        public ProjectDocumentsMap() {
			Table("ProjectDocuments");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.SourceDocId).Column("SourceDocId");
			Map(x => x.ProjectId).Column("ProjectId").Not.Nullable();
			Map(x => x.LevelCode).Column("LevelCode").Not.Nullable();
			Map(x => x.Contract).Column("Contract");
			Map(x => x.DocType).Column("DocType");
			Map(x => x.DocName).Column("DocName");
			Map(x => x.Discipline).Column("Discipline");
			Map(x => x.Element).Column("Element");
			Map(x => x.AttachedProcess).Column("AttachedProcess");
			Map(x => x.AttachedDate).Column("AttachedDate");
			Map(x => x.AttachedBy).Column("AttachedBy");
			Map(x => x.DocumentStatusCode).Column("DocumentStatusCode").Nullable();
			Map(x => x.ReasonRejectCode).Column("ReasonRejectCode");
			Map(x => x.ControlComments).Column("ControlComments");
			Map(x => x.ControlDate).Column("ControlDate");
			Map(x => x.ControlerName).Column("ControlerName");
			Map(x => x.ManhapComments).Column("ManhapComments");
			Map(x => x.ManhapDate).Column("ManhapDate");
        }
    }
}
