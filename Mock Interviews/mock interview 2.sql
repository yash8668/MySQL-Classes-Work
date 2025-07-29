-- ----------------------------------- Database Queries --------------------------------------
-- Create SBI Bank database
CREATE DATABASE SBI_Bank;

-- Select the database for use
USE SBI_Bank;

-- ---------------------------------- Table Queries -----------------------------------------

-- Table-1 : Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AadharNumber VARCHAR(16),
    PANNumber VARCHAR(12),
    Address TEXT,
    BranchCode VARCHAR(10)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '1988-06-12', 'Male', 'rahul88@gmail.com', '9876543210', '123412341234', 'ABCDE1234F', 'Delhi, India', 'SBI001'),
(2, 'Anjali Mehta', '1992-03-25', 'Female', 'anjali25@gmail.com', '9856432109', '987698769876', 'GHYTR5678G', 'Mumbai, India', 'SBI002'),
(3, 'Amit Roy', '1985-01-10', 'Male', 'amitroy@gmail.com', '9871122334', '123456781234', 'DFGTR1234E', 'Kolkata, India', 'SBI003'),
(4, 'Pooja Nair', '1990-09-17', 'Female', 'pooja.n@gmail.com', '9934567890', '567812341234', 'POIUY6789H', 'Chennai, India', 'SBI004'),
(5, 'Vikram Sinha', '1982-12-04', 'Male', 'vikram.sinha@gmail.com', '9765432101', '345612341234', 'PLMNB2345J', 'Bangalore, India', 'SBI005'),
(6, 'Riya Sen', '1994-11-30', 'Female', 'riya.sen@gmail.com', '9823456781', '876543218765', 'LKJHG8765K', 'Hyderabad, India', 'SBI006'),
(7, 'Neeraj Das', '1987-07-23', 'Male', 'neeraj.das@gmail.com', '9812345672', '765412349876', 'MNBVC2345L', 'Ahmedabad, India', 'SBI007'),
(8, 'Seema Agarwal', '1993-04-15', 'Female', 'seema.a@gmail.com', '9743124567', '234512347654', 'QWERT1234P', 'Surat, India', 'SBI008'),
(9, 'Anil Kumar', '1989-08-12', 'Male', 'anil.k@gmail.com', '9687654321', '112233445566', 'ZXCVB3456M', 'Jaipur, India', 'SBI009'),
(10, 'Sneha Das', '1991-02-22', 'Female', 'sneha.d@gmail.com', '9765123890', '667788990011', 'ASDFG5678T', 'Bhopal, India', 'SBI010'),
(11, 'Aditya Mehra', '1990-03-11', 'Male', 'aditya.m@gmail.com', '9845000001', '123400000123', 'PQWER6789Z', 'Lucknow, India', 'SBI011'),
(12, 'Divya Thakur', '1995-06-19', 'Female', 'divya.t@gmail.com', '9789456123', '234500000123', 'LKJHG0001A', 'Kanpur, India', 'SBI012'),
(13, 'Manish Tiwari', '1984-05-15', 'Male', 'manish.t@gmail.com', '9876541290', '321654987000', 'ZMXNB7890D', 'Nagpur, India', 'SBI013'),
(14, 'Priya Kaur', '1987-07-21', 'Female', 'priya.k@gmail.com', '9712314567', '654321009876', 'REWQ1234AS', 'Amritsar, India', 'SBI014'),
(15, 'Kunal Ghosh', '1992-10-01', 'Male', 'kunal.g@gmail.com', '9834567890', '223344556677', 'IUYTRE4321Z', 'Guwahati, India', 'SBI015'),
(16, 'Rachna Pathak', '1989-12-12', 'Female', 'rachna.p@gmail.com', '9854123987', '334455667788', 'OIUYT5678B', 'Indore, India', 'SBI016'),
(17, 'Saurabh Jain', '1985-08-08', 'Male', 'saurabh.j@gmail.com', '9723456789', '445566778899', 'XCVBN2345U', 'Kota, India', 'SBI017'),
(18, 'Meera Joshi', '1991-09-09', 'Female', 'meera.j@gmail.com', '9745123467', '556677889900', 'TREWQ3456N', 'Raipur, India', 'SBI018'),
(19, 'Arun Verma', '1993-06-06', 'Male', 'arun.v@gmail.com', '9887654321', '667788990011', 'NBVCX9876P', 'Agra, India', 'SBI019'),
(20, 'Meena Kapoor', '1991-08-09', 'Female', 'meenak@gmail.com', '9945362819', '673498761234', 'FHTRE7865J', 'Pune, India', 'SBI020');

