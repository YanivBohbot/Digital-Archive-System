using DocumentFormat.OpenXml.Bibliography;
using iRoads.DigitalArchive.Models.Command;
using Newtonsoft.Json;

namespace iRoads.DigitalArchive.Models.Enums
{
    public enum CaseControlStatusEnum
    {
        Finished = 1,
        NotFinished = 2
    }

    public enum BusinessLevelControlStatusEnum
    {
        COMPLETED = 1,
        NOT_COMPLETED = 2,
        NOT_YET_STARTED = 3
    }


    public enum PhaseApprovalStatusEnum
    {
        NOT_YET_STARTED = 1,
        COMPLETED = 2,
        NOT_COMPLETED = 3
    }
    public class BusinessLevelControlStatusDescEnum
    {
        private BusinessLevelControlStatusDescEnum(string value) { Value = value; }
        public string Value { get; set; }

        public static string COMPLETED { get { return new BusinessLevelControlStatusDescEnum("בקרה הושלמה").Value; } }
        public static string NOT_COMPLETED { get { return new BusinessLevelControlStatusDescEnum("בקרה טרם הושלמה").Value; } }
        public static string NOT_YET_STARTED { get { return new BusinessLevelControlStatusDescEnum("טרם החל השלב").Value; } }


    }

    public enum BusinessLevelEnum
    {
        TICHNUN_RISHONI = 1,
        TICHNUN_MUKDAM = 2,
        TICHNUN_MEFORAT = 3,
        HESDEREI_TNUA = 4,
        STATUTORIKA = 5,
        MEKARKEIN = 6,
        BAKARAT_ECHUT = 7,
        HESHBON_SOFI_KABLANI = 8,
        BITZUA = 9,
    }

    public enum DocumentStausEnum
    {
        NOT_TESTED = 0,
        VALID = 1,
        IRRELEVANT = 2,
        INVALID = 3

    }

    public enum SOADocumentStausEnum
    {

        VALID = 3,
        INVALID = 2

    }

    public enum SOALevelControlStatusEnum
    {
        ACTIVE = 1,
        NOT_ACTIVE = 2,
        REACTIVATED = 3
    }



    public enum ChangeReasonCodeEnum
    {
        ADD_DOC = 1,
        UPDATE_DOC_STATUS = 2,
        UPDATE_REJECT_REASON = 3,
        UPDATE_CONTROL_COMMENTS = 4,
        UPDATE_MANHAP_COMMENTS = 5
    }


    public enum LogActionsEnum
    {
        ENTER_SCREEN = 1,
        ADD_VALUE = 2,
        CHANGE_VALUE = 3,
        DELETE_VALUE = 4,
        WATCH_LINK = 5
    }

}
