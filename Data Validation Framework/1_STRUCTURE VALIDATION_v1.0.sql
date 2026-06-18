/*=========================================================
           RETAIL BANKING - STRUCTURE VALIDATION
=========================================================*/

USE retailbanking;



/*=========================================================
1. DATABASE VALIDATION
=========================================================*/

SHOW DATABASES;

SELECT DATABASE() AS Active_Database;



/*=========================================================
2. TABLE VALIDATION
=========================================================*/

SHOW TABLES;

SELECT
TABLE_NAME
FROM information_schema.tables
WHERE table_schema='retailbanking';

SELECT
COUNT(*) AS Total_Tables
FROM information_schema.tables
WHERE table_schema='retailbanking';



/*=========================================================
3. COLUMN VALIDATION
(View structure of all tables)
=========================================================*/

SELECT
TABLE_NAME,
COLUMN_NAME,
COLUMN_TYPE,
IS_NULLABLE,
COLUMN_KEY,
COLUMN_DEFAULT
FROM information_schema.columns
WHERE table_schema='retailbanking'
ORDER BY TABLE_NAME,ORDINAL_POSITION;



/*=========================================================
4. DATA TYPE VALIDATION
(Check exact table definition)
=========================================================*/

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



/*=========================================================
5. RECORD COUNT VALIDATION
(All tables in one query)
=========================================================*/

SELECT 'Customers',COUNT(*) FROM Customers
UNION ALL
SELECT 'Branches',COUNT(*) FROM Branches
UNION ALL
SELECT 'Accounts',COUNT(*) FROM Accounts
UNION ALL
SELECT 'Transactions',COUNT(*) FROM Transactions
UNION ALL
SELECT 'Loans',COUNT(*) FROM Loans
UNION ALL
SELECT 'CreditCards',COUNT(*) FROM CreditCards
UNION ALL
SELECT 'FixedDeposits',COUNT(*) FROM FixedDeposits
UNION ALL
SELECT 'Insurance',COUNT(*) FROM Insurance
UNION ALL
SELECT 'Complaints',COUNT(*) FROM Complaints
UNION ALL
SELECT 'CreditScores',COUNT(*) FROM CreditScores
UNION ALL
SELECT 'FraudAlerts',COUNT(*) FROM FraudAlerts;



/*=========================================================
6. EMPTY TABLE VALIDATION
=========================================================*/

SELECT
TABLE_NAME,
TABLE_ROWS
FROM information_schema.tables
WHERE table_schema='retailbanking'
AND TABLE_ROWS=0;



/*=========================================================
7. PRIMARY KEY VALIDATION
=========================================================*/

SELECT
TABLE_NAME,
COLUMN_NAME
FROM information_schema.key_column_usage
WHERE table_schema='retailbanking'
AND constraint_name='PRIMARY';



/*=========================================================
8. FOREIGN KEY VALIDATION
=========================================================*/

SELECT
TABLE_NAME,
COLUMN_NAME,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
FROM information_schema.key_column_usage
WHERE table_schema='retailbanking'
AND REFERENCED_TABLE_NAME IS NOT NULL;



/*=========================================================
9. INDEX VALIDATION
(All tables in one query)
=========================================================*/

SELECT
TABLE_NAME,
INDEX_NAME,
COLUMN_NAME,
NON_UNIQUE
FROM information_schema.statistics
WHERE table_schema='retailbanking'
ORDER BY TABLE_NAME,INDEX_NAME;



/*=========================================================
10. TABLE SIZE VALIDATION
=========================================================*/

SELECT
TABLE_NAME,
TABLE_ROWS,
ROUND((DATA_LENGTH+INDEX_LENGTH)/1024/1024,2) AS Size_MB
FROM information_schema.tables
WHERE table_schema='retailbanking'
ORDER BY TABLE_NAME;



/*=========================================================
11. DATA PREVIEW
(Preview every table)
=========================================================*/

SELECT * FROM Customers LIMIT 10;
SELECT * FROM Branches LIMIT 10;
SELECT * FROM Accounts LIMIT 10;
SELECT * FROM Transactions LIMIT 10;
SELECT * FROM Loans LIMIT 10;
SELECT * FROM CreditCards LIMIT 10;
SELECT * FROM FixedDeposits LIMIT 10;
SELECT * FROM Insurance LIMIT 10;
SELECT * FROM Complaints LIMIT 10;
SELECT * FROM CreditScores LIMIT 10;
SELECT * FROM FraudAlerts LIMIT 10;



/*=========================================================
12. OPTIONAL BUSINESS CHECKS
=========================================================*/

-- Open Loan Complaints

SELECT COUNT(*) AS Open_Loan_Complaints
FROM Complaints
WHERE Category='Loan'
AND Status='Open';