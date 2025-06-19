-- single line comment -------
/*
multi 
line 
comment 
*/ 

-- create database -----
create database Univercity ;
drop  database Univercity;
-- to work on this database, you need to use it first
-- to execute (ctrl + enter)

 use Univercity ;
 
 -- SQL is not a case-sensitive language (As- AGE or age will be treated as same word)

-- --------------------------------------- Database Analysis --------------------------------------------

/*

T1 : Student(id,name,std,address,age)

T2 : Teachers(TeacherID,Name,Subject,Experience,Email)

T3 : Classes(ClassID,ClassName,Section,TotalStudents,TeacherID)

T4 : Subjects(SubjectID,SubjectName,Credits,ClassID)

T5 : Exams(ExamID,ExamName,Date,TotalMarks,ClassID)

T6 : Attendance(AttendanceID,StudentID,ClassID,Date,Status)

T7 : Grades(GradeID,StudentID,SubjectID,Marks)

T8 : Library(BookID,Title,Author,ISBN,AvailableCopies)

T9 : ExtracurricularActivities(ActivityID,ActivityName,Description,ClassID)

T10: ParentDetails(ParentID,StudentID,ParentName,Relationship,ContactNumber)

T11: Fees( FeeID ,StudentID	,Amount	,DueDate ,Status) 

T12: Timetable(TimetableID,ClassID,SubjectID,DayOfWeek,StartTime,EndTime)

T13: Assignments(AssignmentID,SubjectID,ClassID,Title,DueDate)

T14: Hostel( HostelID,HostelName,Capacity,WardenName,ContactNumber)

T15: Scholarships(ScholarshipID,ScholarshipName,Description,Amount,StartDate,EndDate)
*/

-- table 1 Students
-- create table Students(id,name,std,address,age)
create table Students(
StudentId int primary key,
Name varchar (100) , 
Std varchar (20) ,
Address varchar (100),
Age int 
);

-- insert  a values in student table 
insert into Students 
values
 ( 1 , 'yash', '7th' , 'Mumbai' , 12 ),
 ( 2 , 'viraj', '9th' , 'Mumbai' , 13 ),
 ( 3 , 'pratik', '4th' , 'Mumbai' , 9 ),
 ( 4 , 'parag ', '6th' , 'Mumbai' , 11 ),
 ( 5 , 'sumit', '8th' , 'Mumbai' , 13);
 
 -- Display the table students 
select * from Students ;

truncate table Students ;

drop table Student ;


-- table 2 Teachers
-- create table Teachers(TeacherID,Name,Subject,Experience,Email)

create table Teachers (
TeacherId int primary key , 
Name  varchar (100) , 
Subject varchar (100), 
Experience int ,
Email varchar (100)
); 
 -- --insert  a values in Teachers table
insert into Teachers 
values 
( 11, 'vishal','marathi', 1 , ' vishal09@Example'),
( 12, 'vijay','English', 2 , ' vijay56@Example'),
( 13, 'akash','science ', 1 , ' akash23@Example'),
( 14, 'prathamesh ','hindi', 4, ' prathamesh45@Example'),
( 15, 'ajay ','mathmatics', 4, ' ajay09@Example');

-- display from Teachers table 
select * from Teachers ;

truncate table Teachers;

drop table teachers;

-- table 3 Classes
-- create table Classes(ClassID,ClassName,Section,TotalStudents,TeacherID)
 create table Classes (
 ClassId  int primary key , 
 ClassName varchar (100),
 Section char (10), 
 TotalStudents int , 
 TeacherId int ,
 foreign key (TeacherId) references Teachers (TeacherId)
);

insert into Classes 
values 
(6, '10th', 'A', 30, 11),
(7, '9th', 'B', 25, 12),
(8, '11th', 'C', 20, 13),
(9, '8th', 'A', 28,14),
(10, '12th', 'B', 22, 15);

-- display from Teachers table 
 select*from Classes ;
 
 truncate table Classes;
 
 drop table Classes ;
 
-- table 4 Subjects
-- create table  Subjects(SubjectID,SubjectName,Credits,ClassID)
create table Subjects
( SubjectID int primary key  ,
SubjectName varchar (100),
Credits int,
ClassID int,  
foreign key (ClassId) references Classes(ClassId)
);

insert into Subjects 
values 
(1, 'Mathematics', 4,6),
(2, 'Science', 4,7),
(3, 'English', 3,8),
(4, 'History', 3,9),
(5, 'Geography', 3,10);

