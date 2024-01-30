


--Find the top 2 accounts with the maximum number of unique patients on a monthly(each month 2 accounts) basis.

--Note: Prefer the account if with the least value in case of same number of unique patients

--Table Structure:

create table patient_logs
(
  account_id int,
  dates date,
  patient_id int
);

insert into patient_logs values (1, to_date('02-01-2020','dd-mm-yyyy'), 100);
insert into patient_logs values (1, to_date('27-01-2020','dd-mm-yyyy'), 200);
insert into patient_logs values (2, to_date('01-01-2020','dd-mm-yyyy'), 300);
insert into patient_logs values (2, to_date('21-01-2020','dd-mm-yyyy'), 400);
insert into patient_logs values (2, to_date('21-01-2020','dd-mm-yyyy'), 300);
insert into patient_logs values (2, to_date('01-01-2020','dd-mm-yyyy'), 500);
insert into patient_logs values (3, to_date('20-01-2020','dd-mm-yyyy'), 400);
insert into patient_logs values (1, to_date('04-03-2020','dd-mm-yyyy'), 500);
insert into patient_logs values (3, to_date('20-01-2020','dd-mm-yyyy'), 450);

select * from patient_logs;

------------------------------------------------------------------------------------

--Tutorials: have to know.

--Month
select p.*, to_char(p.dates, 'month') as month --'month' -> name_of_month, 'mm' or 'MM' -> no_of_month
from patient_logs p;

select p.*, to_char(p.dates, 'mm') as month 
from patient_logs p;
---------------------------------------------------------------------------------
--Year
select p.*, to_char(p.dates, 'YYY') as year     --'YYY" or 'yyy'
from patient_logs p;

--------------------------------------------------------------------------------

--Day
select p.*, to_char(p.dates, 'day') as day     --'day' -> name_of_the_day, 'dd' or 'DD' -> no_of_the_day
from patient_logs p;

select p.*, to_char(p.dates, 'dd') as day 
from patient_logs p;

---------------------------------------------------------------------------------

--Solution.

with cte as(
select p.*, to_char(p.dates, 'month') as month
from patient_logs p
),

cte1 as (
select c. month, c.account_id, count(distinct c.patient_id) as no_of_unique_patients
from cte c
group by c.account_id, c.month
order by no_of_unique_patients desc, account_id
),

cte2 as (
select c1.*, row_number() over(partition by c1.month order by c1.no_of_unique_patients desc) as rn
from cte1 c1)

select * 
from cte2
where rn <= 2;
