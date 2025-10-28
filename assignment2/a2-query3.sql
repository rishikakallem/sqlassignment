--3)write a query to find max salary and dep name from all the dept with out using top and limit

select d.deptname,max(e.salary)as highest_salary from employeedetails e inner join department d on e.deptid=d.deptid
group by d.DeptName;