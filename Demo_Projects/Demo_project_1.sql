
set serveroutput on;
--Create Accounts table.
create table Accounts (
   id number primary key,
   name varchar2(10),
   amount number
);
--#############################################################################

--Insert data into Accounts table.
insert into Accounts values(1, 'Emon', 100);
insert into Accounts values(2, 'Rakib', 100);
insert into Accounts values(3, 'Amirul', 100);
insert into Accounts values(4, 'Emran', 100);
insert into Accounts values(5, 'Aaqib', 100);
--#############################################################################

select * from Accounts;

--#############################################################################

--Create Transaction_history table.

CREATE TABLE Transaction_history(
    acc_id NUMBER,
    transaction_type VARCHAR2(50),
    amount NUMBER,
    t_date DATE);
--#############################################################################

--Create Packages 'Transactions' having Procedures "Add_money", "Withdraw_money", "Send_money", and Functions "Check_balance" 

CREATE OR REPLACE PACKAGE Transactions AS
   PROCEDURE Add_money(acc_id NUMBER, amnt NUMBER);
   PROCEDURE Withdraw_money(acc_id NUMBER, amnt NUMBER);
   PROCEDURE Send_money(acc_id NUMBER, to_acc_id NUMBER, amnt NUMBER);
   FUNCTION Check_balance(acc_id NUMBER) RETURN NUMBER;
END Transactions;
/
   
--###############################################################################

--Create Package 'Transactions' Body.

CREATE OR REPLACE PACKAGE BODY Transactions AS
   --Add_money Procedure Implementations.
   PROCEDURE Add_money(acc_id NUMBER, amnt NUMBER) AS 
      old_balance NUMBER;
      new_balance NUMBER;
      BEGIN
         SELECT amount INTO old_balance
         FROM Accounts
         WHERE id = acc_id;
         
         new_balance := old_balance + amnt;
         UPDATE Accounts 
         SET amount = new_balance 
         WHERE id = acc_id;
         
         --Insert the task into Transaction_history table.
         INSERT INTO Transaction_history(acc_id, transaction_type, amount, t_date)
         VALUES (acc_id, 'add_money', amnt, SYSDATE);
         
         COMMIT;
         
         EXCEPTION WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Something went Wrong.');
         ROLLBACK;
      END Add_money;
      
   --Withdraw_money Procedure Implementations.
   
   PROCEDURE Withdraw_money(acc_id NUMBER, amnt NUMBER) AS 
      old_balance NUMBER;
      new_balance NUMBER;
      BEGIN
         SELECT amount INTO old_balance
         FROM Accounts
         WHERE id = acc_id;
          --Ensure withdraw is possible.
         IF old_balance >= amnt THEN 
            new_balance := old_balance - amnt;
            UPDATE Accounts 
            SET amount = new_balance 
            WHERE id = acc_id;
         --Insert the task into Transaction_history table.
            INSERT INTO Transaction_history(acc_id, transaction_type, amount, t_date)
            VALUES (acc_id, 'withdraw_money', amnt, SYSDATE);
            
            COMMIT;
         ELSE DBMS_OUTPUT.PUT_LINE('Error-Withdrawal amount exceeds current balance');
         END IF;
         
         EXCEPTION WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Something went Wrong.');
         ROLLBACK;
      END Withdraw_money;
      
      
      --Send_money Procedure Implementations.
   
   PROCEDURE Send_money(acc_id NUMBER, to_acc_id NUMBER, amnt NUMBER) AS 
      from_old_balance NUMBER;
      from_new_balance NUMBER;
      to_old_balance NUMBER;
      to_new_balance NUMBER;
      BEGIN
         SELECT amount INTO from_old_balance
         FROM Accounts
         WHERE id = acc_id;
          --Ensure send money is possible.
         IF from_old_balance >= amnt THEN 
            from_new_balance := from_old_balance - amnt;
            UPDATE Accounts 
            SET amount = from_new_balance 
            WHERE id = acc_id;
            
            SELECT amount INTO to_old_balance
            FROM Accounts
            WHERE id = to_acc_id;
            
            to_new_balance := to_old_balance + amnt;
            
            UPDATE Accounts 
            SET amount = to_new_balance 
            WHERE id = to_acc_id;
            
         --Insert the task into Transaction_history table.
            INSERT INTO Transaction_history(acc_id, transaction_type, amount, t_date)
            VALUES (acc_id, 'sending_money', amnt, SYSDATE);
            
            COMMIT;
         ELSE DBMS_OUTPUT.PUT_LINE('Error-Withdrawal amount exceeds current balance');
         END IF;
         
         EXCEPTION WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Something went Wrong.');
         ROLLBACK;
      END Send_money;
      
      --#################DONE#################
      
      
   --Check_balance Procedure implementation.
  FUNCTION Check_balance(acc_id NUMBER) RETURN NUMBER AS
     curr_balance NUMBER;
     BEGIN 
        SELECT amount INTO curr_balance 
        FROM Accounts
        WHERE id = acc_id;
        RETURN curr_balance;
        
        EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Something went wrong');
     END Check_balance;
END Transactions;
/
     --.................DONE...............................................
     

--Driver_code
--Adding Money.
BEGIN 
  Transactions.add_money(1, 50); --id, balance
END;
--######################################OK   

--Withdrawing money.
BEGIN 
  Transactions.withdraw_money(2, 50); --id, balance
END;  
--######################################OK
--Sending money.
BEGIN 
  Transactions.send_money(3, 5, 50); --id1, id2, balance
END;  
--######################################OK   
--Checking current balaance
DECLARE 
  cur_balance NUMBER;
BEGIN 
  cur_balance := Transactions.Check_balance(2); --id
  DBMS_OUTPUT.PUT_LINE('Current Balance is: ' || cur_balance);
END;  
--######################################OK   

SELECT * FROM Accounts;

SELECT * FROM Transaction_history;
     

   
     
     
      

      
         
    















   




































