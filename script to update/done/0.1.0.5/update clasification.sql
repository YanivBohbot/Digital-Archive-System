use Archive_QA
go

-- 1. update all  ClassificationCode to big project except DB
update [ProjectType_Classification] set ClassificationCode = 1000 where ClassificationCode = 3000
GO

-- 2. insert מאיץ
INSERT INTO [LOOKUP].[Classification] ([Code] ,[Description] ,[UpdateDate] ,[IsRowDeleted])
     VALUES (5000 ,'מאי"ץ' ,getdate() ,0)
GO

update [ProjectType_Classification] set ClassificationCode = 5000 where ProjectTypeCode = 1
 GO


 DELETE FROM [dbo].[Classification_BusinessLevels_DocumentsTypes]
GO
SET IDENTITY_INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ON 
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1, 1, 1000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (2, 1, 3000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (3, 1, 2000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (4, 1, 4000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (5, 1, 1000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (6, 1, 3000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (7, 1, 2000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (8, 1, 4000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (9, 1, 1000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (10, 1, 3000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (11, 1, 2000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (12, 1, 4000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (13, 1, 1000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (14, 1, 3000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (15, 1, 2000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (16, 1, 4000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (17, 1, 1000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (18, 1, 3000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (19, 1, 2000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (20, 1, 4000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (21, 1, 1000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (22, 1, 3000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (23, 1, 2000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (24, 1, 4000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (25, 1, 1000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (26, 1, 3000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (27, 1, 2000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (28, 1, 4000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (29, 1, 1000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (30, 1, 3000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (31, 1, 2000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (32, 1, 4000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (33, 1, 1000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (34, 1, 3000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (35, 1, 2000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (36, 1, 4000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (37, 1, 1000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (38, 1, 3000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (39, 1, 2000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (40, 1, 4000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (41, 1, 1000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (42, 1, 3000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (43, 1, 2000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (44, 1, 4000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (45, 1, 1000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (46, 1, 3000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (47, 1, 2000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (48, 1, 4000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (49, 1, 1000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (50, 1, 3000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (51, 1, 2000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (52, 1, 4000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (53, 1, 1000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (54, 1, 3000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (55, 1, 2000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (56, 1, 4000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (57, 1, 1000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (58, 1, 3000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (59, 1, 2000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (60, 1, 4000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (61, 1, 1000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (62, 1, 3000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (63, 1, 2000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (64, 1, 4000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (65, 1, 1000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (66, 1, 3000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (67, 1, 2000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (68, 1, 4000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (69, 1, 1000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (70, 1, 3000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (71, 1, 2000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (72, 1, 4000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (73, 1, 1000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (74, 1, 3000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (75, 1, 2000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (76, 1, 4000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (77, 1, 1000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (78, 1, 3000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (79, 1, 2000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (80, 1, 4000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (81, 1, 1000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (82, 1, 3000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (83, 1, 2000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (84, 1, 4000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (85, 1, 1000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (86, 1, 3000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (87, 1, 2000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (88, 1, 4000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (89, 1, 1000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (90, 1, 3000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (91, 1, 2000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (92, 1, 4000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (93, 1, 1000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (94, 1, 3000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (95, 1, 2000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (96, 1, 4000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (97, 1, 1000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (98, 1, 3000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (99, 1, 2000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (100, 1, 4000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (101, 1, 1000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (102, 1, 3000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (103, 1, 2000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (104, 1, 4000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (105, 1, 1000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (106, 1, 3000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (107, 1, 2000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (108, 1, 4000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (109, 1, 1000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (110, 1, 3000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (111, 1, 2000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (112, 1, 4000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (113, 1, 1000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (114, 1, 3000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (115, 1, 2000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (116, 1, 4000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (117, 1, 1000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (118, 1, 3000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (119, 1, 2000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (120, 1, 4000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (121, 1, 1000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (122, 1, 3000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (123, 1, 2000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (124, 1, 4000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (125, 1, 1000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (126, 1, 3000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (127, 1, 2000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (128, 1, 4000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (129, 1, 1000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (130, 1, 3000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (131, 1, 2000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (132, 1, 4000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (133, 1, 1000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (134, 1, 3000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (135, 1, 2000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (136, 1, 4000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (137, 1, 1000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (138, 1, 3000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (139, 1, 2000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (140, 1, 4000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (141, 1, 1000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (142, 1, 3000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (143, 1, 2000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (144, 1, 4000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (145, 2, 1000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (146, 2, 3000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (147, 2, 2000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (148, 2, 4000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (149, 2, 1000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (150, 2, 3000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (151, 2, 2000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (152, 2, 4000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (153, 2, 1000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (154, 2, 3000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (155, 2, 2000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (156, 2, 4000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (157, 2, 1000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (158, 2, 3000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (159, 2, 2000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (160, 2, 4000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (161, 2, 1000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (162, 2, 3000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (163, 2, 2000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (164, 2, 4000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (165, 2, 1000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (166, 2, 3000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (167, 2, 2000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (168, 2, 4000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (169, 2, 1000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (170, 2, 3000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (171, 2, 2000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (172, 2, 4000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (173, 2, 1000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (174, 2, 3000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (175, 2, 2000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (176, 2, 4000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (177, 2, 1000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (178, 2, 3000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (179, 2, 2000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (180, 2, 4000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (181, 2, 1000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (182, 2, 3000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (183, 2, 2000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (184, 2, 4000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (185, 2, 1000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (186, 2, 3000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (187, 2, 2000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (188, 2, 4000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (189, 2, 1000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (190, 2, 3000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (191, 2, 2000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (192, 2, 4000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (193, 2, 1000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (194, 2, 3000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (195, 2, 2000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (196, 2, 4000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (197, 2, 1000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (198, 2, 3000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (199, 2, 2000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (200, 2, 4000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (201, 2, 1000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (202, 2, 3000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (203, 2, 2000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (204, 2, 4000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (205, 2, 1000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (206, 2, 3000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (207, 2, 2000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (208, 2, 4000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (209, 2, 1000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (210, 2, 3000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (211, 2, 2000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (212, 2, 4000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (213, 2, 1000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (214, 2, 3000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (215, 2, 2000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (216, 2, 4000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (217, 2, 1000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (218, 2, 3000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (219, 2, 2000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (220, 2, 4000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (221, 2, 1000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (222, 2, 3000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (223, 2, 2000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (224, 2, 4000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (225, 2, 1000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (226, 2, 3000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (227, 2, 2000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (228, 2, 4000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (229, 2, 1000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (230, 2, 3000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (231, 2, 2000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (232, 2, 4000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (233, 2, 1000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (234, 2, 3000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (235, 2, 2000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (236, 2, 4000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (237, 2, 1000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (238, 2, 3000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (239, 2, 2000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (240, 2, 4000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (241, 2, 1000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (242, 2, 3000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (243, 2, 2000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (244, 2, 4000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (245, 2, 1000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (246, 2, 3000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (247, 2, 2000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (248, 2, 4000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (249, 2, 1000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (250, 2, 3000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (251, 2, 2000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (252, 2, 4000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (253, 2, 1000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (254, 2, 3000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (255, 2, 2000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (256, 2, 4000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (257, 2, 1000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (258, 2, 3000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (259, 2, 2000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (260, 2, 4000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (261, 2, 1000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (262, 2, 3000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (263, 2, 2000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (264, 2, 4000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (265, 2, 1000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (266, 2, 3000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (267, 2, 2000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (268, 2, 4000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (269, 2, 1000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (270, 2, 3000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (271, 2, 2000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (272, 2, 4000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (273, 2, 1000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (274, 2, 3000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (275, 2, 2000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (276, 2, 4000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (277, 2, 1000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (278, 2, 3000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (279, 2, 2000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (280, 2, 4000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (281, 2, 1000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (282, 2, 3000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (283, 2, 2000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (284, 2, 4000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (285, 2, 1000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (286, 2, 3000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (287, 2, 2000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (288, 2, 4000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (289, 3, 1000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (290, 3, 3000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (291, 3, 2000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (292, 3, 4000, N'נגישות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (293, 3, 1000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (294, 3, 3000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (295, 3, 2000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (296, 3, 4000, N'תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (297, 3, 1000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (298, 3, 3000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (299, 3, 2000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (300, 3, 4000, N'אגרונום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (301, 3, 1000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (302, 3, 3000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (303, 3, 2000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (304, 3, 4000, N'אדריכלות גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (305, 3, 1000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (306, 3, 3000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (307, 3, 2000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (308, 3, 4000, N'אדריכלות נוף', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (309, 3, 1000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (310, 3, 3000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (311, 3, 2000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (312, 3, 4000, N'אוורור במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (313, 3, 1000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (314, 3, 3000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (315, 3, 2000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (316, 3, 4000, N'אקולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (317, 3, 1000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (318, 3, 3000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (319, 3, 2000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (320, 3, 4000, N'אקוסטיקה לכבישים ולמסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (321, 3, 1000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (322, 3, 3000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (323, 3, 2000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (324, 3, 4000, N'בטיחות אש במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (325, 3, 1000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (326, 3, 3000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (327, 3, 2000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (328, 3, 4000, N'גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (329, 3, 1000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (330, 3, 3000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (331, 3, 2000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (332, 3, 4000, N'גיאומטריה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (333, 3, 1000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (334, 3, 3000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (335, 3, 2000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (336, 3, 4000, N'גיאומטריה של מסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (337, 3, 1000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (338, 3, 3000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (339, 3, 2000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (340, 3, 4000, N'גינון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (341, 3, 1000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (342, 3, 3000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (343, 3, 2000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (344, 3, 4000, N'הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (345, 3, 1000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (346, 3, 3000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (347, 3, 2000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (348, 3, 4000, N'הידרולוגיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (349, 3, 1000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (350, 3, 3000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (351, 3, 2000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (352, 3, 4000, N'השקיה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (353, 3, 1000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (354, 3, 3000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (355, 3, 2000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (356, 3, 4000, N'זיהום אוויר', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (357, 3, 1000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (358, 3, 3000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (359, 3, 2000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (360, 3, 4000, N'זיהום קרקע ומים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (361, 3, 1000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (362, 3, 3000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (363, 3, 2000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (364, 3, 4000, N'חשמל ותאורה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (365, 3, 1000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (366, 3, 3000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (367, 3, 2000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (368, 3, 4000, N'מבנה עליון במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (369, 3, 1000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (370, 3, 3000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (371, 3, 2000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (372, 3, 4000, N'מים וביוב', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (373, 3, 1000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (374, 3, 3000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (375, 3, 2000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (376, 3, 4000, N'מערכות במנהרה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (377, 3, 1000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (378, 3, 3000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (379, 3, 2000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (380, 3, 4000, N'מערכות וחשמול במסילות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (381, 3, 1000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (382, 3, 3000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (383, 3, 2000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (384, 3, 4000, N'מפרטים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (385, 3, 1000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (386, 3, 3000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (387, 3, 2000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (388, 3, 4000, N'ניקוז', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (389, 3, 1000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (390, 3, 3000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (391, 3, 2000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (392, 3, 4000, N'קונסטרוקציה של גשרים ומבנים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (393, 3, 1000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (394, 3, 3000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (395, 3, 2000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (396, 3, 4000, N'קונסטרוקציה של מנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (397, 3, 1000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (398, 3, 3000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (399, 3, 2000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (400, 3, 4000, N'קרקע וביסוס', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (401, 3, 1000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (402, 3, 3000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (403, 3, 2000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (404, 3, 4000, N'שילוט', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (405, 3, 1000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (406, 3, 3000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (407, 3, 2000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (408, 3, 4000, N'תחזיות תנועה ומיקרוסימולציה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (409, 3, 1000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (410, 3, 3000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (411, 3, 2000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (412, 3, 4000, N'תיאום תשתיות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (413, 3, 1000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (414, 3, 3000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (415, 3, 2000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (416, 3, 4000, N'תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (417, 3, 1000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (418, 3, 3000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (419, 3, 2000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (420, 3, 4000, N'תכנון אורבני', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (421, 3, 1000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (422, 3, 3000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (423, 3, 2000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (424, 3, 4000, N'תכנון סביבתי', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (425, 3, 1000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (426, 3, 3000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (427, 3, 2000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (428, 3, 4000, N'תנועה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (429, 3, 1000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (430, 3, 3000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (431, 3, 2000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (432, 3, 4000, N'מתאם תשתיות במנהרות', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (433, 4, 1000, N'תכנית הסדרי תנועה סופיים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (434, 4, 2000, N'תכנית הסדרי תנועה סופיים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (435, 4, 4000, N'תכנית הסדרי תנועה סופיים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (436, 4, 1000, N'תכנית הסדרי תנועה לשלבי ביצוע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (437, 4, 2000, N'תכנית הסדרי תנועה לשלבי ביצוע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (438, 4, 4000, N'תכנית הסדרי תנועה לשלבי ביצוע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (439, 4, 1000, N'הסדר הנדסי לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (440, 4, 2000, N'הסדר הנדסי לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (441, 4, 4000, N'הסדר הנדסי לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (442, 4, 1000, N'תוכנית זמנים לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (443, 4, 2000, N'תוכנית זמנים לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (444, 4, 4000, N'תוכנית זמנים לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (445, 5, 1000, N'תוכניות מופקדות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (446, 5, 3000, N'תוכניות מופקדות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (447, 5, 2000, N'תוכניות מופקדות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (448, 5, 4000, N'תוכניות מופקדות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (449, 5, 1000, N'תוכניות מופקדות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (450, 5, 3000, N'תוכניות מופקדות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (451, 5, 2000, N'תוכניות מופקדות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (452, 5, 4000, N'תוכניות מופקדות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (453, 5, 1000, N'תוכניות מופקדות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (454, 5, 3000, N'תוכניות מופקדות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (455, 5, 2000, N'תוכניות מופקדות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (456, 5, 4000, N'תוכניות מופקדות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (457, 5, 1000, N'תוכניות מופקדות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (458, 5, 3000, N'תוכניות מופקדות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (459, 5, 2000, N'תוכניות מופקדות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (460, 5, 4000, N'תוכניות מופקדות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (461, 5, 1000, N'תוכניות מאושרות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (462, 5, 3000, N'תוכניות מאושרות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (463, 5, 2000, N'תוכניות מאושרות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (464, 5, 4000, N'תוכניות מאושרות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (465, 5, 1000, N'תוכניות מאושרות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (466, 5, 3000, N'תוכניות מאושרות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (467, 5, 2000, N'תוכניות מאושרות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (468, 5, 4000, N'תוכניות מאושרות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (469, 5, 1000, N'תוכניות מאושרות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (470, 5, 3000, N'תוכניות מאושרות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (471, 5, 2000, N'תוכניות מאושרות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (472, 5, 4000, N'תוכניות מאושרות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (473, 5, 1000, N'תוכניות מאושרות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (474, 5, 3000, N'תוכניות מאושרות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (475, 5, 2000, N'תוכניות מאושרות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (476, 5, 4000, N'תוכניות מאושרות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (477, 5, 1000, N'החלטות מוסדות תכנון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (478, 5, 3000, N'החלטות מוסדות תכנון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (479, 5, 2000, N'החלטות מוסדות תכנון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (480, 5, 4000, N'החלטות מוסדות תכנון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (481, 6, 1000, N'תיק תשלום (תשלום בגין הפקעה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (482, 6, 2000, N'תיק תשלום (תשלום בגין הפקעה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (483, 6, 4000, N'תיק תשלום (תשלום בגין הפקעה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (484, 6, 1000, N'תחשיב אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (485, 6, 2000, N'תחשיב אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (486, 6, 4000, N'תחשיב אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (487, 6, 1000, N'מסמך חוות דעת חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (488, 6, 2000, N'מסמך חוות דעת חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (489, 6, 4000, N'מסמך חוות דעת חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (490, 6, 1000, N'דו"ח בקרת אומדן חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (491, 6, 2000, N'דו"ח בקרת אומדן חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (492, 6, 4000, N'דו"ח בקרת אומדן חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (493, 6, 1000, N'אישור הקלדת אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (494, 6, 2000, N'אישור הקלדת אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (495, 6, 4000, N'אישור הקלדת אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (496, 6, 1000, N'בקרת מדידה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (497, 6, 2000, N'בקרת מדידה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (498, 6, 4000, N'בקרת מדידה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (499, 6, 1000, N'מפת תכולה חתומה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (500, 6, 2000, N'מפת תכולה חתומה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (501, 6, 4000, N'מפת תכולה חתומה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (502, 6, 1000, N'הודעת רכישה (תכנית הכרזה) - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (503, 6, 2000, N'הודעת רכישה (תכנית הכרזה) - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (504, 6, 4000, N'הודעת רכישה (תכנית הכרזה) - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (505, 6, 1000, N'תשריט הפקעות - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (506, 6, 2000, N'תשריט הפקעות - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (507, 6, 4000, N'תשריט הפקעות - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (508, 6, 1000, N'תצ"ר - גוש', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (509, 6, 2000, N'תצ"ר - גוש', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (510, 6, 4000, N'תצ"ר - גוש', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (511, 6, 1000, N'וועדות פיצויים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (512, 6, 2000, N'וועדות פיצויים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (513, 6, 4000, N'וועדות פיצויים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (514, 6, 1000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (515, 6, 2000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (516, 6, 4000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (517, 6, 1000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (518, 6, 2000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (519, 6, 4000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (520, 6, 1000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (521, 6, 2000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (522, 6, 4000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (523, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (524, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (525, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (526, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (527, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (528, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (529, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (530, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (531, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (532, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (533, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (534, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (535, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (536, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (537, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (538, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (539, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (540, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (541, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (542, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (543, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (544, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (545, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (546, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (547, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (548, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (549, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (550, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (551, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (552, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (553, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (554, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (555, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (556, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (557, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (558, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (559, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (560, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (561, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (562, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (563, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (564, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (565, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (566, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (567, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (568, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (569, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (570, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (571, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (572, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (573, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (574, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (575, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (576, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (577, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (578, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (579, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (580, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (581, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (582, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (583, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (584, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (585, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (586, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (587, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (588, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (589, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (590, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (591, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (592, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (593, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (594, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (595, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (596, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (597, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (598, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (599, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (600, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (601, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (602, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (603, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (604, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (605, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (606, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (607, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (608, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (609, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (610, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (611, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (612, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (613, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (614, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (615, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (616, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (617, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (618, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (619, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (620, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (621, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (622, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (623, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (624, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (625, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (626, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (627, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (628, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (629, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (630, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (631, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (632, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (633, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (634, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (635, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (636, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (637, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (638, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (639, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (640, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (641, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (642, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (643, 7, 1000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (644, 7, 3000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (645, 7, 2000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (646, 7, 4000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (647, 7, 1000, N'רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (648, 7, 3000, N'רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (649, 7, 2000, N'רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (650, 7, 4000, N'רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (651, 7, 1000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (652, 7, 3000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (653, 7, 2000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (654, 7, 4000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (655, 7, 1000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (656, 7, 3000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (657, 7, 2000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (658, 7, 4000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (659, 7, 1000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (660, 7, 3000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (661, 7, 2000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (662, 7, 4000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (663, 7, 1000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (664, 7, 3000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (665, 7, 2000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (666, 7, 4000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (667, 7, 1000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (668, 7, 3000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (669, 7, 2000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (670, 7, 4000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (671, 7, 1000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (672, 7, 3000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (673, 7, 2000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (674, 7, 4000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (675, 7, 1000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (676, 7, 3000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (677, 7, 2000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (678, 7, 4000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (679, 7, 1000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (680, 7, 3000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (681, 7, 2000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (682, 7, 4000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (683, 7, 1000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (684, 7, 3000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (685, 7, 2000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (686, 7, 4000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (687, 7, 1000, N'ריכוז אישורי חומרים - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (688, 7, 3000, N'ריכוז אישורי חומרים - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (689, 7, 2000, N'ריכוז אישורי חומרים - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (690, 7, 4000, N'ריכוז אישורי חומרים - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (691, 7, 1000, N'ריכוז אישורי חומרים - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (692, 7, 3000, N'ריכוז אישורי חומרים - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (693, 7, 2000, N'ריכוז אישורי חומרים - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (694, 7, 4000, N'ריכוז אישורי חומרים - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (695, 7, 1000, N'תעודות אחריות למוצר - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (696, 7, 3000, N'תעודות אחריות למוצר - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (697, 7, 2000, N'תעודות אחריות למוצר - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (698, 7, 4000, N'תעודות אחריות למוצר - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (699, 7, 1000, N'תעודות אחריות למוצר - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (700, 7, 3000, N'תעודות אחריות למוצר - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (701, 7, 2000, N'תעודות אחריות למוצר - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (702, 7, 4000, N'תעודות אחריות למוצר - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (703, 7, 1000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (704, 7, 3000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (705, 7, 2000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (706, 7, 4000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (707, 7, 1000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'תשתית', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (708, 7, 3000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'תשתית', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (709, 7, 2000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'תשתית', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (710, 7, 4000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'תשתית', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (711, 7, 1000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (712, 7, 3000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (713, 7, 2000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (714, 7, 4000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (715, 7, 1000, N'בדיקות גליות', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (716, 7, 3000, N'בדיקות גליות', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (717, 7, 2000, N'בדיקות גליות', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (718, 7, 4000, N'בדיקות גליות', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (719, 7, 1000, N'סקר נזקים על פי שיטת PAVER', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (720, 7, 3000, N'סקר נזקים על פי שיטת PAVER', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (721, 7, 2000, N'סקר נזקים על פי שיטת PAVER', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (722, 7, 4000, N'סקר נזקים על פי שיטת PAVER', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (723, 7, 1000, N'בדיקות התנגדות להחלקה', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (724, 7, 3000, N'בדיקות התנגדות להחלקה', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (725, 7, 2000, N'בדיקות התנגדות להחלקה', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (726, 7, 4000, N'בדיקות התנגדות להחלקה', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (727, 7, 1000, N'סקר מבנים ראשוני', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (728, 7, 3000, N'סקר מבנים ראשוני', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (729, 7, 2000, N'סקר מבנים ראשוני', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (730, 7, 4000, N'סקר מבנים ראשוני', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (731, 7, 1000, N'צילום מערכת תשתית (קובץ וידאו)', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (732, 7, 3000, N'צילום מערכת תשתית (קובץ וידאו)', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (733, 7, 2000, N'צילום מערכת תשתית (קובץ וידאו)', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (734, 7, 4000, N'צילום מערכת תשתית (קובץ וידאו)', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (735, 7, 1000, N'בדיקת אטימות למערכות תשתית', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (736, 7, 3000, N'בדיקת אטימות למערכות תשתית', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (737, 7, 2000, N'בדיקת אטימות למערכות תשתית', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (738, 7, 4000, N'בדיקת אטימות למערכות תשתית', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (739, 7, 1000, N'בדיקות נראות של שילוט ותמרור', N'בדיקות קבלה', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (740, 7, 3000, N'בדיקות נראות של שילוט ותמרור', N'בדיקות קבלה', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (741, 7, 2000, N'בדיקות נראות של שילוט ותמרור', N'בדיקות קבלה', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (742, 7, 4000, N'בדיקות נראות של שילוט ותמרור', N'בדיקות קבלה', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (743, 7, 1000, N'בדיקות נראות של סימני דרך', N'בדיקות קבלה', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (744, 7, 3000, N'בדיקות נראות של סימני דרך', N'בדיקות קבלה', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (745, 7, 2000, N'בדיקות נראות של סימני דרך', N'בדיקות קבלה', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (746, 7, 4000, N'בדיקות נראות של סימני דרך', N'בדיקות קבלה', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (747, 7, 1000, N'בדיקות עוצמות תאורה', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (748, 7, 3000, N'בדיקות עוצמות תאורה', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (749, 7, 2000, N'בדיקות עוצמות תאורה', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (750, 7, 4000, N'בדיקות עוצמות תאורה', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (751, 7, 1000, N'בדיקות רמזורים', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (752, 7, 3000, N'בדיקות רמזורים', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (753, 7, 2000, N'בדיקות רמזורים', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (754, 7, 4000, N'בדיקות רמזורים', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (755, 7, 1000, N'מסמכי אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (756, 7, 3000, N'מסמכי אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (757, 7, 2000, N'מסמכי אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (758, 7, 4000, N'מסמכי אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (759, 7, 1000, N'ריכוז אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (760, 7, 3000, N'ריכוז אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (761, 7, 2000, N'ריכוז אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (762, 7, 4000, N'ריכוז אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (763, 8, 1000, N'כבישים (תוכנית כללית) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (764, 8, 3000, N'כבישים (תוכנית כללית) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (765, 8, 2000, N'כבישים (תוכנית כללית) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (766, 8, 4000, N'כבישים (תוכנית כללית) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (767, 8, 1000, N'חשמל ותאורה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (768, 8, 3000, N'חשמל ותאורה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (769, 8, 2000, N'חשמל ותאורה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (770, 8, 4000, N'חשמל ותאורה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (771, 8, 1000, N'אדריכלות נוף (גינון) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (772, 8, 3000, N'אדריכלות נוף (גינון) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (773, 8, 2000, N'אדריכלות נוף (גינון) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (774, 8, 4000, N'אדריכלות נוף (גינון) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (775, 8, 1000, N'תנועה ושילוט - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (776, 8, 3000, N'תנועה ושילוט - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (777, 8, 2000, N'תנועה ושילוט - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (778, 8, 4000, N'תנועה ושילוט - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (779, 8, 1000, N'תאום מערכות/תשתית - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (780, 8, 3000, N'תאום מערכות/תשתית - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (781, 8, 2000, N'תאום מערכות/תשתית - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (782, 8, 4000, N'תאום מערכות/תשתית - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (783, 8, 1000, N'ניקוז והידרולוגיה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (784, 8, 3000, N'ניקוז והידרולוגיה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (785, 8, 2000, N'ניקוז והידרולוגיה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (786, 8, 4000, N'ניקוז והידרולוגיה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (787, 8, 1000, N'מסילות רכבת - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (788, 8, 3000, N'מסילות רכבת - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (789, 8, 2000, N'מסילות רכבת - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (790, 8, 4000, N'מסילות רכבת - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (791, 8, 1000, N'מבנים וגשרים - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (792, 8, 3000, N'מבנים וגשרים - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (793, 8, 2000, N'מבנים וגשרים - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (794, 8, 4000, N'מבנים וגשרים - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (795, 8, 1000, N'כבישים (תוכנית כללית) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (796, 8, 3000, N'כבישים (תוכנית כללית) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (797, 8, 2000, N'כבישים (תוכנית כללית) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (798, 8, 4000, N'כבישים (תוכנית כללית) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (799, 8, 1000, N'חשמל ותאורה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (800, 8, 3000, N'חשמל ותאורה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (801, 8, 2000, N'חשמל ותאורה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (802, 8, 4000, N'חשמל ותאורה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (803, 8, 1000, N'אדריכלות נוף (גינון) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (804, 8, 3000, N'אדריכלות נוף (גינון) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (805, 8, 2000, N'אדריכלות נוף (גינון) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (806, 8, 4000, N'אדריכלות נוף (גינון) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (807, 8, 1000, N'תנועה ושילוט - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (808, 8, 3000, N'תנועה ושילוט - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (809, 8, 2000, N'תנועה ושילוט - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (810, 8, 4000, N'תנועה ושילוט - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (811, 8, 1000, N'תאום מערכות/תשתית - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (812, 8, 3000, N'תאום מערכות/תשתית - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (813, 8, 2000, N'תאום מערכות/תשתית - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (814, 8, 4000, N'תאום מערכות/תשתית - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (815, 8, 1000, N'ניקוז והידרולוגיה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (816, 8, 3000, N'ניקוז והידרולוגיה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (817, 8, 2000, N'ניקוז והידרולוגיה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (818, 8, 4000, N'ניקוז והידרולוגיה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (819, 8, 1000, N'מסילות רכבת - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (820, 8, 3000, N'מסילות רכבת - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (821, 8, 2000, N'מסילות רכבת - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (822, 8, 4000, N'מסילות רכבת - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (823, 8, 1000, N'מבנים וגשרים - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (824, 8, 3000, N'מבנים וגשרים - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (825, 8, 2000, N'מבנים וגשרים - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (826, 8, 4000, N'מבנים וגשרים - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (827, 8, 1000, N'יומן עבודה', N'יומני עבודה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (828, 8, 3000, N'יומן עבודה', N'יומני עבודה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (829, 8, 2000, N'יומן עבודה', N'יומני עבודה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (830, 8, 4000, N'יומן עבודה', N'יומני עבודה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (831, 8, 1000, N'סט תוכניות לביצוע', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (832, 8, 3000, N'סט תוכניות לביצוע', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (833, 8, 2000, N'סט תוכניות לביצוע', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (834, 8, 4000, N'סט תוכניות לביצוע', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (835, 8, 1000, N'צו התחלת עבודה', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (836, 8, 3000, N'צו התחלת עבודה', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (837, 8, 2000, N'צו התחלת עבודה', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (838, 8, 4000, N'צו התחלת עבודה', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (839, 8, 4000, N'מפרט הנדסי לפרויקט DB', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (840, 8, 1000, N'מפרט טכני (פרשה טכנית)', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (841, 8, 3000, N'מפרט טכני (פרשה טכנית)', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (842, 8, 2000, N'מפרט טכני (פרשה טכנית)', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (843, 8, 1000, N'מסמך RFT', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (844, 8, 4000, N'מסמך RFT', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (845, 8, 1000, N'חוזה + נספחים', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (846, 8, 3000, N'חוזה + נספחים', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (847, 8, 2000, N'חוזה + נספחים', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (848, 8, 4000, N'חוזה + נספחים', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (849, 8, 1000, N'כתב כמויות - PDF', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (850, 8, 3000, N'כתב כמויות - PDF', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (851, 8, 2000, N'כתב כמויות - PDF', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (852, 8, 1000, N'כתב כמויות - EXCEL', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (853, 8, 3000, N'כתב כמויות - EXCEL', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (854, 8, 2000, N'כתב כמויות - EXCEL', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (855, 8, 1000, N'סט תוכניות לביצוע - בסוף הביצוע - קבצי אוטוקאד', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (856, 8, 3000, N'סט תוכניות לביצוע - בסוף הביצוע - קבצי אוטוקאד', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (857, 8, 2000, N'סט תוכניות לביצוע - בסוף הביצוע - קבצי אוטוקאד', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (858, 8, 4000, N'סט תוכניות לביצוע - בסוף הביצוע - קבצי אוטוקאד', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (859, 8, 1000, N'סט תוכניות לביצוע - בסוף הביצוע - PDF', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (860, 8, 3000, N'סט תוכניות לביצוע - בסוף הביצוע - PDF', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (861, 8, 2000, N'סט תוכניות לביצוע - בסוף הביצוע - PDF', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (862, 8, 4000, N'סט תוכניות לביצוע - בסוף הביצוע - PDF', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (863, 8, 1000, N'טופס ריכוז נתונים לחשבון סופי', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (864, 8, 3000, N'טופס ריכוז נתונים לחשבון סופי', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (865, 8, 2000, N'טופס ריכוז נתונים לחשבון סופי', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (866, 8, 4000, N'טופס ריכוז נתונים לחשבון סופי', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (867, 8, 1000, N'חשבון סופי (דרישת קבלן)-אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (868, 8, 3000, N'חשבון סופי (דרישת קבלן)-אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (869, 8, 2000, N'חשבון סופי (דרישת קבלן)-אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (870, 8, 4000, N'חשבון סופי (דרישת קבלן)-אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (871, 8, 1000, N'חשבון סופי (דרישת קבלן)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (872, 8, 3000, N'חשבון סופי (דרישת קבלן)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (873, 8, 2000, N'חשבון סופי (דרישת קבלן)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (874, 8, 4000, N'חשבון סופי (דרישת קבלן)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (875, 8, 1000, N'חשבון סופי (המלצת מנה"פ) -אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (876, 8, 3000, N'חשבון סופי (המלצת מנה"פ) -אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (877, 8, 2000, N'חשבון סופי (המלצת מנה"פ) -אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (878, 8, 4000, N'חשבון סופי (המלצת מנה"פ) -אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (879, 8, 1000, N'חשבון סופי (המלצת מנה"פ)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (880, 8, 3000, N'חשבון סופי (המלצת מנה"פ)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (881, 8, 2000, N'חשבון סופי (המלצת מנה"פ)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (882, 8, 4000, N'חשבון סופי (המלצת מנה"פ)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (883, 8, 1000, N'סקיצות- AS- MADE – DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (884, 8, 3000, N'סקיצות- AS- MADE – DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (885, 8, 2000, N'סקיצות- AS- MADE – DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (886, 8, 4000, N'סקיצות- AS- MADE – DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (887, 8, 1000, N'סקיצות- AS- MADE – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (888, 8, 3000, N'סקיצות- AS- MADE – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (889, 8, 2000, N'סקיצות- AS- MADE – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (890, 8, 4000, N'סקיצות- AS- MADE – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (891, 8, 1000, N'חישובי כמויות לכל סעיף – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (892, 8, 3000, N'חישובי כמויות לכל סעיף – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (893, 8, 2000, N'חישובי כמויות לכל סעיף – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (894, 8, 1000, N'חישובי כמויות לכל סעיף – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (895, 8, 3000, N'חישובי כמויות לכל סעיף – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (896, 8, 2000, N'חישובי כמויות לכל סעיף – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (897, 8, 1000, N'חישובי כמויות + צילום מיומן העבודה לכל סעיף', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (898, 8, 3000, N'חישובי כמויות + צילום מיומן העבודה לכל סעיף', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (899, 8, 2000, N'חישובי כמויות + צילום מיומן העבודה לכל סעיף', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (900, 8, 4000, N'חישובי כמויות + צילום מיומן העבודה לכל סעיף', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (901, 8, 1000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (902, 8, 3000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (903, 8, 2000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (904, 8, 1000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות- DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (905, 8, 3000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות- DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (906, 8, 2000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות- DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (907, 8, 1000, N'מכתב הסבר מפורט ממנהל הפרויקט', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (908, 8, 3000, N'מכתב הסבר מפורט ממנהל הפרויקט', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (909, 8, 2000, N'מכתב הסבר מפורט ממנהל הפרויקט', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (910, 8, 4000, N'מכתב הסבר מפורט ממנהל הפרויקט', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (911, 8, 1000, N'מכתב בקשה מהקבלן', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (912, 8, 3000, N'מכתב בקשה מהקבלן', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (913, 8, 2000, N'מכתב בקשה מהקבלן', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (914, 8, 4000, N'מכתב בקשה מהקבלן', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (915, 8, 1000, N'אסמכתא לביצוע העבודה', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (916, 8, 3000, N'אסמכתא לביצוע העבודה', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (917, 8, 2000, N'אסמכתא לביצוע העבודה', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (918, 8, 4000, N'אסמכתא לביצוע העבודה', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (919, 8, 1000, N'אחר', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (920, 8, 3000, N'אחר', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (921, 8, 2000, N'אחר', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (922, 8, 4000, N'אחר', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (923, 8, 1000, N'תצלומי שטח', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (924, 8, 3000, N'תצלומי שטח', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (925, 8, 2000, N'תצלומי שטח', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (926, 8, 4000, N'תצלומי שטח', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (927, 8, 1000, N'המלצת היחידה ההנדסית', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (928, 8, 3000, N'המלצת היחידה ההנדסית', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (929, 8, 2000, N'המלצת היחידה ההנדסית', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (930, 8, 4000, N'המלצת היחידה ההנדסית', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (931, 8, 1000, N'פרוטוקול ואישור וש"ה', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (932, 8, 3000, N'פרוטוקול ואישור וש"ה', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (933, 8, 2000, N'פרוטוקול ואישור וש"ה', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (934, 8, 4000, N'פרוטוקול ואישור וש"ה', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (935, 8, 1000, N'היעדר תביעות', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (936, 8, 3000, N'היעדר תביעות', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (937, 8, 2000, N'היעדר תביעות', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (938, 8, 4000, N'היעדר תביעות', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (939, 8, 1000, N'פלט חשבון', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (940, 8, 3000, N'פלט חשבון', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (941, 8, 2000, N'פלט חשבון', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (942, 8, 4000, N'פלט חשבון', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (943, 9, 1000, N'פיקוח עליון מתכנן מוביל', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (944, 9, 3000, N'פיקוח עליון מתכנן מוביל', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (945, 9, 2000, N'פיקוח עליון מתכנן מוביל', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (946, 9, 4000, N'פיקוח עליון מתכנן מוביל', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (947, 9, 1000, N'פיקוח עליון בקר תכנון', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (948, 9, 3000, N'פיקוח עליון בקר תכנון', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (949, 9, 2000, N'פיקוח עליון בקר תכנון', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (950, 9, 4000, N'פיקוח עליון בקר תכנון', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (951, 9, 1000, N'ישיבות אתר', N'סיכומי ישיבות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (952, 9, 3000, N'ישיבות אתר', N'סיכומי ישיבות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (953, 9, 2000, N'ישיבות אתר', N'סיכומי ישיבות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (954, 9, 4000, N'ישיבות אתר', N'סיכומי ישיבות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (955, 9, 1000, N'אישורי צד ג'' חברות תשתית', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (956, 9, 3000, N'אישורי צד ג'' חברות תשתית', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (957, 9, 2000, N'אישורי צד ג'' חברות תשתית', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (958, 9, 4000, N'אישורי צד ג'' חברות תשתית', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (959, 9, 1000, N'הרשאות לצדי ג'' לעבודות ייזומות ע"י נת"י', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (960, 9, 3000, N'הרשאות לצדי ג'' לעבודות ייזומות ע"י נת"י', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (961, 9, 2000, N'הרשאות לצדי ג'' לעבודות ייזומות ע"י נת"י', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (962, 9, 4000, N'הרשאות לצדי ג'' לעבודות ייזומות ע"י נת"י', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (963, 9, 1000, N'הסכמים', N'הסכמים עם רשויות (גינון)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (964, 9, 2000, N'הסכמים', N'הסכמים עם רשויות (גינון)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (965, 9, 4000, N'הסכמים', N'הסכמים עם רשויות (גינון)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (966, 9, 1000, N'טופס מסירה סופי לאחזקה', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (967, 9, 3000, N'טופס מסירה סופי לאחזקה', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (968, 9, 2000, N'טופס מסירה סופי לאחזקה', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (969, 9, 4000, N'טופס מסירה סופי לאחזקה', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (970, 9, 1000, N'תעודת גמר מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (971, 9, 3000, N'תעודת גמר מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (972, 9, 2000, N'תעודת גמר מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (973, 9, 4000, N'תעודת גמר מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (974, 8, 1000, N'תעודת גמר בלתי מותנת/סופית', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (975, 8, 3000, N'תעודת גמר בלתי מותנת/סופית', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (976, 8, 2000, N'תעודת גמר בלתי מותנת/סופית', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (977, 8, 4000, N'תעודת גמר בלתי מותנת/סופית', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (978, 9, 1000, N'סיור מסירה ראשוני', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (979, 9, 3000, N'סיור מסירה ראשוני', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (980, 9, 2000, N'סיור מסירה ראשוני', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (981, 9, 4000, N'סיור מסירה ראשוני', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (982, 9, 1000, N'סיור מסירה סופי', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (983, 9, 3000, N'סיור מסירה סופי', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (984, 9, 2000, N'סיור מסירה סופי', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (985, 9, 4000, N'סיור מסירה סופי', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (986, 9, 3000, N'טופס מסירה לקבלן פיתוח / חב'' תשתית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (987, 9, 1000, N'דו"ח ביקורת בטיחות בעבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (988, 9, 3000, N'דו"ח ביקורת בטיחות בעבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (989, 9, 2000, N'דו"ח ביקורת בטיחות בעבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (990, 9, 4000, N'דו"ח ביקורת בטיחות בעבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (991, 9, 1000, N'דו"ח ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (992, 9, 3000, N'דו"ח ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (993, 9, 2000, N'דו"ח ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (994, 9, 4000, N'דו"ח ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (995, 9, 1000, N'תוכנית הסדרי תנועה (שלבי ביצוע)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (996, 9, 3000, N'תוכנית הסדרי תנועה (שלבי ביצוע)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (997, 9, 2000, N'תוכנית הסדרי תנועה (שלבי ביצוע)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (998, 9, 4000, N'תוכנית הסדרי תנועה (שלבי ביצוע)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (999, 9, 1000, N'תעודת הסמכת מנהל העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1000, 9, 3000, N'תעודת הסמכת מנהל העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1001, 9, 2000, N'תעודת הסמכת מנהל העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1002, 9, 4000, N'תעודת הסמכת מנהל העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1003, 9, 1000, N'אישור משרד העבודה למינוי מנהל עבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1004, 9, 3000, N'אישור משרד העבודה למינוי מנהל עבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1005, 9, 2000, N'אישור משרד העבודה למינוי מנהל עבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1006, 9, 4000, N'אישור משרד העבודה למינוי מנהל עבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1007, 9, 1000, N'אישור כלי צמ"ה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1008, 9, 3000, N'אישור כלי צמ"ה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1009, 9, 2000, N'אישור כלי צמ"ה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1010, 9, 4000, N'אישור כלי צמ"ה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1011, 9, 1000, N'ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1012, 9, 3000, N'ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1013, 9, 2000, N'ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1014, 9, 4000, N'ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1015, 9, 1000, N'ביקורת בטיחות באתר העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1016, 9, 3000, N'ביקורת בטיחות באתר העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1017, 9, 2000, N'ביקורת בטיחות באתר העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1018, 9, 4000, N'ביקורת בטיחות באתר העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1019, 9, 1000, N'תכנית ניהול הבטיחות + סקר סיכונים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1020, 9, 3000, N'תכנית ניהול הבטיחות + סקר סיכונים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1021, 9, 2000, N'תכנית ניהול הבטיחות + סקר סיכונים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1022, 9, 4000, N'תכנית ניהול הבטיחות + סקר סיכונים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1023, 9, 1000, N'דוח סיור יומיים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1024, 9, 3000, N'דוח סיור יומיים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1025, 9, 2000, N'דוח סיור יומיים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1026, 9, 4000, N'דוח סיור יומיים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1027, 9, 1000, N'תדריך בטיחות (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1028, 9, 3000, N'תדריך בטיחות (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1029, 9, 2000, N'תדריך בטיחות (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1030, 9, 4000, N'תדריך בטיחות (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1031, 9, 1000, N'הפנקס כללי (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1032, 9, 3000, N'הפנקס כללי (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1033, 9, 2000, N'הפנקס כללי (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1034, 9, 4000, N'הפנקס כללי (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1035, 9, 1000, N'אישור העסקת קבלן משנה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1036, 9, 3000, N'אישור העסקת קבלן משנה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1037, 9, 2000, N'אישור העסקת קבלן משנה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1038, 9, 4000, N'אישור העסקת קבלן משנה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1039, 9, 1000, N'סרטון', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1040, 9, 3000, N'סרטון', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1041, 9, 2000, N'סרטון', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1042, 9, 4000, N'סרטון', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1043, 9, 1000, N'תמונה', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1044, 9, 3000, N'תמונה', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1045, 9, 2000, N'תמונה', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1046, 9, 4000, N'תמונה', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1047, 9, 1000, N'תוכנית + תכתובת כדו"ח אחד', N'תיק הסדר תנועה בחירום', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1048, 9, 4000, N'תוכנית + תכתובת כדו"ח אחד', N'תיק הסדר תנועה בחירום', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1049, 4, 1000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-18T16:08:51.940' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1050, 4, 2000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-18T16:08:51.950' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1051, 4, 4000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-18T16:08:51.953' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1052, 4, 1000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-18T16:08:51.957' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1053, 4, 2000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-18T16:08:51.960' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1054, 4, 4000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-18T16:08:51.963' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1055, 4, 1000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-18T16:08:51.967' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1056, 4, 2000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-18T16:08:51.973' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1057, 4, 4000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-18T16:08:51.980' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1067, 4, 1000, N'פרוטוקול התייעצות עם קצין משטרה', NULL, NULL, CAST(N'2023-05-14T23:17:44.700' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1068, 4, 2000, N'פרוטוקול התייעצות עם קצין משטרה', NULL, NULL, CAST(N'2023-05-14T23:17:44.703' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1069, 4, 3000, N'פרוטוקול התייעצות עם קצין משטרה', NULL, NULL, CAST(N'2023-05-14T23:17:44.703' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1072, 1, 5000, N'מאי"ץ אגרונום', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1073, 1, 5000, N'מאי"ץ אדריכלות מבנים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1074, 1, 5000, N'מאי"ץ אדריכלות נוף', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1075, 1, 5000, N'מאי"ץ אקולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1076, 1, 5000, N'מאי"ץ אקוסטיקה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1077, 1, 5000, N'מאי"ץ בטיחות באש', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1078, 1, 5000, N'מאי"ץ גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1079, 1, 5000, N'מאי"ץ גאומטריה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1080, 1, 5000, N'מאי"ץ הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1081, 1, 5000, N'מאי"ץ הידרולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1082, 1, 5000, N'מאי"ץ איכות אויר', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1083, 1, 5000, N'מאי"ץ זיהום קרקע ומים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1084, 1, 5000, N'מאי"ץ חשמל ותאורה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1085, 1, 5000, N'מאי"ץ מים וביוב', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1086, 1, 5000, N'מאי"ץ מפרטים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1087, 1, 5000, N'מאי"ץ נגישות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1088, 1, 5000, N'מאי"ץ ניקוז', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1089, 1, 5000, N'מאי"ץ קונסטרוקציה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1090, 1, 5000, N'מאי"ץ קרקע וביסוס', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1091, 1, 5000, N'מאי"ץ שילוט', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1092, 1, 5000, N'מאי"ץ תחבורה ציבורית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1093, 1, 5000, N'מאי"ץ תיאום תשתיות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1094, 1, 5000, N'מאי"ץ תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1095, 1, 5000, N'מאי"ץ תכנון אורבני', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1096, 1, 5000, N'מאי"ץ תכנון סביבתי', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1097, 1, 5000, N'מאי"ץ תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1098, 1, 5000, N'מאי"ץ תכנון תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1099, 2, 5000, N'מאי"ץ אגרונום', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1100, 2, 5000, N'מאי"ץ אדריכלות מבנים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1101, 2, 5000, N'מאי"ץ אדריכלות נוף', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1102, 2, 5000, N'מאי"ץ אקולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1103, 2, 5000, N'מאי"ץ אקוסטיקה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1104, 2, 5000, N'מאי"ץ בטיחות באש', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1105, 2, 5000, N'מאי"ץ גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1106, 2, 5000, N'מאי"ץ גאומטריה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1107, 2, 5000, N'מאי"ץ הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1108, 2, 5000, N'מאי"ץ הידרולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1109, 2, 5000, N'מאי"ץ איכות אויר', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1110, 2, 5000, N'מאי"ץ זיהום קרקע ומים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1111, 2, 5000, N'מאי"ץ חשמל ותאורה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1112, 2, 5000, N'מאי"ץ מים וביוב', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1113, 2, 5000, N'מאי"ץ מפרטים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1114, 2, 5000, N'מאי"ץ נגישות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1115, 2, 5000, N'מאי"ץ ניקוז', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1116, 2, 5000, N'מאי"ץ קונסטרוקציה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1117, 2, 5000, N'מאי"ץ קרקע וביסוס', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1118, 2, 5000, N'מאי"ץ שילוט', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1119, 2, 5000, N'מאי"ץ תחבורה ציבורית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1120, 2, 5000, N'מאי"ץ תיאום תשתיות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1121, 2, 5000, N'מאי"ץ תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1122, 2, 5000, N'מאי"ץ תכנון אורבני', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1123, 2, 5000, N'מאי"ץ תכנון סביבתי', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1124, 2, 5000, N'מאי"ץ תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1125, 2, 5000, N'מאי"ץ תכנון תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1126, 3, 5000, N'מאי"ץ אגרונום', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1127, 3, 5000, N'מאי"ץ אדריכלות מבנים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1128, 3, 5000, N'מאי"ץ אדריכלות נוף', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1129, 3, 5000, N'מאי"ץ אקולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1130, 3, 5000, N'מאי"ץ אקוסטיקה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1131, 3, 5000, N'מאי"ץ בטיחות באש', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1132, 3, 5000, N'מאי"ץ גיאולוגיה הנדסית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1133, 3, 5000, N'מאי"ץ גאומטריה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1134, 3, 5000, N'מאי"ץ הידרוגיאולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1135, 3, 5000, N'מאי"ץ הידרולוגיה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1136, 3, 5000, N'מאי"ץ איכות אויר', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1137, 3, 5000, N'מאי"ץ זיהום קרקע ומים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1138, 3, 5000, N'מאי"ץ חשמל ותאורה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1139, 3, 5000, N'מאי"ץ מים וביוב', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1140, 3, 5000, N'מאי"ץ מפרטים', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1141, 3, 5000, N'מאי"ץ נגישות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1142, 3, 5000, N'מאי"ץ ניקוז', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1143, 3, 5000, N'מאי"ץ קונסטרוקציה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1144, 3, 5000, N'מאי"ץ קרקע וביסוס', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1145, 3, 5000, N'מאי"ץ שילוט', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1146, 3, 5000, N'מאי"ץ תחבורה ציבורית', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1147, 3, 5000, N'מאי"ץ תיאום תשתיות', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1148, 3, 5000, N'מאי"ץ תכן מבנה מיסעה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1149, 3, 5000, N'מאי"ץ תכנון אורבני', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1150, 3, 5000, N'מאי"ץ תכנון סביבתי', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1151, 3, 5000, N'מאי"ץ תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1152, 3, 5000, N'מאי"ץ תכנון תקשורת ומערכות לבקרת תנועה', NULL, NULL, CAST(N'2023-06-13T17:29:32.640' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1153, 4, 5000, N'תכנית הסדרי תנועה סופיים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1154, 4, 5000, N'תכנית הסדרי תנועה לשלבי ביצוע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1155, 4, 5000, N'הסדר הנדסי לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1156, 4, 5000, N'תוכנית זמנים לרמזור', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1157, 5, 5000, N'תוכניות מופקדות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1158, 5, 5000, N'תוכניות מופקדות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1159, 5, 5000, N'תוכניות מופקדות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1160, 5, 5000, N'תוכניות מופקדות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1161, 5, 5000, N'תוכניות מאושרות – תשריט (מפה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1162, 5, 5000, N'תוכניות מאושרות – תקנון (הוראות התוכנית)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1163, 5, 5000, N'תוכניות מאושרות – נספחים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1164, 5, 5000, N'תוכניות מאושרות – תכתובת כללית (טרום אישור)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1165, 5, 5000, N'החלטות מוסדות תכנון', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1166, 6, 5000, N'תיק תשלום (תשלום בגין הפקעה)', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1167, 6, 5000, N'תחשיב אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1168, 6, 5000, N'מסמך חוות דעת חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1169, 6, 5000, N'דו"ח בקרת אומדן חתום', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1170, 6, 5000, N'אישור הקלדת אומדן', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1171, 6, 5000, N'בקרת מדידה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1172, 6, 5000, N'מפת תכולה חתומה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1173, 6, 5000, N'הודעת רכישה (תכנית הכרזה) - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1174, 6, 5000, N'תשריט הפקעות - גוש חלקה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1175, 6, 5000, N'תצ"ר - גוש', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1176, 6, 5000, N'וועדות פיצויים', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1177, 6, 5000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1178, 6, 5000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1179, 6, 5000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1180, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1181, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1182, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1183, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1184, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1185, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'תשתיות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1186, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1187, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1188, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1189, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1190, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1191, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1192, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1193, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1194, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1195, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1196, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1197, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1198, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1199, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1200, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'התקנת מעקות בטיחות', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1201, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1202, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1203, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'גשרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1204, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1205, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1206, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1207, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1208, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1209, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'מנהור', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1210, 7, 5000, N'תעודות בדיקות מעבדה', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1211, 7, 5000, N'רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1212, 7, 5000, N'תעודות + רשימת תיוג', N'בקרה שוטפת', N'רכבת', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1213, 7, 5000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1214, 7, 5000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1215, 7, 5000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1216, 7, 5000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'קבלני משנה', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1217, 7, 5000, N'אישור נתי למפעלים / ISO / תו תקן - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1218, 7, 5000, N'אישור נתי למפעלים / ISO / תו תקן - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1219, 7, 5000, N'אישורי ספקים / צוותים / נותני שירותים - אישורים', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1220, 7, 5000, N'אישורי ספקים / צוותים / נותני שירותים - הסמכות', N'בקרה מקדימה', N'ספקים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1221, 7, 5000, N'ריכוז אישורי חומרים - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1222, 7, 5000, N'ריכוז אישורי חומרים - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1223, 7, 5000, N'תעודות אחריות למוצר - אישורים', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1224, 7, 5000, N'תעודות אחריות למוצר - הסמכות', N'בקרה מקדימה', N'חומרים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1225, 7, 5000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'עפר', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1226, 7, 5000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'תשתית', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1227, 7, 5000, N'בדיקת תסבולת מבנית FWD', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1228, 7, 5000, N'בדיקות גליות', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1229, 7, 5000, N'סקר נזקים על פי שיטת PAVER', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1230, 7, 5000, N'בדיקות התנגדות להחלקה', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1231, 7, 5000, N'סקר מבנים ראשוני', N'בדיקות קבלה', N'מיסעות/מבנה אספלטי', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1232, 7, 5000, N'צילום מערכת תשתית (קובץ וידאו)', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1233, 7, 5000, N'בדיקת אטימות למערכות תשתית', N'בדיקות קבלה', N'ניקוז', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1234, 7, 5000, N'בדיקות נראות של שילוט ותמרור', N'בדיקות קבלה', N'ריהוט הדרך', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1235, 7, 5000, N'בדיקות נראות של סימני דרך', N'בדיקות קבלה', N'סימון כבישים', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1236, 7, 5000, N'בדיקות עוצמות תאורה', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1237, 7, 5000, N'בדיקות רמזורים', N'בדיקות קבלה', N'חשמל', CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1238, 7, 5000, N'מסמכי אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1239, 7, 5000, N'ריכוז אי התאמה', N'אי התאמות / חריגים', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1240, 8, 5000, N'כבישים (תוכנית כללית) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1241, 8, 5000, N'חשמל ותאורה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1242, 8, 5000, N'אדריכלות נוף (גינון) - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1243, 8, 5000, N'תנועה ושילוט - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1244, 8, 5000, N'תאום מערכות/תשתית - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1245, 8, 5000, N'ניקוז והידרולוגיה - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1246, 8, 5000, N'מסילות רכבת - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1247, 8, 5000, N'מבנים וגשרים - תוכניות סרוקות וחתומות (PDF)', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1248, 8, 5000, N'כבישים (תוכנית כללית) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1249, 8, 5000, N'חשמל ותאורה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1250, 8, 5000, N'אדריכלות נוף (גינון) - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1251, 8, 5000, N'תנועה ושילוט - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1252, 8, 5000, N'תאום מערכות/תשתית - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1253, 8, 5000, N'ניקוז והידרולוגיה - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1254, 8, 5000, N'מסילות רכבת - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1255, 8, 5000, N'מבנים וגשרים - קבצי אוטוקאד', N'תוכניות עדות AS MADE', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1256, 8, 5000, N'יומן עבודה', N'יומני עבודה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1257, 8, 5000, N'סט תוכניות לביצוע', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1258, 8, 5000, N'צו התחלת עבודה', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1259, 8, 5000, N'מפרט טכני (פרשה טכנית)', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1260, 8, 5000, N'מסמך RFT', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1261, 8, 5000, N'חוזה + נספחים', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1262, 8, 5000, N'כתב כמויות - PDF', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1263, 8, 5000, N'כתב כמויות - EXCEL', N'סט תוכניות לביצוע - בשלב המכרז (תיק מטלה)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1264, 8, 5000, N'סט תוכניות לביצוע - בסוף הביצוע - קבצי אוטוקאד', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1265, 8, 5000, N'סט תוכניות לביצוע - בסוף הביצוע - PDF', N'סט תוכניות לביצוע - בסוף הביצוע', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1266, 8, 5000, N'טופס ריכוז נתונים לחשבון סופי', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1267, 8, 5000, N'חשבון סופי (דרישת קבלן)-אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1268, 8, 5000, N'חשבון סופי (דרישת קבלן)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1269, 8, 5000, N'חשבון סופי (המלצת מנה"פ) -אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1270, 8, 5000, N'חשבון סופי (המלצת מנה"פ)– PDF חתום', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1271, 8, 5000, N'סקיצות- AS- MADE – DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1272, 8, 5000, N'סקיצות- AS- MADE – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1273, 8, 5000, N'חישובי כמויות לכל סעיף – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1274, 8, 5000, N'חישובי כמויות לכל סעיף – PDF', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1275, 8, 5000, N'חישובי כמויות + צילום מיומן העבודה לכל סעיף', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1276, 8, 5000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות – אקסל', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1277, 8, 5000, N'חישובי כמויות המבוססות של שינויים/ עדכונים/ בתכניות- DWG', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1278, 8, 5000, N'מכתב הסבר מפורט ממנהל הפרויקט', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1279, 8, 5000, N'מכתב בקשה מהקבלן', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1280, 8, 5000, N'אסמכתא לביצוע העבודה', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1281, 8, 5000, N'אחר', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1282, 8, 5000, N'תצלומי שטח', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1283, 8, 5000, N'המלצת היחידה ההנדסית', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1284, 8, 5000, N'פרוטוקול ואישור וש"ה', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1285, 8, 5000, N'היעדר תביעות', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1286, 8, 5000, N'פלט חשבון', N'חשבון סופי SAP - שלב ב''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1287, 9, 5000, N'פיקוח עליון מתכנן מוביל', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1288, 9, 5000, N'פיקוח עליון בקר תכנון', N'דו"חות פיקוח עליון', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1289, 9, 5000, N'ישיבות אתר', N'סיכומי ישיבות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1290, 9, 5000, N'אישורי צד ג'' חברות תשתית', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1291, 9, 5000, N'הרשאות לצדי ג'' לעבודות ייזומות ע"י נת"י', N'אישורים והתרי חפירה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1292, 9, 5000, N'הסכמים', N'הסכמים עם רשויות (גינון)', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1293, 9, 5000, N'טופס מסירה סופי לאחזקה', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1294, 9, 5000, N'תעודת גמר מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1295, 8, 5000, N'תעודת גמר בלתי מותנת/סופית', N'בקשה חשבון סופי SAP - שלב א''', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1296, 9, 5000, N'סיור מסירה ראשוני', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1297, 9, 5000, N'סיור מסירה סופי', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1298, 9, 5000, N'דו"ח ביקורת בטיחות בעבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1299, 9, 5000, N'דו"ח ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1300, 9, 5000, N'תוכנית הסדרי תנועה (שלבי ביצוע)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1301, 9, 5000, N'תעודת הסמכת מנהל העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1302, 9, 5000, N'אישור משרד העבודה למינוי מנהל עבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1303, 9, 5000, N'אישור כלי צמ"ה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1304, 9, 5000, N'ביקורת בטיחות בתנועה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1305, 9, 5000, N'ביקורת בטיחות באתר העבודה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1306, 9, 5000, N'תכנית ניהול הבטיחות + סקר סיכונים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1307, 9, 5000, N'דוח סיור יומיים', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1308, 9, 5000, N'תדריך בטיחות (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1309, 9, 5000, N'הפנקס כללי (חתום)', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1310, 9, 5000, N'אישור העסקת קבלן משנה', N'בטיחות', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1311, 9, 5000, N'סרטון', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1312, 9, 5000, N'תמונה', N'תיעוד מצולם ממהלך וסוף הפרויקט', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1313, 9, 5000, N'תוכנית + תכתובת כדו"ח אחד', N'תיק הסדר תנועה בחירום', NULL, CAST(N'2023-04-03T10:51:19.417' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1314, 4, 5000, N'מכתב נלווה', NULL, NULL, CAST(N'2023-04-18T16:08:51.940' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1315, 4, 5000, N'נספח תנועה לתב"ע', NULL, NULL, CAST(N'2023-04-18T16:08:51.957' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1316, 4, 5000, N'תשריט מוצע', NULL, NULL, CAST(N'2023-04-18T16:08:51.967' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1317, 4, 5000, N'פרוטוקול התייעצות עם קצין משטרה', NULL, NULL, CAST(N'2023-05-14T23:17:44.700' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1318, 9, 1000, N'טופס מסירה לקבלן פיתוח / חב'' תשתית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:57:15.023' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1319, 9, 3000, N'טופס מסירה לקבלן פיתוח / חב'' תשתית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:57:26.993' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1320, 9, 5000, N'טופס מסירה לקבלן פיתוח / חב'' תשתית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:57:26.993' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1321, 9, 1000, N'תעודת גמר בלתי מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:58:04.363' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1322, 9, 2000, N'תעודת גמר בלתי מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:58:04.367' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1323, 9, 3000, N'תעודת גמר בלתי מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:58:04.367' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1324, 9, 4000, N'תעודת גמר בלתי מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:58:04.367' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] ([Id], [LevelCode], [ClassificationCode], [DocType], [DocSubject], [Discipline], [UpdateDate], [IsRowDeleted], [UpdateUser]) VALUES (1325, 9, 5000, N'תעודת גמר בלתי מותנית', N'מסירת השטח לאחזקה', NULL, CAST(N'2023-06-13T17:58:04.370' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Classification_BusinessLevels_DocumentsTypes] OFF
GO




update Projects set ClassificationCode = 1000 where ClassificationCode in (2000,3000)
update Projects set ClassificationCode = 5000 where ProjectTypes like N'%מאי"ץ%' and ClassificationCode <> 5000