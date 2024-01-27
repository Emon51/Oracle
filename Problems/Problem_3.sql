
create table temp (
userName varchar2(10),
activity varchar2(15),
startDate date,
endDate date);
-------------------------------------------------------------------------------------------------------------------------

insert into temp values('Alice', 'Travel', TO_DATE('2020-02-12', 'YYYY-MM-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'));
insert into temp values('Alice', 'Dancing', TO_DATE('2020-02-21', 'YYYY-MM-DD'), TO_DATE('2020-02-23', 'YYYY-MM-DD'));
insert into temp values('Alice', 'Travel', TO_DATE('2020-02-24', 'YYYY-MM-DD'), TO_DATE('2020-02-28', 'YYYY-MM-DD'));
insert into temp values('Bob', 'Travel', TO_DATE('2020-02-11', 'YYYY-MM-DD'), TO_DATE('2020-02-18', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------------------------------------------------

select * from temp;
---------------------------------------------------------------------------------------------------------------------------

-- Get the 2nd most recent activity, if there is only one activity then return that one.


WITH cte AS (
     SELECT t.*, 
     COUNT(1) OVER (PARTITION BY t.userName) AS cnt,
     RANK() OVER (PARTITION BY t.userName ORDER BY t.endDate DESC) AS rnk
     FROM temp t
)

SELECT * FROM cte c
WHERE c.cnt = 1 OR c.rnk = 2;










