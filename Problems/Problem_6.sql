create table team (
name varchar2(10)
);
--------------------------------------------------------------------------------
insert into team values('BAN');
insert into team values('AUS');
insert into team values('NZ');
insert into team values('PAK');
insert into team values('SA');
insert into team values('ENG');
-------------------------------------------------------------------------------

select * from team;
---------------------------------------------------------------------------------------------------------------
--Write a sql query to arrange matches team1 VS team2, so that each team faced with another team just one times.

--Self Join.

WITH cte AS (
   SELECT ROW_NUMBER() OVER (ORDER BY t.name) AS rn, t.name
   FROM team t)
   
SELECT tm1.name AS team1, tm2.name AS team2
FROM cte tm1 JOIN cte tm2 ON tm1.rn < tm2.rn;























