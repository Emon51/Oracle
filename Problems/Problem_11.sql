
--From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

--Note: Weather is considered to be extremely cold then its temperature is less than zero.

--Table Structure:

create table weather
(
id int,
city varchar(50),
temperature int,
day date
);

insert into weather values (1, 'London', -1, to_date('2021-01-01','yyyy-mm-dd'));
insert into weather values (2, 'London', -2, to_date('2021-01-02','yyyy-mm-dd'));
insert into weather values (3, 'London', 4, to_date('2021-01-03','yyyy-mm-dd'));
insert into weather values (4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd'));
insert into weather values (5, 'London', -2, to_date('2021-01-05','yyyy-mm-dd'));
insert into weather values (6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd'));
insert into weather values (7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd'));
insert into weather values (8, 'London', 5, to_date('2021-01-08','yyyy-mm-dd'));

select * from weather;
--------------------------------------------------------------------------------------------

--Solution:

--Using cte
with cte as (select w.*,
        case when w.temperature < 0 and lead(w.temperature) over(order by w.day) < 0 and lead(w.temperature, 2) over(order by w.day) < 0  then 'Y'
             when w.temperature < 0  and lead(w.temperature) over(order by w.day) < 0 and lag(w.temperature) over(order by w.day) < 0  then 'Y'
             when w.temperature < 0  and lag(w.temperature) over(order by w.day) < 0 and lag(w.temperature,2) over(order by w.day) < 0  then 'Y' 
        end as flag
from weather w)

select c.id, c.city, c.temperature, c.day
from cte c
where c.flag = 'Y';
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Using Subquery.

select c.id, c.city, c.temperature, c.day

from (select w.*,
        case when w.temperature < 0 and lead(w.temperature) over(order by w.day) < 0 and lead(w.temperature, 2) over(order by w.day) < 0  then 'Y'
             when w.temperature < 0  and lead(w.temperature) over(order by w.day) < 0 and lag(w.temperature) over(order by w.day) < 0  then 'Y'
             when w.temperature < 0  and lag(w.temperature) over(order by w.day) < 0 and lag(w.temperature,2) over(order by w.day) < 0  then 'Y' 
        end as flag
        
from weather w) c
where c.flag = 'Y';









