use day1
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
go