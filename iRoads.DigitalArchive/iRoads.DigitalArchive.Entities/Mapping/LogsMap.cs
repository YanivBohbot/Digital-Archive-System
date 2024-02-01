using iRoads.DigitalArchive.Entities.Site;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class LogsMap : EntityBaseMap<Logs> {
        
        public LogsMap() {
			Schema("Site");
			Table("Logs");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.DateHour).Column("DateHour").Not.Nullable();
			Map(x => x.UserName).Column("UserName").Not.Nullable();
			Map(x => x.ActionCode).Column("ActionCode").Not.Nullable();
			Map(x => x.Source).Column("Source").Not.Nullable();
			Map(x => x.TableName).Column("TableName");
			Map(x => x.FieldName).Column("FieldName");
			Map(x => x.OldValue).Column("OldValue");
			Map(x => x.NewValue).Column("NewValue");
			Map(x => x.ErrorMessage).Column("ErrorMessage");
			Map(x => x.InputService).Column("InputService");
			Map(x => x.OutputeService).Column("OutputeService");
        }
    }
}
