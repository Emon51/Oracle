
--while creating new user using sql plus sometimes occurs a error: ORA-00922: missing or invalid option
--Solution:  ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--And try to create new user --- CREATE [new_user_name] IDENTIFIED BY [new_password];
