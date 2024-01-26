/*In Oracle, the GRANT and REVOKE statements are used to manage access control and permissions for database objects.
These statements are part of the Data Control Language (DCL) in SQL, which is responsible for controlling access to data within the database. */

--The GRANT statement is used to give specific privileges to a user.
--The REVOKE statement is used to revoke previously granted privileges.

--Syntax
GRANT SELECT, INSERT, UPDATE ON table_name TO username;

REVOKE SELECT, INSERT, UPDATE ON table_name FROM username;

