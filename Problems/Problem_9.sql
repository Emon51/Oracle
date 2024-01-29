
--From the login_details table, fetch the users who logged in consecutively 3 or more times.

--Table Structure:

create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

insert into login_details values (101, 'Michael', sysdate);
insert into login_details values (102, 'James', sysdate);
insert into login_details values (103, 'Stewart', sysdate +1); -- +1 add as a day
insert into login_details values (104, 'Stewart', sysdate+1);
insert into login_details values (105, 'Stewart', sysdate+1);
insert into login_details values (106, 'Michael', sysdate+2);
insert into login_details values (107, 'Michael', sysdate+2);
insert into login_details values (108, 'Stewart', sysdate+3);
insert into login_details values (109, 'Stewart', sysdate+3);
insert into login_details values (110, 'James', sysdate+4);
insert into login_details values (111, 'James', sysdate+4);
insert into login_details values (112, 'James', sysdate+5);
insert into login_details values (113, 'James', sysdate+6);
---------------------------------------------------------------------------------

select * from login_details;
---------------------------------------------------------------------------------

--Solution:
select distinct c.user_name
from (select lg.*,
        case when lg.user_name = lead(lg.user_name, 1) over (order by lg.login_id) and 
                  lg.user_name = lead(lg.user_name, 2) over (order by lg.login_id)
                  then lg.user_name end as repeated_login
 from login_details lg) c
 where c.repeated_login is not null;
 


