
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION Add_nums(num1 NUMBER, num2 NUMBER) RETURN NUMBER AS
       --res NUMBER;
       BEGIN  
         --res := num1 + num2;
         --RETURN res;
         RETURN (num1 + num2);
       END Add_nums;
       /
       

BEGIN 
  DBMS_OUTPUT.PUT_LINE(Add_nums(4,5));
END;