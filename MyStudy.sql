create database UniversityDB
use UniversityDB
go

create table Students(
   StudentID int identity(1,1) primary key,
   FirstName varchar(30),
   LastName varchar(30),
   Age int,
   GPA decimal(3,2),
   EnrollmentDate date
);
go

insert into Students(FirstName, LastName, Age, GPA, EnrollmentDate)
values
( 'Fakkriddin', 'Abdumutalov', 22, 3.2, '2020-09-12'),
( 'Mohira', 'To`xtasinova', 20, 3.1, '2021-08-23'),
( 'Egamberdi', 'Odilov', 22, 2.3, '2019-06-14'),
( 'Ahkadjon', 'Ermatov', 23, 3.5, '2018-09-25'),
( 'Javokhir', 'Abdumutalov', 20, 3.4, '2022-08-13');
go

select * from Students

select FirstName, LastName, GPA from Students

select FirstName, GPA from Students
where GPA > 3.0;

select * from Students
order by GPA desc

select * from Students
where EnrollmentDate > '2022'

select count(StudentID) as TotalStudents
from Students

select avg(GPA) as AverageGPA
from Students

select min(GPA) as MinGPA, max(GPA) as MaxGPA
from Students

create table Courses(
  CourseID int identity(1,1) primary key
  CourseName varchar(30),
  Department varchar(30)
);
go 
drop table Courses

Alter table Students
add CourseID int

alter table Students
add constraint fk_Students_Courses foreign key (CourseID)
references Courses(CourseID)

insert into Courses(CourseName, Department)
values
  ('Math 101', 'Mathematics'),
  ('History 101', 'History'),
  ('Computer Science 101', 'Computer Science');

update Students
set CourseID = 3
where StudentID = 5

select c.Department, count(s.StudentID) as StudentCount
from Students s 
inner join Courses c on s.CourseID = c.CourseID
group by c.Department;

select s.FirstName, s.LastName, c.CourseName
from Students s 
inner join Courses c on s.CourseID = c.CourseID

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Courses c ON s.CourseID = c.CourseID;

select c.Department, count(s.StudentID) as StudentCount
from Students s 
inner join Courses c on s.CourseID = c.CourseID
Group by c.Department
having count(s.StudentID) > 1

select c.CourseName, avg(s.GPA) 
from Students s 
inner join Courses c on s.CourseID = c.CourseID
Group by c.CourseName
having avg(s.GPA) > 3.1

use MyFirstDatabase

select * from Employees

select FirstName, LastName
from Employees
where Salary > (select avg(Salary) from Employees);

select FirstName, LastName
from Employees
where DepartmentID in (
    select DepartmentID
	from Employees
	group by DepartmentID
	having count(*) > 2
);
select e.FirstName, e.LastName, e.Salary
from Employees
where e.Salary > (
   select avg(Salary)
   from Employees
   where DepartmentID = e.DepartmentID
);
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

select FirstName
from Employees
where Salary > (select avg(Salary)
                from Employees
				Where id =3)

select d.DepartmentName
from Departments d  
where d.DepartmentID in (select d.DepartmentID
                from Employees e
                where e.Salary > 60000)