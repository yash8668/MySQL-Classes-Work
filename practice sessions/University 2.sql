-- -------singel line comment ------------------------------------------------------

/*
multi
line 
comment
*/

## this is also use as single line comment in sql

/*
usege  of comment
1.Documentetion : comment can be use document the purpose of sql query or logic behind complex operation
2.Debugging :you can temporarily disable part of your sql  by commiting them out which is use  for debugging
3.collabration: when working in terms , commenmt help communicate the internet 

*/

-- ---------------------------------- database queries-------------------------------------
-- ------------------------- create a database first 
create database Univercity ;
drop database Univercity ;
-- ------ to execute ( ctrl + enter ) --
-- ---to work on this database , you need to use it first 


use Univercity ;
-- -----------  sql is not  a case sensetive language ( as - AGE or age will be treated same word )
-- ------------------------------ Database analysis-----------------------------
/*
T1 : Students( StudentID , FirstName , LastName ,Gender , DOB ,Email ,Phone ,Address,EnrollmentDate,DepartmentID ) 
T2 :Departments (DepartmentID, DepartmentName, HeadOfDepartment, Phone, Email, OfficeLocation, EstablishedYear, TotalFaculty, Budget, UniversityBranch)
T3 : Courses (CourseID, CourseName, DepartmentID, Credits, Semester, DurationWeeks, Syllabus, CourseType, InstructorID, MaxEnrollment) 
T4 : Faculty (FacultyID, FirstName, LastName, Gender, DOB, Email, Phone, HireDate, DepartmentID, Position)
T5 : Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade, AcademicYear, Semester, Status, AttendancePercent, Remarks)
T6 : Exams (ExamID, CourseID, ExamTitle, ExamDate, DurationMinutes, TotalMarks, PassingMarks, ExamType, Location, InstructorID) 
T7 : Results (ResultID, ExamID, StudentID, MarksObtained, Grade, ResultStatus, Remarks, PublishedDate, EvaluatedBy, RevaluationStatus)
T8 : Library (BookID, Title, Author, ISBN, Publisher, PublishYear, Category, QuantityAvailable, RackNumber, DepartmentID)
T9 : Hostels (HostelID, HostelName, Capacity, Gender, WardenName, ContactNumber, Location, EstablishmentYear, RoomsAvailable, FeePerSemester)
T10 :StudentHostelAssignment (AssignmentID, StudentID, HostelID, RoomNumber, BedNumber, AssignedDate, FeePaid, ValidTill, Status, Remarks)

*/

-- Table 1 Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(150),
    EnrollmentDate DATE,
    DepartmentID INT
);

-- insert the value in table
INSERT INTO Students (StudentID, FirstName, LastName, Gender, DOB, Email, Phone, Address, EnrollmentDate, DepartmentID) VALUES
(1, 'Rahul', 'Sharma', 'Female', '1998-07-20', 'rahul.sharma@university.edu', '9900825271', 'Mumbai', '2020-04-27', 2),
(2, 'Sneha', 'Patel', 'Male', '1998-03-22', 'sneha.patel@university.edu', '9267634434', 'Delhi', '2022-06-21', 1),
(3, 'Amit', 'Verma', 'Female', '2000-11-01', 'amit.verma@university.edu', '9455025074', 'Pune', '2019-06-14', 3),
(4, 'Priya', 'Kumar', 'Male', '2000-12-20', 'priya.kumar@university.edu', '9893023796', 'Chennai', '2020-08-31', 4),
(5, 'Karan', 'Mehta', 'Female', '2003-09-27', 'karan.mehta@university.edu', '9217129651', 'Kolkata', '2019-07-14', 4),
(6, 'Neha', 'Joshi', 'Male', '2000-03-06', 'neha.joshi@university.edu', '9646913291', 'Bangalore', '2021-01-07', 3),
(7, 'Ravi', 'Nair', 'Female', '2001-04-27', 'ravi.nair@university.edu', '9297107600', 'Hyderabad', '2021-01-22', 4),
(8, 'Pooja', 'Reddy', 'Male', '2002-02-07', 'pooja.reddy@university.edu', '9529610890', 'Ahmedabad', '2022-02-22', 3),
(9, 'Vikram', 'Kapoor', 'Female', '1998-01-13', 'vikram.kapoor@university.edu', '9774644782', 'Jaipur', '2022-05-12', 4),
(10, 'Anjali', 'Mishra', 'Male', '2002-04-13', 'anjali.mishra@university.edu', '9515676311', 'Lucknow', '2019-07-01', 5);

