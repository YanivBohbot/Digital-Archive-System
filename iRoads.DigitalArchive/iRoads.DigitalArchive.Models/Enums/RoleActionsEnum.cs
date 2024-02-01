using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Enums
{
    public enum UserRoleEnum
    {
        ARCHIVE = 1,
        MAMAP = 2,
        ARCHIVE_MANAGER = 3,
        MANHAP = 4,
        WATCH_ONLY = 5,
        PLANNER = 6,
        ADMIN = 7,
    }

    public enum AuthorizedActionsCode
    {
        ARCHIVE_APPROVAL_FOR_CASE = 1, //אישור בקרת ארכיב לתיק
        ARCHIVE_APPROVAL_FOR_LEVEL = 2, //אישור בקרת ארכיב לשלב
        DOCUMENT_CONTROL_APPROVAL = 3, //אישור בקרת מסמך
        CASE_COMMENTS = 4, //כתיבת הערות לתיק
        SELECT_MERHAV_AGAF = 5, //בחירה מרחב / אגף ייעודי מתוך רשימה
        WATCH_PROJECTS_SCREEN = 6, //צפייה במסך ריכוז פרויקטים
        CREATE_EXCEL = 7, //הפקת קובץ אקסל
        SEND_BY_MAIL_INCOMPLETE_CONTROL_REPORT = 8, //הפקה ושליחה בדוא"ל - דו"ח תיקים להם הבקרה טרם הושלמה
        MAMAP_APPROVAL_FOR_LEVEL = 9, //אישור ממ"פ לשלב
        SET_CONTROL_MANAGER = 10, //קביעת אחראי בקרה
        WRITE_ATTENTION = 11 //כתיבת התייחסות
    }
}
