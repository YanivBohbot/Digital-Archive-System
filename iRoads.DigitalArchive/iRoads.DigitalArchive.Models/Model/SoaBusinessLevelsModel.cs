using System;

namespace iRoads.DigitalArchive.Models.Model
{
    public class SOABusinessLevelsModel
    {
        public string ProjectId { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
        public DateTime StartLevelDate { get; set; }
        public int StatusLevelCode { get; set; }
        public string IV_CCRN { get; set; }
        public bool FromInterface { get; set; }
    }
}
