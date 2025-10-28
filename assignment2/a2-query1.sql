---database and table creation----
create database assignment2;
use assignment2
create table department (
    deptid int primary key,
    deptname varchar(50) unique
);
create table employeedetails (
    empID int primary key,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT,
    ManagerID INT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
INSERT INTO Department (DeptID, DeptName)
VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

INSERT INTO EmployeeDetails (EmpID, EmpName, Salary, DeptID, ManagerID)
VALUES
(1, 'Suresh', 85000, 1, 4),
(2, 'Ramesh', 90000, 2, 5),
(3, 'Naresh', 88000, 2, 5),
(4, 'Mahesh', 95000, 1, NULL),
(5, 'Rajesh', 97000, 2, NULL),
(6, 'Dinesh', 75000, 3, 7),
(7, 'Lokesh', 98000, 3, NULL),
(8, 'Mukesh', 65000, 1, 4),
(9, 'Sourabh', 72000, 2, 5),
(10, 'Sirish', 86000, 1, 4);

--1)Write a query to find the all the names which are similar in pronouncing as suresh, sort the result in the order of similarity

select empname,difference(empname,'Suresh')as similarity from employeedetails where difference(empname,'Suresh')>2
order by similarity desc;