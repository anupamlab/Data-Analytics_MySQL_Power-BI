/* Domain Validation
│
├── Check Enumerated Values: Certain columns have fixed values like (M/F) (Y/N)
├── Check Numeric Range: Balance cannot be negative
├── Check Date Range : DOB cannot be future.
├── Check Format
├── Check Positive Values
├── Check Logical Range
└── Check Business Domain*/

-- Check Enumerated Values --
SELECT * FROM Customers
WHERE Gender NOT IN ('M','F');

SELECT * FROM Customers
WHERE Segment NOT IN ('Retail','Premium','Corporate');

-- Numeric Range Validation --
SELECT * FROM Loans
WHERE Amount <=0;


SELECT * FROM CreditScores
	WHERE CreditScore<300
	OR CreditScore>900;
    
-- Check Date Range -- DOB cannot be future.
SELECT * FROM Customers
WHERE DOB>CURDATE();

SELECT * FROM Transactions
WHERE Date>CURDATE();

-- Blank Values --

SELECT * FROM Customers
WHERE Name='';

-- BUSINESS DOMAIN VALIDATION -- Retail customers should not have Savings Account

SELECT * FROM Customers 
JOIN Accounts
ON Customers.CustomerID=Accounts.CustomerID
	WHERE Segment='Retail'
	AND AccountType='Savings';