-- Display all customers
SELECT * FROM Customers;

-- Delete all customer records but keep the table structure
TRUNCATE TABLE Customers;

-- Completely remove the Customers table from the database
DROP TABLE Customers;


-- 1 Select specific columns: CustomerID and FullName
select CustomerID, FullName from  Customers;

-- 2 Select distinct branch codes
select distinct BranchCode from  Customers;

-- 3 Filter by city in Address (contains 'Mumbai')
select * from Customers where Address like  '%Mumbai%';

-- 4 Filter by gender = 'Female'
select * from  Customers where Gender = 'Female';

-- 5 count the  total id 
select count(Customerid ) as total_id   from customers  ; 
-- 6 Customers born after 1990-01-01
select  * from Customers where DOB > '1990-01-01';

-- 7 Customers age
select date(current_date()- DOB)as age   from Customers  ;

-- 8 Order customers by FullName ascending
select * from Customers order by FullName ASC;

-- 9 Order by DOB descending 
select * from Customers order by DOB DESC;

-- 10 Count total number of customers
select COUNT(*) as num_customers from Customers;

-- 11 Count customers by gender
select Gender, COUNT(*) as count_gender from Customers group by Gender;

 -- 12. Count customers per branch
select BranchCode, COUNT(*) as count_branch from Customers group by BranchCode;

-- 13. Show branches with more than 1 customer
select BranchCode, COUNT(*) as cnt from Customers group by BranchCode having COUNT(*) > 1;

-- 14. Add an alias for FullName as Name
select CustomerID, FullName as Name from Customers;

-- 15. Extract year of birth
select FullName, year(DOB) as BirthYear from Customers;

-- 16. Combine city and branch in one computed column
select FullName, CONCAT(Address, ' - ', BranchCode) as LocationInfo from Customers;

-- 17. Filter phone starting with '98'
select * from Customers where Phone like '98%';

-- 18. Filter email domain = gmail.com
select * from Customers where Email like '%@gmail.com';

-- 19. Filter AadharNumber of length 12
select * from Customers where LENGTH(AadharNumber)=12;

-- 20. Check PANNumber ending with a letter
select * from Customers where PANNumber like "%A ";

-- 21. Use BETWEEN on DOB between two dates
select * from Customers where DOB between '1985-01-01' and '1990-12-31';

-- 22 Use OR condition: male or branch SBI005
select * from Customers where Gender='Male' or BranchCode='SBI005';

-- 23 Use AND condition: female and city Surat
select * from Customers where Gender='Female' and Address like '%Surat%';

-- 24 Limit output to first 5 rows 
select * from Customers limit 5;

-- 25 Select second page rows with LIMIT and OFFSET
select * from Customers limit 5 offset 5;

-- 25  Add the column  AnnualIncome 
alter table Customers
add AnnualIncome  int  default null ; 

-- 26 Set everyone’s income to 500,000
update Customers
set AnnualIncome = 500000;

-- 27 Give a 10% bonus
update Customers
set AnnualIncome = AnnualIncome * 1.10;

-- 28 Deduct a 50,000 fee
update Customers
SET AnnualIncome = AnnualIncome - 50000;

-- 29 Calculate monthly income
update Customers
set MonthlyIncome = AnnualIncome / 12;

-- 30  the remainder of income divided by 10,000
update Customers
set  LoyaltyPoints = AnnualIncome % 10000 ;

-- 31 Add extra income only for females (+20,000)
update Customers
set AnnualIncome = AnnualIncome + 20000
where Gender = 'Female';

-- 32  max DOB 
select MAX(DOB) as youngest_dob from Customers;

-- 33  min DOB 
select MIN(DOB) as oldest_dob from Customers;

-- 34. update the address but not show the india 
update Customers set Address = CONCAT(Address, ', India') where Address not like '%India%';

-- 35  remove a  customer by ID = 20
delete from Customers where CustomerID = 20;

-- 36 show the data  fullname in  uppercase 
select  upper(Fullname) from Customers ;
 
-- 37  convert the lower case full name 
select lower(fullname ) from Customers ;
 
-- 38 rename the full_name  
alter table Customers 
rename column Fullname to Full_name ;   

-- 39 modify the  column  Full_name 
alter table  Customers 
modify column Full_name varchar (10000); 

-- 40  add column  income 
alter table  Customers 
add column income int ; 

-- 41  delete the column income 
alter table Customers 
Drop  column  income  ;

--  42 show the data 2 two from table 
select * from  Customers where full_name = "Rahul Sharma" or Customerid =  4 ;

