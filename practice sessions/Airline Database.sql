-- Single Line Comment

/*
Multi
Line
Comments
*/

## This is also used as single line comment in sql

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.



-- ----------------------------------------- Database Queries ------------------------------------------

-- create a database first

create database Airline ;

-- to work on this database, you need to use it first
-- to execute (ctrl + enter)
use Airline ;

-- SQL is not a case-sensitive language (As- AGE or age will be treated as same word)

-- --------------------------------------- Database Analysis --------------------------------------------
/*
T1 : Airports( AirportID, Name, City, Country, Code, Latitude, Longitude, Timezone, Altitude_ft, Type)
T2 : Airlines(AirlineID, Name, Code, Country, Rating, EstablishedYear, Alliance, FleetSize, Website, Active)
T3 : Aircraft (AircraftID, Model, Manufacturer, Capacity, RegistrationNo, ManufactureYear, MTOW_kg, Range_km, LastMaintDate, Status)
T4 : Flights (FlightID, FlightNumber, AirlineID, SourceAirportID, DestinationAirportID, AircraftID, Codeshare, Distance_km, Status, Duration_min)
T5 : Bookings(BookingID, PassengerID, ScheduleID, SeatNo, BookingDate, Fare, Status, PaymentID, TicketID, Class)
T6 : CrewMembers(CrewID, Name, Role, AirlineID, ExperienceYrs, LicenseNo, BaseAirportID, HireDate, Contact, Active)
T7 : Schedules(ScheduleID, FlightID, Date, DepTime, ArrTime, Gate, Status, Remarks, CrewAssigned, BoardClosed)
T8 : Payments(PaymentID, BookingID, Amount, Method, PaymentDate, Status, TransactionNo, CardType, Currency, ReceivedBy)
T9 : Tickets( TicketID, BookingID, TicketNumber, IssueDate, ClassType, IssuedBy, CheckedIn, BaggageAllowed, SeatAllocated, ValidTill)
T10: Passengers(PassengerID, FirstName, LastName, DOB, PassportNo, Nationality, Gender, Email, Phone, FFNumber)
*/
-- --------------------------------------- Table Related Queries ---------------------------------

-- 1. Airports Table
 CREATE TABLE Airports (
    AirportID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    Code VARCHAR(10) UNIQUE NOT NULL, 
    Latitude DECIMAL(9,6) NOT NULL,
    Longitude DECIMAL(9,6) NOT NULL,
    Timezone VARCHAR(50) NOT NULL,
    Altitude_ft INT,
    Type VARCHAR(50) 
);

INSERT INTO Airports VALUES 
(1, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India', 'BOM', 19.0896, 72.8656, 'Asia/Kolkata', 37, 'International'),
(2, 'Indira Gandhi International Airport', 'Delhi', 'India', 'DEL', 28.5562, 77.1000, 'Asia/Kolkata', 777, 'International'),
(3, 'Kempegowda International Airport', 'Bangalore', 'India', 'BLR', 13.1979, 77.7063, 'Asia/Kolkata', 3000, 'International'),
(4, 'Rajiv Gandhi International Airport', 'Hyderabad', 'India', 'HYD', 17.2403, 78.4294, 'Asia/Kolkata', 2020, 'International'),
(5, 'Shirdi Airport', 'Shirdi', 'India', 'SAG', 19.6883, 74.3781, 'Asia/Kolkata', 1900, 'Domestic'),
(6, 'Lohegaon Airport', 'Pune', 'India', 'PNQ', 18.5822, 73.9197, 'Asia/Kolkata', 1990, 'Domestic'),
(7, 'Dabolim Airport', 'Goa', 'India', 'GOI', 15.3800, 73.8311, 'Asia/Kolkata', 152, 'International'),
(8, 'DYP Patil Airport', 'Panvel', 'India', 'DYP', 18.9900, 73.1100, 'Asia/Kolkata', 85, 'Domestic'),
(9, 'Chennai International Airport', 'Chennai', 'India', 'MAA', 12.9941, 80.1709, 'Asia/Kolkata', 16, 'International'),
(10, 'Netaji Subhas Chandra Bose International Airport', 'Kolkata', 'India', 'CCU', 22.6547, 88.4467, 'Asia/Kolkata', 16, 'International');

select*from Airports ; 

truncate table Airports ;

drop  table Airports ;

-- 2. Airlines Table
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Code VARCHAR(10) UNIQUE NOT NULL, 
    Country VARCHAR(100) NOT NULL,
    Rating DECIMAL(2,1) CHECK (Rating >= 0 AND Rating <= 5),
    EstablishedYear INT CHECK (EstablishedYear >= 1900 ),
    Alliance VARCHAR(50), 
    FleetSize INT CHECK (FleetSize >= 0),
    Website VARCHAR(150),
    Active BOOLEAN DEFAULT TRUE
);


