USE [Archive_QA]
GO
/****** Object:  Trigger [dbo].[ProjectClassificationTrigger]    Script Date: 6/18/2023 3:39:55 PM ******/
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

--אם קיים DB = DB
--אחרת אם יש רק סיווג אחד - השתמש בו
--אחרת אם יש כמה וקיים מאי"ץ = מאי"ץ
--אחרת אם יש כמה וקיים גדול  = גדול
--אחרת אם קידום זמינות וגם קיים קטן = קטן

		if (select COUNT(*) from  #projectTypesRows) = 0
		begin
			set @ClassificationCode = 1000 
		end
		else if (select COUNT(*) from  #projectTypesRows) = 1
		begin
			select @ClassificationCode = classificationCode from #projectTypesRows 
		end 
		else if exists  (select ClassificationCode from #projectTypesRows where ClassificationCode = 4000 )
		begin
                set @ClassificationCode = 4000;
        end
		else if exists  (select ClassificationCode from #projectTypesRows where ClassificationCode = 5000 )
		begin
                set @ClassificationCode = 5000;
        end
		else if exists  (select ClassificationCode from #projectTypesRows where ClassificationCode = 1000 )
		begin
                set @ClassificationCode = 1000;
        end
		else if exists  (select ClassificationCode from #projectTypesRows where ClassificationCode = 2000 )
		begin
                set @ClassificationCode = 2000;
        end
		else if exists  (select ClassificationCode from #projectTypesRows where ClassificationCode = 3000 )
		begin
                set @ClassificationCode = 3000;
        end
		else
		begin
			set @ClassificationCode = 1000 
		end
       
		

		--if (select COUNT(*) from  #projectTypesRows) = 0
		--begin
		--	select @ClassificationCode = 1000 
		--end
		--else if (select COUNT(*) from  #projectTypesRows) = 1
		--begin
		--	select @ClassificationCode = classificationCode from #projectTypesRows 
		--end
		--else
		--begin
		--	select @param1= case when classificationCode = 4000 then 1 else 0 END 
		--	from #projectTypesRows 

		--	if @param1 > 0 
		--	begin 
  --              set @ClassificationCode = 4000;
  --          end
  --          else 
		--	begin
		--		select @param1= case when classificationCode = 1000 then 1 else 0 END , @param2 =case when classificationCode = 2000 or classificationCode = 3000 then 1 else 0 end
		--		from #projectTypesRows 
						
		--		if  @param1>0 and  @param2 >0
		--		begin
  --                      set @ClassificationCode = 1000
		--		end
		--		else
		--		begin
		--			select @param1= case when classificationCode =2000 then 1 else 0 END , @param2 =case when classificationCode = 2000 or classificationCode = 3000 then 1 else 0 end
		--			from #projectTypesRows 
                            
		--			set @ClassificationCode = 2000
		--		end
		--	end
		--end

       	update [dbo].[Projects] set [ClassificationCode] = @ClassificationCode
       	where [ProjectId] = @ProjectId            

		drop table #projectTypesRows
		FETCH NEXT FROM project_cursor  
		INTO  @ProjectId, @ClassificationCode, @ProjectTypes;         
	END  

	CLOSE project_cursor;  
	DEALLOCATE project_cursor;  
END
