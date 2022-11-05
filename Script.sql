
DECLARE @Guid UNIQUEIDENTIFIER ='2F9EC6C6-3127-412E-A3B6-4F78CDC9E689'
DECLARE @SQLQuerys NVARCHAR(MAX)=(

SELECT    'select  count(*)Counts,'''+t.name+'''TableName, '''+c.name+'''ColumnName ,'''+'select * from '+t.name+' where '+c.name+'=''''''+cast('+c.name+' as nvarchar(100))'+'+ '''''''' '+' from '+t.name+' group by '+c.name+' having  '+c.name+'= '''+CAST(@Guid AS NVARCHAR(50))+''' and count( * ) >0 Union All  '
FROM sys.columns c
     JOIN sys.tables t ON c.object_id=t.object_id
WHERE system_type_id=36 AND t.name NOT LIKE '%temp%'
 FOR XML PATH (''))
 SET @SQLQuerys =REPLACE(left(@SQLQuerys,LEN(@SQLQuerys)-12),'&gt;','>')
 SET @SQLQuerys = REPLACE(@SQLQuerys, '&gt','>0')
EXEC (@SQLQuerys )

 