-- 43  show the data aadhar number 
select* from  customers where AadharNumber > 123412341234 ; 

-- 44 covert the uppar case for gender
select upper( Gender)as  uppercase_gender   from  Customers ;
 
--  45 count  the lenght  gender  
select length(gender) as lowercase_gender from  Customers ; 
 
 -- 46 set the limit  6 
 select * from  Customers  limit 6 ; 
 -- 47 select coustomer  whose  dob is after a certain  date 
 select*from  Customers  where DOB >  1988-06-12 ; 
 -- 48 select  customers and id < 10 
 select *from Customers where Customerid > 10  ;
 -- 49  select customer and gender show only male 
 select *from  Customers where Gender != "Female" ; 
 -- 50  select  customer and  use not cluse  in id < 9 
 select * from  Customers where id not like 9   ; 
  select*from  Customers;
-- Table-2: Accounts

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(12,2),
    IFSCCode VARCHAR(11),
    BranchCode VARCHAR(10),
    Status VARCHAR(10),
    NomineeName VARCHAR(100),
    Currency VARCHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2020-01-15', 55000.75, 'SBIN000001', 'SBI001', 'Active', 'Reena Sharma', 'INR'),
(102, 2, 'Current', '2019-05-22', 125000.00, 'SBIN000002', 'SBI002', 'Active', 'Vijay Mehta', 'INR'),
(103, 3, 'Savings', '2021-11-10', 67000.00, 'SBIN000003', 'SBI003', 'Active', 'Asha Roy', 'INR'),
(104, 4, 'Savings', '2018-07-09', 89000.00, 'SBIN000004', 'SBI004', 'Active', 'Pritam Nair', 'INR'),
(105, 5, 'Current', '2022-01-01', 32000.00, 'SBIN000005', 'SBI005', 'Active', 'Kiran Sinha', 'INR'),
(106, 6, 'Savings', '2020-06-15', 47000.90, 'SBIN000006', 'SBI006', 'Active', 'Aman Sen', 'INR'),
(107, 7, 'Savings', '2021-02-25', 51000.50, 'SBIN000007', 'SBI007', 'Active', 'Sonal Das', 'INR'),
(108, 8, 'Current', '2017-09-10', 95000.00, 'SBIN000008', 'SBI008', 'Active', 'Vivek Agarwal', 'INR'),
(109, 9, 'Savings', '2023-04-20', 22000.00, 'SBIN000009', 'SBI009', 'Active', 'Rina Kumar', 'INR'),
(110, 10, 'Savings', '2019-12-12', 34000.00, 'SBIN000010', 'SBI010', 'Active', 'Neeraj Das', 'INR'),
(111, 11, 'Savings', '2021-08-12', 78000.45, 'SBIN000011', 'SBI011', 'Active', 'Priya Mehra', 'INR'),
(112, 12, 'Current', '2022-03-19', 125000.00, 'SBIN000012', 'SBI012', 'Active', 'Ajay Thakur', 'INR'),
(113, 13, 'Savings', '2023-01-23', 33000.00, 'SBIN000013', 'SBI013', 'Active', 'Anita Tiwari', 'INR'),
(114, 14, 'Savings', '2020-10-14', 59000.00, 'SBIN000014', 'SBI014', 'Active', 'Karan Kaur', 'INR'),
(115, 15, 'Current', '2021-04-18', 40500.00, 'SBIN000015', 'SBI015', 'Active', 'Deepak Ghosh', 'INR'),
(116, 16, 'Savings', '2019-11-11', 22000.00, 'SBIN000016', 'SBI016', 'Active', 'Nidhi Pathak', 'INR'),
(117, 17, 'Savings', '2020-05-30', 47000.50, 'SBIN000017', 'SBI017', 'Active', 'Tarun Jain', 'INR'),
(118, 18, 'Current', '2022-06-22', 110000.00, 'SBIN000018', 'SBI018', 'Active', 'Ankit Joshi', 'INR'),
(119, 19, 'Savings', '2023-03-03', 56000.00, 'SBIN000019', 'SBI019', 'Active', 'Radhika Verma', 'INR'),
(120, 20, 'Savings', '2023-07-07', 43250.50, 'SBIN000020', 'SBI020', 'Active', 'Amit Kapoor', 'INR');

-- Show all accounts
SELECT * FROM Accounts;

-- Delete all account records but keep the structure
TRUNCATE TABLE Accounts;

-- Completely remove the Accounts table
DROP TABLE Accounts;

-- 1 Select specific columns: CustomerID and Currency
select CustomerID, Currency from  Accounts;

