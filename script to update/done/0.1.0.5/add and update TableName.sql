
--ALTER TABLE [dbo].[Classification_BusinessLevels_DocumentsTypes] ADD TableName nvarchar(255);

update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchPlanDocs' where LevelCode = 1
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchPlanDocs' where LevelCode = 2
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchPlanDocs' where LevelCode = 3
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchTnua' where LevelCode = 4
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchStatutory' where LevelCode = 5
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchQuality_A_Doc' where LevelCode = 7


update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'As_Made_Doc' where LevelCode = 8 and DocSubject ='תוכניות עדות AS MADE'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchTikMatala' where LevelCode = 8 and DocSubject ='סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchEndBizua' where LevelCode = 8 and DocSubject ='סט תוכניות לביצוע - בסוף הביצוע'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'WSDL CCR DOCS' where LevelCode = 8 and DocSubject ='בקשה חשבון סופי SAP - שלב א'''
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'WSDL CCR DOCS' where LevelCode = 8 and DocSubject ='חשבון סופי SAP - שלב ב''' and DocType in('המלצת היחידה ההנדסית','פרוטוקול ואישור וש"ה')
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'WSDL REPORTING' where LevelCode = 8 and DocSubject ='חשבון סופי SAP - שלב ב''' and DocType in('היעדר תביעות','פלט חשבון')



update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'PRDiary' where LevelCode = 9 and DocSubject ='דו"חות פיקוח עליון'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'Arch_Disc_Summari' where LevelCode = 9 and DocSubject ='סיכומי ישיבות'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchTeumim' where LevelCode = 9 and DocSubject ='אישורים והתרי חפירה'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchRashuyotGinun' where LevelCode = 9 and DocSubject ='הסכמים עם רשויות (גינון)'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchMesiraShetah' where LevelCode = 9 and DocSubject ='מסירת השטח לאחזקה'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchSafety' where LevelCode = 9 and DocSubject ='בטיחות'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchPicture' where LevelCode = 9 and DocSubject ='תיעוד מצולם ממהלך וסוף הפרויקט'
update [dbo].[Classification_BusinessLevels_DocumentsTypes] set TableName = 'ArchTnuaHirom' where LevelCode = 9 and DocSubject ='תיק הסדר תנועה בחירום'






