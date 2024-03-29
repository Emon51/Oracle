

/* Write a SQL query to display only the details of employees who either earn the highest salary
or the lowest salary in each department from the employee table */

--Tables Structure:

drop table employee;
create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
----------------------------------------------------------------------------------------------

select * from employee;
-------------------------------------------------------------------------------------------------
-- Solution:

with cte as (
    select e.*, 
    rank() over (partition by e.dept_name order by e.salary desc) as max_sal_rnk, --row_number() is an another option
    rank() over (partition by e.dept_name order by e.salary asc) as min_sal_rnk
    from employee e
)

select c.emp_id, c.emp_name, c.dept_name, c.salary
from cte c
where c.max_sal_rnk = 1 or c.min_sal_rnk = 1;

--------------------------------------------------------------------------------------

with cte as (
    select e.*, 
    row_number() over (partition by e.dept_name order by e.salary desc) as max_sal_rn,
    row_number() over (partition by e.dept_name order by e.salary asc) as min_sal_rn
    from employee e
),

cte1 as (select c.emp_id, c.emp_name, c.dept_name, c.salary,
row_number() over(partition by c.dept_name order by c.salary desc) as rn
from cte c
where c.max_sal_rn = 1 or c.min_sal_rn = 1)

select c1.dept_name, 
       sum(case when c1.rn = 1 then salary end) as max_salary,
       sum(case when c1.rn = 2 then salary end) as min_salary
from cte1 c1
group by c1.dept_name;
       
       

