-- 2 Select distinct branch codes
select distinct BranchCode from  Accounts ;

-- 3 Filter by status in  active 
select * from Accounts where Status  like  '%Active%';

-- 4 Filter by AccountType = 'savings'
select * from  Accounts where AccountType = 'Savings';

-- 5 count the  total id 
select count(Accountid ) as total_id   from Accounts  ; 

-- 6 Accounts born after SBIN000003
select  * from Accounts where IFSCCode > 'SBIN000003';

-- 7  Add the column  
alter table Accounts 
add column name_employee  varchar (100);

-- 8 Order Accounts by Balance
select * from Accounts order by Balance ASC;

-- 9 Order by Balance descending 
select * from Accounts order by Balance DESC;


-- 10 Count total number of Accounts 
select COUNT(*) as num_Accounts from Accounts ;

-- 11 Count Accounts by Accountype 
select Accountype, COUNT(*) as count_Accountype from Accounts group by Accountype;

 -- 12. Count Accounts per branch
select BranchCode, COUNT(*) as count_branch from Accounts group by BranchCode;

-- 13. Show branches with more than 1 Accounts 
select BranchCode, COUNT(*) as cnt from Accounts group by BranchCode having COUNT(*) > 1;

-- 14. Add an alias for AccountType as type
select CustomerID, AccountType as type from Accounts;

-- 15. update the status  for id 1 
 update Accounts
 set  status =" inactive"
 where AccountId =  101 ;
 
-- 16. Combine Status and Currency in one computed column
select AccountID, CONCAT(Status, ' - ', Currency) as LocationInfo from Customers;

-- 17. Filter Balance starting with '00.75'
select * from Accounts where Balance like '00.75%';

-- 18. Filter email domain = gmail.com
select * from Accounts where AccountType like '%@ent';

-- 19. Filter AadharNumber of length 12
select * from Accounts where LENGTH(IFSCCode)=12;

-- 20. Check Balance ending with a letter
select * from Accounts where Balance like "%1 ";

-- 21. Use BETWEEN on AccountId between two id
select * from Accounts  where AccountId between 105 and 110;

-- 22  
select * from Accounts  where AccountId ='104' or BranchCode='SBI005';

-- 23 AccountType and AccountId 
select * from Accouunts  where AccountId='110' and AccountType like '%Savings%';

-- 24 Limit output to first 5 rows 
select * from Accounts  limit 5;

-- 25 Select second page rows with LIMIT and OFFSET
select * from Accounts  limit 5 offset 5;

-- 25  Add the column  AnnualIncome 
alter table Accounts
add AnnualIncome  int  default null ; 

-- 26 Set everyone’s income to 500,000
update Accounts
set AnnualIncome = 500000;

-- 27 Give a 10% bonus
update Accounts
set AnnualIncome = AnnualIncome * 1.10;

-- 28 Deduct a 50,000 fee
update Accounts
Set AnnualIncome = AnnualIncome - 50000;

-- 29 Calculate monthly income
update Accounts
set MonthlyIncome = AnnualIncome / 12;

-- 30  the remainder of income divided by 10,000
update Accounts
set  LoyaltyPoints = AnnualIncome % 10000 ;

-- 31 Add extra income only for id =  108
update Accounts
set AnnualIncome = AnnualIncome + 20000
where Accountid = '108';

-- 32  max  Balance
select MAX(Balance) as Max_balance from Accounts;

-- 33  min Balance
select MIN(Balance) as Min_balance from Accounts;

-- 34. avg balnce 
select avg(Balance) as Avg_Balance from Accounts ;


-- 35  remove a  Accounts by ID = 20
delete from Accounts where CustomerID = 20;

-- 36 show the data  AccountType in  uppercase 
select  upper(AccountType) from Accounts ;
 
-- 37  convert the lower case AccountType
select lower(AccountType ) from Accounts ;
 
-- 38 rename the AccountType 
alter table Accounts 
rename column AccountType to Account_Type ;   

-- 39 modify the  column  Account_Type
alter table  Accounts 
modify column Account_Type varchar (10000); 

-- 40  add column  income 
alter table  Accounts
add column income int ; 

-- 41  delete the column income 
alter table Accounts 
Drop  column  income  ;

--  42 show the data 2 two from table 
select * from  Accounts  where CustomerID = 5 or AccountID =  4 ;

-- 43  show the data OpenDate > 2022-06-22
select* from  Accounts  where OpenDate > 2022-06-22 ; 

-- 44 covert the uppar case for Status
select upper( Status)as  uppercase_Status from  Accounts  ;
 
