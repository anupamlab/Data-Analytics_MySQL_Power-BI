 /*Referential Integrity Validation
     ├── Identify Parent-Child Relationship
     ├── Validate Child FK Exists in Parent PK - Every Child belongs to a valid Parent
     ├── Check for Orphan Records
     ├── Check Parent Records without Children
     └── Document Relationship Status*/
     
-- Identify Parent and Child Tables From your EER diagram --

SELECT TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='RetailBanking'
AND REFERENCED_TABLE_NAME IS NOT NULL;

/* Validation Logic: Child "FK Exists in PK" Parent

SELECT ChildFKey FROM ChildTable
LEFT JOIN ParentTable
ON ChildFKey=ParentPKey
WHERE ParentPKey IS NULL;*/

SELECT Accounts.AccountID, Accounts.CustomerID FROM Accounts
LEFT JOIN Customers
ON Accounts.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID IS NULL;

SELECT Accounts.AccountID, Accounts.BranchID FROM Accounts
LEFT JOIN Branches
ON Accounts.BranchID=Branches.BranchID
WHERE Branches.BranchID IS NULL;

-- Check for Orphan Records  (SAME AS Validation Logic) --
SELECT Accounts.AccountID, Accounts.CustomerID FROM Accounts
LEFT JOIN Customers
ON Accounts.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID IS NULL;

-- Check Parent Records without Children --
SELECT Customers.CustomerID FROM Customers
LEFT JOIN Accounts
ON Customers.CustomerID=Accounts.CustomerID
WHERE Accounts.CustomerID IS NULL;
