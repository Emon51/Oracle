
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    balance NUMBER
);
--------------------------------------------------------------------------------

INSERT INTO accounts VALUES (1, 1000);
INSERT INTO accounts VALUES (2, 500);
--------------------------------------------------------------------------------

SELECT * FROM accounts;
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE transfer_money(
    p_from_account_id NUMBER, --Here p stands for parameter.
    p_to_account_id NUMBER,
    p_amount NUMBER
) AS

    v_balance_from NUMBER;  --Here v stands for variable.
    v_balance_to NUMBER;
    
    -- Declare a custom exception
    INSUFFICIENT_FUND EXCEPTION;
    
BEGIN
    -- Set transaction isolation level to SERIALIZABLE.
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Begin the transaction explicitly
    BEGIN
        -- Retrieve and lock the balance of the source account.
        SELECT balance INTO v_balance_from
        FROM accounts
        WHERE account_id = p_from_account_id;
        
        -- Check if there are sufficient balance or not.
        IF v_balance_from < p_amount THEN
            -- Rollback the transaction if there are insufficient funds.
            ROLLBACK;
            RAISE INSUFFICIENT_FUND; --Syntax: RAISE user_defined_exception_name_in_Exception_Block; -- Block terminated(return);
        END IF;

        -- Retrieve the balance of the destination account.
        SELECT balance INTO v_balance_to
        FROM accounts
        WHERE account_id = p_to_account_id;

        -- Perform the transfer.
        UPDATE accounts
        SET balance = v_balance_from - p_amount
        WHERE account_id = p_from_account_id;

        UPDATE accounts
        SET balance = v_balance_to + p_amount
        WHERE account_id = p_to_account_id;

        -- Commit the transaction.
        COMMIT;
    EXCEPTION
        WHEN INSUFFICIENT_FUND THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance !!!');
        
        -- Rollback the transaction in case of any exception.
        WHEN OTHERS THEN
            ROLLBACK;
    END;
END;
/
--------------------------------------------------------------------------------

-- Execute the transfer_money procedure
BEGIN
    transfer_money(1, 2, 500);
END;
/
--------------------------------------------------------------------------------

SELECT * FROM accounts;


