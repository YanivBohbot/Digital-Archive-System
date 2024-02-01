using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class HistoryMap : BaseEntityCreateMapping<History> {
        
        public HistoryMap() {
			Table("History");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.ProjectDocId).Column("ProjectDocId").Not.Nullable();
			Map(x => x.ChangeReasonCode).Column("ChangeReasonCode").Not.Nullable();
			Map(x => x.ControlStatus).Column("ControlStatus");
			Map(x => x.RejectReasonCode).Column("RejectReasonCode");
			Map(x => x.ControlComments).Column("ControlComments");
			Map(x => x.ManhapComments).Column("ManhapComments");
			Map(x => x.UpdatedBy).Column("UpdatedBy");
            

        }
    }
}
