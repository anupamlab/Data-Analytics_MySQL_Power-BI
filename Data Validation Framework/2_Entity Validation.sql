/* Entity Validation
├── 1. Primary Key Uniqueness - PK Duplicate Check: No Primary Key should appear more than once
├── 2. Primary Key NULL Check - PK NULL Check
├── 3. Mandatory Field NULL Check - Mandatory Attribute null Check, Primary Key is not enough.
├── 4. Duplicate Business Records check - Primary Key may be unique but business data can still be duplicated
├── 5. Entity Attribute Completeness - Check whether important descriptive fields are blank
└── 6. Basic Entity Consistency */

use retailbanking;

-- Primary Key Uniqueness --
SELECT CustomerID,
COUNT(*) FROM Customers
GROUP BY CustomerID
HAVING COUNT(*)>1;

SELECT AccountID,
COUNT(*)
FROM Accounts
GROUP BY AccountID
HAVING COUNT(*)>1;

-- Primary Key NULL Check --
SELECT * FROM Customers
WHERE CustomerID IS NULL;

SELECT * FROM branches
WHERE BranchID IS NULL;

-- Mandatory Field NULL Check --

SELECT * FROM customers
WHERE CustomerID IS NULL
   OR Name IS NULL
   OR Gender IS NULL
   OR DOB IS NULL
   OR City IS NULL
   OR Occupation IS NULL
   OR KYC IS NULL
   OR Segment IS NULL;

-- Duplicate Business Records--
SELECT Name, DOB,
COUNT(*) FROM Customers
GROUP BY Name,DOB
HAVING COUNT(*)>1;

-- Entity Attribute Completeness --
SELECT * FROM customers
WHERE CustomerID=''
   OR Name=''
   OR Gender=''
   OR City=''
   OR Occupation=''
   OR KYC=''
   OR Segment='';
   
-- Basic Entity Consistency --

SELECT *
FROM Customers
WHERE Gender IS NULL
   OR Gender NOT IN ('M','F');

SELECT *
FROM Customers
WHERE DOB > CURDATE();