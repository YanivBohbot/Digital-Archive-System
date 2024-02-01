using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class HistoryModel:BaseModel
    {
        public int Id { get; set; }
        public int ProjectDocId { get; set; }
        public int ChangeReasonCode { get; set; }
        public string ChangeReasonDesc { get; set; }
        public int? ControlStatus { get; set; }
        public string ControlStatusDesc { get; set; }
        public int? RejectReasonCode { get; set; }
        public string  RejectReasonDesc { get; set; }
        public string ControlComments { get; set; }
        public string ManhapComments { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