--  45 count  the lenght  Status  
select length(Status) as lowercase_Status from  Accounts ; 
 
 -- 46 set the limit  6 
 select * from  Accounts  limit 6 ; 
 
 -- 47 select Accounts  after a certain  id
 select*from  Accounts  where id  > 11; 
 -- 48 select  Accounts and  show the customerid < 10 
 select *from Accounts where Customerid > 10  ;
 
 -- 49  select Accounts and currency
 select *from  Customers where currency != "INR" ; 
 
 -- 50  select  Accounts and  use not cluse  in id < 9 
 select * from  Accounts where Accountid not like 9   ; 

--  Table-3: Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Type VARCHAR(10),
    Amount DECIMAL(10,2),
    Description TEXT,
    Mode VARCHAR(20),
    Status VARCHAR(10),
    BalanceAfter DECIMAL(12,2),
    BranchCode VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1001, 101, '2024-06-10', 'Credit', 5000.00, 'Salary credited', 'NEFT', 'Success', 60000.75, 'SBI001'),
(1002, 101, '2024-06-15', 'Debit', 2000.00, 'Mobile recharge', 'UPI', 'Success', 58000.75, 'SBI001'),
(1003, 102, '2024-05-22', 'Debit', 1500.00, 'Electricity bill', 'Net Banking', 'Success', 123500.00, 'SBI002'),
(1004, 103, '2024-07-01', 'Credit', 20000.00, 'Cheque deposit', 'Cheque', 'Success', 87000.00, 'SBI003'),
(1005, 104, '2024-07-02', 'Debit', 500.00, 'ATM Withdrawal', 'ATM', 'Success', 88500.00, 'SBI004'),
(1006, 105, '2024-06-20', 'Credit', 10000.00, 'UPI received', 'UPI', 'Success', 42000.00, 'SBI005'),
(1007, 106, '2024-05-10', 'Debit', 1500.00, 'Online shopping', 'UPI', 'Success', 45500.90, 'SBI006'),
(1008, 107, '2024-07-15', 'Debit', 2500.00, 'Fuel payment', 'Card', 'Success', 48500.50, 'SBI007'),
(1009, 108, '2024-06-30', 'Credit', 7000.00, 'Client payment', 'IMPS', 'Success', 102000.00, 'SBI008'),
(1010, 109, '2024-05-18', 'Debit', 1000.00, 'Recharge', 'UPI', 'Success', 21000.00, 'SBI009'),
(1011, 110, '2024-07-05', 'Credit', 5000.00, 'Salary', 'NEFT', 'Success', 39000.00, 'SBI010'),
(1012, 111, '2024-06-12', 'Debit', 2000.00, 'Shopping', 'UPI', 'Success', 76000.45, 'SBI011'),
(1013, 112, '2024-05-25', 'Credit', 15000.00, 'Cheque', 'Cheque', 'Success', 140000.00, 'SBI012'),
(1014, 113, '2024-06-07', 'Debit', 2000.00, 'Rent', 'NEFT', 'Success', 31000.00, 'SBI013'),
(1015, 114, '2024-05-29', 'Debit', 1000.00, 'Petrol', 'UPI', 'Success', 58000.00, 'SBI014'),
(1016, 115, '2024-07-18', 'Credit', 10000.00, 'Client Payment', 'IMPS', 'Success', 50500.00, 'SBI015'),
(1017, 116, '2024-06-25', 'Debit', 500.00, 'Bill Payment', 'Net Banking', 'Success', 21500.00, 'SBI016'),
(1018, 117, '2024-07-03', 'Credit', 12000.00, 'Cash Deposit', 'Cash', 'Success', 59000.50, 'SBI017'),
(1019, 118, '2024-06-17', 'Debit', 1000.00, 'Restaurant', 'Card', 'Success', 109000.00, 'SBI018'),
(1020, 119, '2024-07-21', 'Credit', 8000.00, 'Transfer from friend', 'UPI', 'Success', 64000.00, 'SBI019');

-- Show all transactions
SELECT * FROM Transactions;

-- Remove all transaction records 
TRUNCATE TABLE Transactions;
 
-- Delete the Transactions table permanently
DROP TABLE Transactions;

-- 1. select all transactions  and show the transactionId
select * from transactions where TransactionID =  1001; 

-- 2. select transactionid and amount
select transactionid, amount from transactions;

-- 3. select credit transactions only
select * from transactions where type = 'credit';

-- 4. select debit transactions only
select * from transactions where type = 'debit';

-- 5. select transactions above 5000
select * from transactions where amount > 5000;

