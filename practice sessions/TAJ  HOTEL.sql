--  Single line comment-- 
/* 
multy 
line 
comment 
*/

CREATE DATABASE  TAJ_HOTEL ; 
USE TAJ_HOTEL;
-- --------------------------------------- Database Analysis --------------------------------------------
/*
t1: Hotel(HotelID, Name, Location, Classification, NumRooms, NumSuites, Owner, OpeningDate, Email, Phone)
t2: Room(RoomID, HotelID, RoomNumber, Type, Capacity, RatePerNight, Status, Floor, View, Notes)
t3: Guest(GuestID, FirstName, LastName, Email, Phone, PassportNumber, Nationality, DateOfBirth, GuestType, CreatedAt)
t4: Reservation(ReservationID, GuestID, HotelID, RoomID, CheckInDate, CheckOutDate, NumAdults, NumChildren, TotalAmount, ReservationStatus)
t5: Employee(EmployeeID, HotelID, FirstName, LastName, Role, Phone, Email, HireDate, Salary, SupervisorID)
t6: Service(ServiceID, HotelID, Name, Description, Rate, Available, ServiceType, OperatingHours, Contact, Notes)
t7: ServiceUsage(UsageID, ReservationID, ServiceID, UsageDate, Quantity, Charge, Notes, ProcessedBy, Status, CreatedAt)
t8: Invoice(InvoiceID, ReservationID, InvoiceDate, Subtotal, Tax, Total, PaidAmount, PaymentMethod, Status, IssuedBy)
t9: Feedback(FeedbackID, ReservationID, GuestID, Rating, Comments, FeedbackDate, Response, ResponseDate, HandledBy, Status)
t10: Amenity(AmenityID, HotelID, Name, Description, Location, Hours, Contact, Availability, Notes, AddedDate)
*/

-- 1. HOTEL
CREATE TABLE Hotel (
  HotelID INT PRIMARY KEY,
  Name VARCHAR(100),
  Location VARCHAR(100),
  Classification VARCHAR(50),
  NumRooms INT,
  NumSuites INT,
  Owner VARCHAR(100),
  OpeningDate DATE,
  Email VARCHAR(100),
  Phone VARCHAR(20)
);
INSERT INTO Hotel VALUES
(1,'Taj Mahal Palace','Mumbai','Luxury',600,44,'Taj Group','1903-12-16','info@tajpalace.com','+91-22-66653366'),
(2,'Taj Coromandel','Chennai','Luxury',182,12,'Taj Group','1974-07-08','info@tajcoromandel.com','+91-44-66200202'),
(3,'Taj Lands End','Mumbai','Luxury',300,20,'Taj Group','1999-11-15','info@tajlandsend.com','+91-22-44441234'),
(4,'Taj Palace','New Delhi','Luxury',195,15,'Taj Group','1978-03-06','info@tajpalace.in','+91-11-26110202'),
(5,'Taj Exotica','Goa','Resort',230,25,'Taj Group','2001-02-12','info@tajexotica.com','+91-832-6691234'),
(6,'Taj Bengal','Kolkata','Luxury',300,18,'Taj Group','2008-05-05','info@tajbengal.com','+91-33-66250202'),
(7,'Taj Bekal','Kerala','Resort',110,8,'Taj Group','2010-09-30','info@tajbekal.com','+91-471-2605151'),
(8,'Taj Usha Kiran','Mysuru','Heritage',85,5,'Taj Group','1942-02-26','info@tajushakiran.com','+91-821-2605999'),
(9,'Taj Dang','Rishikesh','Luxury',150,10,'Taj Group','2015-11-20','info@tajdang.com','+91-135-2641234'),
(10,'Taj Aravali','Jaipur','Resort',120,10,'Taj Group','2007-12-15','info@tajaravali.com','+91-141-2221234');


-- View all data in the Hotel table
SELECT * FROM Hotel;

-- Permanently delete the Hotel table and its data
DROP TABLE Hotel;

-- Remove all records from the Hotel table but keep its structure
TRUNCATE TABLE Hotel;

