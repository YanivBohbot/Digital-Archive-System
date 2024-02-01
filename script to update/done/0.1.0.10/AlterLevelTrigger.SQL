/****** Object:  Trigger [dbo].[SOABusinessLevelTrigger]    Script Date: 7/10/2023 6:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[SOABusinessLevelTrigger]
ON [dbo].[SOABusinessLevel]
FOR  UPDATE, INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	  
	  declare 
			@ProjectId [varchar](50),
			@Contract [nvarchar](255),
			@LevelCode [int],
			@MNF [nvarchar](255),
			@LevelStatus [int],
			@NewStatusLevelCode [int],
			@FromInterface [int]

			
		SET @ProjectId = (SELECT  i.ProjectId From inserted i )
		SET @Contract = (SELECT  i.[Contract] From inserted i )
		SET @LevelCode = (SELECT  i.LevelCode From inserted i )
		SET @NewStatusLevelCode = (SELECT  i.StatusLevelCode From inserted i )
		SET @FromInterface = (SELECT  i.FromInterface From inserted i )

		
	IF EXISTS (SELECT * FROM ProjectBusinessLevel p
			WHERE @ProjectId = p.ProjectId 
			AND (p.Contract = @Contract OR (p.Contract IS NULL AND @Contract IS NULL) )
			AND p.LevelCode = @LevelCode)
		begin

			
			SET @LevelStatus = (SELECT top 1 BusinessLevelControlStatusCode FROM ProjectBusinessLevel p
			WHERE @ProjectId = p.ProjectId 
			AND (p.Contract = @Contract OR (p.Contract IS NULL AND @Contract IS NULL) )
			AND p.LevelCode = @LevelCode)

			--if the existing project is not yet started, and we inserted same project with status of not yet complete, treat it as new
			if (@LevelStatus = 3 AND @NewStatusLevelCode = 1 AND @FromInterface = 1)
			begin

				UPDATE [dbo].[Projects]
				SET CurrentLevelCode = @LevelCode
				WHERE ProjectId = @ProjectId
			end

			UPDATE dbo.ProjectBusinessLevel 
				
				SET 
				 StartBusinessLevelDate = CASE WHEN (i.StatusLevelCode = 1) THEN i.StartLevelDate ELSE p.StartBusinessLevelDate END,
				 BusinessLevelControlStatusCode = CASE WHEN (BusinessLevelControlStatusCode = 3 OR BusinessLevelControlStatusCode = 1) THEN 
														CASE WHEN (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1) THEN 2 ELSE 1 END 
														ELSE BusinessLevelControlStatusCode END, 
				 BusinessLevelStatusDate = GETDATE(),
				 PhaseApprovalArcCode =  CASE WHEN (BusinessLevelControlStatusCode = 3 OR BusinessLevelControlStatusCode = 1)
												AND (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1) THEN 3 ELSE PhaseApprovalArcCode END,
				 PhaseApprovalMamapCode =	CASE	
												WHEN i.LevelCode = 8 THEN 2 
												ELSE 
													CASE 
														WHEN (BusinessLevelControlStatusCode = 3 OR BusinessLevelControlStatusCode = 1)
														AND  (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1)  THEN 3 
														ELSE PhaseApprovalMamapCode 
													END
											END,
				 PhaseApprovalArcDate = CASE 
											WHEN (BusinessLevelControlStatusCode = 3 OR BusinessLevelControlStatusCode = 1)
											AND  (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1)  THEN NULL 
											ELSE PhaseApprovalArcDate 
										END,
				   PhaseApprovalMamapDate = CASE	
												WHEN i.LevelCode = 8 THEN GETDATE() 
												ELSE 
													CASE 
														WHEN (BusinessLevelControlStatusCode = 3 OR BusinessLevelControlStatusCode = 1)
														AND  (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1)  THEN NULL 
														ELSE PhaseApprovalMamapDate 
													END
											END ,
				 --UserNameArchiv = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
					--				ELSE p.UserNameArchiv END,
				 --UserNameMamap = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
					--				ELSE p.UserNameMamap END,
				 IV_CCRN = i.IV_CCRN,
				 FromInterface = i.FromInterface,
				 UpdateDate=getdate()
				 

			From inserted i join ProjectBusinessLevel p
				on @ProjectId = p.ProjectId 
				AND (p.Contract = @Contract OR (p.Contract IS NULL AND @Contract IS NULL) )
				AND p.LevelCode = @LevelCode
		end
			
		
	ELSE
		begin
			
			if (@FromInterface = 1)
			begin
				UPDATE [dbo].[Projects]
				SET CurrentLevelCode = @LevelCode
				WHERE ProjectId = @ProjectId
			end

			SET @MNF = (SELECT p.MNF From Projects p WHERE p.ProjectId = @ProjectId)

			INSERT INTO  dbo.ProjectBusinessLevel
			(ProjectId, MNF, LevelCode, Contract, StartBusinessLevelDate, BusinessLevelControlStatusCode, BusinessLevelStatusDate, 
			PhaseApprovalArcCode, PhaseApprovalMamapCode, PhaseApprovalArcDate, PhaseApprovalMamapDate,
				UserNameArchiv, UserNameMamap, DesignatedSpace, IV_CCRN, FromInterface)
				
			 SELECT  
			 @ProjectId,
			 @MNF, 
			 i.LevelCode ,
			 i.[Contract],
			 i.StartLevelDate, 
			 CASE WHEN (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1) THEN 2 ELSE 1 END, 
			 GETDATE(),
			 CASE WHEN (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1) THEN 3 ELSE 2 END,
			 CASE WHEN i.LevelCode = 8 THEN 2 
					ELSE CASE WHEN (i.StatusLevelCode = 3 OR i.StatusLevelCode = 1) THEN 3 ELSE 2 END END,
			 NULL,
			  CASE WHEN i.LevelCode = 8 THEN GETDATE() 
					ELSE NULL END,
			 NULL,
			 NULL,
			 NULL,
			 i.IV_CCRN,
			 i.FromInterface
			 FROM inserted i


		end
			
			UPDATE dbo.SOABusinessLevel
			SET ManagementStatus = case when @@ROWCOUNT = 0 then  N'בתהליך כשל' else  N'טופל' end,
			Error = case when @@ROWCOUNT = 0 then 'Failed To Update Data' end
			WHERE ProjectId = @ProjectId

			
		
	
END
