USE [Archive_QA]
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
         LEFT JOIN (SELECT DISTINCT ProjectId, LevelCode, Contract, CONVERT(BIT, 1) AS IsInvalidDocs FROM   ProjectDocuments WHERE  DocumentStatusCode = 3) dd
				    ON( p.ProjectId = dd.ProjectId AND L.LevelCode = dd.LevelCode AND ( L.Contract = dd.Contract OR ( L.Contract IS NULL AND dd.Contract IS NULL ) ) )

go 

/****** Object:  StoredProcedure [dbo].[CheckIfLevelExists]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[CheckIfLevelExists] 
	@ProjectId varchar(50),
	@LevelCode int,
	@Contract varchar(50)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM dbo.ProjectBusinessLevel  WHERE ProjectId = @ProjectId  AND LevelCode = @LevelCode AND [Contract] = @Contract)
		BEGIN
			SELECT 1 AS result
		END
	ELSE
		BEGIN
			SELECT -1 AS result
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCombosSP]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetCombosSP] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   

	SELECT value as WBS into #TableWBS
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.WBS_Num, ',');

	SELECT value as Agaf into #TableAgaf
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.OperationDepartment, ',');

	SELECT value as ControlManagers into #TableControlManagers
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.ControlManager, ',');

	SELECT value as Tenders into #TableTenders
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.TenderType, ',');

	SELECT value as Contracts into #TableContracts
	FROM ProjectBusinessLevel pb 
	CROSS APPLY STRING_SPLIT(pb.Contract, ',');

	SELECT value as Contractors into #TableContractors
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.MainContractor, ',');

	SELECT value as Company into #TableCompany
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.ManagementCompany, ',');

	SELECT value as Mamap into #TableMamap
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.MamapFullName, ',');

	SELECT value as Manhap into #TableManhap
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.ManhapFullName, ',');

	SELECT value as Roads into #TableRoads
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.RoadRailNum, ',');

	SELECT value as Intersects into #TableIntersects
	FROM Projects p 
	CROSS APPLY STRING_SPLIT(p.Interchange, ',');



	SELECT DISTINCT WBS FROM #TableWBS WHERE len(WBS) > 0
	SELECT DISTINCT Agaf FROM #TableAgaf WHERE len(Agaf) > 0
	SELECT DISTINCT ControlManagers FROM #TableControlManagers WHERE len(ControlManagers) > 0
	SELECT DISTINCT Tenders FROM #TableTenders WHERE len(Tenders) > 0
	SELECT DISTINCT Contracts FROM #TableContracts WHERE len(Contracts) > 0
	SELECT DISTINCT Contractors FROM #TableContractors WHERE len(Contractors) > 0
	SELECT DISTINCT Company FROM #TableCompany WHERE len(Company) > 0
	SELECT DISTINCT Mamap FROM #TableMamap WHERE len(Mamap) > 0
	SELECT DISTINCT Manhap FROM #TableManhap WHERE len(Manhap) > 0
	SELECT DISTINCT Roads FROM #TableRoads WHERE len(Roads) > 0
	SELECT DISTINCT Intersects FROM #TableIntersects WHERE len(Intersects) > 0

	drop Table #TableWBS, #TableAgaf, #TableControlManagers, #TableTenders, #TableContracts, #TableContractors, #TableCompany, #TableMamap, #TableManhap, #TableRoads, #TableIntersects 
END
GO
/****** Object:  StoredProcedure [dbo].[GetFinishedProjectsSP]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetFinishedProjectsSP] 
	@LastRun [DateTime] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	

	SELECT ProjectId, ProjectTypes, CS.Description as ProjectStatus, MamapUserName, 
	MamapFullName, MamapEmail, ManhapUserName, ManhapEmail,ManhapFullName, MNF, AgafManagerEmail, MemoneBakaraEmail
	FROM [dbo].[Projects] 
		inner join [LOOKUP].[CaseControlStatus] CS on CaseControlStatusCode = CS.Code
	WHERE CaseControlDate > @LastRun AND CaseControlStatusCode = 1
	ORDER by ManhapUserName asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetInvalidDocsSP]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetInvalidDocsSP] 
	@LastRun [DateTime] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	

	SELECT P.ManhapUserName, MNF, ProjectTypes, BL.Description as LevelName, PD.DocType as DocumentType, 
	Discipline, DocName, ControlComments, RR.Description as RejectReason, P.ManhapEmail, P.MemoneBakaraEmail
	FROM [dbo].[ProjectDocuments] PD inner join [dbo].[Projects] P  on P.ProjectId = PD.ProjectId 
		inner join [LOOKUP].[BusinessLevel] BL on LevelCode = BL.Code
		inner join [LOOKUP].[RejectReason] RR on ReasonRejectCode = RR.Code
	WHERE PD.ControlDate > @LastRun AND PD.DocumentStatusCode = 3
	ORDER by ManhapUserName,P.ProjectId,AttachedDate asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetLookup]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetLookup]
	@Name [nvarchar](50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF(@Name = 'businesslevel')
	BEGIN
		SELECT [Code],[Description],[SOAUrl] FROM LOOKUP.BusinessLevel ORDER BY [Code]
	END
	IF(@Name = 'rejectreason')
	BEGIN
		SELECT [Code],[Description] FROM LOOKUP.RejectReason ORDER BY [Code]
	END
	IF(@Name = 'documentstatus')
	BEGIN
		SELECT [Code],[Description] FROM LOOKUP.DocumentStatus ORDER BY [Code]
	END
	IF(@Name = 'designatedspace')
	BEGIN
		SELECT [Code],[Description] FROM LOOKUP.DesignatedSpace ORDER BY [Code]
	END
	IF(@Name = 'phaseapprovalstatus')
	BEGIN
		SELECT [Code],[Description] FROM LOOKUP.PhaseApprovalStatus ORDER BY [Code]
	END
	IF(@Name = 'BusinessLevelControlStatus')
	BEGIN
		SELECT [Code],[Description] FROM LOOKUP.BusinessLevelControlStatus ORDER BY [Code]
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetProjectDocTypes]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER procedure [dbo].[GetProjectDocTypes] 
@Project_ID nvarchar(50),
@LevelCode int
as
BEGIN
	select distinct cld.[DocType],cld.Discipline,cld.DocSubject
	from [dbo].[Classification_BusinessLevels_DocumentsTypes] cld 
	where cld.LevelCode = @LevelCode and cld.ClassificationCode = 
		(select ClassificationCode
		from Projects p 
		where ProjectId = @Project_ID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetProjectLevelsSP]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








ALTER procedure [dbo].[GetProjectLevelsSP] 
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
		LEFT JOIN [dbo].[ProjectBusinessLevel] pbl ON p.ProjectId = pbl.ProjectId and pbl.LevelCode = cbl.LevelCode and (pbl.BusinessLevelControlStatusCode = 1 or pbl.BusinessLevelControlStatusCode = 2)
		LEFT JOIN [LOOKUP].[BusinessLevel] bl ON cbl.LevelCode = bl.Code
		LEFT JOIN [LOOKUP].[BusinessLevelControlStatus] blcs ON blcs.Code = pbl.BusinessLevelControlStatusCode
		LEFT JOIN [LOOKUP].[PhaseApprovalStatus] pasA ON pasA.Code = pbl.PhaseApprovalArcCode
		LEFT JOIN [LOOKUP].[PhaseApprovalStatus] pasM ON pasM.Code = pbl.PhaseApprovalMamapCode
	WHERE p.[ProjectId] = @Project_ID --and (pbl.BusinessLevelControlStatusCode = 1 or pbl.BusinessLevelControlStatusCode = 2)
END

GO
/****** Object:  StoredProcedure [dbo].[SaveOrUpdateConfig]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[SaveOrUpdateConfig] 
	@Key nvarchar(50),
	@Value nvarchar(255)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS (SELECT * FROM Site.Config Where Id = @Key)
		BEGIN
			UPDATE Site.Config
			SET
			[Value] = @Value
			WHERE Id = @Key
		END
	ELSE
		BEGIN
			INSERT INTO Site.Config 
			(Id, [Value], IsRowDeleted, App, UpdateDate) VALUES (@Key, @Value, 0, 0, GETDATE());
		END
	
END
GO
/****** Object:  Trigger [dbo].[setArcMamapStatus]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[setArcMamapStatus]
   ON [dbo].[ProjectBusinessLevel]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Id int;
	declare @levelStatus int;
	declare @arcStatus int;
	declare @mamaplStatus int;
	  
	DECLARE ProjectBusinessLevel_cursor CURSOR FOR  
	SELECT [Id], [BusinessLevelControlStatusCode], PhaseApprovalArcCode, PhaseApprovalMamapCode
	from inserted    

	OPEN ProjectBusinessLevel_cursor;   

	FETCH NEXT FROM ProjectBusinessLevel_cursor  
	INTO  @Id,@levelStatus, @arcStatus, @mamaplStatus;                

    WHILE @@FETCH_STATUS = 0  
	BEGIN     		
		if @levelStatus = 2 and ( @arcStatus = 1 or @arcStatus is null)
		begin
			update ProjectBusinessLevel
			set PhaseApprovalArcCode = 3
			where Id = @Id
		end
		if @levelStatus = 2 and( @mamaplStatus = 1 or @mamaplStatus is null)
		begin
			update ProjectBusinessLevel
			set PhaseApprovalMamapCode = 3
			where Id = @Id
		end
		
		FETCH NEXT FROM ProjectBusinessLevel_cursor  
		INTO   @Id, @levelStatus, @arcStatus, @mamaplStatus;         
	END  

	CLOSE ProjectBusinessLevel_cursor;  
	DEALLOCATE ProjectBusinessLevel_cursor; 
END
GO

/****** Object:  Trigger [dbo].[ProjectClassificationTrigger]    Script Date: 5/14/2023 9:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[ProjectClassificationTrigger] on [dbo].[Projects]
	AFTER INSERT, UPDATE 
	AS
BEGIN
    
	SET NOCOUNT ON;    

    declare @ProjectId nvarchar(255);        
	declare @ClassificationCode int;
	declare @ProjectTypes nvarchar(255);
	
	declare @param1 int;
	declare @param2 int;
  
    DECLARE project_cursor CURSOR FOR  
        
	SELECT [ProjectId], [ClassificationCode], [ProjectTypes]
	from inserted      

    OPEN project_cursor;   

	FETCH NEXT FROM project_cursor  
	INTO  @ProjectId, @ClassificationCode, @ProjectTypes;                

    WHILE @@FETCH_STATUS = 0  
	BEGIN     

		select pc.ProjectTypeCode, pc.ClassificationCode into #projectTypesRows from 
		(select value  from  string_split(@ProjectTypes,',') ) pt inner join [LOOKUP].[ProjectType] t on pt.value = t.Description
		inner join [dbo].[ProjectType_Classification] pc  on pc.ProjectTypeCode = t.Code  

		if (select COUNT(*) from  #projectTypesRows) = 1
		begin
			select @ClassificationCode = classificationCode from #projectTypesRows 
		end
		else
		begin
			select @param1= case when classificationCode = 4000 then 1 else 0 END 
			from #projectTypesRows 

			if @param1 > 0 
			begin 
                set @ClassificationCode = 4000;
            end
            else 
			begin
				select @param1= case when classificationCode = 1000 then 1 else 0 END , @param2 =case when classificationCode = 2000 or classificationCode = 3000 then 1 else 0 end
				from #projectTypesRows 
						
				if  @param1>0 and  @param2 >0
				begin
                        set @ClassificationCode = 1000
				end
				else
				begin
					select @param1= case when classificationCode =2000 then 1 else 0 END , @param2 =case when classificationCode = 2000 or classificationCode = 3000 then 1 else 0 end
					from #projectTypesRows 
                            
					set @ClassificationCode = 2000
				end
			end
		end

       	update [dbo].[Projects] set [ClassificationCode] = @ClassificationCode
       	where [ProjectId] = @ProjectId            

		drop table #projectTypesRows
		FETCH NEXT FROM project_cursor  
		INTO  @ProjectId, @ClassificationCode, @ProjectTypes;         
	END  

	CLOSE project_cursor;  
	DEALLOCATE project_cursor;  
END
GO

/****** Object:  Trigger [dbo].[SOABusinessLevelTrigger]    Script Date: 5/14/2023 9:58:55 PM ******/
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
			@MNF [nvarchar](255)

			
		SET @ProjectId = (SELECT  i.ProjectId From inserted i )
		SET @Contract = (SELECT  i.[Contract] From inserted i )
		SET @LevelCode = (SELECT  i.LevelCode From inserted i )


		
	IF EXISTS (SELECT * FROM ProjectBusinessLevel p
			WHERE @ProjectId = p.ProjectId AND ISNULL(p.[Contract],'') =  ISNULL(@Contract,'') AND p.LevelCode = @LevelCode)
		begin

			UPDATE dbo.ProjectBusinessLevel 
				
				SET 
				 BusinessLevelControlStatusCode = CASE WHEN i.StatusLevelCode = 3 THEN 2 ELSE (CASE WHEN i.StatusLevelCode = 1 THEN 2 ELSE 1 END) END, 
				 BusinessLevelStatusDate = GETDATE(),
				 PhaseApprovalArcCode =  CASE WHEN i.StatusLevelCode = 3 THEN 1 END,
				 PhaseApprovalMamapCode = CASE WHEN i.LevelCode = 8 THEN 2 ELSE CASE WHEN i.StatusLevelCode = 3 THEN 1  ELSE NULL END END,
				 PhaseApprovalArcDate = CASE WHEN i.StatusLevelCode = 3 THEN NULL ELSE p.PhaseApprovalArcDate END,
				 PhaseApprovalMamapDate = CASE WHEN i.StatusLevelCode = 3 THEN NULL ELSE p.PhaseApprovalMamapDate END,
				 UserNameArchiv = CASE WHEN i.StatusLevelCode = 3 THEN NULL ELSE p.UserNameArchiv END,
				 UserNameMamap = CASE WHEN i.StatusLevelCode = 3 THEN NULL ELSE p.UserNameMamap END
				 

			From inserted i join ProjectBusinessLevel p
				on @ProjectId = p.ProjectId
		end
			
		
	ELSE
		begin
			
			SET @MNF = (SELECT p.MNF From Projects p WHERE p.ProjectId = @ProjectId)

			INSERT INTO  dbo.ProjectBusinessLevel
			(ProjectId, MNF, LevelCode, Contract, StartBusinessLevelDate, BusinessLevelControlStatusCode, BusinessLevelStatusDate, 
			PhaseApprovalArcCode, PhaseApprovalMamapCode, PhaseApprovalArcDate, PhaseApprovalMamapDate,
				UserNameArchiv, UserNameMamap, DesignatedSpace, IV_CCRN)
				
			 SELECT  
			 @ProjectId,
			 @MNF, 
			 i.LevelCode ,
			 i.[Contract],
			 i.StartLevelDate, 
			 CASE WHEN i.StatusLevelCode = 3 THEN 2 ELSE (CASE WHEN i.StatusLevelCode = 1 THEN 2 ELSE 1 END) END, 
			 GETDATE(),
			 CASE WHEN i.StatusLevelCode = 3 THEN 1 ELSE NULL END,
			 CASE WHEN i.LevelCode = 8 THEN 2 ELSE CASE WHEN i.StatusLevelCode = 3 THEN 1 ELSE NULL END END,
			 NULL,
			 NULL,
			 NULL,
			 NULL,
			 NULL,
			 i.IV_CCRN
			 FROM inserted i


		end
			
			UPDATE dbo.SOABusinessLevel
			SET ManagementStatus = case when @@ROWCOUNT = 0 then  N'בתהליך כשל' else  N'טופל' end,
			Error = case when @@ROWCOUNT = 0 then 'Failed To Update Data' end
			WHERE ProjectId = @ProjectId

			UPDATE [dbo].[Projects]
			SET CurrentLevelCode = @LevelCode
			WHERE ProjectId = @ProjectId
			
		
	
