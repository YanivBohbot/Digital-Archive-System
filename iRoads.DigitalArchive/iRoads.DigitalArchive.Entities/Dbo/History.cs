using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class History : EntityCreateBase
    {
        public virtual int Id { get; set; }
        public virtual int ProjectDocId { get; set; }
        public virtual int ChangeReasonCode { get; set; }
        public virtual int? ControlStatus { get; set; }
        public virtual int? RejectReasonCode { get; set; }
        public virtual string ControlComments { get; set; }
        public virtual string ManhapComments { get; set; }
        public virtual string UpdatedBy { get; set; }

    }
}
