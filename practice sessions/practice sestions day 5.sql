use xyzcollege ;

-- ----------------------------------- Database quires ------------------------------
/*
T1 :  Customers  ( CustomerID,FirstName,LastName,Email,Phone,Address,City,State,ZipCode,JoinDate)
T2 :  Products ( ProductID	, Name	, Category	, Price	,StockQty,	Supplier,Weight	,Color	,Dimensions	,AddedDate)
T3 : Orders (OrderID,CustomerID,ProductID,Quantity,OrderDate,ShipDate,Status,ShipMethod,ShipCost,TotalAmount)
T4 : Suppliers(SupplierID, Name,ContactName,ContactEmail,Phone,Address,City,State,Country,Rating)
T5 : Reviews(ReviewID, CustomerID,ProductID	Rating,Title,ReviewText	,ReviewDate, VerifiedPurchase,Likes,Response)
*/

-- ----------------------------- Table Queries ----------------------------------------
-- ------- Table 1 : Customers --------------------------------------------------
create table Customers  ( 
CustomerID int primary key ,
FirstName varchar (100),
LastName varchar (100),
Email varchar(100) unique ,
Phone varchar (10),
Address varchar (50),
City varchar(25),
State varchar(100),
ZipCode int ,
JoinDate date
);

INSERT INTO Customers VALUES
(1,  'Alice',  'Smith',  'alice.smith@gmail.com',    '5550100', '123 Maple St',     'Austin',        'TX', 78701, '2023-01-15'),
(2,  'Bob',    'Jones',  'bob.jones@yahoo.com',       '5550101', '456 Oak Ave',      'Boston',        'MA', 2108,  '2022-11-10'),
(3,  'Carol',  'Lee',    'carol.lee@hotmail.com',     '5550102', '789 Pine Rd',      'Seattle',       'WA', 98101, '2021-06-22'),
(4,  'David',  'Nguyen', 'david.nguyen@outlook.com',  '5550103', '321 Elm St',       'Denver',        'CO', 80202, '2024-03-07'),
(5,  'Eva',    'Patel',  'eva.patel@gmail.com',       '5550104', '654 Cedar Blvd',   'Miami',         'FL', 33101, '2023-08-30'),
(6,  'Frank',  'Kumar',  'frank.kumar@yahoo.com',     '5550105', '987 Birch Ln',     'Chicago',       'IL', 60601, '2022-12-05'),
(7,  'Grace',  'Chen',   'grace.chen@hotmail.com',    '5550106', '135 Spruce Ct',    'San Jose',      'CA', 95112, '2024-01-14'),
(8,  'Henry',  'Lopez',  'henry.lopez@gmail.com',     '5550107', '246 Redwood Dr',   'Phoenix',       'AZ', 85001, '2023-05-19'),
(9,  'Irene',  'Davis',  'irene.davis@yahoo.com',     '5550108', '357 Willow Way',   'Philadelphia', 'PA', 19103, '2021-09-10'),
(10, 'Jack',   'Wilson', 'jack.wilson@outlook.com',   '5550109', '468 Aspen Pl',     'Dallas',        'TX', 75201, '2024-04-01');

-- ---------- display the table  ---------------------------------
select *from Customers;
-- ------------- delete the table -------------------------------
drop table Customers;
--  -------------- delete the all reacords --------------------------
truncate table  Customers;

-- ----------- Table 2 : Products  ---------------------------------
create table Products ( 
ProductID int primary key , 
Name varchar (100), 
Category varchar(100), 
Price int ,
StockQty int ,	
Supplier varchar(50),
Weight int,
Color varchar(30),
Dimensions varchar(100)	,
AddedDate date 
);

