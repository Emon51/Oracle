


--Create package named calculator.
create or replace package calculator as

     procedure greeting;
     function addition(a int, b int) return int;
     function subtraction (a int, b int) return int;
     function multiplication(a int, b int) return int;
     function division(a int, b int) return int;
     
  end;
  
------------------------------------------------------------------------------------------------------
--Implementation of calculator package's body
create or replace package body calculator as
    --greeting procedure
    procedure greeting as
       begin
          dbms_output.put_line('Welcome Here');
       end;
   --Addition function
   function addition (a int, b int) return int as 
       begin 
          return (a + b);
       end;
   
   --Subtraction function
   function subtraction(a int, b int) return int as 
        begin 
           return (a - b);
        end;
        
    --Multiplication function
   function multiplication(a int, b int) return int as 
        begin 
           return (a * b);
        end;
        
    --Division function
   function division(a int, b int) return int as 
        begin 
           if b = 0 
              then dbms_output.put_line('Divison is not Possible');
              return null;
           else 
              return (a / b);
           end if;
        end;
end calculator;
--------------------------------------------------------------------------------------------------

begin 
dbms_output.put_line(calculator.addition(7, 4));
dbms_output.put_line(calculator.subtraction(7, 4));
dbms_output.put_line(calculator.multiplication(7, 4));
dbms_output.put_line(calculator.division(20, 0));
dbms_output.put_line(calculator.division(20, 4));
end;