-- ----- to display  table data --------------------------

select*from students ;

-- ------ to remove complete records from table --------------

truncate  table students;

-- ------- to remove  complete records and attribute form table  -------

drop table students;

-- Table 2 Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    HeadOfDepartment VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    OfficeLocation VARCHAR(100),
    EstablishedYear INT,
    TotalFaculty INT,
    Budget DECIMAL(10,2),
    UniversityBranch VARCHAR(100)
);
-- --insert the value in table 

INSERT INTO Departments (DepartmentID, DepartmentName, HeadOfDepartment, Phone, Email, OfficeLocation, EstablishedYear, TotalFaculty, Budget, UniversityBranch) VALUES
(1, 'Department of Clinical', 'Donald Walker', '001-181-960-013', 'dept1@university.edu', 'Block-A Floor-3', 1988, 10, 3966202.00, 'Lake Debra'),
(2, 'Department of Sports', 'Jerry Ramirez', '2654235116', 'dept2@university.edu', 'Block-B Floor-1', 1992, 14, 3945884.86, 'West Melanieview'),
(3, 'Department of Armed', 'Kimberly Dudley', '(184)959-3103x4', 'dept3@university.edu', 'Block-C Floor-3', 2008, 38, 3181466.13, 'Ramirezstad'),
(4, 'Department of Designer,', 'Daniel Adams', '+1-192-832-7648', 'dept4@university.edu', 'Block-D Floor-3', 1998, 11, 1119188.88, 'Richardland'),
(5, 'Department of Engineer,', 'Latoya Robbins', '767.242.3884', 'dept5@university.edu', 'Block-E Floor-1', 1992, 26, 3408074.92, 'Hurstfurt'),
(6, 'Department of Medical', 'Zachary Hicks', '012-269-1669', 'dept6@university.edu', 'Block-F Floor-3', 1991, 32, 3599537.75, 'Riceside'),
(7, 'Department of Administrator,', 'Ashley Dyer', '001-451-462-704', 'dept7@university.edu', 'Block-G Floor-3', 1998, 17, 2796836.19, 'East Nathaniel'),
(8, 'Department of Designer,', 'Paula Moreno', '9570154303', 'dept8@university.edu', 'Block-H Floor-2', 2010, 37, 1025995.04, 'North Jessicaland'),
(9, 'Department of Site', 'Betty Alvarez', '+1-248-963-8346', 'dept9@university.edu', 'Block-I Floor-1', 2007, 23, 2361002.07, 'Samuelhaven'),
(10, 'Department of Production', 'Danny Morgan', '001-839-301-031', 'dept10@university.edu', 'Block-J Floor-1', 1991, 40, 4053976.52, 'Chadbury');

-- ----- to display  table data --------------------------

select*from Departments ;

-- ------ to remove complete records from table --------------

truncate  table Departments;

-- ------- to remove  complete records and attribute form table  -------

drop table Departments;

-- Table 3 Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    Semester VARCHAR(20),
    DurationWeeks INT,
    Syllabus TEXT,
    CourseType VARCHAR(20),
    InstructorID INT,
    MaxEnrollment INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- ----insert the value in table 
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits, Semester, DurationWeeks, Syllabus, CourseType, InstructorID, MaxEnrollment) VALUES
(1, 'Introduction to Programming', 2, 4, 'Semester 2', 12, 'This course covers Introduction to Programming and its practical applications.', 'Elective', 10, 63),
(2, 'Database Management', 1, 5, 'Semester 8', 14, 'This course covers Database Management and its practical applications.', 'Core', 7, 40),
(3, 'Operating Systems', 9, 4, 'Semester 6', 14, 'This course covers Operating Systems and its practical applications.', 'Core', 2, 35),
(4, 'Computer Networks', 4, 4, 'Semester 2', 16, 'This course covers Computer Networks and its practical applications.', 'Core', 2, 78),
(5, 'Software Engineering', 5, 4, 'Semester 6', 11, 'This course covers Software Engineering and its practical applications.', 'Elective', 6, 56),
(6, 'Data Structures', 5, 5, 'Semester 2', 14, 'This course covers Data Structures and its practical applications.', 'Core', 9, 61),
(7, 'Artificial Intelligence', 3, 4, 'Semester 7', 12, 'This course covers Artificial Intelligence and its practical applications.', 'Core', 6, 37),
(8, 'Machine Learning', 4, 3, 'Semester 6', 13, 'This course covers Machine Learning and its practical applications.', 'Elective', 2, 57),
(9, 'Web Development', 10, 5, 'Semester 6', 11, 'This course covers Web Development and its practical applications.', 'Elective', 7, 88),
(10, 'Cyber Security', 3, 4, 'Semester 3', 11, 'This course covers Cyber Security and its practical applications.', 'Elective', 10, 84);

