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

select patindex('%[^0-9]%','rishi4the190')
go
------------------------------------------------------------------------------------------------------------
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



--------------------------------------------------------
create function dbo.errorcolumn()
returns int as
begin
RAISEERROR('Access Denied',16,1);
return 0;
end
go

create table sample1(
id int,
name varchar(50),
non_accesible as (1/0))
select * from sample1

------------------------------------------------------------------------------------------------------------------------

declare @year int=2017;

with newcalender as
(
select datefromparts(@year,1,1) as startdate
union all
select dateadd(day,1,startdate) from newcalender where dateadd(day,1,startdate)<datefromparts(@year+1,1,1)
)
select datepart(dayofyear,startdate) as dayofyear,
datepart(week,startdate)as weeknumber,
datepart(weekday,startdate) as dayofweek,
datepart(month,startdate) as monthnumber,
datepart(day,startdate) as dayofmonth,
datename(weekday,startdate)as dayname,
datename(month,startdate) as monthname from newcalender option(maxrecursion 366)

------------------------------------------------------------------------------------------------------------

create table emp 
(empid int primary key,
empname varchar(50),
mgrid int)
insert into emp values
(1,'ceo',null),
(2,'vp',1),
(3,'manager',2),
(4,'lead',3),
(5,'developer',4)
declare @id int =5;
with emp_hierarchy as
(select empid,empname,mgrid,1 as level from emp where empid=@id
union all
select e.empid,e.empname,e.mgrid,eh.level+1 from emp e inner join emp_hierarchy eh on e.empid=eh.mgrid)

select * from emp_hierarchy;
