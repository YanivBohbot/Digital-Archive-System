using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class TaskschedularMap : ClassMap<Taskschedular>
    {

        public TaskschedularMap()
        {
            Table("TaskSchedular");
            LazyLoad();
            Id(x => x.TaskTypeCode).GeneratedBy.Identity().Column("TaskTypeCode");
            Map(x => x.NextRunTime).Column("NextRunTime").Not.Nullable();
            Map(x => x.LastRunTime).Column("LastRunTime");
            Map(x => x.Error).Column("Error");
            Map(x => x.Params).Column("Params");
            Map(x => x.TaskState).Column("TaskState").Not.Nullable();
            Map(x => x.TaskStatus).Column("TaskStatus").Not.Nullable();
            Map(x => x.SortOrder).Column("SortOrder");
            Map(x => x.UpdateDate).Column("UpdateDate").Not.Nullable();
            Map(x => x.IsRowDeleted).Column("IsRowDeleted").Not.Nullable();
        }
    }
}
