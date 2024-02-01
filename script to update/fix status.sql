
select * from LOOKUP.PhaseApprovalStatus
select * from LOOKUP.BusinessLevelControlStatus

--select new 4,5,6 with wrong approve date
select * from [dbo].[ProjectBusinessLevel] where PhaseApprovalArcCode = 3 and LevelCode in (4,5,6) and PhaseApprovalArcDate = StartBusinessLevelDate
--update  [dbo].[ProjectBusinessLevel] set PhaseApprovalArcDate=null where PhaseApprovalArcCode = 3 and LevelCode in (4,5,6) and PhaseApprovalArcDate = StartBusinessLevelDate
select * from [dbo].[ProjectBusinessLevel] where PhaseApprovalMamapCode = 3 and LevelCode in (4,5,6) and PhaseApprovalMamapDate = StartBusinessLevelDate
--update  [dbo].[ProjectBusinessLevel] set PhaseApprovalMamapDate=null where PhaseApprovalMamapCode = 3 and LevelCode in (4,5,6) and PhaseApprovalMamapDate = StartBusinessLevelDate


--fix arc status complete
select * from [dbo].[ProjectBusinessLevel]
where  PhaseApprovalArcDate is not null and PhaseApprovalArcCode <> 2

--update [dbo].[ProjectBusinessLevel]
--SET PhaseApprovalArcCode = 2 
--where  PhaseApprovalArcDate is not null

--select * from [dbo].[ProjectBusinessLevel]
--where  PhaseApprovalArcDate is not null and PhaseApprovalArcCode <> 2

--fix mmp status complete
select * from [dbo].[ProjectBusinessLevel]
where  PhaseApprovalMamapDate is not null and PhaseApprovalMamapCode <> 2

--update [dbo].[ProjectBusinessLevel]
--SET PhaseApprovalMamapCode = 2 
--where  PhaseApprovalMamapDate is not null

--select * from [dbo].[ProjectBusinessLevel]
--where  PhaseApprovalMamapDate is not null and PhaseApprovalMamapCode <> 2

--fix level complete
select * from [dbo].[ProjectBusinessLevel]
where PhaseApprovalMamapCode = 2 and PhaseApprovalArcCode = 2 and BusinessLevelControlStatusCode <> 1

--update [dbo].[ProjectBusinessLevel]
--SET BusinessLevelControlStatusCode = 1 
--where PhaseApprovalMamapCode = 2 and PhaseApprovalArcCode = 2 and BusinessLevelControlStatusCode <> 1

--select * from [dbo].[ProjectBusinessLevel]
--where PhaseApprovalMamapCode = 2 and PhaseApprovalArcCode = 2 and BusinessLevelControlStatusCode <> 1

-- fix arc  status non complete
select * from [dbo].[ProjectBusinessLevel]
where BusinessLevelControlStatusCode = 2 and PhaseApprovalArcDate is null and  (PhaseApprovalArcCode is null or PhaseApprovalArcCode=1)

--update [dbo].[ProjectBusinessLevel]
--SET PhaseApprovalArcCode = 3 
--where BusinessLevelControlStatusCode = 2 and PhaseApprovalArcDate is null and  (PhaseApprovalArcCode is null or PhaseApprovalArcCode=1)

--select * from [dbo].[ProjectBusinessLevel]
--where BusinessLevelControlStatusCode = 2 and PhaseApprovalArcDate is null and  (PhaseApprovalArcCode is null or PhaseApprovalArcCode=1)

-- fix mamap status non complete
select * from [dbo].[ProjectBusinessLevel]
where BusinessLevelControlStatusCode = 2 and PhaseApprovalMamapDate is null and  (PhaseApprovalMamapCode is null or PhaseApprovalMamapCode=1)

--update [dbo].[ProjectBusinessLevel]
--SET PhaseApprovalMamapCode = 3 
--where BusinessLevelControlStatusCode = 2 and PhaseApprovalMamapDate is null and  (PhaseApprovalMamapCode is null or PhaseApprovalMamapCode=1)

--select * from [dbo].[ProjectBusinessLevel]
--where BusinessLevelControlStatusCode = 2 and PhaseApprovalMamapDate is null and  (PhaseApprovalMamapCode is null or PhaseApprovalMamapCode=1)


--set not yet complete
--update ProjectBusinessLevel set BusinessLevelControlStatusCode=2 
--where BusinessLevelControlStatusCode = 1 
--and (PhaseApprovalArcCode =3 or PhaseApprovalMamapCode=3)


--reset all to before start
--update [dbo].[ProjectBusinessLevel] set 
--	BusinessLevelControlStatusCode=3,
--	PhaseApprovalArcCode = 1,
--	PhaseApprovalMamapCode = 1 ,
--	StartBusinessLevelDate= NULL,
--	BusinessLevelStatusDate=NULL,
--	FromInterface=NULL
--where BusinessLevelControlStatusCode <>1