-- 6. select transactions in june 2024
select * from transactions where transactiondate between '2024‑06‑01' and '2024‑06‑30';

-- 7. select last five transactions by date
select * from transactions order by transactiondate desc limit 5;

-- 8. count total transactions
select count(*) as total_count from transactions;

-- 9. total amount of credits
select sum(amount) as total_credit from transactions where type = 'credit';

-- 10. total amount of debits
select sum(amount) as total_debit from transactions where type = 'debit';

-- 11. average transaction amount
select avg(amount) as avg_amount from transactions;

-- 12. maximum transaction amount
select max(amount) as max_amount from transactions;

-- 13. minimum transaction amount
select min(amount) as min_amount from transactions;

-- 14. number of transactions per account
select accountid, count(*) as txn_count from transactions group by accountid;

-- 15. total amount per account
select accountid, sum(amount) as total_amt from transactions group by accountid;

-- 16. highest balanceafter value
select accountid, balanceafter from transactions order by balanceafter desc limit 1;

-- 17. find an account’s transactions (accountid = 101)
select * from transactions where accountid = 101;

-- 18. transactions via upi
select * from transactions where mode = 'upi';

-- 19. transactions via neft
select * from transactions where mode = 'neft';

-- 20. transactions via cheque
select * from transactions where mode = 'cheque';

-- 21. success status transactions only
select * from transactions where status = 'success';

-- 22. total of successful debits
select sum(amount) from transactions where type = 'debit' and status = 'success';

-- 23. total of successful credits
select sum(amount) from transactions where type = 'credit' and status = 'success';

-- 24. transactions at branch 'sbi001'
select * from transactions where branchcode = 'sbi001';

-- 25. transactions per branch
select branchcode, count(*) as cnt from transactions group by branchcode;

-- 26. distinct modes used
select distinct mode from transactions;

-- 27. distinct types used
select distinct type from transactions;

-- 28. transactions in july 2024
select * from transactions where transactiondate between '2024‑07‑01' and '2024‑07‑31';

-- 29. total amount per type
select type, sum(amount) as total_amount from transactions group by type;

-- 30. average debit amount
select avg(amount) as avg_debit from transactions where type = 'debit';

-- 31. average credit amount
select avg(amount) as avg_credit from transactions where type = 'credit';

-- 32. account with highest total credit
select accountid, sum(amount) as total_credit from transactions ;

-- 33. account with highest total debit
select accountid, sum(amount) as total_debit from transactions ;

-- 34. transactions sorted by amount desc
select * from transactions order by amount desc;

-- 35. transactions sorted by amount asc
select * from transactions order by amount asc;

-- 36. transactions and running total per account (using window)
select accountid, transactiondate, amount, sum(amount) over (partition by accountid order by transactiondate) as running_total from transactions;

-- 37. count transactions by mode
select mode, count(*) as cnt from transactions group by mode;

-- 38. sum amount by mode
select mode, sum(amount) as total_amt from transactions group by mode;

-- 39. transactions with description containing 'salary'
select * from transactions where description like '%salary%';

-- 40. transactions with description containing 'bill'
select * from transactions where description like '%bill%';

-- 41. transactions before june 2024
select * from transactions where transactiondate < '2024‑06‑01';

-- 42. transactions after july 1 2024
select * from transactions where transactiondate > '2024‑07‑01';

-- 43. debit count 
select accountid, count(*) as debit_count from transactions ;

-- 44. select  upper case to  Desciptions
select upper(Description) from transactions; 

-- 45. transactions on 2024‑06‑10
select * from transactions where transactiondate = '2024‑06‑10';

-- 46. show balanceafter along with amount and date
select transactiondate, amount, balanceafter from transactions;

-- 47. transactions with amount between 1000 and 5000
select * from transactions where amount between 1000 and 5000;

-- 48. lower case use in status
select lower(Status) from  transactions;  

-- 49. find failed transactions 
select * from transactions where status <> 'success';

-- 50.set the limit 
select *from transactions limit 5 ; 



-- Table-4: Loans

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(20),
    Amount DECIMAL(12,2),
    StartDate DATE,
    TenureMonths INT,
    InterestRate FLOAT,
    EMI DECIMAL(10,2),
    Status VARCHAR(10),
    BranchCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201, 1, 'Home', 2500000.00, '2023-01-01', 240, 7.5, 22345.67, 'Active', 'SBI001'),
