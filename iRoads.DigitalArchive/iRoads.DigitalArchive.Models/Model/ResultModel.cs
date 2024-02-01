using iRoads.DigitalArchive.Models.Enums;
using System.Collections.Generic;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ResultModel : BaseModel
    {
        public int ErrorCode;
        public string ErrorMsg;
        public List<string> ErrorMessages;

        public ResultModel() {
            ErrorCode = (int)Status.SUCCESS;
            ErrorMsg = "Success";
            ErrorMessages = new List<string>();
        }
    }
}
