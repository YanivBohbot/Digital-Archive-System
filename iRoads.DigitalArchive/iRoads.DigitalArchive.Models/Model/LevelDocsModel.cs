using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;

namespace iRoads.DigitalArchive.Models.Model
{
    public class LevelDocsModel :BaseModel
    {
        public LevelDocsModel() {
            Docs = new List<DocumentModel>();
        }
        public int ErrorCode;
        public string ErrorMessage;
        public string Project_IID;
        public List<DocumentModel> Docs;
    }
}
