
-- Create Table 'Products'

CREATE TABLE Products
(
    ProductId NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, --Auto Increment
    ProductName VARCHAR2(200) NOT NULL,
    BrandName VARCHAR2(200) NOT NULL,
    ReceiveDate DATE,
    AvailableStock FLOAT NOT NULL,
    Price NUMBER NOT NULL,
    CreateDate DATE DEFAULT SYSDATE,
    ModifyDate DATE DEFAULT SYSDATE
);


-- Inser Data

INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('Logitech MX Master 3', 'Logitech', TO_DATE('2022-07-18', 'YYYY-MM-DD'), 100, 99.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('Apple Magic Keyboard', 'Apple', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 200, 199.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('Samsung T7 Portable SSD', 'Samsung', TO_DATE('2022-04-15', 'YYYY-MM-DD'), 150, 179.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('990 Pro 2TB SSD', 'Samsung', TO_DATE('2022-09-07', 'YYYY-MM-DD'), 300, 279.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('Magic Mouse', 'Apple', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 50, 99.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('SIGNATURE K650', 'Logitech', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 100, 49.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('870 Evo SATA 250GB', 'Samsung', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 75, 49.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('MX Key Mini', 'Logitech', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 200, 99.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('Samsung T5 Portable SSD', 'Samsung', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 100, 197.99);
INSERT INTO Products (ProductName, BrandName, ReceiveDate, AvailableStock, Price) VALUES ('AirTag Leather Loop', 'Apple', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 20, 39.99);


SELECT * FROM Products;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------                          



-- Create Table History
CREATE TABLE History
(
	RecordId NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, --Auto Increment
	ActionName VARCHAR2(50) NOT NULL,
	TableName VARCHAR2(50) NOT NULL,
	ColumnName VARCHAR2(50),
	PreviousValue VARCHAR2(500),
	ModifedValue VARCHAR2(500),
	CreateDate DATE DEFAULT SYSDATE
 );
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 --SYNTAX FOR TRIGGER
 
 CREATE TRIGGER [trigger_name] 
 ON [table_name]
 [after/for/instead of]
 [insert/update/delete]
 AS
 {trigger_body}
 
 ---------------------------------------------------------------------------------------------------------------------------------------------------------
 
 -- Create Trigger for insert data
 
CREATE TRIGGER TR_Products_Insert
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO History (ActionName, TableName)
    VALUES ('Insert', 'Products');

    dbms_output.put_line('trigger body is executed');
END;


 
 
 
 
 
 
 
 
 
 