INSERT INTO Products VALUES
(101, 'Wireless Mouse',      'Electronics',  19, 150, 'TechSupplies',    200, 'Black', '4×2×1 in',         '2023-02-05'),
(102, 'Bluetooth Speaker',   'Electronics',  49, 80,  'AudioWorld',      1500,'Blue',  '7×3×3 in',         '2023-04-11'),
(103, 'LED Monitor 24\"',    'Electronics', 149, 45,  'DisplayHub',      7000,'Black', '21×14×2 in',        '2022-09-30'),
(104, 'Office Chair',        'Furniture',   129, 60,  'ComfortSeats',   25000,'Gray',  '24×24×40 in',       '2024-01-20'),
(105, 'Standing Desk',       'Furniture',   299, 30,  'OfficePros',     60000,'White', '48×24×46 in',       '2024-03-18'),
(106, 'Notebook 14\"',       'Computers',    599,25,  'LaptopWorld',     3300,'Silver', '13×9×0.7 in',       '2024-04-05'),
(107, 'USB-C Hub',           'Accessories',  25, 120, 'ConnectPlus',     300, 'Gray',  '5×2×0.5 in',        '2023-11-12'),
(108, 'External SSD 1TB',    'Storage',      89, 75,  'DataKeepers',     100, 'Black', '4×2×0.4 in',        '2023-07-29'),
(109, 'Desk Lamp LED',       'Lighting',     39, 95,  'BrightLights',   1200,'White', '6×6×18 in',         '2022-12-22'),
(110, 'Ergonomic Keyboard',  'Electronics',  79, 50,  'KeyMasters',     1800,'Black', '18×6×1 in',         '2023-09-14');

-- ---------- display the table  ---------------------------------
select *from Products;
-- ------------- delete the table -------------------------------
drop table Products;
--  -------------- delete the all reacords --------------------------
truncate table  Products;

-- ----------- Table 3 : Orders ----------------------------------------
create table Orders (
OrderID int primary key ,
CustomerID int ,
ProductID int ,
Quantity int ,
OrderDate date ,
ShipDate date ,
Status varchar (100),
ShipMethod  varchar(100),
ShipCost int ,
TotalAmount int ,
foreign key (CustomerID) references Customers(CustomerID)
on delete cascade 
on update cascade ,
foreign key (ProductID) references Products(ProductID)
on delete cascade 
on update cascade
);

INSERT INTO Orders 
VALUES
(5001, 1, 106, 1, '2024-05-12', '2024-05-15', 'Shipped',   'Ground',    15,  614),
(5002, 2, 104, 2, '2024-06-01', '2024-06-03', 'Delivered', 'Expedited',  25,  284),
(5003, 3, 108, 1, '2024-04-28', '2024-05-01', 'Delivered', 'Ground',    10,   99),
(5004, 4, 101, 3, '2024-03-11', '2024-03-13', 'Delivered', 'Ground',     8,   67),
(5005, 5, 105, 1, '2024-06-15', '2024-06-18', 'Shipped',   'Freight',   50,  349),
(5006, 6, 109, 2, '2024-05-20', '2024-05-22', 'Delivered', 'Ground',    12,   91),
(5007, 7, 107, 4, '2024-06-05', '2024-06-07', 'Delivered', 'Ground',     5,  111),
(5008, 8, 102, 1, '2024-06-22', NULL,        'Processing','Ground',    10,   59),
(5009, 9, 110, 1, '2024-05-02', '2024-05-05', 'Delivered', 'Ground',    10,   89),
(5010,10, 103, 1, '2024-06-28', NULL,        'Processing','Expedited',  20,  169);

-- ---------- display the table  ---------------------------------
select *from Orders ;
-- ------------- delete the table -------------------------------
drop table Orders ;
--  -------------- delete the all reacords --------------------------
truncate table  Orders ;

-- ----- Table 4 : Suppliers ------------------------------------------
create table Suppliers(
SupplierID int primary key , 
Name varchar(100),
ContactName varchar (100),
ContactEmail varchar(100),
Phone varchar(10),
Address varchar(100),
City varchar(100),
State varchar(100),
Country varchar(100),
Rating int 
);

