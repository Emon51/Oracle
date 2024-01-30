

--From the students table, write a SQL query to interchange the adjacent student names.

--Note: If there are no adjacent student then the student name should stay the same.

create table students
(
id int primary key,
student_name varchar(50) not null
);

insert into students values (1, 'James');
insert into students values (2, 'Michael');
insert into students values (3, 'George');
insert into students values (4, 'Stewart');
insert into students values (5, 'Robin');

select * from students;








--Solutions:

with cte as (
             select s.*, 
             lead(s.student_name, 1, s.student_name) over(order by s.id) as next_name,
             lag(s.student_name, 1, s.student_name) over(order by s.id) as prev_name
             from students s
             )
            
select c.id, c.student_name,
       case when mod(c.id, 2) = 1 then c.next_name else c.prev_name end as new_name
from cte c;

--------------------------------------------------------------------------------------------------
select id,student_name,
case when mod(id, 2) <> 0 then lead(student_name,1,student_name) over(order by id)
else lag(student_name, 1, student_name) over(order by id) end as new_name
from students;
