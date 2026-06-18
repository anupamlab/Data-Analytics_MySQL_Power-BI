/*=========================================================
        RETAIL BANKING - REFERENTIAL INTEGRITY VALIDATION
=========================================================*/

USE retailbanking;


/*=========================================================
1. IDENTIFY ALL PARENT-CHILD RELATIONSHIPS
=========================================================*/

SELECT
TABLE_NAME,
COLUMN_NAME,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='retailbanking'
AND REFERENCED_TABLE_NAME IS NOT NULL;


/*=========================================================
2. CHILD FOREIGN KEY VALIDATION
(Check for Orphan Records)
=========================================================*/

-- Accounts -> Customers

SELECT
Accounts.AccountID,
Accounts.CustomerID
FROM Accounts
LEFT JOIN Customers
ON Accounts.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- Accounts -> Branches

SELECT
Accounts.AccountID,
Accounts.BranchID
FROM Accounts
LEFT JOIN Branches
ON Accounts.BranchID=Branches.BranchID
WHERE Branches.BranchID IS NULL;


-- Transactions -> Accounts

SELECT
Transactions.TransactionID,
Transactions.AccountID
FROM Transactions
LEFT JOIN Accounts
ON Transactions.AccountID=Accounts.AccountID
WHERE Accounts.AccountID IS NULL;


-- Loans -> Customers

SELECT
Loans.LoanID,
Loans.CustomerID
FROM Loans
LEFT JOIN Customers
ON Loans.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- CreditCards -> Customers

SELECT
CreditCards.CardID,
CreditCards.CustomerID
FROM CreditCards
LEFT JOIN Customers
ON CreditCards.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- FixedDeposits -> Customers

SELECT
FixedDeposits.DepositID,
FixedDeposits.CustomerID
FROM FixedDeposits
LEFT JOIN Customers
ON FixedDeposits.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- Insurance -> Customers

SELECT
Insurance.InsuranceID,
Insurance.CustomerID
FROM Insurance
LEFT JOIN Customers
ON Insurance.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- Complaints -> Customers

SELECT
Complaints.ComplaintID,
Complaints.CustomerID
FROM Complaints
LEFT JOIN Customers
ON Complaints.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- CreditScores -> Customers

SELECT
CreditScores.ScoreID,
CreditScores.CustomerID
FROM CreditScores
LEFT JOIN Customers
ON CreditScores.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL;


-- FraudAlerts -> Transactions

SELECT
FraudAlerts.AlertID,
FraudAlerts.TransactionID
FROM FraudAlerts
LEFT JOIN Transactions
ON FraudAlerts.TransactionID=Transactions.TransactionID
WHERE Transactions.TransactionID IS NULL;


/*=========================================================
3. PARENT RECORDS WITHOUT CHILDREN
=========================================================*/

-- Customers without Accounts

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN Accounts
ON Customers.CustomerID=Accounts.CustomerID
WHERE Accounts.CustomerID IS NULL;


-- Branches without Accounts

SELECT
Branches.BranchID
FROM Branches
LEFT JOIN Accounts
ON Branches.BranchID=Accounts.BranchID
WHERE Accounts.BranchID IS NULL;


-- Customers without Loans

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN Loans
ON Customers.CustomerID=Loans.CustomerID
WHERE Loans.CustomerID IS NULL;


-- Customers without Credit Cards

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN CreditCards
ON Customers.CustomerID=CreditCards.CustomerID
WHERE CreditCards.CustomerID IS NULL;


-- Customers without Fixed Deposits

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN FixedDeposits
ON Customers.CustomerID=FixedDeposits.CustomerID
WHERE FixedDeposits.CustomerID IS NULL;


-- Customers without Insurance

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN Insurance
ON Customers.CustomerID=Insurance.CustomerID
WHERE Insurance.CustomerID IS NULL;


-- Customers without Complaints

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN Complaints
ON Customers.CustomerID=Complaints.CustomerID
WHERE Complaints.CustomerID IS NULL;


-- Customers without Credit Scores

SELECT
Customers.CustomerID
FROM Customers
LEFT JOIN CreditScores
ON Customers.CustomerID=CreditScores.CustomerID
WHERE CreditScores.CustomerID IS NULL;


/*=========================================================
4. REFERENTIAL INTEGRITY SUMMARY
=========================================================*/

SELECT
'Accounts -> Customers' AS Relationship,
COUNT(*) AS OrphanRecords
FROM Accounts
LEFT JOIN Customers
ON Accounts.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'Accounts -> Branches',
COUNT(*)
FROM Accounts
LEFT JOIN Branches
ON Accounts.BranchID=Branches.BranchID
WHERE Branches.BranchID IS NULL

UNION ALL

SELECT
'Transactions -> Accounts',
COUNT(*)
FROM Transactions
LEFT JOIN Accounts
ON Transactions.AccountID=Accounts.AccountID
WHERE Accounts.AccountID IS NULL

UNION ALL

SELECT
'Loans -> Customers',
COUNT(*)
FROM Loans
LEFT JOIN Customers
ON Loans.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'CreditCards -> Customers',
COUNT(*)
FROM CreditCards
LEFT JOIN Customers
ON CreditCards.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'FixedDeposits -> Customers',
COUNT(*)
FROM FixedDeposits
LEFT JOIN Customers
ON FixedDeposits.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'Insurance -> Customers',
COUNT(*)
FROM Insurance
LEFT JOIN Customers
ON Insurance.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'Complaints -> Customers',
COUNT(*)
FROM Complaints
LEFT JOIN Customers
ON Complaints.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'CreditScores -> Customers',
COUNT(*)
FROM CreditScores
LEFT JOIN Customers
ON CreditScores.CustomerID=Customers.CustomerID
WHERE Customers.CustomerID IS NULL

UNION ALL

SELECT
'FraudAlerts -> Transactions',
COUNT(*)
FROM FraudAlerts
LEFT JOIN Transactions
ON FraudAlerts.TransactionID=Transactions.TransactionID
WHERE Transactions.TransactionID IS NULL;