using FluentNHibernate.Mapping;
using iRoads.DigitalArchive.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{
    public class TasktriggersMap : ClassMap<Tasktriggers>
    {

        public TasktriggersMap()
        {
            Table("TaskTriggers");
            LazyLoad();
            CompositeId().KeyProperty(x => x.TaskTypeCode, "TaskTypeCode")
                         .KeyProperty(x => x.DayOfWeek, "DayOfWeek")
                         .KeyProperty(x => x.StartHour, "StartHour")
                         .KeyProperty(x => x.EndHour, "EndHour");
            Map(x => x.SortOrder).Column("SortOrder");
            Map(x => x.UpdateDate).Column("UpdateDate").Not.Nullable();
            Map(x => x.IsRowDeleted).Column("IsRowDeleted").Not.Nullable();
        }
    }
}
