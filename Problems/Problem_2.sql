
create table temp (
student_id int, 
subject varchar2(10),
marks int);
--------------------------------------------------------------------------------

insert into temp values (1, 'chemistry', 91);
insert into temp values (1, 'physics', 91);
insert into temp values (2, 'chemistry', 80);
insert into temp values (2, 'physics', 90);
insert into temp values (3, 'chemistry', 80);
insert into temp values (4, 'chemistry', 71);
insert into temp values (4, 'physics', 54);
--------------------------------------------------------------------------------

select * from temp;
--------------------------------------------------------------------------------

--Find students with same marks in physics and chemistry.

WITH cte AS (
    SELECT 
        student_id, 
        SUM(CASE WHEN subject = 'chemistry' THEN marks END) AS chemistry,
        SUM(CASE WHEN subject = 'physics' THEN marks END) AS physics
    FROM temp
    GROUP BY student_id
)

SELECT * FROM cte
WHERE chemistry = physics;

             












