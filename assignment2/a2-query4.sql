--4)Write a SQL query to maximum number from a table without using MAX or MIN aggregate functions.
select top 1 salary from employeedetails order by salary desc;