SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-- ============================================-- Author      : Rahul Kr. Ghosh               : MCITP-DBA 2009-- Create date : Sep 20 2010  1:34PM-- Description : STOPPING ALL ROWS UPDATE, DELETE AT ONCE-- @Type       : 'Update' if to create only update trigger               : 'Delete' if to create only delete trigger               : 'Both' if to create both (combine) delete & update trigger-- ============================================= */
CREATE PROC [dbo].[SP_Restriction]
--getting table name & type of trigger
@tblname varchar(50),
@Type varchar(20)

as 
begin

--getting my tools
declare @trgname nvarchar(50)
Declare @strTRGText Varchar(max)
declare @errdel varchar(50)
declare @errupd varchar(50)
declare @errboth varchar(60)
declare @severity nvarchar(5)
declare @state nvarchar (5)

--setting my tools
Set @tblname = SubString(@tblName,CharIndex('.',@tblName)+1, Len(@tblName))
Set	@strTRGText = '' ;
set @errupd = 'Cannot update all rows. Use WHERE CONDITION'; --- UPDATE TRIGGER ERROR MSG
set @errdel = 'Cannot delete all rows. Use WHERE CONDITION'; --- DELETE TRIGGER ERROR MSG
set @errboth = 'Cannot update or delete all rows. Use WHERE CONDITION'; --- UPDATE & DELETE TRIGGER ERROR MSG
set @severity = '16'
set @state = '1'

--if update trigger
if @Type = 'Update'
begin 
Set	@trgname = '[dbo].[trg_upd_'+ @tblName +']';
IF  Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(@trgname))
begin
Set @strTRGText = @strTRGText +  CHAR(13) + ''
			Set @strTRGText = @strTRGText +  CHAR(13) + '/*-- ============================================='
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Author      : Rahul Kr. Ghosh'
			Set @strTRGText = @strTRGText +  CHAR(13) + '               : MCITP-DBA 2009'
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Create date : ' + Convert(varchar(20),Getdate())
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Description : STOPPING THE UPDATE OF ALL ROWS AT A STRESS IN TABLE '  + @tblName
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- ============================================= */'
-- creating the update trigger code

Set @strTRGText = @strTRGText +  CHAR(13) + 'CREATE TRIGGER ' + @trgname
Set @strTRGText = @strTRGText +  CHAR(13) + 'ON ' + @tblname
Set @strTRGText = @strTRGText +  CHAR(13) + 'FOR UPDATE AS'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'DECLARE @Count int'
Set @strTRGText = @strTRGText +  CHAR(13) + 'SET @Count = @@ROWCOUNT;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'IF @Count >= (SELECT SUM(row_count)' 
Set @strTRGText = @strTRGText +  CHAR(13) + 'FROM sys.dm_db_partition_stats'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'WHERE OBJECT_ID = OBJECT_ID(''' + @tblname + ''')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RAISERROR('''+ @errupd + ''',' + @severity +',' + @state +')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'ROLLBACK TRANSACTION' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RETURN;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ''

Exec(@strTRGText);

print 'Trigger done (update)'
 
     		if (@@ERROR=0) 
				Print 'Trigger ' + @trgname + ' Created Successfully '
end

--trigger already there
else

begin
Print 'Sorry!!  ' + @trgname + ' Already exists in the database... '
end

end


--if delete trigger
else 
if @Type = 'Delete'
begin
Set	@trgname = '[dbo].[trg_del_'+ @tblName +']';
IF  Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(@trgname))
begin
Set @strTRGText = @strTRGText +  CHAR(13) + ''
			Set @strTRGText = @strTRGText +  CHAR(13) + '/*-- ============================================='
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Author      : Rahul Kr. Ghosh'
			Set @strTRGText = @strTRGText +  CHAR(13) + '               : MCITP-DBA 2009'
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Create date : ' + Convert(varchar(20),Getdate())
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Description : STOPPING THE DELETE OF ALL ROWS AT A STRESS IN TABLE '  + @tblName
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- ============================================= */'
-- creating the delete trigger code

Set @strTRGText = @strTRGText +  CHAR(13) + 'CREATE TRIGGER ' + @trgname
Set @strTRGText = @strTRGText +  CHAR(13) + 'ON ' + @tblname
Set @strTRGText = @strTRGText +  CHAR(13) + 'FOR DELETE AS'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'DECLARE @Count int'
Set @strTRGText = @strTRGText +  CHAR(13) + 'SET @Count = @@ROWCOUNT;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'IF @Count >= (SELECT SUM(row_count)' 
Set @strTRGText = @strTRGText +  CHAR(13) + 'FROM sys.dm_db_partition_stats'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'WHERE OBJECT_ID = OBJECT_ID(''' + @tblname + ''')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RAISERROR('''+ @errdel + ''',' + @severity +',' + @state +')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'ROLLBACK TRANSACTION' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RETURN;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ''

Exec(@strTRGText);

print 'Trigger done (delete)'

			if (@@ERROR=0) 
				Print 'Trigger ' + @trgname + ' Created Successfully '
end

--trigger already there

else

begin
Print 'Sorry!!  ' + @trgname + ' Already exists in the database... '
end

end

--- BOTH THE TRIGGER DELETE & UPDATE 
else 
if @Type = 'Both'
begin
Set	@trgname = '[dbo].[trg_DelUpd_'+ @tblName +']';
IF  Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(@trgname))
begin
Set @strTRGText = @strTRGText +  CHAR(13) + ''
			Set @strTRGText = @strTRGText +  CHAR(13) + '/*-- ============================================='
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Author      : Rahul Kr. Ghosh'
			Set @strTRGText = @strTRGText +  CHAR(13) + '               : MCITP-DBA 2009'
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Create date : ' + Convert(varchar(20),Getdate())
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- Description : STOPPING THE UPDATE AND DELETE OF ALL ROWS AT A STRESS IN TABLE '  + @tblName
			Set @strTRGText = @strTRGText +  CHAR(13) + '-- ============================================= */'
-- creating the delete & UPDATE  trigger code

Set @strTRGText = @strTRGText +  CHAR(13) + 'CREATE TRIGGER ' + @trgname
Set @strTRGText = @strTRGText +  CHAR(13) + 'ON ' + @tblname
Set @strTRGText = @strTRGText +  CHAR(13) + 'FOR UPDATE , DELETE AS'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'DECLARE @Count int'
Set @strTRGText = @strTRGText +  CHAR(13) + 'SET @Count = @@ROWCOUNT;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'IF @Count >= (SELECT SUM(row_count)' 
Set @strTRGText = @strTRGText +  CHAR(13) + 'FROM sys.dm_db_partition_stats'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'WHERE OBJECT_ID = OBJECT_ID(''' + @tblname + ''')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'BEGIN'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RAISERROR('''+ @errboth + ''',' + @severity +',' + @state +')'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'ROLLBACK TRANSACTION' 
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'RETURN;'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + 'END'
Set @strTRGText = @strTRGText +  CHAR(13) + ''
Set @strTRGText = @strTRGText +  CHAR(13) + ''

Exec(@strTRGText);

print 'Trigger done (update & delete)'

			if (@@ERROR=0) 
				Print 'Trigger ' + @trgname + ' Created Successfully '
end

--trigger already there

else

begin
Print 'Sorry!!  ' + @trgname + ' Already exists in the database... '
end

end
end