-- ----- to display  table data --------------------------

select*from Courses ;

-- ------ to remove complete records from table --------------

truncate  table Courses;

-- ------- to remove  complete records and attribute form table  -------

drop table Courses;

-- Table 4 Faculty
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    HireDate DATE,
    DepartmentID INT,
    Position VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- ----insert the value in table 

INSERT INTO Faculty (FacultyID, FirstName, LastName, Gender, DOB, Email, Phone, HireDate, DepartmentID, Position) VALUES
(1, 'Arun', 'Sharma', 'Male', '1975-06-12', 'arun.sharma@university.edu', '9810011122', '2010-07-01', 1, 'Professor'),
(2, 'Meena', 'Iyer', 'Female', '1980-03-20', 'meena.iyer@university.edu', '9822033300', '2012-01-15', 2, 'Associate Professor'),
(3, 'Rajiv', 'Kapoor', 'Male', '1978-11-05', 'rajiv.kapoor@university.edu', '9833055501', '2011-09-10', 3, 'Assistant Professor'),
(4, 'Sunita', 'Deshmukh', 'Female', '1983-07-28', 'sunita.deshmukh@university.edu', '9844077702', '2013-03-20', 4, 'Lecturer'),
(5, 'Kunal', 'Verma', 'Male', '1979-09-18', 'kunal.verma@university.edu', '9855099903', '2009-12-01', 5, 'Professor'),
(6, 'Priya', 'Nair', 'Female', '1982-12-14', 'priya.nair@university.edu', '9866121104', '2014-05-25', 6, 'Associate Professor'),
(7, 'Sanjay', 'Rao', 'Male', '1976-02-22', 'sanjay.rao@university.edu', '9877133305', '2011-08-30', 7, 'Assistant Professor'),
(8, 'Neha', 'Singh', 'Female', '1984-05-03', 'neha.singh@university.edu', '9888144406', '2015-06-10', 8, 'Lecturer'),
(9, 'Vikram', 'Joshi', 'Male', '1977-10-10', 'vikram.joshi@university.edu', '9899155507', '2010-04-18', 9, 'Professor'),
(10, 'Anita', 'Mehta', 'Female', '1981-08-09', 'anita.mehta@university.edu', '9900166608', '2012-11-05', 10, 'Assistant Professor');

-- ----- to display  table data --------------------------

select*from Faculty ;

-- ------ to remove complete records from table --------------

truncate  table Faculty;

-- ------- to remove  complete records and attribute form table  -------

drop table Faculty;

