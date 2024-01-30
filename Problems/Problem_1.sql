
--Problem: select row in which any column has 'a'


create table temp(
c1 varchar2(5),
c2 varchar2(5),
c3 varchar2(5),
c4 varchar2(5)
);


insert into temp values ('a', 'b', 'd', 'e');
insert into temp values ('s', 't', 'g', 'f');
insert into temp values ('u', 'b', 'r', 'a');
insert into temp values ('f', 'b', 'd', 'e');

------------------------------------------------------------
select * from temp;

--Solution_1

SELECT * 
FROM temp
WHERE c1 = 'a' OR c2 = 'a' OR c3 = 'a' OR c4 = 'a';

--Solution_2

SELECT * FROM TEMP WHERE c1 = 'a'
UNION 
SELECT * FROM TEMP WHERE c2 = 'a'
UNION 
SELECT * FROM TEMP WHERE c3 = 'a'
UNION
SELECT * FROM TEMP WHERE c4 = 'a';

--Solution_3

SELECT * FROM temp
WHERE 'a' in (c1, c2, c3, c4);

--Solution_4

SELECT * FROM temp
WHERE c1 || c2 || c3 || c4 LIKE '%a%';

--Solution_5

SELECT * FROM temp
WHERE INSTR(c1 || c2 || c3 || c4, 'a') > 0;