INSERT INTO Airlines VALUES 
(1, 'Air India', 'AI', 'India', 4.1, 1932, 'Star Alliance', 125, 'https://www.airindia.in', TRUE),
(2, 'IndiGo', '6E', 'India', 4.5, 2006, NULL, 310, 'https://www.goindigo.in', TRUE),
(3, 'SpiceJet', 'SG', 'India', 3.9, 2005, NULL, 90, 'https://www.spicejet.com', TRUE),
(4, 'Vistara', 'UK', 'India', 4.3, 2015, 'Star Alliance', 50, 'https://www.airvistara.com', TRUE),
(5, 'Go First', 'G8', 'India', 3.2, 2005, NULL, 55, 'https://www.flygofirst.com', FALSE),
(6, 'AirAsia India', 'I5', 'India', 3.8, 2014, 'AirAsia Group', 30, 'https://www.airasia.co.in', TRUE),
(7, 'Emirates', 'EK', 'UAE', 4.7, 1985, NULL, 270, 'https://www.emirates.com', TRUE),
(8, 'Qatar Airways', 'QR', 'Qatar', 4.9, 1993, 'OneWorld', 250, 'https://www.qatarairways.com', TRUE),
(9, 'Lufthansa', 'LH', 'Germany', 4.2, 1953, 'Star Alliance', 300, 'https://www.lufthansa.com', TRUE),
(10, 'British Airways', 'BA', 'UK', 4.0, 1974, 'OneWorld', 280, 'https://www.britishairways.com', TRUE);

select*from Airlines ; 

truncate table Airlines ;

drop  table Airlines ;


-- 3. Aircraft Table
CREATE TABLE Aircraft (
    AircraftID INT PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    Capacity INT CHECK (Capacity > 0),
    RegistrationNo VARCHAR(20) UNIQUE NOT NULL, 
    ManufactureYear INT ,
    MTOW_kg INT CHECK (MTOW_kg > 0), 
    Range_km INT CHECK (Range_km > 0), 
    LastMaintDate DATE,
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Maintenance', 'Retired'))
);

INSERT INTO Aircraft VALUES
(1, 'A320neo', 'Airbus', 180, 'VT-IKH', 2018, 79000, 6500, '2025-06-01', 'Active'),
(2, 'B737-800', 'Boeing', 189, 'VT-SLA', 2016, 79015, 5436, '2025-05-10', 'Active'),
(3, 'A321XLR', 'Airbus', 244, 'VT-VWX', 2022, 97000, 8700, '2025-06-15', 'Active'),
(4, 'B777-300ER', 'Boeing', 396, 'VT-ALJ', 2012, 351534, 13649, '2025-04-28', 'Maintenance'),
(5, 'A350-900', 'Airbus', 325, 'VT-AKT', 2020, 280000, 15000, '2025-06-05', 'Active'),
(6, 'B787-8', 'Boeing', 242, 'VT-ANZ', 2017, 227930, 14140, '2025-06-20', 'Active'),
(7, 'ATR 72-600', 'ATR', 72, 'VT-RKM', 2019, 23000, 1500, '2025-07-01', 'Active'),
(8, 'Embraer E195-E2', 'Embraer', 132, 'VT-EMB', 2021, 61500, 4800, '2025-06-25', 'Active'),
(9, 'B747-400', 'Boeing', 416, 'VT-EVA', 2008, 396900, 13450, '2024-12-15', 'Retired'),
(10, 'A330-300', 'Airbus', 277, 'VT-AAV', 2010, 242000, 11300, '2025-03-12', 'Maintenance');

select*from Aircraft ; 

truncate table Aircraft ;

drop  table Aircraft ;

-- 4. Flights Table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(20) UNIQUE NOT NULL,
    AirlineID INT,
    SourceAirportID INT,
    DestinationAirportID INT,
    AircraftID INT,
    Codeshare BOOLEAN DEFAULT FALSE,
    Distance_km INT CHECK (Distance_km > 0),
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'Cancelled', 'Departed', 'Arrived', 'Delayed')),
    Duration_min INT CHECK (Duration_min > 0),
    
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
    FOREIGN KEY (SourceAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
);