-- 2. ROOM
CREATE TABLE Room (
  RoomID INT PRIMARY KEY,
  HotelID INT,
  RoomNumber VARCHAR(10),
  Type VARCHAR(50),
  Capacity INT,
  RatePerNight DECIMAL(10,2),
  Status VARCHAR(20),
  Floor INT,
  View VARCHAR(50),
  Notes VARCHAR(255),
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

INSERT INTO Room VALUES
(1,1,'101','Deluxe',2,250.00,'Vacant',1,'City','Sea-facing deluxe'),
(2,1,'102','Suite',4,500.00,'Vacant',1,'Sea','Premium suite'),
(3,2,'201','Deluxe',2,230.00,'Occupied',2,'City','Near elevator'),
(4,2,'202','Suite',4,480.00,'Vacant',2,'Garden','Garden view suite'),
(5,3,'301','Deluxe',2,240.00,'Vacant',3,'City','Extra pillows'),
(6,3,'302','Suite',4,490.00,'Vacant',3,'Pool','Poolside suite'),
(7,4,'401','Deluxe',2,260.00,'Occupied',4,'City','Quiet room'),
(8,4,'402','Suite',4,520.00,'Vacant',4,'Garden','Garden suite'),
(9,5,'501','Deluxe',2,255.00,'Vacant',5,'Sea','Balcony view'),
(10,5,'502','Suite',4,510.00,'Vacant',5,'Sea','Luxurious suite');

-- View all data in the Room table
SELECT * FROM Room;

-- Permanently delete the Room table and its data
DROP TABLE Room;

-- Remove all records from the Room table but keep its structure
TRUNCATE TABLE Room;

-- 3. GUEST
CREATE TABLE Guest (
  GuestID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  PassportNumber VARCHAR(20),
  Nationality VARCHAR(50),
  DateOfBirth DATE,
  GuestType VARCHAR(20),
  CreatedAt DATE
);
INSERT INTO Guest VALUES
(1,'Ayesha','Singh','ayesha@mail.com','+919820123456','P1234567','India','1985-05-20','Regular','2025-08-01'),
(2,'Rohan','Patel','rohan@mail.com','+919876543210','P7654321','India','1990-11-11','VIP','2025-07-20'),
(3,'Emily','Johnson','emily@mail.com','+14445556666','A12345678','USA','1988-03-14','Regular','2025-06-15'),
(4,'Liu','Wei','liu@mail.com','+8613800138000','X9876543','China','1992-08-08','Regular','2025-07-01'),
(5,'Fatima','Khan','fatima@mail.com','+919012345678','N2345678','India','1995-12-30','VIP','2025-08-05'),
(6,'Carlos','Sanchez','carlos@mail.com','+34123456789','E8765432','Spain','1980-01-01','Regular','2025-05-10'),
(7,'Aiko','Tanaka','aiko@mail.com','+819012345678','Z3456789','Japan','1987-06-06','Regular','2025-07-25'),
(8,'Oliver','Brown','oliver@mail.com','+447700900123','B7654321','UK','1993-10-10','VIP','2025-08-03'),
(9,'Sara','Martinez','sara@mail.com','+521234567890','X1234567','Mexico','1991-02-02','Regular','2025-06-20'),
(10,'Ahmed','Ali','ahmed@mail.com','+971501234567','Y9876543','UAE','1984-04-04','Regular','2025-05-30');

-- View all data in the Guest table
SELECT * FROM Guest;

-- Permanently delete the Guest table and its data
DROP TABLE Guest;

-- Remove all records from the Guest table but keep its structure
TRUNCATE TABLE Guest;

-- 4. RESERVATION
CREATE TABLE Reservation (
  ReservationID INT PRIMARY KEY,
  GuestID INT,
  HotelID INT,
  RoomID INT,
  CheckInDate DATE,
  CheckOutDate DATE,
  NumAdults INT,
  NumChildren INT,
  TotalAmount DECIMAL(12,2),
  ReservationStatus VARCHAR(20),
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
INSERT INTO Reservation VALUES
(1,1,1,1,'2025-08-10','2025-08-15',2,0,1250.00,'Confirmed'),
(2,2,1,2,'2025-08-12','2025-08-14',2,1,1500.00,'CheckedIn'),
(3,3,2,3,'2025-07-01','2025-07-05',1,0,920.00,'Completed'),
(4,4,2,4,'2025-07-10','2025-07-12',2,2,1080.00,'Completed'),
(5,5,3,5,'2025-08-05','2025-08-07',2,0,480.00,'Confirmed'),
(6,6,3,6,'2025-06-15','2025-06-18',1,1,1470.00,'Completed'),
(7,7,4,7,'2025-07-20','2025-07-22',2,0,520.00,'Completed'),
(8,8,4,8,'2025-08-05','2025-08-08',3,1,1560.00,'Confirmed'),
(9,9,5,9,'2025-08-01','2025-08-03',2,0,510.00,'Completed'),
(10,10,5,10,'2025-07-30','2025-08-02',2,2,1530.00,'CheckedOut');

-- View all data in the Reservation table
SELECT * FROM Reservation;

-- Permanently delete the Reservation table and its data
DROP TABLE Reservation;

-- Remove all records from the Reservation table but keep its structure
TRUNCATE TABLE Reservation;

-- 5. EMPLOYEE
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  HotelID INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Role VARCHAR(50),
  Phone VARCHAR(20),
  Email VARCHAR(100),
  HireDate DATE,
  Salary DECIMAL(12,2),
  SupervisorID INT,
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);
INSERT INTO Employee VALUES
(1,1,'Rohan','Patel','FrontDesk','+9122240004000','rohan@taj.com','2020-01-05',40000,NULL),
(2,1,'Neha','Sharma','Housekeeping','+9122260005000','neha@taj.com','2019-06-10',30000,1),
(3,2,'Suresh','Kumar','FrontDesk','+9144220006000','suresh@taj.com','2021-03-15',38000,NULL),
(4,2,'Priya','Reddy','Housekeeping','+9144220007000','priya@taj.com','2022-02-20',29000,3),
(5,3,'Arjun','Mehta','Manager','+9122440008000','arjun@taj.com','2018-11-01',60000,NULL),
(6,3,'Sneha','Roy','FrontDesk','+9122440009000','sneha@taj.com','2021-08-12',42000,5),
(7,4,'Vikram','Gupta','FrontDesk','+911126111000','vikram@taj.com','2019-04-25',41000,NULL),
(8,4,'Anita','Verma','Housekeeping','+911126111100','anita@taj.com','2022-12-05',28000,7),
(9,5,'Rahul','Singh','FrontDesk','+918326691200','rahul@taj.com','2020-05-18',43000,NULL),
(10,5,'Meera','Joshi','Housekeeping','+918326691300','meera@taj.com','2023-01-10',30500,9);

-- View all data in the Employee table
SELECT * FROM Employee;

-- Permanently delete the Employee table and its data
DROP TABLE Employee;

-- Remove all records from the Employee table but keep its structure
TRUNCATE TABLE Employee;

-- 6. SERVICE
CREATE TABLE Service (
  ServiceID INT PRIMARY KEY,
  HotelID INT,
  Name VARCHAR(100),
  Description VARCHAR(255),
  Rate DECIMAL(10,2),
  Available VARCHAR(10),
  ServiceType VARCHAR(50),
  OperatingHours VARCHAR(50),
  Contact VARCHAR(50),
  Notes VARCHAR(255),
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);
INSERT INTO Service VALUES
(1,1,'Spa','Full-body massage',120.00,'Yes','Wellness','10:00-20:00','+912240005000','Reservations required'),
(2,1,'Laundry','Laundry service',15.00,'Yes','Housekeeping','06:00-22:00','+912240005100','Express available'),
(3,2,'Spa','Signature spa',150.00,'Yes','Wellness','10:00-21:00','+914460006000','Prior booking needed'),
(4,2,'Gym','24x7 gym',0.00,'Yes','Fitness','00:00-23:59','+914460006100','Access with keycard'),
(5,3,'Laundry','Premium laundry',18.00,'Yes','Housekeeping','07:00-20:00','+912240008000','Pick-up available'),
(6,3,'SwimPool','Outdoor pool',0.00,'Yes','Leisure','06:00-22:00','+912240008100','Heated'),
(7,4,'Spa','Luxury spa',160.00,'Yes','Wellness','10:00-22:00','+911126111200','Reservations required'),
(8,4,'Gym','Gym access',0.00,'Yes','Fitness','05:00-23:00','+911126111300','Open to members'),
(9,5,'Laundry','Quick laundry',17.00,'Yes','Housekeeping','08:00-18:00','+918326691400','Express'),
(10,5,'Spa','Beach spa',130.00,'Yes','Wellness','09:00-19:00','+918326691500','Ocean view');

-- View all data in the Service table
SELECT * FROM Service;

-- Permanently delete the Service table and its data
DROP TABLE Service;

-- Remove all records from the Service table but keep its structure
TRUNCATE TABLE Service;

-- 7. SERVICEUSAGE
CREATE TABLE ServiceUsage (
  UsageID INT PRIMARY KEY,
  ReservationID INT,
  ServiceID INT,
  UsageDate DATE,
  Quantity INT,
  Charge DECIMAL(10,2),
  Notes VARCHAR(255),
  ProcessedBy INT,
  Status VARCHAR(20),
  CreatedAt DATE,
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
  FOREIGN KEY (ProcessedBy) REFERENCES Employee(EmployeeID)
);
INSERT INTO ServiceUsage VALUES
(1,1,1,'2025-08-11',1,120.00,'Relaxation session',1,'Completed','2025-08-11'),
(2,2,2,'2025-08-13',2,30.00,'Two laundry loads',2,'Completed','2025-08-13'),
(3,3,3,'2025-07-02',1,150.00,'Signature massage',3,'Completed','2025-07-02'),
(4,4,4,'2025-07-11',1,0.00,'Gym use',4,'Completed','2025-07-11'),
(5,5,5,'2025-08-06',3,54.00,'Laundry items',6,'Completed','2025-08-06'),
(6,6,6,'2025-06-16',1,0.00,'Swim session',6,'Completed','2025-06-16'),
(7,7,7,'2025-07-21',1,160.00,'Spa therapy',7,'Completed','2025-07-21'),
(8,8,8,'2025-08-06',1,0.00,'Gym access',8,'Completed','2025-08-06'),
(9,9,9,'2025-08-02',2,34.00,'Laundry pick-up',10,'Completed','2025-08-02'),
(10,10,10,'2025-07-31',1,130.00,'Beach spa session',9,'Completed','2025-07-31');

-- View all data in the ServiceUsage table
SELECT * FROM ServiceUsage;

-- Permanently delete the ServiceUsage table and its data
DROP TABLE ServiceUsage;

-- Remove all records from the ServiceUsage table but keep its structure
TRUNCATE TABLE ServiceUsage;

-- 8. INVOICE
CREATE TABLE Invoice (
  InvoiceID INT PRIMARY KEY,
  ReservationID INT,
  InvoiceDate DATE,
  Subtotal DECIMAL(12,2),
  Tax DECIMAL(12,2),
  Total DECIMAL(12,2),
  PaidAmount DECIMAL(12,2),
  PaymentMethod VARCHAR(50),
  Status VARCHAR(20),
  IssuedBy INT,
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (IssuedBy) REFERENCES Employee(EmployeeID)
);
INSERT INTO Invoice VALUES
(1,1,'2025-08-15',1250.00,112.50,1362.50,1362.50,'Credit Card','Paid',1),
(2,2,'2025-08-14',1500.00,135.00,1635.00,1635.00,'Cash','Paid',2),
(3,3,'2025-07-05',920.00,82.80,1002.80,1002.80,'Credit Card','Paid',3),
(4,4,'2025-07-12',1080.00,97.20,1177.20,1177.20,'Cash','Paid',4),
(5,5,'2025-08-07',480.00,43.20,523.20,523.20,'Credit Card','Paid',6),
(6,6,'2025-06-18',1470.00,132.30,1602.30,1602.30,'Cash','Paid',5),
(7,7,'2025-07-22',520.00,46.80,566.80,566.80,'Credit Card','Paid',7),
(8,8,'2025-08-08',1560.00,140.40,1700.40,1700.40,'Cash','Paid',8),
(9,9,'2025-08-03',510.00,45.90,555.90,555.90,'Credit Card','Paid',9),
(10,10,'2025-08-02',1530.00,137.70,1667.70,1667.70,'Cash','Paid',10);

-- View all data in the Invoice table
SELECT * FROM Invoice;

-- Permanently delete the Invoice table and its data
DROP TABLE Invoice;

-- Remove all records from the Invoice table but keep its structure
TRUNCATE TABLE Invoice;

-- 9. FEEDBACK
CREATE TABLE Feedback (
  FeedbackID INT PRIMARY KEY,
  ReservationID INT,
  GuestID INT,
  Rating INT,
  Comments VARCHAR(255),
  FeedbackDate DATE,
  Response VARCHAR(255),
  ResponseDate DATE,
  HandledBy INT,
  Status VARCHAR(20),
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
  FOREIGN KEY (HandledBy) REFERENCES Employee(EmployeeID)
);
INSERT INTO Feedback VALUES
(1,1,1,5,'Excellent stay!','2025-08-16',NULL,NULL,NULL,'New'),
(2,2,2,4,'Very nice location.','2025-08-15',NULL,NULL,NULL,'New'),
(3,3,3,5,'Wonderful experience.','2025-07-06',NULL,NULL,NULL,'New'),
(4,4,4,3,'Could improve breakfast.','2025-07-13',NULL,NULL,NULL,'New'),
(5,5,5,5,'Staff very helpful.','2025-08-08',NULL,NULL,NULL,'New'),
(6,6,6,4,'Great amenities.','2025-06-19',NULL,NULL,NULL,'New'),
(7,7,7,5,'Loved the spa.','2025-07-23',NULL,NULL,NULL,'New'),
(8,8,8,4,'Decent stay.','2025-08-10',NULL,NULL,NULL,'New'),
(9,9,9,5,'Perfect hotel!','2025-08-05',NULL,NULL,NULL,'New'),
(10,10,10,3,'Room was small.','2025-08-04',NULL,NULL,NULL,'New');

-- View all data in the Feedback table
SELECT * FROM Feedback;

-- Permanently delete the Feedback table and its data
DROP TABLE Feedback;

-- Remove all records from the Feedback table but keep its structure
TRUNCATE TABLE Feedback;

-- 10. AMENITY
CREATE TABLE Amenity (
  AmenityID INT PRIMARY KEY,
  HotelID INT,
  Name VARCHAR(100),
  Description VARCHAR(255),
  Location VARCHAR(100),
  Hours VARCHAR(50),
  Contact VARCHAR(50),
  Availability VARCHAR(50),
  Notes VARCHAR(255),
  AddedDate DATE,
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

INSERT INTO Amenity VALUES
(1,1,'Swimming Pool','Outdoor pool with sea view','Rooftop','06:00-22:00','+912240006000','Open','Heated pool','2025-01-01'),
(2,1,'Gym','Fitness center','Ground Floor','00:00-23:59','+912240006100','Open','24x7 access','2025-01-01'),
(3,2,'Spa','Signature spa','First Floor','10:00-21:00','+914460006200','Open','Prior booking','2025-02-01'),
(4,2,'Restaurant','Multi-cuisine restaurant','Lobby','07:00-23:00','+914460006300','Open','Buffet available','2025-02-01'),
(5,3,'Pool','Outdoor pool','Ground Floor','06:00-22:00','+912240008200','Open','Heated','2025-03-01'),
(6,3,'Gym','Gym center','First Floor','05:00-23:00','+912240008300','Open','Free for guests','2025-03-01'),
(7,4,'Spa','Wellness spa','Second Floor','10:00-22:00','+911126111400','Open','Reservations required','2025-04-01'),
(8,4,'Bar','Rooftop bar','Top Floor','18:00-02:00','+911126111500','Open','Sea view bar','2025-04-01'),
(9,5,'Beach','Private beach access','Hotel Annex','06:00-18:00','+918326691600','Open','Complimentary','2025-05-01'),
(10,5,'Kids Club','Children activity area','Ground Floor','09:00-21:00','+918326691700','Open','Supervised','2025-05-01');

-- View all data in the Amenity table
SELECT * FROM Amenity;

-- Permanently delete the Amenity table and its data
DROP TABLE Amenity;

-- Remove all records from the Amenity table but keep its structure
TRUNCATE TABLE Amenity;
