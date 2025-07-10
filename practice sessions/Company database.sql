-- ----------------------- single line comment -----------
  /*
   multi line comment 
  */
  -- create database company 
  create database company  ;
  -- to work on database first , you need to first 
  drop database company ;
  use company ; 
  
-- ------------------------------ Database analysis-----------------------------
/*
T1 : Employees(EmpID, FirstName, LastName, Gender, DOB, Email, Phone, DepartmentID, Position, JoinDate)
T2 : Departments(DepartmentID, DeptName, HeadOfDepartment, Phone, Email, OfficeLocation, EstablishedYear, TotalEmployees, Budget, Branch)
T3 : Projects(ProjectID, ProjectName, DepartmentID, StartDate, EndDate, Budget, ManagerID, TeamSize, Status, Location)
T4 : Salaries(SalaryID, EmpID, BasePay, Bonus, Deductions, Tax, NetPay, PayMonth, PayYear, PaymentDate)
T5 : Attendance(AttendanceID, EmpID, Date, Status, InTime, OutTime, WorkHours, Remarks, VerifiedBy, Overtime)
T6 : Leaves(LeaveID, EmpID, LeaveType, StartDate, EndDate, TotalDays, Reason, ApprovedBy, Status, AppliedDate)
T7 : Assets(AssetID, Name, Type, AssignedTo, PurchaseDate, WarrantyYears, Value, Condition, Status, DepartmentID)
T8 : Clients(ClientID, CompanyName, ContactPerson, Email, Phone, Address, City, Country, JoinedDate, Status)
T9 : WorkLogs(LogID, EmpID, ProjectID, LogDate, TaskDescription, HoursWorked, ApprovedBy, Status, Remarks, EntryTime)
T10 : Feedback(FeedbackID, EmpID, GivenTo, ProjectID, Rating, Comment, FeedbackDate, Type, Anonymous, Reviewed)

*/

-- Table 1 Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE,
    ManagerID INT,
    Location VARCHAR(50) NOT NULL,
    Budget DECIMAL(10,2) CHECK (Budget >= 0),
    CreatedDate DATE,
    Extension INT,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Inactive')) DEFAULT 'Active'
);

INSERT INTO Departments VALUES
(1, 'IT', 1, 'Mumbai', 1000000.00, '2015-01-10', 101, '022-1234567', 'it@company.com', 'Active'),
(2, 'HR', 2, 'Delhi', 500000.00, '2016-02-15', 102, '011-2345678', 'hr@company.com', 'Active'),
(3, 'Finance', 3, 'Pune', 750000.00, '2017-03-20', 103, '020-3456789', 'finance@company.com', 'Active'),
(4, 'Marketing', 4, 'Bangalore', 600000.00, '2018-04-25', 104, '080-4567890', 'marketing@company.com', 'Active'),
(5, 'Sales', 5, 'Hyderabad', 800000.00, '2019-05-30', 105, '040-5678901', 'sales@company.com', 'Active'),
(6, 'Admin', 6, 'Chennai', 400000.00, '2017-07-01', 106, '044-1234567', 'admin@company.com', 'Active'),
(7, 'Legal', 7, 'Ahmedabad', 300000.00, '2016-08-15', 107, '079-2345678', 'legal@company.com', 'Active'),
(8, 'Logistics', 8, 'Jaipur', 350000.00, '2018-09-30', 108, '0141-3456789', 'logistics@company.com', 'Active'),
(9, 'Support', 9, 'Nagpur', 450000.00, '2020-03-10', 109, '0712-4567890', 'support@company.com', 'Active'),
(10, 'R&D', 10, 'Kolkata', 900000.00, '2021-12-20', 110, '033-5678901', 'rnd@company.com', 'Active');
-- ----- to display  table data --------------------------

select*from Departments ;

-- ------ to remove complete records from table --------------

truncate  table Departments;

-- ------- to remove  complete records and attribute form table  -------

drop table Departments;

