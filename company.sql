create database company;
use Company;

Create Table Employees(
Emp_Id Int,
First_Name Varchar(50),
Last_Name Varchar(50),
Email Varchar(50),
Hire_Date Date,
Job_Title Varchar(50),
Department_Id Int,
Manager_Id Int,
Primary Key (Emp_ID,Department_ID,Manager_ID),
Foreign Key (Department_Id) References Departments(Department_Id)
);


Insert Into Employees(Emp_Id,First_Name,Last_Name,Email,Hire_Date,Job_Title,Department_Id,Manager_Id)
values(1001,'John','Smith','john.smith@company.com','2020-01-15','Software Engineer',101,2001),
(1002,'Emma','Johnsan','emma.johnson@company.com','2019-03-22','Project Manager',102,2002),
(1003,'David','Brown','david.brown@company.com','2022-06-10','Business Analyst',103,2001),
(1004,'Oliva','Garcia','olivia.garcia@company.com','2018-11-05','QA Engineer',101,2001),
(1005,'Liam','Martinez','liam.martinez@company.com','2022-02-28','HR Specialist',104,2003),
(1006,'Ava','Davis','ava.davis@company.com','2023-05-18','DevOps Engineer',101,2001),
(1007,'Noah','Wilson','noah.wilson@company.com','2017-09-12','Finance Analyst',105,2004)
;

alter table employees
add 
Foreign key (Manager_Id) References Manager(Manager_Id);


Create Table Departments(
Department_Id Int Primary Key,
Department_Name Varchar(50)
);


Insert Into Departments(Department_Id,Department_Name)
Values(101,'Engineering'),(102,'Project Managerment'),(103,'Business Analyst'),
(104,'Human Resources'),(105,'Fianance');


Create Table Project(
Project_Id varchar(10) Primary Key,
Project_Name Varchar(50),
Start_Date Date,
End_Date Date
); 

Insert into Project(Project_Id,Project_Name,Start_Date,End_Date)
Values('P101','Employee Onboarding','2023-01-10','2023-04-20'),
('P102','Finance Dashboard','2022-11-01','2023-03-15'),
('P103','HR Automation Tool','2023-05-01','2023-09-30'),
('P104','DevOps Migration','2023-06-10','2023-12-15'),
('P105','Client CRM Revamp','2022-08-01','2023-02-28');



Create Table Manager(
Manager_Id Int,
Emp_Id Int,
Primary Key (Manager_Id,Emp_Id),
Foreign Key (Emp_Id) References Employees(Emp_Id)
);

Insert Into Manager(Manager_Id,Emp_Id)
Values(2001,1001),(2001,1003),(2001,1004),(2001,1006),
(2002,1002),(2003,1005),(2004,1007);


Create Table Salary(
Emp_id Int,
Base_Salary Int,
Primary Key (Emp_Id,Base_Salary),
Foreign Key (Emp_Id) References Employees(Emp_Id)
);

Insert Into Salary(Emp_Id,Base_Salary)
values(1001,85000),(1002,95000),(1003,72000),
(1004,70000),(1005,65000),(1006,88000),(1007,78000);

Create Table Performance(
Performance_Id  Int Primary Key,
Emp_Id Int,
Department_Id Int,
Performance_Scale Int,
Foreign key (Emp_Id) References Employees(Emp_Id),
Foreign Key (Department_Id) References Departments(Department_Id)
);


Insert Into Performance(Performance_Id,Emp_Id,Department_Id,Performance_Scale)
Values(501,1001,101,5),(502,1002,102,4),(503,1003,103,3),(504,1004,101,4),
(505,1005,104,3),(506,1006,101,5),(507,1007,105,4);

Select * From Employees;
Select * From Project;
Select * From Salary;
Select * From Departments;
Select * From Manager;
Select * From Performance;

