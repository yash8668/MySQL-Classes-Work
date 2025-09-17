create database Electricity_Department ; 

use Electricity_Department ;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Contact VARCHAR(15) UNIQUE,
    ConnectionDate DATE,
    Status VARCHAR(10) DEFAULT 'Active'
);


INSERT INTO Customer (CustomerID, Name, Address, City, Contact, ConnectionDate)
VALUES
    (1, 'John Doe', '123 Elm St, Downtown', 'Mumbai', '9876543210', '2022-01-15'),
    (2, 'Jane Smith', '456 Oak Rd, Suburbia', 'Delhi', '9876543211', '2023-03-22'),
    (3, 'Alice Johnson', '789 Pine Ave, Uptown', 'Bangalore', '9876543212', '2021-07-30'),
    (4, 'Bob Brown', '101 Maple Dr, Lakeside', 'Chennai', '9876543213', '2020-11-05'),
    (5, 'Charlie Davis', '202 Birch Blvd, Hilltop', 'Hyderabad', '9876543214', '2024-05-12');

CREATE TABLE Meter (
    MeterID INT PRIMARY KEY,
    CustomerID INT,
    MeterType VARCHAR(50),
    InstallationDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO Meter (MeterID, CustomerID, MeterType, InstallationDate, Status)
VALUES
    (101, 1, 'Domestic', '2022-01-20', 'Active'),
    (102, 2, 'Commercial', '2023-03-25', 'Active'),
    (103, 3, 'Domestic', '2021-08-05', 'Inactive'),
    (104, 4, 'Industrial', '2020-11-10', 'Active'),
    (105, 5, 'Domestic', '2024-05-15', 'Active');

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    CustomerID INT,
    MeterID INT,
    BillMonth DATE,
    UnitsConsumed INT,
    Amount DECIMAL(10,2),
    DueDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (MeterID) REFERENCES Meter(MeterID)
);


INSERT INTO Bill (BillID, CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status)
VALUES
    (201, 1, 101, '2022-01-31', 150, 750.00, '2022-02-15', 'Paid'),
    (202, 2, 102, '2023-03-31', 300, 1500.00, '2023-04-15', 'Unpaid'),
    (203, 3, 103, '2021-08-31', 100, 500.00, '2021-09-15', 'Paid'),
    (204, 4, 104, '2020-11-30', 500, 2500.00, '2020-12-15', 'Unpaid'),
    (205, 5, 105, '2024-05-31', 200, 1000.00, '2024-06-15', 'Paid');

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BillID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),
    Mode VARCHAR(50),
    Status VARCHAR(10),
    FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);


INSERT INTO Payment (PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
VALUES
    (301, 201, '2022-02-10', 750.00, 'Online', 'Completed'),
    (302, 202, '2023-04-10', 1500.00, 'Cash', 'Pending'),
    (303, 203, '2021-09-10', 500.00, 'Cheque', 'Completed'),
    (304, 204, '2020-12-10', 2500.00, 'Bank Transfer', 'Pending'),
    (305, 205, '2024-06-10', 1000.00, 'UPI', 'Completed');

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch VARCHAR(100)
);

INSERT INTO Staff (StaffID, Name, Role, Salary, Branch)
VALUES
    (401, 'Rajesh Kumar', 'Manager', 50000.00, 'Mumbai'),
    (402, 'Sita Sharma', 'Clerk', 30000.00, 'Delhi'),
    (403, 'Amit Verma', 'Technician', 25000.00, 'Bangalore'),
    (404, 'Neha Patel', 'Accountant', 35000.00, 'Chennai'),
    (405, 'Vikram Singh', 'Field Officer', 28000.00, 'Hyderabad');
CREATE TABLE  Complaint(
ComplaintID INT Primary key , 
CustomerID int ,
 Date datetime, 
 Description varchar(100),
 Status varchar (100),
 StaffID int ,
     FOREIGN KEY (ComplaintID) REFERENCES customer(ComplaintID),
     FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
 );
 
CREATE TABLE Complaint (
    ComplaintID INT PRIMARY KEY,
    CustomerID INT,
    Date DATETIME,
    Description TEXT,
    Status VARCHAR(50),
    StaffID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Section A – Commands 

-- 1. Create Customer Table 
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Contact VARCHAR(15) UNIQUE,
    ConnectionDate DATE,
    Status VARCHAR(20) DEFAULT 'Active'
);

-- 2. Alter Bill Table to Add LateFee 
ALTER TABLE Bill
ADD LateFee DECIMAL(8,2);

-- 3. Insert New Customer 
INSERT INTO Customer (CustomerID, Name, Address, City, Contact, ConnectionDate)
VALUES (11, 'Rahul Sharma', '123 Main St', 'Lucknow', '3482488246', '2025-09-17');

-- 4. Update Overdue Bills 
SET SQL_SAFE_UPDATES = 0 ;
UPDATE Bill
SET Status = 'Overdue'
WHERE DueDate < CURRENT_DATE;

-- 5. Select Customers Connected After 2020 
SELECT Name AS CustomerName, City, ConnectionDate
FROM Customer
WHERE ConnectionDate > '2020-01-01';