(202, 2, 'Car', 800000.00, '2023-05-10', 60, 9.2, 16543.00, 'Active', 'SBI002'),
(203, 3, 'Personal', 200000.00, '2024-01-15', 36, 11.5, 6720.45, 'Active', 'SBI003'),
(204, 4, 'Education', 400000.00, '2022-06-01', 48, 10.0, 10450.30, 'Active', 'SBI004'),
(205, 5, 'Home', 1500000.00, '2023-04-20', 180, 8.0, 15400.00, 'Active', 'SBI005'),
(206, 6, 'Car', 950000.00, '2022-03-01', 60, 9.5, 17250.20, 'Active', 'SBI006'),
(207, 7, 'Business', 1200000.00, '2023-07-10', 84, 8.9, 19300.00, 'Active', 'SBI007'),
(208, 8, 'Education', 350000.00, '2021-08-15', 48, 10.2, 9450.00, 'Active', 'SBI008'),
(209, 9, 'Home', 1800000.00, '2023-09-01', 240, 7.0, 19800.50, 'Active', 'SBI009'),
(210, 10, 'Car', 600000.00, '2022-02-20', 60, 9.1, 13450.00, 'Active', 'SBI010'),
(211, 11, 'Personal', 250000.00, '2023-11-10', 36, 11.2, 7300.00, 'Active', 'SBI011'),
(212, 12, 'Home', 3000000.00, '2022-12-12', 240, 6.9, 24500.00, 'Active', 'SBI012'),
(213, 13, 'Education', 420000.00, '2023-05-01', 60, 10.4, 9900.00, 'Active', 'SBI013'),
(214, 14, 'Car', 700000.00, '2021-10-10', 48, 9.3, 15000.00, 'Active', 'SBI014'),
(215, 15, 'Home', 2200000.00, '2022-01-05', 240, 7.2, 21400.00, 'Active', 'SBI015'),
(216, 16, 'Business', 1000000.00, '2022-06-25', 120, 8.8, 19500.00, 'Active', 'SBI016'),
(217, 17, 'Personal', 300000.00, '2023-04-14', 36, 11.0, 8800.00, 'Active', 'SBI017'),
(218, 18, 'Education', 250000.00, '2022-07-07', 48, 10.5, 7800.00, 'Active', 'SBI018'),
(219, 19, 'Car', 850000.00, '2023-03-03', 60, 9.0, 15800.00, 'Active', 'SBI019'),
(220, 20, 'Personal', 200000.00, '2024-03-20', 36, 11.5, 6720.45, 'Active', 'SBI020');

-- List all home loans above ₹20 lakhs
SELECT * FROM Loans;

-- Clear all loan records
TRUNCATE TABLE Loans;

-- Delete the Loans table from database
DROP TABLE Loans;

-- 1. select all Loans  and show the LoanID
select * from Loans where LoanID =  201; 

-- 2. select LoanID and amount
select LoanID, amount from Loans;

-- 3. select Loans only Home
select * from Loans where Loantype = 'Home';

-- 4. select  Loans only  EMI
select * from Loans where EMI = '16543.00';

-- 5. select Loans above 50000
select * from Loans where amount > 50000;

-- 6. select Loans in startdate
select * from Loans where startdate between '2022-06-25' and '2024-06-25';

-- 7. select last five Loans by date
select * from Loans order by startdate desc limit 5;

-- 8. count total Loans
select count(*) as total_count from Loans;

-- 9. total amount of car
select sum(amount) as total_credit from Loans where loantype = 'Car';

-- 10. total amount of home
select sum(amount) as total_debit from Loans where loantype = 'Home';

-- 11.  max of amount
select max(amount) as max_amounts  from Loans ;

-- 12.  min of amount 
select min(amount) as min_amounts from Loans ; 

-- 13.  Avg of Amount
select avg(Amount) as Avg_Amounts from Loans ;  

--  14 multiple the Amount  2
select amount ,  amount*2 as multiple_amount  from  loans  ; 

--  15 divide the amount 200
select amount , amount- 200  as div_amounts from Loans ; 

--  Table-5: Branches

CREATE TABLE Branches (
    BranchCode VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    IFSCCode VARCHAR(11),
    MICRCode VARCHAR(10),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Contact VARCHAR(15),
    ManagerName VARCHAR(100),
    WorkingHours VARCHAR(50)
);

