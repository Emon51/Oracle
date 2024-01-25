
--Merging two table(two tables shouold have same attributes with same datatypes).

create table employee (
  emp_id int primary key,
  name varchar2(20),
  age int
  );
  -----------------------------------------------------------------------------
create table temp_employee (
  emp_id int primary key,
  name varchar2(20),
  age int
  );
--------------------------------------------------------------------------------
insert into employee values (1, 'Emon', 23);
insert into employee values (2, 'Rakib', 22);

insert into temp_employee values (3, 'Amirul', 20);
insert into temp_employee values (1, 'Emon', 24);
--------------------------------------------------------------------------------

-- Merge

MERGE INTO employee e USING temp_employee t
ON (e.emp_id = t.emp_id)
WHEN MATCHED THEN UPDATE
SET e.name = t.name,
    e.age = t.age
WHEN NOT MATCHED THEN INSERT VALUES
    (t.emp_id, t.name, t.age);


select * from employee;

select * from temp_employee;






