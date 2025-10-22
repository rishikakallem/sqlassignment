create function dbo.cal_age(@dob date)
returns int as
begin
declare @age int;
set @age=datediff(year,@dob,getdate());
if (month(@dob)>month(getdate()) or (month(getdate())=month(@dob) and day(getdate())<day(@dob)))
begin set @age=@age-1;
end
return @age;

end
go
select dbo.cal_age('2004-12-01') as age
go
