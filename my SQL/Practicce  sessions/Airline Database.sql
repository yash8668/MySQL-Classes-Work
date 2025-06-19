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
*/

-- ----------------------------------------- Database Queries ------------------------------------------

-- create a database first
create database Airline ;

-- to work on this database, you need to use it first
-- to execute (ctrl + enter)
use Airline ;

-- SQL is not a case-sensitive language (As- AGE or age will be treated as same word)

-- --------------------------------------- Database Analysis --------------------------------------------
/*
T1 : Airports(AirportId, Name, City, Country, Code)
T2 : Airlines(AirlineId, Name, Code, Country, Rating)
T3 : Flights(FlightId, FlightNumber, AirlineId, SourceAirportId, DestinationAirportId)
T4 : Passengers(PassengerId, Name, PassportNumber, Nationality, Gender)
T5 : Bookings(BookingId, PassengerId, FlightId, SeatNumber, BookingDate)
T6 : CrewMembers(CrewId, Name, Role, AirlineId, Experience)
T7 : Schedules(ScheduleId, FlightId, DepartureDate, DepartureTime, Gate)
T8 : Payments(PaymentId, BookingId, Amount, PaymentMethod, PaymentDate)
T9 : Tickets(TicketId, BookingId, TicketNumber, IssueDate, ClassType)
T10: Feedback(FeedbackId, PassengerId, FlightId, Rating, Comments)
*/
-- --------------------------------------- Table Related Queries ---------------------------------

-- 1. Airports Table
CREATE TABLE Airports (
    AirportId INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Code VARCHAR(10)
);

INSERT INTO Airports VALUES
(1, 'Indira Gandhi International', 'Delhi', 'India', 'DEL'),
(2, 'Chhatrapati Shivaji', 'Mumbai', 'India', 'BOM'),
(3, 'Heathrow', 'London', 'UK', 'LHR'),
(4, 'John F. Kennedy', 'New York', 'USA', 'JFK'),
(5, 'Dubai International', 'Dubai', 'UAE', 'DXB');

select*from Airports ; 

truncate table Airports ;

drop  table Airports ;

-- 2. Airlines Table
CREATE TABLE Airlines (
    AirlineId INT PRIMARY KEY,
    Name VARCHAR(100),
    Code VARCHAR(10),
    Country VARCHAR(50),
    Rating DECIMAL(2,1)
);

INSERT INTO Airlines VALUES
(1, 'Air India', 'AI', 'India', 4.2),
(2, 'IndiGo', '6E', 'India', 4.0),
(3, 'British Airways', 'BA', 'UK', 4.5),
(4, 'Emirates', 'EK', 'UAE', 4.8),
(5, 'Delta Airlines', 'DL', 'USA', 4.3);


-- 3. Flights Table
CREATE TABLE Flights (
    FlightId INT PRIMARY KEY,
    FlightNumber VARCHAR(20),
    AirlineId INT,
    SourceAirportId INT,
    DestinationAirportId INT
);

INSERT INTO Flights VALUES
(1, 'AI202', 1, 1, 2),
(2, '6E350', 2, 2, 5),
(3, 'BA142', 3, 3, 4),
(4, 'EK507', 4, 5, 1),
(5, 'DL400', 5, 4, 3);


-- 4. Passengers Table
CREATE TABLE Passengers (
    PassengerId INT PRIMARY KEY,
    Name VARCHAR(100),
    PassportNumber VARCHAR(20),
    Nationality VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO Passengers VALUES
(1, 'Raj Malhotra', 'P123456', 'Indian', 'Male'),
(2, 'Anita Singh', 'P654321', 'Indian', 'Female'),
(3, 'John Smith', 'B112233', 'British', 'Male'),
(4, 'Ayesha Khan', 'U998877', 'Emirati', 'Female'),
(5, 'Mike Brown', 'US778899', 'American', 'Male');


-- 5. Bookings Table
CREATE TABLE Bookings (
    BookingId INT PRIMARY KEY,
    PassengerId INT,
    FlightId INT,
    SeatNumber VARCHAR(10),
    BookingDate DATE
);

INSERT INTO Bookings VALUES
(1, 1, 1, '12A', '2025-06-01'),
(2, 2, 2, '14B', '2025-06-02'),
(3, 3, 3, '22F', '2025-06-03'),
(4, 4, 4, '9C', '2025-06-04'),
(5, 5, 5, '8D', '2025-06-05');


-- 6. CrewMembers Table
CREATE TABLE CrewMembers (
    CrewId INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    AirlineId INT,
    Experience INT
);

INSERT INTO CrewMembers VALUES
(1, 'Captain Rajeev', 'Pilot', 1, 12),
(2, 'Neha Sharma', 'Cabin Crew', 2, 5),
(3, 'William Blake', 'Co-Pilot', 3, 7),
(4, 'Fatima Noor', 'Cabin Crew', 4, 4),
(5, 'James Taylor', 'Pilot', 5, 15);


-- 7. Schedules Table
CREATE TABLE Schedules (
    ScheduleId INT PRIMARY KEY,
    FlightId INT,
    DepartureDate DATE,
    DepartureTime TIME,
    Gate VARCHAR(10)
);

INSERT INTO Schedules VALUES
(1, 1, '2025-06-10', '10:00:00', 'A1'),
(2, 2, '2025-06-11', '12:30:00', 'B2'),
(3, 3, '2025-06-12', '15:00:00', 'C3'),
(4, 4, '2025-06-13', '18:15:00', 'D4'),
(5, 5, '2025-06-14', '20:45:00', 'E5');


-- 8. Payments Table
CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY,
    BookingId INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    PaymentDate DATE
);

INSERT INTO Payments VALUES
(1, 1, 7500.00, 'Credit Card', '2025-06-01'),
(2, 2, 5600.00, 'UPI', '2025-06-02'),
(3, 3, 10200.00, 'Debit Card', '2025-06-03'),
(4, 4, 8900.00, 'Cash', '2025-06-04'),
(5, 5, 6600.00, 'Net Banking', '2025-06-05');


-- 9. Tickets Table
CREATE TABLE Tickets (
    TicketId INT PRIMARY KEY,
    BookingId INT,
    TicketNumber VARCHAR(20),
    IssueDate DATE,
    ClassType VARCHAR(20)
);

INSERT INTO Tickets VALUES
(1, 1, 'TKT2025001', '2025-06-01', 'Economy'),
(2, 2, 'TKT2025002', '2025-06-02', 'Business'),
(3, 3, 'TKT2025003', '2025-06-03', 'Economy'),
(4, 4, 'TKT2025004', '2025-06-04', 'Business'),
(5, 5, 'TKT2025005', '2025-06-05', 'First');


-- 10. Feedback Table
CREATE TABLE Feedback (
    FeedbackId INT PRIMARY KEY,
    PassengerId INT,
    FlightId INT,
    Rating INT,
    Comments VARCHAR(255)
);

INSERT INTO Feedback VALUES
(1, 1, 1, 5, 'Very smooth flight'),
(2, 2, 2, 4, 'Good service'),
(3, 3, 3, 3, 'Average experience'),
(4, 4, 4, 5, 'Excellent crew'),
(5, 5, 5, 2, 'Could be better');
