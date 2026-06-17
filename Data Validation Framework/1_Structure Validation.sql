/* Structure Validation
├── 1. Database Validation
├── 2. Table Validation
├── 3. Column Validation
├── 4. Data Type Validation
├── 5. Record Count Validation
├── 6. Empty Table Validation
├── 7. Primary Key Existence
├── 8. Foreign Key Existence
├── 9. Index Validation
├── 10. Table Size Validation
└── 11. Basic Data Preview */

Use retailbanking;

-- 1 Database Validation --
#Show all databases
SHOW DATABASES;
#Verify active database
SELECT DATABASE();

-- 2 Table Validation -- 
#Show all tables
SHOW TABLES;
#Count number of tables
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema='retailbanking';

-- 3 Column Validation --
#View Customers structure
DESCRIBE accounts;
DESCRIBE branches;
DESCRIBE complaints;
DESCRIBE creditcards;
DESCRIBE creditscores;
DESCRIBE customers;
DESCRIBE fixeddeposits;
DESCRIBE fraudalerts;
DESCRIBE insurance;
DESCRIBE loans;
DESCRIBE transactions;

-- 4 Data Type Validation --
#Data Type Validation of table
SHOW CREATE TABLE Accounts;
SHOW CREATE TABLE Branches;
SHOW CREATE TABLE Complaints;
SHOW CREATE TABLE CreditCards;
SHOW CREATE TABLE CreditScores;
SHOW CREATE TABLE Customers;
SHOW CREATE TABLE FixedDeposits;
SHOW CREATE TABLE FraudAlerts;
SHOW CREATE TABLE Insurance;
SHOW CREATE TABLE Loans;
SHOW CREATE TABLE Transactions;

-- 5 Record Count Validation --
SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT COUNT(*) AS Total_Branches
FROM Branches;

select * from Complaints;

SELECT COUNT(*) AS Total_Complaints FROM Complaints
where Category= 'Loan' and status= 'open';

SELECT 'Customers',COUNT(*) FROM Customers
UNION
SELECT 'Branches',COUNT(*) FROM Branches
UNION
SELECT 'Accounts',COUNT(*) FROM Accounts
UNION
SELECT 'Transactions',COUNT(*) FROM Transactions
UNION
SELECT 'Loans',COUNT(*) FROM Loans
UNION
SELECT 'CreditCards',COUNT(*) FROM CreditCards
UNION
SELECT 'FixedDeposits',COUNT(*) FROM FixedDeposits
UNION
SELECT 'Insurance',COUNT(*) FROM Insurance
UNION
SELECT 'Complaints',COUNT(*) FROM Complaints
UNION
SELECT 'CreditScores',COUNT(*) FROM CreditScores
UNION
SELECT 'FraudAlerts',COUNT(*) FROM FraudAlerts;

-- 6 Empty Table Validation --
#Find tables with zero records
SELECT COUNT(*) FROM Customers;

-- 7 Primary Key Validation --
SHOW CREATE TABLE Customers;

-- 8 Foreign Key Validation--
SHOW CREATE TABLE Accounts;

-- 9 Index Validation --
SHOW INDEXES FROM Customers;
SHOW INDEXES FROM Accounts;
SHOW INDEXES FROM Transactions;
SHOW INDEXES FROM Loans;
SHOW INDEXES FROM CreditCards;
SHOW INDEXES FROM FixedDeposits;
SHOW INDEXES FROM Insurance;
SHOW INDEXES FROM Complaints;
SHOW INDEXES FROM CreditScores;
SHOW INDEXES FROM FraudAlerts;
SHOW INDEXES FROM Branches;

-- 10 Table Size Validation --

SHOW TABLE STATUS;

SELECT * FROM information_schema.tables
WHERE table_schema='retailbanking';

-- 11 Data Preview_Table --
SELECT * FROM Customers
LIMIT 10;