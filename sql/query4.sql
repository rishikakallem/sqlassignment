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
go