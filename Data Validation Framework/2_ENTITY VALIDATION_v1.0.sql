/*=========================================================
           RETAIL BANKING - ENTITY VALIDATION
=========================================================*/

USE retailbanking;


/*=========================================================
1. PRIMARY KEY UNIQUENESS VALIDATION
=========================================================*/

SELECT CustomerID, COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT BranchID, COUNT(*) AS Duplicate_Count
FROM Branches
GROUP BY BranchID
HAVING COUNT(*) > 1;

SELECT AccountID, COUNT(*) AS Duplicate_Count
FROM Accounts
GROUP BY AccountID
HAVING COUNT(*) > 1;

SELECT TransactionID, COUNT(*) AS Duplicate_Count
FROM Transactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;

SELECT LoanID, COUNT(*) AS Duplicate_Count
FROM Loans
GROUP BY LoanID
HAVING COUNT(*) > 1;

SELECT CardID, COUNT(*) AS Duplicate_Count
FROM CreditCards
GROUP BY CardID
HAVING COUNT(*) > 1;

SELECT DepositID, COUNT(*) AS Duplicate_Count
FROM FixedDeposits
GROUP BY DepositID
HAVING COUNT(*) > 1;

SELECT InsuranceID, COUNT(*) AS Duplicate_Count
FROM Insurance
GROUP BY InsuranceID
HAVING COUNT(*) > 1;

SELECT ComplaintID, COUNT(*) AS Duplicate_Count
FROM Complaints
GROUP BY ComplaintID
HAVING COUNT(*) > 1;

SELECT ScoreID, COUNT(*) AS Duplicate_Count
FROM CreditScores
GROUP BY ScoreID
HAVING COUNT(*) > 1;

SELECT AlertID, COUNT(*) AS Duplicate_Count
FROM FraudAlerts
GROUP BY AlertID
HAVING COUNT(*) > 1;


/*=========================================================
2. PRIMARY KEY NULL VALIDATION
=========================================================*/

SELECT * FROM Customers WHERE CustomerID IS NULL;
SELECT * FROM Branches WHERE BranchID IS NULL;
SELECT * FROM Accounts WHERE AccountID IS NULL;
SELECT * FROM Transactions WHERE TransactionID IS NULL;
SELECT * FROM Loans WHERE LoanID IS NULL;
SELECT * FROM CreditCards WHERE CardID IS NULL;
SELECT * FROM FixedDeposits WHERE DepositID IS NULL;
SELECT * FROM Insurance WHERE InsuranceID IS NULL;
SELECT * FROM Complaints WHERE ComplaintID IS NULL;
SELECT * FROM CreditScores WHERE ScoreID IS NULL;
SELECT * FROM FraudAlerts WHERE AlertID IS NULL;


/*=========================================================
3. MANDATORY FIELD NULL VALIDATION
=========================================================*/

SELECT *
FROM Customers
WHERE CustomerID IS NULL
OR Name IS NULL
OR Gender IS NULL
OR DOB IS NULL
OR City IS NULL
OR Occupation IS NULL
OR KYC IS NULL
OR Segment IS NULL;

SELECT *
FROM Accounts
WHERE AccountID IS NULL
OR CustomerID IS NULL
OR BranchID IS NULL
OR AccountType IS NULL
OR Balance IS NULL;

SELECT *
FROM Transactions
WHERE TransactionID IS NULL
OR AccountID IS NULL
OR TransactionDate IS NULL
OR Amount IS NULL;

SELECT *
FROM Loans
WHERE LoanID IS NULL
OR CustomerID IS NULL
OR LoanAmount IS NULL
OR LoanType IS NULL;

SELECT *
FROM CreditCards
WHERE CardID IS NULL
OR CustomerID IS NULL
OR CardType IS NULL;

SELECT *
FROM Branches
WHERE BranchID IS NULL
OR BranchName IS NULL
OR City IS NULL;


/*=========================================================
4. DUPLICATE BUSINESS ENTITY VALIDATION
=========================================================*/

SELECT Name,DOB,
COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY Name,DOB
HAVING COUNT(*)>1;

SELECT CustomerID,AccountType,
COUNT(*) AS Duplicate_Count
FROM Accounts
GROUP BY CustomerID,AccountType
HAVING COUNT(*)>1;

SELECT CustomerID,CardType,
COUNT(*) AS Duplicate_Count
FROM CreditCards
GROUP BY CustomerID,CardType
HAVING COUNT(*)>1;


/*=========================================================
5. ENTITY ATTRIBUTE COMPLETENESS
=========================================================*/

SELECT *
FROM Customers
WHERE Name=''
OR Gender=''
OR City=''
OR Occupation=''
OR KYC=''
OR Segment='';

SELECT *
FROM Accounts
WHERE AccountType='';

SELECT *
FROM Branches
WHERE BranchName=''
OR City='';

SELECT *
FROM CreditCards
WHERE CardType='';

SELECT *
FROM Loans
WHERE LoanType='';


/*=========================================================
6. BASIC ENTITY CONSISTENCY VALIDATION
=========================================================*/

-- Invalid Gender

SELECT *
FROM Customers
WHERE Gender NOT IN ('M','F');

-- Future Date of Birth

SELECT *
FROM Customers
WHERE DOB > CURDATE();

-- Negative Account Balance

SELECT *
FROM Accounts
WHERE Balance < 0;

-- Negative Loan Amount

SELECT *
FROM Loans
WHERE LoanAmount < 0;

-- Invalid Transaction Amount

SELECT *
FROM Transactions
WHERE Amount <= 0;

-- Invalid Credit Score

SELECT *
FROM CreditScores
WHERE CreditScore < 300
OR CreditScore > 900;

-- Future Transaction Date

SELECT *
FROM Transactions
WHERE TransactionDate > CURDATE();

-- Invalid Complaint Status

SELECT *
FROM Complaints
WHERE Status NOT IN
('Open','Closed','In Progress');


/*=========================================================
7. ENTITY RECORD COUNT
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
8. ENTITY DATA PREVIEW
=========================================================*/

SELECT * FROM Customers LIMIT 5;
SELECT * FROM Branches LIMIT 5;
SELECT * FROM Accounts LIMIT 5;
SELECT * FROM Transactions LIMIT 5;
SELECT * FROM Loans LIMIT 5;
SELECT * FROM CreditCards LIMIT 5;
SELECT * FROM FixedDeposits LIMIT 5;
SELECT * FROM Insurance LIMIT 5;
SELECT * FROM Complaints LIMIT 5;
SELECT * FROM CreditScores LIMIT 5;
SELECT * FROM FraudAlerts LIMIT 5;