USE [Archive_QA]
GO

/****** Object:  View [dbo].[ProjectsFull]    Script Date: 5/16/2023 11:07:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[ProjectsFull]
AS
  SELECT Row_number() OVER (ORDER BY L.ProjectId DESC) AS Id,
         p.ProjectId,
         L.LevelCode AS 'LevelCode',
         p.ManhapAllUserName,
         p.MNF,
         p.RoadRailNum,
         p.ControlManager,
         p.MainContractor,
         p.WBS_Num,
         p.OperationDepartment,
         p.ManagementCompany,
         p.MamapFullName,
         p.MamapUserName,
         p.ManhapFullName,
         P.ManhapUserName,
         P.PlannerAllUserName,
         P.Name,
         P.Interchange,
         P.TenderType,
         bll.Description AS 'CurrentLevelDesc',
         L.BusinessLevelControlStatusCode,
         L.PhaseApprovalMamapCode,
         bls.Description AS 'MamapStatusDesc',
         blsl.Description AS 'ArchivStatusDesc',
         L.PhaseApprovalArcCode,
         L.Contract,
         L.StartBusinessLevelDate,
         f.CreateUser,
         d.IsComments,
         dd.IsInvalidDocs
  FROM   Projects P
         LEFT JOIN ProjectBusinessLevel L ON P.ProjectId = L.ProjectId AND P.CurrentLevelCode = L.LevelCode
         LEFT JOIN [LOOKUP].[BusinessLevel] bll ON L.LevelCode = bll.Code
         LEFT JOIN [LOOKUP].[PhaseApprovalStatus] blsl ON L.PhaseApprovalArcCode = blsl.Code
         LEFT JOIN [LOOKUP].[PhaseApprovalStatus] bls ON L.PhaseApprovalMamapCode = bls.Code
         LEFT JOIN FavoriteProjects f ON p.ProjectId = f.ProjectId AND L.LevelCode = f.LevelCode AND ( L.Contract = f.Contract OR ( L.Contract IS NULL AND f.Contract IS NULL ) )
         LEFT JOIN (SELECT DISTINCT ProjectId, LevelCode, Contract, CONVERT(BIT, 1) AS IsComments FROM   ProjectDocuments WHERE  ManhapComments IS NOT NULL) d 
					ON( p.ProjectId = d.ProjectId AND L.LevelCode = d.LevelCode AND ( L.Contract = d.Contract OR ( L.Contract IS NULL AND d.Contract IS NULL ) ) )
         LEFT JOIN (SELECT DISTINCT ProjectId,  CONVERT(BIT, 1) AS IsInvalidDocs FROM   ProjectDocuments WHERE  DocumentStatusCode = 3) dd
				    ON( p.ProjectId = dd.ProjectId  )
GO


