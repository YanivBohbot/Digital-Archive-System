using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Site
{

    public class Logs : EntityBase  {
        public virtual int Id { get; set; }
        public virtual DateTime DateHour { get; set; }
        public virtual string UserName { get; set; }
        public virtual int ActionCode { get; set; }
        public virtual string Source { get; set; }
        public virtual string TableName { get; set; }
        public virtual string FieldName { get; set; }
        public virtual string OldValue { get; set; }
        public virtual string NewValue { get; set; }
        public virtual string ErrorMessage { get; set; }
        public virtual string InputService { get; set; }
        public virtual string OutputeService { get; set; }
    }
}
