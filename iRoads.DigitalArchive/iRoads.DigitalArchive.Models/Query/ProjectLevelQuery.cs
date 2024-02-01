
namespace iRoads.DigitalArchive.Models.Query
{
		public class ProjectLevelQuery : BaseQuery
		{
				public ProjectLevelQuery() { }

				public string ProjectID { get; set; }
				public bool? GetLevelDocs { get; set; }
				public bool? CreateLevels { get; set; }
    }
}
