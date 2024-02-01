using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class DocumentHistoryModel:BaseModel
    {
        public IList<HistoryModel> History { get; set; }
        public string DocType { get; set; }
        public string DocName { get; set; }
    }
}
