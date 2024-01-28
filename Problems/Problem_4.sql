

create table temp (
  team1 varchar2(10),
  team2 varchar2(10),
  winner varchar(10)
  );
---------------------------------------------------------------------------------
INSERT INTO temp values('India','SL','India');
INSERT INTO temp values('SL','Aus','Aus');
INSERT INTO temp values('SA','Eng','Eng');
INSERT INTO temp values('Eng','NZ','NZ');
INSERT INTO temp values('Aus','India','India');
---------------------------------------------------------------------------------
select * from temp;
---------------------------------------------------------------------------------

--Summarize the temp table.

WITH cte AS (SELECT t.team1 as team, 
       CASE WHEN t.winner = t.team1 THEN 1 ELSE 0 END AS win_cnt,
       CASE WHEN t.winner !=  t.team1 THEN 1 ELSE 0 END AS loss_cnt
FROM temp t

UNION ALL

SELECT t.team2 as team, 
       CASE WHEN t.winner = t.team2 THEN 1 ELSE 0 END AS win_cnt,
       CASE WHEN t.winner !=  t.team2 THEN 1 ELSE 0 END AS loss_cnt
FROM temp t)


SELECT c.team, SUM(c.win_cnt) AS win_cnt, SUM(c.loss_cnt) AS loss_cnt, COUNT(*) AS total_match
FROM cte c
GROUP BY c.team;