-- 6. Grant Privileges to Staff 
CREATE USER 'clerk1';
GRANT SELECT, UPDATE ON Bill TO 'clerk1';

-- 7. Rollback Payment Insertion 
start TRANSACTION;

INSERT INTO Payment (PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
VALUES (1, 201, '2025-09-17', 1500.00, 'Credit Card', 'Completed');

-- Simulate an error
ROLLBACK ;

-- Section B – Clauses 

-- 8. Retrieve Customers from Delhi
SELECT * FROM Customer
WHERE City = 'Delhi';

-- 9. Group Customers by City
SELECT City, COUNT(*) AS NumberOfConnections
FROM Customer
GROUP BY City;

-- 10. Max Bill Amount by City
SELECT c.City, MAX(b.Amount) AS MaxBillAmount
FROM Customer c
JOIN Bill b ON c.CustomerID = b.CustomerID
GROUP BY c.City;

-- 11. Customers Whose Name Starts with 'A'
SELECT * FROM Customer
WHERE Name LIKE 'A%';

-- 12. Top 5 Highest Bill Amounts
SELECT * FROM Bill
ORDER BY Amount DESC
LIMIT 5;

-- 13. Average Units Consumed > 200
SELECT AVG(UnitsConsumed) AS AvgUnitsConsumed
FROM Bill
WHERE UnitsConsumed > 200
GROUP BY CustomerID
HAVING AVG(UnitsConsumed) > 200;

-- Section C – Constraints 

-- 14. Create Meter Table with CHECK Constraint
CREATE TABLE Meter (
    MeterID INT PRIMARY KEY,
    CustomerID INT,
    MeterType VARCHAR(50),
    InstallationDate DATE,
    Status VARCHAR(20),
    CONSTRAINT chk_MeterType CHECK (MeterType IN ('Domestic', 'Commercial'))
);

-- 15. BillID as Auto Increment
CREATE TABLE Bill (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    MeterID INT,
    BillMonth DATE,
    UnitsConsumed INT,
    Amount DECIMAL(10,2),
    DueDate DATE,
    Status VARCHAR(20)
);

-- 16. Add FOREIGN KEY in Bill Table
ALTER TABLE Bill
ADD CONSTRAINT CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

-- Section D – Joins (Q17–Q22)

-- 17. Customer and Meter Details
SELECT c.Name AS CustomerName, m.MeterType, m.InstallationDate
FROM Customer c
JOIN Meter m ON c.CustomerID = m.CustomerID;

-- 18. All Customers and Their Bills
SELECT c.Name AS CustomerName, b.BillID, b.Amount
FROM Customer c
LEFT JOIN Bill b ON c.CustomerID = b.CustomerID;

-- 19. Staff Without Complaints
SELECT s.Name  ,c.ComplaintID
FROM Staff s
LEFT JOIN Complaint c ON s.StaffID = c.StaffID
WHERE c.ComplaintID IS NULL;

-- 20. Total Amount Collected by Staff
SELECT s.Name AS StaffName, SUM(p.AmountPaid) AS TotalAmountCollected
FROM Staff s
JOIN Complaint c ON s.StaffID = c.StaffID
JOIN Payment p ON c.ComplaintID = p.BillID
GROUP BY s.Name;

-- 21. Customers Who Paid After Due Date
SELECT c.Name , p.PaymentDate, b.DueDate
FROM Customer c
JOIN Bill b ON c.CustomerID = b.CustomerID
JOIN Payment p ON b.BillID = p.BillID
WHERE p.PaymentDate > b.DueDate;

-- 22. Customer, Complaint, and Staff Details
SELECT c.Name , cm.Description , s.Name 
FROM customer c
join Complaint cm ON c.customerid = cm.customerid 
JOIN Staff s ON cm.StaffID = s.StaffID ;

-- Section E – Subqueries 

-- 23. Customer with Highest Bill Amount
SELECT * FROM Customer
WHERE CustomerID = (
    SELECT CustomerID
    FROM Bill
    ORDER BY Amount DESC
    LIMIT 1
);

-- 24. Customers with Units Consumed > Average
SELECT * FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Bill
    WHERE UnitsConsumed > (
        SELECT AVG(UnitsConsumed)
        FROM Bill
    )
);

-- 25. Second Highest Bill Amount
SELECT * FROM Bill
WHERE Amount = (
    SELECT MAX(Amount)
    FROM Bill
    WHERE Amount < (
        SELECT MAX(Amount)
        FROM Bill
    )
);

-- 26. Customers Who Never Made a Payment
SELECT * FROM Customer
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Payment
);

-- 27. Customers with Due Bills > Max Staff Salary
SELECT c.Name AS CustomerName
FROM Customer c
JOIN Bill b ON c.CustomerID = b.CustomerID
WHERE b.Amount > (
    SELECT MAX(Salary)
    FROM Staff
);

-- 28. Oldest Connection Date
SELECT MIN(ConnectionDate) AS OldestConnectionDate
FROM Customer;
select *from Customer;
-- Section F 

-- 29. Display Current Date and Time
SELECT current_timestamp();

-- 30. Show the first 5 characters of customer names using string functions.
SELECT SUBSTRING(Name, 1, 5) AS FirstFiveChars
FROM Customer;