INSERT INTO Suppliers
VALUES
(201, 'TechSupplies',     'Karen Wright',   'karen@techsup.com',    '5551001', '12 Tech Park Rd',  'Austin',       'TX', 'USA', 5),
(202, 'AudioWorld',       'Mike Brown',     'mike@audioworld.com',  '5551002', '78 Music Ave',     'Nashville',    'TN', 'USA', 4),
(203, 'DisplayHub',       'Susan Lee',      'susan@displayhub.com', '5551003', '34 Monitor Blvd',  'Los Angeles',  'CA', 'USA', 5),
(204, 'ComfortSeats',     'Tom Davis',      'tom@comfortseats.net', '5551004', '56 Cozy St',       'New York',     'NY', 'USA', 4),
(205, 'OfficePros',       'Linda Green',    'linda@officepros.com', '5551005', '90 Workway Ln',    'Chicago',      'IL', 'USA', 4),
(206, 'LaptopWorld',      'Raj Patel',      'raj@laptopworld.com',  '5551006', '123 Tech Dr',      'San Francisco','CA', 'USA', 5),
(207, 'ConnectPlus',      'Amy Wong',       'amy@connectplus.com',  '5551007', '45 Cable Ct',      'Seattle',      'WA', 'USA', 4),
(208, 'DataKeepers',      'Leo Martinez',   'leo@datakeepers.com',  '5551008', '67 Storage Rd',    'Boston',       'MA', 'USA', 5),
(209, 'BrightLights',     'Emma Taylor',    'emma@brightlights.com','5551009', '23 Bright Ave',    'Miami',        'FL', 'USA', 4),
(210, 'KeyMasters',       'John Kim',       'john@keymasters.com',  '5551010', '89 Key St',        'Denver',       'CO', 'USA', 5);

-- ---------- display the table  ---------------------------------
select *from Suppliers ;
-- ------------- delete the table -------------------------------
drop table Suppliers ;
--  -------------- delete the all reacords --------------------------
truncate table  Suppliers ;

-- ------------------ Table 5 : Reviews --------------------------------------
create table Reviews(
ReviewID int primary key ,
CustomerID int ,
ProductID int , 
Rating varchar(100),
Title varchar(100),
ReviewText varchar(100),
ReviewDate date,
VerifiedPurchase varchar(100),
Likes  varchar(100),
Response varchar(100),
foreign key (CustomerID) references Customers(CustomerID)
on delete cascade 
on update cascade,
foreign key (ProductID) references Products(ProductID)
on delete cascade 
on update cascade
);

INSERT INTO Reviews 
VALUES
(9001, 1, 106, '5', 'Excellent Laptop',        'Runs fast, battery lasts long.',     '2024-06-01', 'Yes', '12', 'Thanks!'),
(9002, 2, 104, '4', 'Comfortable Chair',        'Great support but armrests could be better.', '2024-06-05', 'Yes', '8',  NULL),
(9003, 3, 108, '5', 'Fast SSD',                 'Super fast transfer speeds.',        '2024-05-10', 'Yes', '10', NULL),
(9004, 4, 101, '3', 'Decent Mouse',             'Works okay, but scroll wheel is a bit stiff.', '2024-04-15', 'Yes', '4', NULL),
(9005, 5, 105, '5', 'Perfect Desk',             'Sturdy build and adjustable height.', '2024-06-20', 'Yes', '15', NULL),
(9006, 6, 109, '4', 'Bright Lamp',              'Nice light, but shade scratches easily.', '2024-05-25', 'No', '5',  NULL),
(9007, 7, 107, '4', 'Handy USB Hub',           'Useful but runs a bit warm.',        '2024-06-07', 'Yes', '6',  NULL),
(9008, 8, 102, '5', 'Great Speaker',            'Excellent sound quality.',           '2024-06-25', 'Yes', '9',  NULL),
(9009, 9, 110, '3', 'Okay Keyboard',           'Keys feel shallow for my taste.',    '2024-05-15', 'Yes', '3',  NULL),
(9010,10, 103, '5', 'Crisp Monitor',           'Sharp display, very clear visuals.', '2024-06-30', 'Yes', '11', NULL);

-- ---------- display the table  ---------------------------------
select *from Reviews ;

-- ------------- delete the table -------------------------------
drop table Reviews ;
--  -------------- delete the all reacords --------------------------
truncate table  Reviews ;

set sql_safe_updates=0;
set sql_safe_updates=1;
select *from orders;
update Customers set CustomerID =20 where customerID=3;

update Products set ProductID =103 where ProductID=105;

delete from Products where ProductID =103;

delete from Customers where CustomerID =20;