-- Table 5 Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(5),
    AcademicYear VARCHAR(10),
    Semester VARCHAR(10),
    Status VARCHAR(20),
    AttendancePercent DECIMAL(5,2),
    Remarks TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ----insert the value in table 

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade, AcademicYear, Semester, Status, AttendancePercent, Remarks) VALUES
(1, 1, 2, '2022-07-10', 'A', '2022-2023', 'Semester 2', 'Completed', 92.50, 'Excellent performance'),
(2, 2, 4, '2023-01-15', 'B+', '2022-2023', 'Semester 4', 'Completed', 85.00, 'Good understanding of concepts'),
(3, 3, 1, '2021-08-01', 'A-', '2021-2022', 'Semester 1', 'Completed', 90.00, 'Consistent performer'),
(4, 4, 5, '2022-01-20', 'B', '2021-2022', 'Semester 3', 'Completed', 78.50, 'Needs improvement in assignments'),
(5, 5, 3, '2023-06-05', 'C+', '2023-2024', 'Semester 5', 'Ongoing', 68.00, 'Average performance'),
(6, 6, 7, '2022-07-18', 'A+', '2022-2023', 'Semester 6', 'Completed', 95.00, 'Top performer in class'),
(7, 7, 6, '2021-11-12', 'B-', '2021-2022', 'Semester 2', 'Completed', 82.75, 'Fair participation'),
(8, 8, 9, '2023-01-10', 'A', '2023-2024', 'Semester 1', 'Ongoing', 88.00, 'Strong practical skills'),
(9, 9, 10, '2023-02-20', NULL, '2023-2024', 'Semester 3', 'Ongoing', 72.50, 'Midterm not yet conducted'),
(10, 10, 8, '2022-12-05', 'B+', '2022-2023', 'Semester 4', 'Completed', 84.00, 'Actively involved in discussions');

-- ----- to display  table data --------------------------

select*from Enrollments ;

-- ------ to remove complete records from table --------------

truncate  table Enrollments;

-- ------- to remove  complete records and attribute form table  -------

drop table Enrollments;

-- Table 6 Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CourseID INT,
    ExamTitle VARCHAR(100),
    ExamDate DATE,
    DurationMinutes INT,
    TotalMarks INT,
    PassingMarks INT,
    ExamType VARCHAR(20),
    Location VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Faculty(FacultyID)
);

-- ----insert the value in table 

INSERT INTO Exams (ExamID, CourseID, ExamTitle, ExamDate, DurationMinutes, TotalMarks, PassingMarks, ExamType, Location, InstructorID) VALUES
(1, 1, 'Midterm - Programming Basics', '2023-03-15', 90, 100, 40, 'Midterm', 'Room A101', 1),
(2, 2, 'Final - DBMS Concepts', '2023-05-20', 120, 100, 50, 'Final', 'Lab B202', 2),
(3, 3, 'Quiz - OS Process Mgmt', '2023-02-05', 30, 20, 10, 'Quiz', 'Room A105', 3),
(4, 4, 'Midterm - Networking', '2023-03-18', 60, 50, 20, 'Midterm', 'Room C301', 4),
(5, 5, 'Final - Software Engineering', '2023-06-10', 120, 100, 40, 'Final', 'Room B103', 5),
(6, 6, 'Quiz - Data Structures Basics', '2023-01-28', 45, 25, 10, 'Quiz', 'Lab C201', 6),
(7, 7, 'Final - AI Theory', '2023-05-01', 120, 100, 50, 'Final', 'Room A204', 7),
(8, 8, 'Midterm - Machine Learning', '2023-03-20', 90, 50, 25, 'Midterm', 'Lab A110', 8),
(9, 9, 'Quiz - Web Development', '2023-02-22', 30, 20, 10, 'Quiz', 'Room C105', 9),
(10, 10, 'Final - Cyber Security', '2023-06-15', 120, 100, 50, 'Final', 'Room B301', 10);

-- ----- to display  table data --------------------------

select*from Exams ;

-- ------ to remove complete records from table --------------

truncate  table Exams;

-- ------- to remove  complete records and attribute form table  -------

drop table Exams;

-- Table 7 Results
CREATE TABLE Results (
    ResultID INT PRIMARY KEY,
    ExamID INT,
    StudentID INT,
    MarksObtained INT,
    Grade VARCHAR(5),
    ResultStatus VARCHAR(20),
    Remarks TEXT,
    PublishedDate DATE,
    EvaluatedBy INT,
    RevaluationStatus VARCHAR(20),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (EvaluatedBy) REFERENCES Faculty(FacultyID)
);