-- Table 2 Employees

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    JoinDate DATE,
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive')),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees VALUES
(1, 'Raj', 'Mehra', 'raj.mehra@company.com', '9876543201', 1, 'Manager', 48260.79, '2022-01-31', 'Active'),
(2, 'Anita', 'Sharma', 'anita.sharma@company.com', '9876543202', 1, 'HR Executive', 86095.78, '2022-09-10', 'Active'),
(3, 'Vikram', 'Seth', 'vikram.seth@company.com', '9876543203', 1, 'Manager', 74654.04, '2023-09-20', 'Inactive'),
(4, 'Sneha', 'Rane', 'sneha.rane@company.com', '9876543204', 1, 'HR Executive', 60066.20, '2023-04-26', 'Active'),
(5, 'Amit', 'Verma', 'amit.verma@company.com', '9876543205', 5, 'HR Executive', 43247.65, '2020-08-26', 'Inactive'),
(6, 'Meera', 'Desai', 'meera.desai@company.com', '9876543206', 3, 'Analyst', 67332.00, '2023-09-12', 'Active'),
(7, 'Karan', 'Malhotra', 'karan.malhotra@company.com', '9876543207', 3, 'Analyst', 67426.96, '2015-01-31', 'Active'),
(8, 'Nikita', 'Singh', 'nikita.singh@company.com', '9876543208', 2, 'Developer', 48118.23, '2022-11-14', 'Inactive'),
(9, 'John', 'Doe', 'john.doe@company.com', '9876543209', 1, 'HR Executive', 43067.46, '2018-01-11', 'Inactive'),
(10, 'Priya', 'Kale', 'priya.kale@company.com', '9876543210', 3, 'Sales Rep', 46888.83, '2023-02-04', 'Inactive');

-- ----- to display  table data --------------------------

select*from Employees ;

-- ------ to remove complete records from table --------------

truncate  table Employees;

-- ------- to remove  complete records and attribute form table  -------

drop table Employees;

-- Table 3 Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    Budget DECIMAL(10,2) CHECK (Budget >= 0),
    Status VARCHAR(20) CHECK (Status IN ('Planned', 'Ongoing', 'Completed')),
    TeamSize INT CHECK (TeamSize > 0),
    ManagerID INT,
    Location VARCHAR(50),

	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
);


INSERT INTO Projects VALUES
(1, 'Project_1', '2016-07-10', '2016-10-17', 1, 273411.11, 'Completed', 19, 6, 'Bangalore'),
(2, 'Project_2', '2019-11-26', '2020-05-23', 2, 519449.77, 'Planned', 16, 10, 'Mumbai'),
(3, 'Project_3', '2018-09-05', '2018-10-06', 3, 614558.63, 'Ongoing', 3, 8, 'Delhi'),
(4, 'Project_4', '2016-08-31', '2016-10-06', 4, 822127.60, 'Planned', 6, 1, 'Pune'),
(5, 'Project_5', '2022-05-24', '2022-10-18', 2, 648797.06, 'Ongoing', 15, 2, 'Delhi'),
(6, 'Project_6', '2021-09-23', '2022-03-17', 2, 175341.85, 'Ongoing', 8, 5, 'Hyderabad'),
(7, 'Project_7', '2015-04-11', '2015-05-22', 1, 479749.16, 'Completed', 8, 6, 'Hyderabad'),
(8, 'Project_8', '2021-01-20', '2021-05-11', 5, 649657.37, 'Planned', 6, 10, 'Hyderabad'),
(9, 'Project_9', '2020-11-30', '2021-02-03', 2, 384899.30, 'Ongoing', 15, 6, 'Hyderabad'),
(10, 'Project_10', '2019-08-28', '2020-01-07', 1, 794841.35, 'Planned', 19, 3, 'Bangalore');
-- ----- to display  table data --------------------------

select*from Projects ;

-- ------ to remove complete records from table --------------

truncate  table Projects;

-- ------- to remove  complete records and attribute form table  -------

drop table Projects;

-- Table 4 Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmpID INT,
    Date DATE NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent', 'Leave')),
    InTime TIME,
    OutTime TIME,
    WorkHours DECIMAL(4,2),
    Remarks VARCHAR(100),
    VerifiedBy VARCHAR(50),
    Overtime BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Attendance (AttendanceID, EmpID, Date, Status, InTime, OutTime, WorkHours, Remarks, VerifiedBy, Overtime)
VALUES 
(1, 1, '2025-07-01', 'Present', '09:00:00', '17:00:00', 8.00, 'On time', 'Manager1', FALSE),
(2, 2, '2025-07-01', 'Absent', NULL, NULL, 0.00, 'Sick leave', 'Manager2', FALSE),
(3, 3, '2025-07-01', 'Present', '09:15:00', '17:30:00', 8.25, 'Late entry', 'Manager1', TRUE),
(4, 4, '2025-07-01', 'Leave', NULL, NULL, 0.00, 'Approved leave', 'HR1', FALSE),
(5, 5, '2025-07-01', 'Present', '08:45:00', '17:15:00', 8.50, 'Early arrival', 'Manager3', TRUE),
(6, 6, '2025-07-02', 'Present', '09:00:00', '17:00:00', 8.00, '', 'Manager1', FALSE),
(7, 7, '2025-07-02', 'Present', '09:10:00', '17:05:00', 7.92, 'Slight delay', 'Manager2', FALSE),
(8, 8, '2025-07-02', 'Leave', NULL, NULL, 0.00, 'Family function', 'HR2', FALSE),
(9, 9, '2025-07-02', 'Present', '09:00:00', '18:00:00', 9.00, 'Overtime work', 'Manager1', TRUE),
(10, 10, '2025-07-02', 'Absent', NULL, NULL, 0.00, 'No notice', 'Manager3', FALSE);

