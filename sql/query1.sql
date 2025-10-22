create function extract__numbers 
(@input varchar(50))
returns varchar(50) as
begin
declare @idx int;
set @idx=patindex('%[^0-9]%',@input);
while(@idx>0)
begin
set @input=stuff(@input,@idx,1,'');
set @idx=patindex('%[^0-9]%',@input);
end
return @input;
end

go

select dbo.extract__numbers('1Rishi89df6');

go