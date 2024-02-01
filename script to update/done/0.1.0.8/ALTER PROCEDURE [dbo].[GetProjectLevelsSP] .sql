USE [Archive_QA]
GO

/****** Object:  StoredProcedure [dbo].[GetProjectLevelsSP]    Script Date: 7/3/2023 2:48:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER PROCEDURE [dbo].[GetProjectLevelsSP] 
	@Project_ID nvarchar(50)
AS
BEGIN
	--declare @Project_ID nvarchar(50) = '55173';
	SELECT distinct p.ProjectId, cbl.LevelCode, bl.Description,  pbl.StartBusinessLevelDate, 
		pbl.BusinessLevelControlStatusCode  , blcs.Description AS BusinessLevelControlStatusDesc,
		pbl.BusinessLevelStatusDate, (	SELECT count (*) FROM ProjectDocuments WHERE ProjectId = p.ProjectId and LevelCode = cbl.LevelCode and DocumentStatusCode= 3) AS 'InvalidDocsCount', 
		pbl.PhaseApprovalArcCode, pasA.Description AS PhaseApprovalArcDesc, pbl.PhaseApprovalArcDate, pbl.UserNameArchiv, 
		pbl.PhaseApprovalMamapCode, pasM.Description AS PhaseApprovalMamapDesc, pbl.PhaseApprovalMamapDate, pbl.UserNameMamap, 
		pbl.Contract
		FROM [dbo].[Projects] p 
		inner JOIN [dbo].[Classification_BusinessLevels_DocumentsTypes] cbl ON p.ClassificationCode = cbl.ClassificationCode 
		LEFT JOIN [dbo].[ProjectBusinessLevel] pbl ON p.ProjectId = pbl.ProjectId and pbl.LevelCode = cbl.LevelCode 
		LEFT JOIN [LOOKUP].[BusinessLevel] bl ON cbl.LevelCode = bl.Code
		LEFT JOIN [LOOKUP].[BusinessLevelControlStatus] blcs ON blcs.Code = pbl.BusinessLevelControlStatusCode
		LEFT JOIN [LOOKUP].[PhaseApprovalStatus] pasA ON pasA.Code = pbl.PhaseApprovalArcCode
		LEFT JOIN [LOOKUP].[PhaseApprovalStatus] pasM ON pasM.Code = pbl.PhaseApprovalMamapCode
	WHERE p.[ProjectId] = @Project_ID --and (pbl.BusinessLevelControlStatusCode = 1 or pbl.BusinessLevelControlStatusCode = 2)
END

GO


