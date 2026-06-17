show databases;
Create database Retailbanking;
use retailbanking;

-- Table Create 1 --
create table Customers
(
	CustomerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    City VARCHAR(50),
    Occupation VARCHAR(50),
    KYC CHAR(1),
    Segment VARCHAR(20)
);

show tables from Retailbanking;
select * from Retailbanking.Customers;
describe Retailbanking.Customers;

# table data import wizard
select * from Retailbanking.Customers;
SELECT COUNT(*) FROM Retailbanking.Customers;

-- Create Table 2 --
CREATE TABLE Branches 
(
    BranchID VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50)
);

select * from Retailbanking.Branches;

-- Create Table 3 --
CREATE TABLE Accounts 
(
    AccountID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10) not null,
    BranchID VARCHAR(10),
    AccountType VARCHAR(20),
    Balance DECIMAL(15,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),
    
    FOREIGN KEY (BranchID)
    REFERENCES Branches(BranchID)
);
select * from Retailbanking.Accounts;
describe Retailbanking.Accounts;

-- Create Table 4 --
CREATE TABLE Transactions 
(
    TxnID VARCHAR(15) PRIMARY KEY,
    AccountID VARCHAR(15),
    CustomerID VARCHAR(10),
    Amount DECIMAL(15,2),
    Type VARCHAR(20),
    Channel VARCHAR(20),
    Date DATE,

    FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 5 --
CREATE TABLE Loans 
(
    LoanID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10),
    LoanType VARCHAR(30),
    Amount DECIMAL(15,2),
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 6 --
CREATE TABLE CreditCards 
(
    CardID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10),
    CardType VARCHAR(20),
    CreditLimit DECIMAL(15,2),
    Outstanding DECIMAL(15,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 7 --
CREATE TABLE FixedDeposits 
(
    FDID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10),
    Amount DECIMAL(15,2),
    TenureMonths INT,

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 8 --
CREATE TABLE Insurance 
(
    PolicyID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10),
    PolicyType VARCHAR(30),
    Premium DECIMAL(15,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 9 --
CREATE TABLE Complaints 
(
    ComplaintID VARCHAR(15) PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(50),
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 10 --
CREATE TABLE CreditScores 
(
    CustomerID VARCHAR(10) PRIMARY KEY,
    CreditScore INT,
    Rating VARCHAR(20),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

-- Create Table 11 --
CREATE TABLE FraudAlerts 
(
    AlertID VARCHAR(15) PRIMARY KEY,
    TxnID VARCHAR(15),
    RiskScore INT,
    Status VARCHAR(20),

    FOREIGN KEY (TxnID)
    REFERENCES Transactions(TxnID)
);

select * from Accounts;
select * from Branches;
select * from Complaints;
select * from CreditCards;
select * from CreditScores;
select * from Customers;
select * from Insurance;
select * from FraudAlerts;
select * from FixedDeposits;
select * from Loans;
select * from Transactions;

SELECT COUNT(*) FROM Accounts;
SELECT COUNT(*) FROM Customers;
