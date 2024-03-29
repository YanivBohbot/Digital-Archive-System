USE [Archive_D]
GO
/****** Object:  Table [dbo].[ProjectBusinessLevel]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectBusinessLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [varchar](50) NOT NULL,
	[MNF] [nvarchar](255) NOT NULL,
	[LevelCode] [int] NOT NULL,
	[Contract] [varchar](50) NULL,
	[StartBusinessLevelDate] [datetime] NULL,
	[BusinessLevelControlStatusCode] [int] NOT NULL,
	[BusinessLevelStatusDate] [datetime] NULL,
	[PhaseApprovalArcCode] [int] NULL,
	[PhaseApprovalMamapCode] [int] NULL,
	[PhaseApprovalArcDate] [datetime] NULL,
	[PhaseApprovalMamapDate] [datetime] NULL,
	[UserNameArchiv] [nvarchar](250) NULL,
	[UserNameMamap] [nvarchar](250) NULL,
	[DesignatedSpace] [nvarchar](250) NULL,
	[IV_CCRN] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsRowDeleted] [bit] NOT NULL,
	[FromInterface] [bit] NULL,
 CONSTRAINT [PK__ProjectB__3214EC072FCA62D3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOABusinessLevel]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOABusinessLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [varchar](50) NOT NULL,
	[LevelCode] [int] NOT NULL,
	[Contract] [nvarchar](255) NULL,
	[StartLevelDate] [datetime] NULL,
	[StatusLevelCode] [int] NOT NULL,
	[ManagementStatus] [nvarchar](50) NULL,
	[Error] [nvarchar](255) NULL,
	[IV_CCRN] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsRowDeleted] [bit] NOT NULL,
	[FromInterface] [bit] NULL,
 CONSTRAINT [PK_SOABusinessLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOAImpProjects]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOAImpProjects](
	[ProjectId] [varchar](50) NOT NULL,
	[ProjectTypes] [nvarchar](255) NULL,
	[MNF] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MainContractor] [nvarchar](255) NULL,
	[WBS_Num] [nvarchar](255) NULL,
	[TenderType] [nvarchar](255) NULL,
	[RoadRailNum] [nvarchar](255) NULL,
	[Interchange] [nvarchar](255) NULL,
	[OperationDepartment] [nvarchar](255) NULL,
	[ManagementCompany] [nvarchar](255) NULL,
	[MamapFullName] [nvarchar](255) NULL,
	[MamapUserName] [nvarchar](50) NULL,
	[MamapEmail] [nvarchar](50) NULL,
	[ManhapAllUserName] [nvarchar](max) NULL,
	[ManhapFullName] [nvarchar](50) NULL,
	[ManhapUserName] [nvarchar](50) NULL,
	[ManhapEmail] [nvarchar](50) NULL,
	[AgafManagerEmail] [nvarchar](50) NULL,
	[MemoneBakaraEmail] [nvarchar](50) NULL,
	[PlannerAllUserName] [nvarchar](max) NULL,
	[FromKM] [nvarchar](50) NULL,
	[ToKM] [nvarchar](50) NULL,
	[Contracts] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Merhav_Agaf] [nvarchar](255) NULL,
	[Management_Status] [nvarchar](50) NULL,
	[Error] [nvarchar](255) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsRowDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__SOAImpPr__3214EC075BEA4DB8] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Contract]    Script Date: 6/4/2023 8:29:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_Contract] ON [dbo].[SOABusinessLevel]
(
	[Contract] ASC,
	[ProjectId] ASC,
	[LevelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] ADD  CONSTRAINT [DF_ProjectBusinessLevel_StartBusinessLevelDate]  DEFAULT (getdate()) FOR [StartBusinessLevelDate]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] ADD  CONSTRAINT [DF_ProjectBusinessLevel_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] ADD  CONSTRAINT [DF_ProjectBusinessLevel_IsRowDeleted]  DEFAULT ((0)) FOR [IsRowDeleted]
GO
ALTER TABLE [dbo].[SOAImpProjects] ADD  CONSTRAINT [DF_SOAImpProjects_Management_Status]  DEFAULT (N'חדש') FOR [Management_Status]
GO
ALTER TABLE [dbo].[SOAImpProjects] ADD  CONSTRAINT [DF_SOAImpProjects_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[SOAImpProjects] ADD  CONSTRAINT [DF_SOAImpProjects_IsRowDeleted]  DEFAULT ((0)) FOR [IsRowDeleted]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK__ProjectBu__Busin__2FCF1A8A] FOREIGN KEY([BusinessLevelControlStatusCode])
REFERENCES [LOOKUP].[BusinessLevelControlStatus] ([Code])
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] CHECK CONSTRAINT [FK__ProjectBu__Busin__2FCF1A8A]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK__ProjectBu__Phase__2DE6D218] FOREIGN KEY([PhaseApprovalArcCode])
REFERENCES [LOOKUP].[PhaseApprovalStatus] ([Code])
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] CHECK CONSTRAINT [FK__ProjectBu__Phase__2DE6D218]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK__ProjectBu__Phase__2EDAF651] FOREIGN KEY([PhaseApprovalMamapCode])
REFERENCES [LOOKUP].[PhaseApprovalStatus] ([Code])
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] CHECK CONSTRAINT [FK__ProjectBu__Phase__2EDAF651]
GO
ALTER TABLE [dbo].[ProjectBusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK__ProjectBu__Proje__30C33EC3] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[ProjectBusinessLevel] CHECK CONSTRAINT [FK__ProjectBu__Proje__30C33EC3]
GO
ALTER TABLE [dbo].[SOABusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK_SOABusinessLevel_BusinessLevel] FOREIGN KEY([StatusLevelCode])
REFERENCES [LOOKUP].[SOALevelControlStatus] ([Code])
GO
ALTER TABLE [dbo].[SOABusinessLevel] CHECK CONSTRAINT [FK_SOABusinessLevel_BusinessLevel]
GO
ALTER TABLE [dbo].[SOABusinessLevel]  WITH CHECK ADD  CONSTRAINT [FK_SOABusinessLevel_SOALevelControlStatus] FOREIGN KEY([LevelCode])
REFERENCES [LOOKUP].[BusinessLevel] ([Code])
GO
ALTER TABLE [dbo].[SOABusinessLevel] CHECK CONSTRAINT [FK_SOABusinessLevel_SOALevelControlStatus]
GO
/****** Object:  StoredProcedure [dbo].[CheckIfLevelExists]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CheckIfLevelExists] 
	@ProjectId varchar(50),
	@LevelCode int,
	@Contract varchar(50)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM dbo.ProjectBusinessLevel  WHERE ProjectId = @ProjectId  AND LevelCode = @LevelCode AND [Contract] = @Contract AND BusinessLevelControlStatusCode <> 3)
		BEGIN
			SELECT 1 AS result
		END
	ELSE
		BEGIN
			SELECT -1 AS result
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCombosSP]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCombosSP] 

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
/****** Object:  StoredProcedure [dbo].[GetFinishedProjectsSP]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFinishedProjectsSP] 
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
/****** Object:  StoredProcedure [dbo].[GetInvalidDocsSP]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInvalidDocsSP] 
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
/****** Object:  StoredProcedure [dbo].[GetLookup]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLookup]
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
/****** Object:  StoredProcedure [dbo].[GetProjectDocTypes]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[GetProjectDocTypes] 
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
/****** Object:  StoredProcedure [dbo].[GetProjectLevelsSP]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE procedure [dbo].[GetProjectLevelsSP] 
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
/****** Object:  StoredProcedure [dbo].[SaveOrUpdateConfig]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SaveOrUpdateConfig] 
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
/****** Object:  StoredProcedure [dbo].[SaveOrUpdateSOABusinessLevel]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveOrUpdateSOABusinessLevel]
	@ProjectId varchar(50),
	@LevelCode int,
	@Contract varchar(50) null,
	@StartLevelDate datetime null,
	@StatusLevelCode int ,
	@IV_CCRN varchar(50) null,
	@FromInterface bit null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 --   IF EXISTS (SELECT * FROM [dbo].[SOABusinessLevel] p
	--		WHERE @ProjectId = p.ProjectId 
	--		AND (p.Contract = @Contract OR (p.Contract IS NULL AND @Contract IS NULL) )
	--		AND p.LevelCode = @LevelCode)

	--	begin
	--	UPDATE  [dbo].[SOABusinessLevel] 
	--	SET
	--	StartLevelDate = @StartLevelDate, 
	--	StatusLevelCode = @StatusLevelCode, 
	--	IV_CCRN	= @IV_CCRN,
	--	FromInterface = @FromInterface
	--	WHERE @ProjectId = ProjectId 
	--		AND (Contract = @Contract OR (Contract IS NULL AND @Contract IS NULL) )
	--		AND LevelCode = @LevelCode
	--	end

	--ELSE

	--	begin
	--	INSERT INTO [dbo].[SOABusinessLevel]
	--		(ProjectId, LevelCode, Contract, StartLevelDate,[StatusLevelCode] ,[IV_CCRN],[FromInterface],[UpdateDate],[IsRowDeleted])
				
	--		 SELECT  
	--		 @ProjectId,
	--		 @LevelCode ,
	--		 @Contract,
	--		 @StartLevelDate, 
	--		 @StatusLevelCode, 
	--		 @IV_CCRN,
	--		 @FromInterface,
	--		 getDate(),
	--		 0
			 

	--	end

	Merge [dbo].[SOABusinessLevel]
	Using (
	 SELECT
	  @ProjectId as ProjectId,
	  @LevelCode as LevelCode,
	  @Contract	 as Contract
	) MergeData 
	ON [dbo].[SOABusinessLevel].ProjectId = MergeData.ProjectId 
	AND [dbo].[SOABusinessLevel].LevelCode = MergeData.LevelCode 
	AND MergeData.ProjectId = [dbo].[SOABusinessLevel].ProjectId 
			AND ([dbo].[SOABusinessLevel].Contract = MergeData.Contract OR ([dbo].[SOABusinessLevel].Contract IS NULL AND MergeData.Contract IS NULL) )
			AND [dbo].[SOABusinessLevel].LevelCode = MergeData.LevelCode 
	 WHEN MATCHED THEN
	 UPDATE SET
		StartLevelDate = @StartLevelDate, 
		StatusLevelCode = @StatusLevelCode, 
		IV_CCRN	= @IV_CCRN,
		FromInterface = @FromInterface,
		[UpdateDate] = getDate(),
		[IsRowDeleted] = 0
	 WHEN NOT MATCHED BY TARGET THEN
	 INSERT  (ProjectId, LevelCode, Contract, StartLevelDate,[StatusLevelCode] ,[IV_CCRN],[FromInterface],[UpdateDate],[IsRowDeleted] )
				
			 VALUES(  
			 @ProjectId,
			 @LevelCode ,
			 @Contract,
			 @StartLevelDate, 
			 @StatusLevelCode, 
			 @IV_CCRN,
			 @FromInterface,
			 getDate(),
			 0);
	 


	

END
GO
/****** Object:  StoredProcedure [dbo].[SetCurrentLevel]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetCurrentLevel] 
	@ProjectId varchar(50),
	@LevelCode int,
	@Contract varchar(50)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT * FROM ProjectBusinessLevel p
			WHERE @ProjectId = p.ProjectId AND ISNULL(p.[Contract],'') =  ISNULL(@Contract,'') AND p.LevelCode = @LevelCode)

		BEGIN
			UPDATE [dbo].[Projects]
			SET CurrentLevelCode = @LevelCode
			WHERE ProjectId = @ProjectId
		END
	ELSE 
		BEGIN
		IF EXISTS (
			SELECT * FROM ProjectBusinessLevel p
				WHERE @ProjectId = p.ProjectId 
				AND ISNULL(p.[Contract],'') =  ISNULL(@Contract,'') 
				AND p.LevelCode = @LevelCode 
				AND BusinessLevelControlStatusCode = 3
				AND FromInterface = 1)

			BEGIN
				UPDATE [dbo].[Projects]
				SET CurrentLevelCode = @LevelCode
				WHERE ProjectId = @ProjectId
			END
		END
END
GO
/****** Object:  Trigger [dbo].[SOABusinessLevelTrigger]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SOABusinessLevelTrigger]
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
			if (@LevelStatus = 3 AND @NewStatusLevelCode = 2 AND @FromInterface = 1)
			begin

				UPDATE [dbo].[Projects]
				SET CurrentLevelCode = @LevelCode
				WHERE ProjectId = @ProjectId
			end

			UPDATE dbo.ProjectBusinessLevel 
				
				SET 
				 BusinessLevelControlStatusCode = CASE WHEN  @FromInterface = 1  and BusinessLevelControlStatusCode <> 1 THEN 2 
													ELSE i.StatusLevelCode END, 
				 BusinessLevelStatusDate = GETDATE(),
				 PhaseApprovalArcCode =  CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN 1 ELSE PhaseApprovalArcCode END,
				 PhaseApprovalMamapCode =	CASE	
												WHEN i.LevelCode = 8 THEN 2 
												ELSE 
													CASE 
														WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3  THEN 1 
														ELSE PhaseApprovalMamapCode 
													END
											END,
				 PhaseApprovalArcDate = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
										ELSE p.PhaseApprovalArcDate END,
				 PhaseApprovalMamapDate = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
										ELSE p.PhaseApprovalMamapDate END,
				 UserNameArchiv = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
									ELSE p.UserNameArchiv END,
				 UserNameMamap = CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN NULL 
									ELSE p.UserNameMamap END,
				 IV_CCRN = i.IV_CCRN,
				 FromInterface = i.FromInterface
				 

			From inserted i join ProjectBusinessLevel p
				on @ProjectId = p.ProjectId
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
			 CASE WHEN @FromInterface = 1 THEN 2 ELSE i.StatusLevelCode END, 
			 GETDATE(),
			 CASE WHEN @FromInterface <> 1 AND i.StatusLevelCode = 3 THEN 1 ELSE 3 END,
			 CASE WHEN i.LevelCode = 8 THEN 2 
					ELSE CASE WHEN @FromInterface <> 1 AND  i.StatusLevelCode = 3 THEN 1 
							ELSE 3 END END,
			 NULL,
			 NULL,
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
GO
ALTER TABLE [dbo].[SOABusinessLevel] ENABLE TRIGGER [SOABusinessLevelTrigger]
GO
/****** Object:  Trigger [dbo].[SOAImportTrigger]    Script Date: 6/4/2023 8:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SOAImportTrigger]
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
				Content = i.Content,
				Contracts = i.Contracts 

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
				PlannerAllUserName, Content, ClassificationCode,
				Contracts)
				
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
				i.PlannerAllUserName, i.Content, 1000, i.Contracts   From inserted i 
			


			end

			SET @ProjectId = (SELECT  i.ProjectId From inserted i )
			
			UPDATE dbo.SOAImpProjects
			SET Management_Status =case when @@ROWCOUNT = 0 then  N'בתהליך כשל' else  N'טופל' end,
			Error = case when @@ROWCOUNT = 0 then 'Failed To Update Data' end
			WHERE ProjectId = @ProjectId
	
END
GO
ALTER TABLE [dbo].[SOAImpProjects] ENABLE TRIGGER [SOAImportTrigger]
GO
