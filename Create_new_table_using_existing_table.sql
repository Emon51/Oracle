
--Syntax

--Create new table or backup table using existing table

CREATE TABLE [new_table_name] AS (SELECT * FROM [old_table_name])    --Parenthesis not mandatory


--Create new table structure without data using existing table

CREATE TABLE [new_table_name] AS (SELECT * FROM [old_table_name])    --Parenthesis not mandatory
WHERE 1 = 2 --False Condition

--Copy all records or specific records(using where clause associated with specified conditions).

INSERT INTO [new_table_name] (SELECT * FROM [old_table_name]) --Parenthesis not mandatory

--OR

INSERT INTO [new_table_name] (SELECT * FROM [old_table_name] WHERE [conditions]) --Parenthesis not mandatory
