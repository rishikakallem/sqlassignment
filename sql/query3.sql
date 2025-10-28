use day1
create table sample1(
id int,
name varchar(50),
non_accesible as (1/0))
select * from sample1
go
