using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{


    public class EmailAddressesMap : BaseEntityCreateMapping<EmailAddresses>
    {

        public EmailAddressesMap()
        {
            Table("EmailAddresses");
            Id(x => x.Id).GeneratedBy.Assigned().Column("Id");
            Map(x => x.EmailKey).Column("EmailKey");
            Map(x => x.Email).Column("Email");
            Map(x => x.ControlManagerCode).Column("ControlManagerCode");
        }
    }
}
