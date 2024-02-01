namespace iRoads.DigitalArchive.Models.Enums
{
    public enum Status
    {
        SUCCESS = 0,
        FAIL = 1,
        DOESNT_EXIST = 2,
        NOT_FOUND = 3,
        NOT_ALLOWED = 4,
    }

    public class Messages
    {
        public readonly static string TECHNICAL_ERROR_MSG = "תקלה טכנית";
    }

    public enum TaskState
    {
        New = 1,
        InProgress = 2,
        Finished = 3
    }

    public enum Setting
    {
        FacultyResourceMinimum,
        RatePercentageChange,
        ResourceBalanceAllowed,
        ResourceUnusualUtilization,
        TekenBalanceAllowed,
        TekenUnusual,
        UnusualAmountPerChange,
        YachaCost,
        YachaCount
    }

    public enum UserMessages
    {
        Exception,
        Failed,
        NotFound,
        Success,
        UserExists,
        UserNotExists,
        UsersNotFound,
        UserWrongLoginData,
        WrongDetails,
        WrongEmail,
        WrongIdNumber
    }

    public enum SaveMode
    {
        Add,
        Update,
        Check
    }

    public enum TotalDescription
    {
        Tekens,
        Resources
    }
}
