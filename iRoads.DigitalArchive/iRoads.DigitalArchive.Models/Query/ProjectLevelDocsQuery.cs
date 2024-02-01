

namespace iRoads.DigitalArchive.Models.Query
{
    public class ProjectLevelDocsQuery : BaseQuery
    {
        public ProjectLevelDocsQuery() { }

        public string ProjectID { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
        public string WBS { get; set; }
        public string MNF { get; set; }
        public int PageNum { get; set; }
    }
}