INSERT INTO Branches VALUES
('SBI001', 'SBI Delhi Main Branch', 'SBIN000001', '110002001', 'Connaught Place, Delhi', 'Delhi', 'Delhi', '01123456789', 'Rajeev Khanna', '9 AM - 4 PM'),
('SBI002', 'SBI Mumbai West Branch', 'SBIN000002', '400002002', 'Bandra, Mumbai', 'Mumbai', 'Maharashtra', '02245678901', 'Sonal Rane', '9 AM - 4 PM'),
('SBI003', 'SBI Kolkata Branch', 'SBIN000003', '700002003', 'Salt Lake, Kolkata', 'Kolkata', 'West Bengal', '03312345678', 'Rakesh Roy', '9 AM - 4 PM'),
('SBI004', 'SBI Chennai Branch', 'SBIN000004', '600002004', 'T Nagar, Chennai', 'Chennai', 'Tamil Nadu', '04423456789', 'Meena Nair', '9 AM - 4 PM'),
('SBI005', 'SBI Bangalore Branch', 'SBIN000005', '560002005', 'MG Road, Bangalore', 'Bangalore', 'Karnataka', '08034567891', 'Anil Sinha', '9 AM - 4 PM'),
('SBI006', 'SBI Hyderabad Branch', 'SBIN000006', '500002006', 'Banjara Hills, Hyderabad', 'Hyderabad', 'Telangana', '04067891234', 'Preeti Rao', '9 AM - 4 PM'),
('SBI007', 'SBI Ahmedabad Branch', 'SBIN000007', '380002007', 'Navrangpura, Ahmedabad', 'Ahmedabad', 'Gujarat', '07945678912', 'Karan Patel', '9 AM - 4 PM'),
('SBI008', 'SBI Surat Branch', 'SBIN000008', '395002008', 'Ring Road, Surat', 'Surat', 'Gujarat', '02612345678', 'Anjali Desai', '9 AM - 4 PM'),
('SBI009', 'SBI Jaipur Branch', 'SBIN000009', '302002009', 'MI Road, Jaipur', 'Jaipur', 'Rajasthan', '01414567890', 'Ravi Sharma', '9 AM - 4 PM'),
('SBI010', 'SBI Bhopal Branch', 'SBIN000010', '462002010', 'New Market, Bhopal', 'Bhopal', 'Madhya Pradesh', '07552678901', 'Neha Joshi', '9 AM - 4 PM'),
('SBI011', 'SBI Lucknow Branch', 'SBIN000011', '226002011', 'Hazratganj, Lucknow', 'Lucknow', 'Uttar Pradesh', '05221234567', 'Saurabh Pandey', '9 AM - 4 PM'),
('SBI012', 'SBI Kanpur Branch', 'SBIN000012', '208002012', 'Mall Road, Kanpur', 'Kanpur', 'Uttar Pradesh', '05122345678', 'Anita Yadav', '9 AM - 4 PM'),
('SBI013', 'SBI Nagpur Branch', 'SBIN000013', '440002013', 'Sitabuldi, Nagpur', 'Nagpur', 'Maharashtra', '07122456789', 'Manoj Deshmukh', '9 AM - 4 PM'),
('SBI014', 'SBI Amritsar Branch', 'SBIN000014', '143002014', 'GT Road, Amritsar', 'Amritsar', 'Punjab', '01832456789', 'Gurpreet Singh', '9 AM - 4 PM'),
('SBI015', 'SBI Guwahati Branch', 'SBIN000015', '781002015', 'Zoo Road, Guwahati', 'Guwahati', 'Assam', '03612456789', 'Bipin Choudhary', '9 AM - 4 PM'),
('SBI016', 'SBI Indore Branch', 'SBIN000016', '452002016', 'Rajwada, Indore', 'Indore', 'Madhya Pradesh', '07312456789', 'Isha Tripathi', '9 AM - 4 PM'),
('SBI017', 'SBI Kota Branch', 'SBIN000017', '324002017', 'Chambal Road, Kota', 'Kota', 'Rajasthan', '07442456789', 'Deepak Verma', '9 AM - 4 PM'),
('SBI018', 'SBI Raipur Branch', 'SBIN000018', '492002018', 'Pandri, Raipur', 'Raipur', 'Chhattisgarh', '07712456789', 'Shweta Chauhan', '9 AM - 4 PM'),
('SBI019', 'SBI Agra Branch', 'SBIN000019', '282002019', 'Sadar Bazar, Agra', 'Agra', 'Uttar Pradesh', '05622456789', 'Abhay Dixit', '9 AM - 4 PM'),
('SBI020', 'SBI Pune Branch', 'SBIN000020', '411002020', 'Kalyani Nagar, Pune', 'Pune', 'Maharashtra', '02024567890', 'Ajay Pawar', '9 AM - 4 PM');

-- View all branches located in Maharashtra
SELECT * FROM Branches;

-- Remove all records from Branches
TRUNCATE TABLE Branches;

-- Drop the entire Branches table
DROP TABLE Branches;
