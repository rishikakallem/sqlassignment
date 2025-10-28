--2)write a query to find second highest salary in organisation without using subqueries and top

select salary from EmployeeDetails order by salary desc offset 1 rows
fetch next 1 rows only