INSERT INTO Flights VALUES
(1, 'AI101', 1, 1, 2, 1, FALSE, 1150, 'Scheduled', 130),
(2, '6E202', 2, 1, 6, 2, FALSE, 150, 'Departed', 60),
(3, 'UK303', 4, 2, 3, 3, FALSE, 1740, 'Scheduled', 150),
(4, 'SG401', 3, 3, 4, 4, TRUE, 510, 'Cancelled', 80),
(5, 'G8305', 5, 2, 5, 5, FALSE, 240, 'Delayed', 75),
(6, 'I5120', 6, 6, 1, 6, FALSE, 150, 'Arrived', 60),
(7, 'EK500', 7, 1, 9, 7, FALSE, 2690, 'Scheduled', 180),
(8, 'QR511', 8, 2, 10, 8, TRUE, 3360, 'Scheduled', 210),
(9, 'LH760', 9, 9, 2, 9, FALSE, 6300, 'Arrived', 450),
(10, 'BA143', 10, 2, 1, 10, TRUE, 7200, 'Departed', 480);

select*from Flights ; 

truncate table Flights ;

drop  table Flights ;


-- 5. Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    ScheduleID INT,
    SeatNo VARCHAR(10) NOT NULL,
    BookingDate DATE NOT NULL,
    Fare DECIMAL(10,2) ,
    Status VARCHAR(20) CHECK (Status IN ('Confirmed', 'Cancelled', 'Pending')),
    PaymentID INT,
    TicketID INT,
    Class VARCHAR(20) CHECK (Class IN ('Economy', 'Business', 'First')),

    FOREIGN KEY (ScheduleID) REFERENCES Flights(FlightID)
);


INSERT INTO Bookings VALUES
(1, 101, 1, '12A', '2025-07-01', 4500.00, 'Confirmed', 201, 301, 'Economy'),
(2, 102, 2, '14C', '2025-07-02', 3200.00, 'Pending', 202, 302, 'Economy'),
(3, 103, 3, '1B',  '2025-07-03', 8500.00, 'Confirmed', 203, 303, 'Business'),
(4, 104, 4, '22F', '2025-07-04', 2700.00, 'Cancelled', 204, 304, 'Economy'),
(5, 105, 5, '3A',  '2025-07-05', 11000.00, 'Confirmed', 205, 305, 'First'),
(6, 106, 6, '15D', '2025-07-06', 3100.00, 'Confirmed', 206, 306, 'Economy'),
(7, 107, 7, '10E', '2025-07-07', 2600.00, 'Pending', 207, 307, 'Economy'),
(8, 108, 8, '2C',  '2025-07-08', 9000.00, 'Confirmed', 208, 308, 'Business'),
(9, 109, 9, '5F',  '2025-07-09', 13000.00, 'Confirmed', 209, 309, 'First'),
(10, 110, 10, '18B','2025-07-10', 4400.00, 'Cancelled', 210, 310, 'Economy');

select*from Bookings ; 

truncate table Bookings ;

drop  table Bookings ;


-- 6. CrewMembers Table
CREATE TABLE CrewMembers (
    CrewID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50) CHECK (Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer', 'Navigator')),
    AirlineID INT,
    ExperienceYrs INT CHECK (ExperienceYrs >= 0),
    LicenseNo VARCHAR(50) UNIQUE,
    BaseAirportID INT,
    HireDate DATE,
    Contact VARCHAR(20),
    Active BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
    FOREIGN KEY (BaseAirportID) REFERENCES Airports(AirportID)
);


INSERT INTO CrewMembers VALUES
(1, 'Captain Raj Mehra', 'Pilot', 1, 15, 'LIC-AI-12345', 1, '2010-06-15', '+91-9876543210', TRUE),
(2, 'Anita Joshi', 'Flight Attendant', 2, 7, 'LIC-6E-22567', 2, '2018-03-22', '+91-9123456780', TRUE),
(3, 'Vikram Sethi', 'Co-Pilot', 3, 8, 'LIC-SG-33901', 3, '2016-11-10', '+91-9988776655', TRUE),
(4, 'Rohit Kumar', 'Pilot', 4, 10, 'LIC-UK-88223', 4, '2014-01-05', '+91-8866554433', TRUE),
(5, 'Sneha Rane', 'Flight Attendant', 5, 5, 'LIC-G8-55442', 5, '2019-08-18', '+91-9356677889', TRUE),
(6, 'Captain Amir Khan', 'Pilot', 6, 18, 'LIC-I5-99001', 6, '2007-04-02', '+91-9090909090', TRUE),
(7, 'Meera D\'Souza', 'Flight Attendant', 7, 6, 'LIC-EK-77665', 1, '2020-09-12', '+91-8765432100', TRUE),
(8, 'John Mathew', 'Engineer', 8, 12, 'LIC-QR-44002', 2, '2011-12-01', '+91-8899776655', TRUE),
(9, 'Nikita Sharma', 'Navigator', 9, 9, 'LIC-LH-90090', 9, '2013-05-27', '+91-8080808080', FALSE),
(10, 'Karan Singh', 'Co-Pilot', 10, 11, 'LIC-BA-77777', 10, '2012-02-19', '+91-9234567890', TRUE);

