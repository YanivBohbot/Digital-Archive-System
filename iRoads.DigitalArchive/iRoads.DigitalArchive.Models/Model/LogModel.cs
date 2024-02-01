using System;

namespace iRoads.DigitalArchive.Models.Model
{
    public class LogModel:BaseModel
    {
        public int Id;
        public DateTime DateHour;
        public string UserName;
        public int ActionCode;
        public string Source;
        public string TableName;
        public string FieldName;
        public string OldValue;
        public string NewValue;
        public string ErrorMessage;
        public string InputService;
        public string OutputeService;
        public DateTime UpdateDate;
        public bool IsRowDeleted;
    }
}