-- ----- to display  table data --------------------------

select*from Attendance ;

-- ------ to remove complete records from table --------------

truncate  table Attendance;

-- ------- to remove  complete records and attribute form table  -------

drop table Attendance;

-- Table 5 Salaries
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmpID INT,
    BasePay DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    Tax DECIMAL(10,2),
    NetPay DECIMAL(10,2),
    PayMonth VARCHAR(20),
    PayYear INT,
    PaymentDate DATE,

    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
    
);
INSERT INTO Salaries VALUES
(1, 1, 65000.00, 5000.00, 2000.00, 6500.00, 61500.00, 'June', 2024, '2024-06-30'),
(2, 2, 72000.00, 4500.00, 2500.00, 7200.00, 66800.00, 'June', 2024, '2024-06-30'),
(3, 3, 56000.00, 3000.00, 1800.00, 5600.00, 51600.00, 'June', 2024, '2024-06-30'),
(4, 4, 61000.00, 4000.00, 2200.00, 6100.00, 56700.00, 'June', 2024, '2024-06-30'),
(5, 5, 48000.00, 3500.00, 1600.00, 4800.00, 45100.00, 'June', 2024, '2024-06-30'),
(6, 6, 82000.00, 6000.00, 3000.00, 8200.00, 76800.00, 'June', 2024, '2024-06-30'),
(7, 7, 70000.00, 5000.00, 2500.00, 7000.00, 65500.00, 'June', 2024, '2024-06-30'),
(8, 8, 55000.00, 3200.00, 1800.00, 5500.00, 50900.00, 'June', 2024, '2024-06-30'),
(9, 9, 60000.00, 4000.00, 2200.00, 6000.00, 55800.00, 'June', 2024, '2024-06-30'),
(10, 10, 67000.00, 4200.00, 2000.00, 6700.00, 62500.00, 'June', 2024, '2024-06-30');


-- ----- to display  table data --------------------------

select*from Salaries ;

-- ------ to remove complete records from table --------------

truncate  table Salaries;

-- ------- to remove  complete records and attribute form table  -------

drop table Salaries;


