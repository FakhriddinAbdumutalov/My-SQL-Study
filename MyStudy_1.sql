create database MyFirstDatabase
go

use MyFirstDatabase
go 
use Northwind
go 

create table Employees (
    id int identity(1,1) primary key, 
	FirstName varchar(30),
	LastName varchar(30), 
	Department varchar(40), 
	Salary decimal(10,2),
	HireDate date
);
go 
sp_rename 'Employees.id', 'EmployeeID', 'Column'
exec sp_depends 'Employees'

insert into Employees (FirstName, LastName, Department, Salary, HireDate)
values
('John', 'Doe', 'Sales', 55000.00, '2023-01-15'),
('Jane', 'Smith', 'IT', 72000.00, '2022-05-20'),
('Alice', 'Brown', 'HR', 48000.00, '2021-11-03'),
('Bob', 'Johnson', 'Sales', 61000.00, '2020-06-12');
go

select * from Employees;
go 

select * from Employees

select FirstName, Department from Employees

select *
from Employees
where Department = 'Sales';

select * 
from Employees
order by Salary asc;

select * 
from Employees
where Department = 'Sales' and Salary > 60000;

select avg(Salary) as AverageSalary
from Employees

select Department, sum(Salary) as TotalSalary
from Employees
group by Department

select Department, sum(Salary) as TotalSalary
from Employees
group by Department
having sum(Salary) > 100000;

select FirstName from Employees
where HireDate > '2022-01-01';

select Salary from Employees
order by Salary desc

select * from Employees
where Department = 'IT'

create table Departments (
   DepartmentID int primary key, 
   DepartmentName varchar(40),
   Location varchar(40)
);
go

insert into Departments (DepartmentID, DepartmentName, Location)
values 
(1, 'Sales', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'HR', 'Chicago');
go

alter table Employees
add DepartmentID int;

update Employees
set DepartmentID = case
    when Department = 'Sales' then 1
	when Department = 'IT' then 2
	when Department = 'HR' then 3
end;

alter table Employees
Drop column Department;

alter table Employees
add constraint fk_Employees_Departments foreign key (DepartmentID)
references Departments(DepartmentID);
go

select e.FirstName, e.LastName, d.DepartmentName
from Employees e
inner join Departments d on e.DepartmentID = d.DepartmentID;

SELECT * FROM Employees;
select * from Departments;

select e.FirstName, e.LastName, d.Location
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
where d.Location = 'San Francisco';

select d.DepartmentName, count(e.ID) as EmployeeCount
from Employees e
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

select e.FirstName, e.LastName, d.DepartmentName
from Employees e 
left join Departments d on e.DepartmentID = d.DepartmentID;

select count(*) as TotalEmployees
from Employees

select sum(Salary) as TotalSalary
from Employees

select avg(Salary) as AverageSalary
from Employees

select min(Salary) as MinimumSalary, max(Salary) as MaximumSalary
from Employees

select d.DepartmentName, count(e.ID) as EmployeeCount
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

select d.DepartmentName, sum(e.Salary) as TotalSalary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

select d.DepartmentName, avg(e.Salary) as AverageSalary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

select d.DepartmentName, count(e.ID) as EmployeeCount
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(e.ID) > 1

select d.DepartmentName, sum(e.Salary) as TotalSalary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having sum(e.Salary) > 100000;

select d.DepartmentName, sum(e.Salary) as TotalSalary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having d.DepartmentName = 'Sales';

select d.DepartmentName, avg(e.Salary) as Average
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
where e.HireDate < '2022-01-01'
group by d.DepartmentName

select d.DepartmentName, count(e.ID) as EmployeeCount
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(e.ID) > 1

select * from Employees

use Northwind

select * from Employees

select  FirstName, LastName from Employees

select d.DepartmentName
from Departments d 
where d.DepartmentName = 'HR'

select * from Employees
order by Salary desc

select top 2 * from Employees
order by Salary asc