-- display from Subjects  table 
 select*from Subjects  ;
 
 truncate table Subjects ;
 
 drop table Subjects  ;
 
-- Table 5: Exams
create table Exams (
    ExamID int primary key ,
    ExamName varchar (100),
    Date DATE,
    TotalMarks int,
    ClassID int,
    foreign key( ClassID ) references classes  ( ClassID )
);

insert into Exams 
values
(111, 'Mid Term Exam', '2023-10-15', 100, 6),
(222, 'Final Exam', '2023-12-20', 100,7),
(333, 'Unit Test', '2023-11-10', 50,8),
(444, 'Quarterly Exam', '2023-09-25', 75,9),
(555, 'Annual Exam', '2024-03-15', 100,10);

-- display from Exams   table 
 select*from Exams  ;
 
 truncate table Exams ;
 
 drop table Exams ;
 
-- Table 6: Attendance 
create table Attendance (
    AttendanceID int primary key , 
    StudentId int ,
    ClassID int , 
    Date DATE,
    Status ENUM('Present', 'Absent'),
    foreign key(studentId) references students (StudentId),
    foreign key(classId) references classes (classId)
);

insert into Attendance 
values
(21, 1, 11, '2023-10-01', 'Present'),
(22, 2, 12, '2023-10-01', 'Absent'),
(23, 3, 13, '2023-10-01', 'Present'),
(24, 4, 14, '2023-10-01', 'Present'),
(25, 5, 15, '2023-10-01', 'Absent');



-- display from Attendance  table 
 select*from Attendance ;
 
 truncate table Attendance;
 
 drop table Attendance;
 
-- Table 7: Grades
create table  Grades (
    GradeID int primary key ,
    StudentID int ,
    SubjectID int ,
    Marks int,
    foreign key (StudentID) references Students(StudentID),
    foreign key (SubjectID) references Subjects(SubjectID)
);

insert into Grades 
value
(1, 1, 1, 85),
(2, 2, 2, 78),
(3, 3, 3, 90),
(4, 4, 4, 88),
(5, 5, 5, 92);

-- display from Grades  table 
 select*from  Grades ;
 
 truncate table  Grades ;
 
 drop table  Grades ;

-- Table 8: Library
create table Library (
    BookID int primary key,
    Title varchar (100),
    Author varchar (100),
    ISBN varchar(20),
    AvailableCopies int
);

insert into  Library 
values
(1, 'The Alchemist', 'Paulo Coelho', '978-0061122415', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', '978-0061120084', 3),
(3, '1984', 'George Orwell', '978-0451524935', 4),
(4, 'Pride and Prejudice', 'Jane Austen', '978-1503290563', 2),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 6);

-- display from  Library  table 
 select*from  Library  ;
 
 truncate table   Library  ;
 
 drop table   Library ;
 
-- Table 9: ExtracurricularActivities
create table ExtracurricularActivities (
    ActivityID int primary key ,
    ActivityName varchar(100),
    Description TEXT,
    ClassID int, 
	foreign key(classId) references classes (classId)
);

insert into ExtracurricularActivities 
values
(1, 'Basketball', 'Team sport played on a court.', 6),
(2, 'Debate Club', 'A club for debating current issues.', 7),
(3, 'Science Club', 'A club for science enthusiasts.', 8),
(4, 'Drama Club', 'A club for aspiring actors.', 9),
(5, 'Art Club', 'A club for artists and creative minds.', 10);

-- display from  ExtracurricularActivities  table 
 select*from  ExtracurricularActivities  ;
 
 truncate table  ExtracurricularActivities  ;
 
 drop table ExtracurricularActivities ;
 
-- Table 10: ParentDetails
create table  ParentDetails (
    ParentID int primary key ,
    StudentID int ,
    ParentName varchar(100),
    Relationship varchar(50),
    ContactNumber varchar (15),
   foreign key (StudentID) references Students(StudentID)
);

insert into ParentDetails 
values
(1, 1, 'Mr. Anil Sharma', 'Father', '9876543210'),
(2, 2, 'Mrs. Sunita Patel', 'Mother', '9876543211'),
(3, 3, 'Mr. Raj Verma', 'Father', '9876543212'),
(4, 4, 'Mrs. Kavita Iyer', 'Mother', '9876543213'),
(5, 5, 'Mr. Vikram Singh', 'Father', '9876543214');

-- display from  ParentDetails  table 
 select*from   ParentDetails   ;
 
 truncate table   ParentDetails   ;
 
 drop table  ParentDetails  ;
 
