using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class LevelModel: BaseModel
    {
        public int Code { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
        public DateTime LevelDate { get; set; }
    }
}
