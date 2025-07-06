use company;
select * from project;
select * from manager;
select * from departments;
select * from salary;
select * from performance;
select * from employees;


Select * From Employees;
select First_Name,Last_Name,Email from Employees;
select * from Employees where Hire_Date > '2022-01-01';
select * from Employees where Department_Id = 101;
select * from Project
order by Start_Date asc;
select * from Salary where Base_Salary > 60000;
Select * from Departments where Department_Name like 'M%';
select Project_Name from Project where End_Date> '2023-12-01';
select First_Name from Employees where First_Name like '%a%';
Select * from Employees where Manager_Id is Null;
select distinct Job_Title from Employees;
select e.First_Name,e.Last_Name,d.Department_name 
from Employees e Join Departments d on e.Department_Id = d.Department_Id 
Where d.Department_Name='Engineering';
select e.First_Name,e.Last_Name,s.Base_Salary 
from Employees e join Salary s on e.Emp_id = s.Emp_id 
order by base_salary desc;
select e.First_Name,e.Last_name,m.Manager_Id from Employees e join Manager m where e.emp_id = m.emp_Id;
select * from Employees where Hire_Date between '2021-01-01' and '2021-12-31';
select e.First_Name,e.Last_Name,d.Department_Name from Employees e join Departments d where e.Department_Id = d.Department_Id;
select e.First_Name,e.Last_Name,s.Base_Salary from Employees e join Salary s where e.Emp_id= s.Emp_id;
Select Departments.Department_Name, count(Employees.Emp_Id) AS Total_Employees
FROM Departments
left join  Employees ON Departments.Department_Id = Employees.Department_Id
group by Departments.Department_Name;
select Department_Name, max(Base_salary) as highest_salary
from Departments join Salary group by department_name ;
select avg(Base_Salary) as average_salary from salary;
select d.department_name, d.department_id , avg(p.performance_scale) as average_performance
from departments d join performance p on d.department_id = p.department_id 
group by d.department_name,p.department_id;
select project_name, datediff(end_date,start_date) as project_duration from project;
select e.emp_id,e.first_name,e.last_name,p.performance_scale
from employees e join performance p on e.emp_id = p.emp_id where performance_scale>3;
select d.department_name, count(e.emp_id) as total_employee from departments d join employees e on d.department_id = e.department_id group by d.department_name;
select s.emp_id,s.base_salary,p.performance_scale from salary s join performance p on s.emp_id = p.emp_id;
select e.emp_id,e.first_name,e.last_name,d.department_name,dept_counts.total_employee
from employees e join departments d on e.department_id = d.department_id join (
select department_id, count(*) as total_employee from employees
group by department_id) as dept_counts on e.department_id = dept_counts.department_id;
select e.emp_id, s.base_salary, d.department_name from employees e
join departments d on e.department_id = d.department_id join  salary s on e.emp_id = s.emp_id
where d.department_name = 'Engineering' and s.base_salary > 70000;
select d.department_id,d.department_name from departments d left join 
employees e on d.department_id = e.department_id where e.emp_id is null;
select id,e.first_name,e.last_name,s.base_salary from employees e
join salary s on e.emp_id = s.emp_id order by s.base_salary desc limit 3;
select * from project where start_date between '2023-01-01' and '2023-12-30';
select manager_id , count(*) as num_of_employees from employees where manager_id is not null 
group by manager_id;
select *
from employees
where department_id in (select department_id from employees group by department_id having count(*) > 1);
select e.first_name,e.last_name,d.department_name,p.performance_scale,s.base_salary
from employees e join departments d on e.department_id = d.department_id 
join performance p on e.emp_id = p.emp_id join salary s on e.emp_id = s.emp_id;
select e.emp_id, e. first_name , last_name,s.base_salary
from Employees e join salary s on e.emp_id = s.emp_id 
where s.base_salary = (select max(base_salary) from salary);
select e.department_id, d.department_name, avg(s.base_salary) as avgsalary from employees e
join Salary s on e.emp_id = s.emp_id join departments d on e.department_id = d.department_id 
where s.base_salary > 70000 group by e.department_id, d.department_name;
select e.first_name,last_name,s.base_salary from employees e join salary s 
where s.base_salary > (select avg(base_salary) from salary);
select e.first_name,e.last_name,p.performance_scale from employees e join performance p
order by performance_scale desc limit 3;
create view employee_details 
as 
select e.first_name,e.last_name,d.department_name,s.base_salary from employees e join 
departments d on e.department_id = d.department_id join salary s on e.emp_id = s.emp_id;
select * from employee_details;
create view departmentperformancesummary
as
select department_id ,avg(performance_scale) as average_performance,
max(performance_scale) as maximum_performance, min(performance_scale) as minimum_performance from performance
group by department_id;
select * from departmentperformancesummary;
update salary
set base_salary = 90000*1.10
where emp_id = 1001;
delete from project where end_date < '2023-06-01' limit 100;
Insert Into Employees(Emp_Id,First_Name,Last_Name,Email,Hire_Date,Job_Title,Department_Id,Manager_Id)
values(1008,'Robert','Goel','Goel.robert@company.com','2024-05-25','HR',104,2001);
select year(hire_date) as hireyaer, count(*) as totalemployee
from employees group by year(hire_date);
create table bonuses(
bonus_id int primary key,
emp_id int,
bonus_amount int,
foreign key (emp_id) references employees(emp_id));
select * from employees where department_id is null;
select d.department_id,d.department_name, avg(p.performance_scale) as avgperformance from departments d 
join performance p on d.department_id = p.department_id group by d.department_id, d.department_name 
having avg(p.performance_scale)>3 ;