select*from CrewMembers ; 

truncate table CrewMembers ;

drop  table CrewMembers ;


-- 7. Schedules Table
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY,
    FlightID INT,
    Date DATE NOT NULL,
    DepTime TIME NOT NULL,
    ArrTime TIME NOT NULL,
    Gate VARCHAR(10),
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'Cancelled', 'Departed', 'Delayed', 'Arrived')),
    Remarks VARCHAR(255),
    CrewAssigned BOOLEAN DEFAULT FALSE,
    BoardClosed BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);



INSERT INTO Schedules VALUES
(1, 1, '2025-07-12', '08:30:00', '10:40:00', 'A1', 'Scheduled', 'On time', TRUE, FALSE),
(2, 2, '2025-07-12', '12:15:00', '13:30:00', 'B2', 'Departed', 'Departed 10 min early', TRUE, TRUE),
(3, 3, '2025-07-13', '06:00:00', '08:45:00', 'C1', 'Cancelled', 'Technical issue', FALSE, FALSE),
(4, 4, '2025-07-13', '15:50:00', '17:10:00', 'D3', 'Scheduled', 'New aircraft assigned', TRUE, FALSE),
(5, 5, '2025-07-14', '09:20:00', '10:35:00', 'E5', 'Delayed', 'Weather conditions', TRUE, FALSE),
(6, 6, '2025-07-14', '18:00:00', '19:15:00', 'F4', 'Arrived', 'Smooth landing', TRUE, TRUE),
(7, 7, '2025-07-15', '11:45:00', '14:45:00', 'G6', 'Scheduled', 'Security check completed', TRUE, FALSE),
(8, 8, '2025-07-15', '21:10:00', '00:10:00', 'H1', 'Scheduled', 'Overnight flight', TRUE, FALSE),
(9, 9, '2025-07-16', '07:00:00', '14:30:00', 'I2', 'Departed', 'Flight took off on time', TRUE, TRUE),
(10, 10, '2025-07-16', '16:30:00', '00:30:00', 'J3', 'Scheduled', 'International gate', TRUE, FALSE);

select*from Schedules ; 

truncate table Schedules ;

drop  table Schedules ;


