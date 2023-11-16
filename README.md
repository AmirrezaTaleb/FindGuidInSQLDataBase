# FindGuidInSQLDataBase
Find GUID In All  Tables and Columns For SQL Server Databases
Place your id as a parmether and Execute it in your database, the result will be like a photo, the script is also placed in a column so that you can easily find the id.

If you want to run all the scripts together clear "Union All" from the end of the result
```SQL

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
```
Output!!

![image](https://user-images.githubusercontent.com/55345142/161344964-943ed876-e339-4ae0-84c2-6a2a741625bd.png)