-- table 11 Fees 
-- create fees table 
create table fees (
    feeid int primary key, 
    studentid int,
    amount decimal(10,2),
    duedate date, 
    status varchar(20), 
    foreign key (studentid) references Students(studentid)
);

-- insert value in fees table
insert into fees 
value 
(1, 1, 15000.00, '2025-06-30', 'paid'),
(2, 2, 14000.00, '2025-06-30', 'unpaid'),
(3, 3, 15000.00, '2025-06-30', 'paid'),
(4, 4, 14000.00, '2025-06-30', 'unpaid'),
(5, 5, 15000.00, '2025-06-30', 'paid');

-- display from fees  table 
 select*from   fees   ;
 
 truncate table   fees   ;
 
 drop table  fees  ;
 
-- table 12 timetable 
-- create table timetable

create table timetable (
    timetableid int primary key, 
    classid int, 
    subjectid int, 
    dayofweek varchar(10), 
    starttime time, 
    endtime time,
    foreign key(classId) references classes (classId),
	foreign key(subjectid) references subjects (subjectid)
);

-- insert value in timetable 
insert into timetable 
values
(11, 6, 1, 'monday', '09:00:00', '10:00:00'),
(22, 7, 2, 'tuesday', '10:00:00', '11:00:00'),
(33, 8, 3, 'wednesday', '11:00:00', '12:00:00'),
(44, 9, 4, 'monday', '11:00:00', '12:00:00'),
(55, 10, 5, 'tuesday', '11:00:00', '12:00:00');

-- display from timetable  table 
 select*from timetable  ;
 
 truncate table  timetable  ;
 
 drop table  timetable  ;
 
-- table 13  assignments
-- create table assignments
create table assignments (
    assignmentid int primary key, 
    subjectid int, 
    classid int, 
    title varchar(100), 
    duedate date,
	foreign key(classId) references classes (classId),
	foreign key(subjectid) references subjects (subjectid)
);

-- insert value in  assignments
insert into assignments 
 values
(1, 1, 6, 'algebra homework', '2025-06-15'),
(2, 2, 7, 'science project', '2025-06-20'),
(3, 3, 8, 'algebra homework', '2025-06-15'),
(4, 4, 9, 'science project', '2025-06-20'),
(5, 5, 10, 'essay writing', '2025-06-25');

-- display from assignments  table 
 select*from assignments  ;
 
 truncate table  assignments  ;
 
 drop table  assignments  ;
 
-- table 14 hostel
-- create table hostel
create table hostel (
    hostelid int primary key,
    hostelname varchar(100), 
    capacity int, 
    wardenname varchar(100), 
    contactnumber varchar(15) 
);

-- insert value in  hostel 
insert into hostel 
values
(1, 'sunrise hostel', 100, 'mr. kapoor', '9123456780'),
(2, 'moonlight hostel', 80, 'ms. rao', '9234567891'),
(3, 'moonlight hostel', 80, 'ms. rao', '9234457891'),
(4, 'moonlight hostel', 80, 'mr.kapoor', '23443567891'),
(5, 'sunrise hostel', 60, 'mr.kapoor', '2346474791');

-- display from hostel   table 
 select*from hostel   ;
 
 truncate table  hostel   ;
 
 drop table  hostel   ;

-- table 15 scholarships
-- create table scholarships
create table scholarships (
    scholarshipid int primary key, 
    scholarshipname varchar(100), 
    description text, 
    amount decimal(10,2), 
    startdate date, 
    enddate date 
);

-- insert value in scholarships
insert into scholarships 
values
(1, 'merit-based scholarship', 'awarded to students with outstanding academic achievements.', 10000.00, '2025-01-01', '2025-12-31'),
(2, 'need-based scholarship', 'provided to students who demonstrate financial need.', 8000.00, '2025-02-01', '2025-11-30'),
(3, 'sports excellence scholarship', 'for students excelling in sports at the state or national level.', 12000.00, '2025-03-01', '2025-10-31'),
(4, 'arts talent scholarship', 'awarded to students with exceptional talent in arts and music.', 9000.00, '2025-04-01', '2025-09-30'),
(5, 'science innovation scholarship', 'for students who have demonstrated innovation in scientific projects.', 11000.00, 
'2025-05-01', '2025-08-31');

-- display from scholarships   table 
 select*from scholarships   ;
 
 truncate table  scholarships   ;
 
 drop table  scholarships   ;