INSERT INTO Results (ResultID, ExamID, StudentID, MarksObtained, Grade, ResultStatus, Remarks, PublishedDate, EvaluatedBy, RevaluationStatus) VALUES
(1, 1, 1, 88, 'A', 'Pass', 'Excellent grasp of programming concepts', '2023-03-20', 1, 'Not Requested'),
(2, 2, 2, 72, 'B+', 'Pass', 'Solid understanding of DBMS', '2023-05-25', 2, 'Not Requested'),
(3, 3, 3, 18, 'A-', 'Pass', 'Very good on OS quiz', '2023-02-06', 3, 'Not Requested'),
(4, 4, 4, 42, 'B', 'Pass', 'Good effort in networking exam', '2023-03-22', 4, 'Not Requested'),
(5, 5, 5, 38, 'C+', 'Fail', 'Needs improvement in SE concepts', '2023-06-15', 5, 'Requested'),
(6, 6, 6, 23, 'A', 'Pass', 'Strong knowledge in data structures', '2023-01-30', 6, 'Not Requested'),
(7, 7, 7, 90, 'A+', 'Pass', 'Outstanding in AI exam', '2023-05-05', 7, 'Not Requested'),
(8, 8, 8, 46, 'B+', 'Pass', 'Good application of ML techniques', '2023-03-25', 8, 'Not Requested'),
(9, 9, 9, 19, 'A-', 'Pass', 'Very interactive and practical', '2023-02-24', 9, 'Not Requested'),
(10, 10, 10, 59, 'B', 'Pass', 'Basic cyber security principles covered', '2023-06-18', 10, 'Not Requested');

-- ----- to display  table data --------------------------

select*from Results ;

-- ------ to remove complete records from table --------------

truncate  table Results;

-- ------- to remove  complete records and attribute form table  -------

drop table Results;


-- Table 8 Library
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Publisher VARCHAR(100),
    PublishYear INT,
    Category VARCHAR(50),
    QuantityAvailable INT,
    RackNumber VARCHAR(10),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- ---- insert the value in table 
