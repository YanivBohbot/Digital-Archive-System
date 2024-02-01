
using iRoads.DigitalArchive.Entities.Dbo;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class EmailMessagesMap : EntityBaseMap<EmailMessages> {
        
        public EmailMessagesMap() {
			Table("EmailMessages");
			Id(x => x.Id).GeneratedBy.Assigned().Column("Id");
			Map(x => x.Subject).Column("Subject").Not.Nullable();
			Map(x => x.Body).Column("Body").Not.Nullable();
        }
    }
}
