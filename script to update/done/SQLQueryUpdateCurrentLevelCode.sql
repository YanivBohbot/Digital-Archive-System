USE [Archive_QA]
GO
/****** Object:  Trigger [dbo].[SOAImportTrigger]    Script Date: 5/8/2023 1:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 Select  pb.UpdateDate,pb.ProjectId as ProjectID,pb.LevelCode as LevelCode  into #temp
    from [dbo].SOABusinessLevel pb 
    inner join 
    (
        Select max(pb.UpdateDate) as LatestDate, pb.ProjectId
        from [dbo].SOABusinessLevel pb
        Group by pb.ProjectId
    ) SubMax 
    on pb.UpdateDate = SubMax.LatestDate
    and pb.ProjectId = SubMax.ProjectId 


	--select * from #temp


	 
	UPDATE [dbo].[Projects]
   SET CurrentLevelCode = #temp.LevelCode
   FROM Projects p LEFT JOIN #temp on
	 p.ProjectId = #temp.ProjectID
	GO


	drop table #temp