INSERT INTO Library (BookID, Title, Author, ISBN, Publisher, PublishYear, Category, QuantityAvailable, RackNumber, DepartmentID) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', '9780262033848', 'MIT Press', 2009, 'Computer Science', 5, 'CS-01', 1),
(2, 'Database System Concepts', 'Abraham Silberschatz', '9780078022159', 'McGraw-Hill', 2010, 'Database', 4, 'DB-03', 2),
(3, 'Operating System Concepts', 'Silberschatz & Galvin', '9781118063330', 'Wiley', 2012, 'Operating Systems', 3, 'OS-04', 3),
(4, 'Computer Networks', 'Andrew S. Tanenbaum', '9780132126953', 'Pearson', 2011, 'Networking', 6, 'NET-02', 4),
(5, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', '9780136042594', 'Pearson', 2015, 'AI', 5, 'AI-05', 5),
(6, 'Machine Learning', 'Tom M. Mitchell', '9780070428072', 'McGraw-Hill', 1997, 'ML', 2, 'ML-01', 6),
(7, 'Web Technologies', 'Achyut Godbole', '9780070140698', 'McGraw-Hill', 2011, 'Web Dev', 7, 'WD-02', 7),
(8, 'Cyber Security Essentials', 'Charles J. Brooks', '9781284090703', 'Jones & Bartlett', 2016, 'Security', 4, 'SEC-03', 8),
(9, 'Software Engineering', 'Ian Sommerville', '9780137035151', 'Pearson', 2010, 'SE', 5, 'SE-04', 9),
(10, 'Data Structures Using C', 'Reema Thareja', '9780198086289', 'Oxford University Press', 2011, 'Data Structures', 3, 'DS-06', 10);

-- ----- to display  table data --------------------------

select*from Library ;

-- ------ to remove complete records from table --------------

truncate  table Library;

-- ------- to remove  complete records and attribute form table  -------

drop table Library;

-- Table 9 Hostels
CREATE TABLE Hostels (
    HostelID INT PRIMARY KEY,
    HostelName VARCHAR(100),
    Capacity INT,
    Gender VARCHAR(10),
    WardenName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Location VARCHAR(100),
    EstablishmentYear INT,
    RoomsAvailable INT,
    FeePerSemester DECIMAL(10,2)
);

-- ---- insert the value in table 
INSERT INTO Hostels (HostelID, HostelName, Capacity, Gender, WardenName, ContactNumber, Location, EstablishmentYear, RoomsAvailable, FeePerSemester) VALUES
(1, 'Nalanda Boys Hostel', 150, 'Male', 'Rajesh Kumar', '9876543210', 'North Campus Block A', 2005, 50, 18000.00),
(2, 'Takshashila Girls Hostel', 120, 'Female', 'Anita Sharma', '9765432109', 'South Campus Block B', 2007, 40, 20000.00),
(3, 'Aryabhata Hostel', 100, 'Male', 'Praveen Singh', '9654321876', 'East Campus Block C', 2010, 35, 15000.00),
(4, 'Kalpana Chawla Hostel', 80, 'Female', 'Sunita Desai', '9543218765', 'West Campus Block D', 2012, 30, 22000.00),
(5, 'CV Raman Hostel', 130, 'Male', 'Alok Pandey', '9432187654', 'Central Campus', 2008, 45, 17000.00),
(6, 'Indira Gandhi Hostel', 90, 'Female', 'Meera Nair', '9321876543', 'New Girls Wing', 2015, 32, 21000.00),
(7, 'APJ Abdul Kalam Hostel', 160, 'Male', 'Suresh Patil', '9218765432', 'Old Boys Block', 2004, 48, 19000.00),
(8, 'Sarojini Naidu Hostel', 100, 'Female', 'Deepa Iyer', '9876215430', 'Girls Tower A', 2009, 33, 19500.00),
(9, 'Vikram Sarabhai Hostel', 110, 'Male', 'Harish K', '9854321670', 'Science Wing Extension', 2013, 38, 17500.00),
(10, 'Mother Teresa Hostel', 95, 'Female', 'Jyoti Rao', '9832154670', 'West End Block E', 2016, 36, 20500.00);

-- ----- to display  table data --------------------------

select*from Hostels ;

-- ------ to remove complete records from table --------------

truncate  table Hostels;

-- ------- to remove  complete records and attribute form table  -------

drop table Hostels;

-- Table 10 StudentHostelAssignment
CREATE TABLE StudentHostelAssignment (
    AssignmentID INT PRIMARY KEY,
    StudentID INT,
    HostelID INT,
    RoomNumber VARCHAR(10),
    BedNumber INT,
    AssignedDate DATE,
    FeePaid DECIMAL(10,2),
    ValidTill DATE,
    Status VARCHAR(20),
    Remarks TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (HostelID) REFERENCES Hostels(HostelID)
);

-- ---- insert the value in table 
INSERT INTO StudentHostelAssignment (AssignmentID, StudentID, HostelID, RoomNumber, BedNumber, AssignedDate, FeePaid, ValidTill, Status, Remarks) VALUES
(1, 1, 1, 'A101', 1, '2023-07-01', 18000.00, '2024-06-30', 'Active', 'No issues reported'),
(2, 2, 2, 'B203', 2, '2023-07-05', 20000.00, '2024-06-30', 'Active', 'Room shared with 1 roommate'),
(3, 3, 3, 'C110', 1, '2022-08-15', 15000.00, '2023-07-31', 'Expired', 'Shifted to off-campus housing'),
(4, 4, 4, 'D305', 2, '2023-01-10', 22000.00, '2024-01-09', 'Active', 'Quiet room'),
(5, 5, 5, 'C201', 1, '2023-06-20', 17000.00, '2024-06-19', 'Active', 'Requested fan repair'),
(6, 6, 6, 'E104', 1, '2022-07-01', 21000.00, '2023-06-30', 'Expired', 'Transferred to another hostel'),
(7, 7, 7, 'F312', 3, '2023-03-01', 19000.00, '2024-02-29', 'Active', 'Top floor room'),
(8, 8, 8, 'G205', 2, '2023-08-01', 19500.00, '2024-07-31', 'Active', 'Minor plumbing issues resolved'),
(9, 9, 9, 'H107', 1, '2022-09-10', 17500.00, '2023-09-09', 'Expired', 'Left due to semester abroad'),
(10, 10, 10, 'I303', 2, '2023-06-15', 20500.00, '2024-06-14', 'Active', 'Clean and well-maintained');

-- ----- to display  table data --------------------------

select*from StudentHostelAssignment ;

-- ------ to remove complete records from table --------------

truncate  table StudentHostelAssignment;

-- ------- to remove  complete records and attribute form table  -------

drop table StudentHostelAssignment;