-- 8. Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2) CHECK (Amount >= 0),
    Method VARCHAR(30) CHECK (Method IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash', 'Wallet')),
    PaymentDate DATE NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Success', 'Failed', 'Pending', 'Refunded')),
    TransactionNo VARCHAR(50) UNIQUE NOT NULL,
    CardType VARCHAR(20), 
    Currency VARCHAR(10) DEFAULT 'INR',
    ReceivedBy VARCHAR(50),

    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Payments VALUES
(201, 1, 4500.00, 'UPI', '2025-07-01', 'Success', 'TXN10001', NULL, 'INR', 'Self-Service'),
(202, 2, 3200.00, 'Credit Card', '2025-07-02', 'Pending', 'TXN10002', 'Visa', 'INR', 'Agent01'),
(203, 3, 8500.00, 'Net Banking', '2025-07-03', 'Success', 'TXN10003', NULL, 'INR', 'Self-Service'),
(204, 4, 2700.00, 'Debit Card', '2025-07-04', 'Failed', 'TXN10004', 'RuPay', 'INR', 'Agent02'),
(205, 5, 11000.00, 'Credit Card', '2025-07-05', 'Success', 'TXN10005', 'MasterCard', 'INR', 'OnlinePortal'),
(206, 6, 3100.00, 'Wallet', '2025-07-06', 'Success', 'TXN10006', NULL, 'INR', 'Self-Service'),
(207, 7, 2600.00, 'Cash', '2025-07-07', 'Success', 'TXN10007', NULL, 'INR', 'CounterStaff'),
(208, 8, 9000.00, 'Credit Card', '2025-07-08', 'Success', 'TXN10008', 'Visa', 'INR', 'Agent03'),
(209, 9, 13000.00, 'UPI', '2025-07-09', 'Refunded', 'TXN10009', NULL, 'INR', 'Self-Service'),
(210, 10, 4400.00, 'Debit Card', '2025-07-10', 'Failed', 'TXN10010', 'MasterCard', 'INR', 'Agent04');

select*from Payments ; 

truncate table Payments ;

drop  table Payments ;


-- 9. Tickets Table
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    BookingID INT,
    TicketNumber VARCHAR(30) UNIQUE NOT NULL,
    IssueDate DATE NOT NULL,
    ClassType VARCHAR(20) CHECK (ClassType IN ('Economy', 'Business', 'First')),
    IssuedBy VARCHAR(50),
    CheckedIn BOOLEAN DEFAULT FALSE,
    BaggageAllowed INT CHECK (BaggageAllowed >= 0), 
    SeatAllocated VARCHAR(10),
    ValidTill DATE,

    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Tickets VALUES
(301, 1, 'TKT10001', '2025-07-01', 'Economy', 'Self-Service', TRUE, 15, '12A', '2025-07-12'),
(302, 2, 'TKT10002', '2025-07-02', 'Economy', 'Agent01', FALSE, 15, '14C', '2025-07-12'),
(303, 3, 'TKT10003', '2025-07-03', 'Business', 'OnlinePortal', TRUE, 25, '1B', '2025-07-13'),
(304, 4, 'TKT10004', '2025-07-04', 'Economy', 'Agent02', FALSE, 15, '22F', '2025-07-13'),
(305, 5, 'TKT10005', '2025-07-05', 'First', 'OnlinePortal', TRUE, 35, '3A', '2025-07-14'),
(306, 6, 'TKT10006', '2025-07-06', 'Economy', 'Self-Service', TRUE, 15, '15D', '2025-07-14'),
(307, 7, 'TKT10007', '2025-07-07', 'Economy', 'Agent03', FALSE, 15, '10E', '2025-07-15'),
(308, 8, 'TKT10008', '2025-07-08', 'Business', 'Self-Service', TRUE, 25, '2C', '2025-07-15'),
(309, 9, 'TKT10009', '2025-07-09', 'First', 'Agent04', TRUE, 35, '5F', '2025-07-16'),
(310, 10, 'TKT10010', '2025-07-10', 'Economy', 'Self-Service', FALSE, 15, '18B', '2025-07-16');

select*from Tickets ; 

truncate table Tickets ;

drop  table Tickets ;


-- 10. Passengers Table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    PassportNo VARCHAR(20) UNIQUE NOT NULL,
    Nationality VARCHAR(50),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    FFNumber VARCHAR(30) 
);

INSERT INTO Passengers VALUES
(101, 'Raj', 'Mehra', '1980-05-12', 'P1234567', 'Indian', 'Male', 'raj.mehra@example.com', '+91-9876543210', 'FF1001'),
(102, 'Anita', 'Joshi', '1992-11-25', 'P2345678', 'Indian', 'Female', 'anita.joshi@example.com', '+91-9123456780', 'FF1002'),
(103, 'Vikram', 'Seth', '1985-09-09', 'P3456789', 'Indian', 'Male', 'vikram.seth@example.com', '+91-9988776655', 'FF1003'),
(104, 'Sneha', 'Rane', '1990-04-20', 'P4567890', 'Indian', 'Female', 'sneha.rane@example.com', '+91-9356677889', 'FF1004'),
(105, 'Amit', 'Verma', '1988-12-30', 'P5678901', 'Indian', 'Male', 'amit.verma@example.com', '+91-9090909090', 'FF1005'),
(106, 'Meera', 'D\'Souza', '1995-03-15', 'P6789012', 'Indian', 'Female', 'meera.dsouza@example.com', '+91-8765432100', 'FF1006'),
(107, 'John', 'Mathew', '1979-08-08', 'P7890123', 'Indian', 'Male', 'john.mathew@example.com', '+91-8899776655', 'FF1007'),
(108, 'Nikita', 'Sharma', '1993-07-07', 'P8901234', 'Indian', 'Female', 'nikita.sharma@example.com', '+91-8080808080', 'FF1008'),
(109, 'Karan', 'Singh', '1987-01-01', 'P9012345', 'Indian', 'Male', 'karan.singh@example.com', '+91-9234567890', 'FF1009'),
(110, 'Priya', 'Kale', '1991-10-10', 'P0123456', 'Indian', 'Female', 'priya.kale@example.com', '+91-9012345678', 'FF1010');


select*from Passengers ; 

truncate table Passengers ;

drop  table Passengers ;

