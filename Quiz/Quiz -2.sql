 create database company1  ;
 
 -- use the database
use company1 ;
-- Part A  Commonds ( DDL ,DML, DQL )
 
-- table 1  Employees 
 create table  Employees (
 Empid int  primary key  ,
 Name varchar (100)  not null ,
 Department varchar(100) ,
 Salary int  
 ); 
 
 -- insert value  in table Employees 
 INSERT INTO Employees (EmpID, Name, Department, Salary) VALUES
(101, 'Ravi Kumar', 'HR', 45000),
(102, 'Sunita Sharma', 'Finance', 55000),
(103, 'Amit Verma', 'IT', 60000),
(104, 'Priya Singh', 'Marketing', 48000),
(105, 'Rahul Mehta', 'Sales', 52000);

-- show the  all data  
select* from Employees; 

--  2 update the salary of employee with EmpID = 105.
update  Employees
set  salary =  60000 
where empid =105 ;

-- 3.remove the  employees table in department  HR  
delete  from   Employees
where department = 'HR' ;

--  4.select  the Employees table  and show the working on  finance  
select* from  Employees
where department = 'Finance' ; 

-- Part  B  clauses  
--  5 .display  the top 3  employees
select* from Employees 
order by  salary  desc
limit 3;

-- 6 show the total slary  paid   
select department ,  sum(salary) as totalsalary from  Employees  
group by  department  ;

-- 7 .retrive the  employees  more 50000 an less then 80000 
select*from employees 
where salary >50000 and salary < 80000 ;  

-- 8.show the data from employees table name  start with name  A 
select* from Employees 
where name  like 'a%' ;

--  Part C  Constraints 
-- create student table 
create  table  students (
stdId int primary key  ,
RollNo int unique ,
marks int check (marks >0 ) 
);

-- add column in Employees table  
alter table  Employees 
Add Email varchar(50) not null ; 
 
 
 --  create table  customer '
 create table  customers  
 ( customerid int primary key  ,
 name varchar (100)
 );
 
-- create table  order  
create table orders  
( orderid int primary key  ,
customerid  int ,
foreign key  (CustomerId ) references Customers (Customerid ) 
);
 drop table customers;

-- Part D Joins 

-- 12  inner join 
 select T1.customerid  , T1.name  , T2.orderid  
 from  customers t1 
 inner join orders t2 on t1.Customerid = t2.customerid ;
 
 -- 13 left join 
 create table Projects(
 Projectid  int primary key ,
 Empid int  ,
 project_name varchar(100) 
 ) ;  
 drop table projects;
 select  t1.Empid ,  t1.name , t2.projectid , t2.project_name 
 from  Employees t1
 left join Projects t2 on t1.Empid = t2.Empid ;  
 
 --  14  right join  
 create table Departments 
 ( Dpt_id  int primary key ,
 Dpt_name  varchar (100),
 Empid int  
 );
 
 drop table Departments; 
 select t1.name , t2.Dpt_name 
 from Employees t1
 right join departments t2 on  t1.empid = t2.empid ;
 
 --  16 combine two tables  use with union 
 create table  Branch_A_Employees (
 Empid int primary key ,
 name  varchar (100) 
 );
 
 create table  Branch_B_Employees (
 Empid int primary key ,
 name  varchar (100) 
 );
 
 
 select t1.Empid , t1.name ,t2.Empid , t2.name 
 from Branch_A_Employees t1
 right join Branch_B_Employees t2 on  t1.empid = t2.empid
 union
 select t1.Empid , t1.name ,t2.Empid , t2.name 
 from Branch_A_Employees t1
 right join Branch_B_Employees t2 on  t1.empid = t2.empid;
 
 -- Part E Subqueries 
 
 -- 17 find the highest secound salary  
 select max(salary ) as max_salary from Employees 
 where salary <(select max(salary) from  Employees);
 
 -- 18 find the avg salary  and show the  names  
 select name , salary  from  Employees 
 where salary > (select avg(salary ) as avg_salary from employees );
 
 --  19  disply the employees work on same department   ( employees name ' Rohit ' ) 
 select * from  employees  
 where department = (select department from employees where  name  =  ' Rohit ' );
 
 -- 20 
 
--  Part  F Built-in & User-defined Functions

-- 21 show the current date  
select  now() as currentDate;

-- 22 length function 
select length(name ) from Employees ;

-- 24 count the total   employees  
select count(*) as total_emp  from  employees where  empid ;

--  25 create user define function  getBonus  and returns 10% salary bouns 

Delimiter // 
create function GetBonus (salary Decimal (10,2))
returns decimal(10,2)
Deterministic
Begin
 return salary *0.10;
End //
delimiter ;

 -- use the fuction  and display  Empid , name  GetBonus 
 select Empid , name , GetBonus(salary) from Employees ;