-- Table 6 Leaves
CREATE TABLE Leaves (
    LeaveID INT PRIMARY KEY,
    EmpID INT,
    LeaveType VARCHAR(30) CHECK (LeaveType IN ('Sick', 'Casual', 'Earned')),
    StartDate DATE,
    EndDate DATE,
    TotalDays INT CHECK (TotalDays > 0),
    Reason VARCHAR(100),
    ApprovedBy INT,
    Status VARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Approved', 'Rejected', 'Pending')),
    AppliedDate DATE,

	FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Leaves (LeaveID, EmpID, LeaveType, StartDate, EndDate, TotalDays, Reason, ApprovedBy, Status, AppliedDate)
VALUES
(
1, 1, 'Sick', '2025-07-01', '2025-07-03', 3, 'Fever and rest', 102, 'Approved', '2025-06-30'),
(2, 2, 'Casual', '2025-07-05', '2025-07-05', 1, 'Personal errand', 101, 'Approved', '2025-07-03'),
(3, 3, 'Earned', '2025-07-10', '2025-07-15', 6, 'Family trip', 104, 'Pending', '2025-07-01'),
(4, 4, 'Sick', '2025-07-08', '2025-07-10', 3, 'Flu', 101, 'Rejected', '2025-07-07'),
(5, 5, 'Casual', '2025-07-03', '2025-07-04', 2, 'Urgent work', 102, 'Approved', '2025-07-01'),
(6, 6, 'Earned', '2025-07-20', '2025-07-22', 3, 'Vacation', 103, 'Pending', '2025-07-15'),
(7, 7, 'Sick', '2025-07-11', '2025-07-11', 1, 'Migraine', 101, 'Approved', '2025-07-10'),
(8, 8, 'Casual', '2025-07-13', '2025-07-13', 1, 'Bank work', 102, 'Approved', '2025-07-12'),
(9, 9, 'Earned', '2025-07-18', '2025-07-20', 3, 'Hometown visit', 101, 'Pending', '2025-07-17'),
(10, 10, 'Sick', '2025-07-09', '2025-07-10', 2, 'Fever', 104, 'Approved', '2025-07-08');


-- ----- to display  table data --------------------------

select*from Leaves ;

-- ------ to remove complete records from table --------------

truncate  table Leaves;

-- ------- to remove  complete records and attribute form table  -------

drop table Leaves;

-- Table 7 Clients
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    Country VARCHAR(50),
    JoinedDate DATE,
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive'))
);
INSERT INTO Clients (ClientID, CompanyName, ContactPerson, Email, Phone, Address, City, Country, JoinedDate, Status)
VALUES
(1, 'TechCorp Ltd.', 'Ravi Kumar', 'ravi@techcorp.com', '9876543210', '123 MG Road', 'Mumbai', 'India', '2024-04-15', 'Active'),
(2, 'GreenSoft Pvt Ltd.', 'Neha Shah', 'neha@greensoft.in', '9123456780', '456 Link Street', 'Pune', 'India', '2023-11-21', 'Active'),
(3, 'DataWiz Inc.', 'John Doe', 'john@datawiz.com', '9988776655', '789 Data Lane', 'Bangalore', 'India', '2025-01-10', 'Inactive'),
(4, 'Skyline Solutions', 'Meera Mehta', 'meera@skyline.com', '9876543333', '22 Cloud Ave', 'Chennai', 'India', '2022-09-12', 'Active'),
(5, 'HexaTech', 'Alok Verma', 'alok@hexatech.io', '9087654321', '55 Core Zone', 'Hyderabad', 'India', '2025-05-05', 'Active'),
(6, 'Vortex Systems', 'Suman Roy', 'suman@vortexsys.com', '9001122334', '88 Spin Park', 'Kolkata', 'India', '2024-12-01', 'Active'),
(7, 'FusionWare', 'Karan Patel', 'karan@fusionware.com', '8899001122', '77 Wave Blvd', 'Delhi', 'India', '2023-06-17', 'Inactive'),
(8, 'BrightApps', 'Divya Nair', 'divya@brightapps.io', '9822334455', '44 App Center', 'Ahmedabad', 'India', '2023-10-10', 'Active'),
(9, 'NeoTech', 'Sameer Khan', 'sameer@neotech.org', '9797979797', '33 Future Street', 'Surat', 'India', '2025-03-15', 'Active'),
(10, 'SmartEdge', 'Anjali Gupta', 'anjali@smartedge.com', '9678563412', '66 Smart Zone', 'Indore', 'India', '2022-08-30', 'Inactive');

-- ----- to display  table data --------------------------

select*from Clients ;

-- ------ to remove complete records from table --------------

truncate  table Clients;

-- ------- to remove  complete records and attribute form table  -------

drop table Clients;

