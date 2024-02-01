using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class TaskjobsMap : ClassMap<Taskjobs>
    {

        public TaskjobsMap()
        {
            Table("TaskJobs");
            LazyLoad();
            Id(x => x.Id).GeneratedBy.Identity().Column("Id");
            Map(x => x.TaskTypeCode).Column("TaskTypeCode");
            Map(x => x.Num).Column("Num");
            Map(x => x.NumEnd).Column("NumEnd");
            Map(x => x.Total).Column("Total");
            Map(x => x.TotalEnd).Column("TotalEnd");
            Map(x => x.Value).Column("Value");
            Map(x => x.Description).Column("Description");
            Map(x => x.TDate).Column("TDate");
            Map(x => x.TDateEnd).Column("TDateEnd");
            Map(x => x.Params).Column("Params");
            Map(x => x.TaskState).Column("TaskState").Not.Nullable();
            Map(x => x.Error).Column("Error");
            Map(x => x.SortOrder).Column("SortOrder");
            Map(x => x.UpdateDate).Column("UpdateDate").Not.Nullable();
            Map(x => x.IsRowDeleted).Column("IsRowDeleted").Not.Nullable();
        }
    }
}
