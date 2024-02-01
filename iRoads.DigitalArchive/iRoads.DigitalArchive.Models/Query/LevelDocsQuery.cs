
namespace iRoads.DigitalArchive.Models.Query
{
    public class LevelDocsQuery : BaseQuery
    {
        public LevelDocsQuery() { }

        public string ProjectID { get; set; }
        public int LevelCode { get; set; }
        public string Contracts { get; set; }
        public string WBS { get; set; }
        public string MNF { get; set; }
    }
}