-- Table 8 Assets
CREATE TABLE Assets (
    AssetID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    AssignedTo INT,
    PurchaseDate DATE,
    WarrantyYears INT,
    Value DECIMAL(10,2),
    Conditions VARCHAR(20) ,
    Status VARCHAR(20) CHECK (Status IN ('Assigned', 'Available', 'Scrapped')),
    DepartmentID INT,


	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Assets (AssetID, Name, Type, AssignedTo, PurchaseDate, WarrantyYears, Value, Conditions, Status, DepartmentID)
VALUES
(1, 'Dell Laptop', 'Electronics', 101, '2023-01-15', 3, 60000.00, 'Good', 'Assigned', 1),
(2, 'HP Printer', 'Electronics', NULL, '2022-05-10', 2, 15000.00, 'Fair', 'Available', 2),
(3, 'Office Chair', 'Furniture', 102, '2021-07-20', 5, 4000.00, 'Good', 'Assigned', 3),
(4, 'Air Conditioner', 'Electronics', NULL, '2020-03-30', 3, 35000.00, 'Poor', 'Scrapped', 4),
(5, 'MacBook Pro', 'Electronics', 103, '2024-04-18', 2, 120000.00, 'Excellent', 'Assigned', 1),
(6, 'Whiteboard', 'Stationary', NULL, '2022-09-25', 4, 3000.00, 'Good', 'Available', 3),
(7, 'iPhone', 'Electronics', 104, '2025-01-10', 1, 85000.00, 'Good', 'Assigned', 2),
(8, 'Projector', 'Electronics', NULL, '2023-08-11', 2, 25000.00, 'Good', 'Available', 1),
(9, 'Server Rack', 'Hardware', NULL, '2022-11-15', 3, 95000.00, 'Excellent', 'Available', 4),
(10, 'Desk Lamp', 'Furniture', 105, '2023-06-05', 5, 1200.00, 'Good', 'Assigned', 2);

-- ----- to display  table data --------------------------

select*from Assets ;

-- ------ to remove complete records from table --------------

truncate  table Assets;

-- ------- to remove  complete records and attribute form table  -------

drop table Assets;

-- Table 9 Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    EmpID INT,
    GivenTo INT,
    ProjectID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    FeedbackDate DATE,
    Type VARCHAR(20) CHECK (Type IN ('Peer', 'Manager', 'Self')),
    Anonymous BOOLEAN DEFAULT FALSE,
    Reviewed BOOLEAN DEFAULT FALSE,

	FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO Feedback (FeedbackID, EmpID, GivenTo, ProjectID, Rating, Comment, FeedbackDate, Type, Anonymous, Reviewed)
VALUES
(1, 1, 102, 1, 5, 'Excellent collaboration', '2025-07-01', 'Peer', FALSE, TRUE),
(2, 2, 101, 2, 4, 'Great support', '2025-07-02', 'Peer', TRUE, TRUE),
(3, 3, 101, 3, 3, 'Needs improvement in time management', '2025-07-03', 'Manager', FALSE, TRUE),
(4, 4, 102, 4, 4, 'Solid contribution', '2025-07-04', 'Peer', TRUE, FALSE),
(5, 5, 103, 5, 2, 'Delayed deliverables', '2025-07-05', 'Manager', FALSE, FALSE),
(6, 6, 104, 6, 5, 'Very proactive', '2025-07-06', 'Peer', TRUE, TRUE),
(7, 7, 105, 7, 3, 'Average performance', '2025-07-07', 'Self', FALSE, TRUE),
(8, 8, 104, 8, 4, 'Completed tasks on time', '2025-07-08', 'Peer', TRUE, TRUE),
(9, 9, 105, 9, 5, 'Excellent team player', '2025-07-09', 'Peer', FALSE, TRUE),
(10, 10, 101, 10, 4, 'Good initiative', '2025-07-10', 'Peer', FALSE, FALSE);

-- ----- to display  table data --------------------------

select*from Feedback ;

-- ------ to remove complete records from table --------------

truncate  table Feedback;

-- ------- to remove  complete records and attribute form table  -------

drop table Feedback;

-- Table 10 WorkLogs
CREATE TABLE WorkLogs (
    LogID INT PRIMARY KEY,
    EmpID INT,
    ProjectID INT,
    LogDate DATE NOT NULL,
    TaskDescription VARCHAR(200),
    HoursWorked DECIMAL(4,2) CHECK (HoursWorked >= 0),
    ApprovedBy INT,
    Status VARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Approved', 'Rejected')),
    Remarks TEXT,
    EntryTime TIME,

    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO WorkLogs (LogID, EmpID, ProjectID, LogDate, TaskDescription, HoursWorked, ApprovedBy, Status, Remarks, EntryTime)
VALUES
(1, 1, 1, '2025-07-01', 'Implemented login module', 6.50, 102, 'Approved', 'Well done', '09:00:00'),
(2, 2, 2, '2025-07-01', 'Database schema design', 7.00, 101, 'Approved', '', '09:15:00'),
(3, 3, 3, '2025-07-01', 'UI mockup created', 5.75, 104, 'Pending', '', '09:30:00'),
(4, 4, 4, '2025-07-01', 'Code review and testing', 6.25, 103, 'Approved', '', '10:00:00'),
(5, 5, 5, '2025-07-01', 'Bug fixing', 8.00, 101, 'Rejected', 'Not satisfactory', '09:45:00'),
(6, 6, 6, '2025-07-02', 'Deployed on staging', 4.50, 102, 'Approved', '', '09:00:00'),
(7, 7, 7, '2025-07-02', 'Documentation updates', 3.75, 101, 'Approved', '', '09:10:00'),
(8, 8, 8, '2025-07-02', 'Frontend enhancements', 6.00, 104, 'Pending', '', '09:20:00'),
(9, 9, 9, '2025-07-02', 'Backend integration', 7.25, 103, 'Approved', '', '09:40:00'),
(10, 10, 10, '2025-07-02', 'Testing & bug reporting', 5.50, 102, 'Approved', 'Good effort', '09:55:00');


-- ----- to display  table data --------------------------

select*from WorkLogs ;

-- ------ to remove complete records from table --------------

truncate  table WorkLogs;

-- ------- to remove  complete records and attribute form table  -------

drop table WorkLogs;