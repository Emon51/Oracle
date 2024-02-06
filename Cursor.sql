

SET SERVEROUTPUT ON;

select * from Employee;  
     
     
CREATE OR REPLACE PROCEDURE show_details AS
    CURSOR my_cursor IS
        SELECT emp_id, emp_name, salary
        FROM Employee;

    v_id Employee.emp_id % TYPE;
    v_name Employee.emp_name % TYPE;
    v_salary Employee.salary%TYPE;

BEGIN
    OPEN my_cursor;
    
    LOOP
        FETCH my_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN my_cursor % NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_id || ' ' || v_name || ' ' || v_salary);
    END LOOP;

    CLOSE my_cursor;
END;
/


begin 
show_details;
end;