END
GO

/****** Object:  Trigger [dbo].[SOAImportTrigger]    Script Date: 5/14/2023 9:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[SOAImportTrigger]
ON [dbo].[SOAImpProjects]
FOR  UPDATE, INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;
	 declare @ProjectId [varchar](50)
		
  IF EXISTS (select * From inserted i join Projects p
				on i.ProjectId = p.ProjectId)
  begin

			UPDATE dbo.Projects  				
				SET 
				ProjectTypes = i.ProjectTypes,
				MNF = i.MNF,
				MainContractor = i.MainContractor,
				WBS_Num = i.WBS_Num,
				TenderType = i.TenderType,
				RoadRailNum = i.RoadRailNum,
				Interchange = i.Interchange,
				OperationDepartment = i.OperationDepartment,
				ManagementCompany = i.ManagementCompany,
				MamapUserName = i.MamapUserName,
				MamapFullName = i.MamapFullName,
				MamapEmail = i.MamapEmail,
				ManhapAllUserName = i.ManhapAllUserName,
				ManhapFullName = i.ManhapFullName,
				ManhapUserName = i.ManhapUserName,
				ManhapEmail = i.ManhapEmail,
				AgafManagerEmail = i.AgafManagerEmail,
				MemoneBakaraEmail = i.MemoneBakaraEmail,
				PlannerAllUserName	= i.PlannerAllUserName,
				Name = i.Name, 
				Content = i.Content

		From inserted i join Projects p
				on i.ProjectId = p.ProjectId
			end
			
		
			else
			begin

			INSERT INTO  dbo.Projects
			(ProjectId, ProjectTypes, MNF, Name, MainContractor, WBS_Num, 
			TenderType, RoadRailNum, Interchange, OperationDepartment,
				ManagementCompany, MamapUserName, MamapFullName,
				MamapEmail,
				ManhapAllUserName,
				ManhapFullName,
				ManhapUserName,
				ManhapEmail,
				AgafManagerEmail,
				MemoneBakaraEmail,
				PlannerAllUserName, Content, ClassificationCode)
				
			 SELECT  i.ProjectId, i.ProjectTypes, i.MNF , i.Name, i.MainContractor, i.WBS_Num, 
				i.TenderType, i.RoadRailNum, i.Interchange, i.OperationDepartment,
				i.ManagementCompany, i.MamapUserName, 
				i.MamapFullName,
				i.MamapEmail,
				i.ManhapAllUserName,
				i.ManhapFullName,
				i.ManhapUserName,
				i.ManhapEmail,
				i.AgafManagerEmail,
				i.MemoneBakaraEmail,
				i.PlannerAllUserName, i.Content, 1000   From inserted i 
			


			end

			SET @ProjectId = (SELECT  i.ProjectId From inserted i )
			
			UPDATE dbo.SOAImpProjects
			SET Management_Status =case when @@ROWCOUNT = 0 then  N'בתהליך כשל' else  N'טופל' end,
			Error = case when @@ROWCOUNT = 0 then 'Failed To Update Data' end
			WHERE ProjectId = @ProjectId
	
END
GO

