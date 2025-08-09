
--  Single line comment-- 

/* 
multy 
line 
comment 
*/
CREATE DATABASE Flipkart;
use Flipkart;
-- --------------------------------------- Database Analysis --------------------------------------------

/*
t1: Customer(CustomerID, Name, Email, Phone, RegistrationDate, Status, LoyaltyTier, DefaultAddressID, TotalOrders, PreferredPaymentMethod)
t2: Address(AddressID, CustomerID, Label, Line1, Line2, City, State, ZipCode, Country, Phone)
t3: Category(CategoryID, ParentCategoryID, Name, Description, IsActive, CreatedAt, UpdatedAt, DisplayOrder, SEOKeyword, ImageURL)
t4: Product(ProductID, CategoryID, SKU, Name, Description, Price, StockQuantity, Brand, CreatedAt, IsActive)
t5: ProductVariant(VariantID, ProductID, VariantName, VariantValue, AdditionalPrice, StockDelta, IsActive, CreatedAt, UpdatedAt, SKU)
t6: Order(OrderID, CustomerID, OrderDate, Status, TotalAmount, PaymentMethod, ShippingAddressID, BillingAddressID, DiscountCode, TrackingNumber)
t7: OrderItem(OrderItemID, OrderID, ProductID, VariantID, Quantity, UnitPrice, TotalPrice, DiscountApplied, Tax, ReturnStatus)
t8: Payment(PaymentID, OrderID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, Provider, IsRefunded, RefundDate)
t9: Shipment(ShipmentID, OrderID, ShippedDate, EstimatedDeliveryDate, ActualDeliveryDate, Courier, TrackingNumber, ShippingCost, Status, DeliveredBy)
t10: Seller(SellerID, Name, ContactEmail, ContactPhone, SellerCategory, Rating, CreatedAt, IsActive, WarehouseID, TotalProducts)
*/


-- 1) Customer

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  PasswordHash VARCHAR(255),
  DateRegistered DATE,
  Status VARCHAR(20),
  DefaultAddressID INT,
  TotalOrders INT,
  LoyaltyTier VARCHAR(20)
);

INSERT INTO Customer VALUES
(1,'Alice Johnson','alice@example.com','9876543210','hash1','2025-01-20','Active',1,2,'Gold'),
(2,'Bob Smith','bob@example.com','9876543211','hash2','2025-02-11','Active',2,1,'Silver'),
(3,'Carol Lee','carol@example.com','9876543212','hash3','2025-03-05','Active',3,5,'Platinum'),
(4,'David Kumar','david@example.com','9876543213','hash4','2025-04-15','Active',4,0,'Bronze'),
(5,'Esha Patel','esha@example.com','9876543214','hash5','2025-05-10','Active',5,3,'Gold'),
(6,'Fiona Chen','fiona@example.com','9876543215','hash6','2025-06-18','Active',6,8,'Platinum'),
(7,'George Roy','george@example.com','9876543216','hash7','2025-07-22','Active',7,4,'Silver'),
(8,'Hannah Garcia','hannah@example.com','9876543217','hash8','2025-08-01','Active',8,7,'Gold'),
(9,'Ian Martinez','ian@example.com','9876543218','hash9','2025-08-05','Active',9,2,'Bronze'),
(10,'Julia Brown','julia@example.com','9876543219','hash10','2025-08-07','Active',10,6,'Platinum');
select * from Customer;
drop table Customer;
truncate table Customer;
-- 2) Address

CREATE TABLE Address (
  AddressID INT PRIMARY KEY,
  CustomerID INT,
  Label VARCHAR(50),
  Line1 VARCHAR(100),
  Line2 VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  ZipCode VARCHAR(20),
  Country VARCHAR(50),
  Phone VARCHAR(20),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Address VALUES
(1,1,'Home','123 Main St','','Mumbai','Maharashtra','400001','India','9876543210'),
(2,2,'Office','456 Park Ave','','Pune','Maharashtra','411001','India','9876543211'),
(3,3,'Home','789 Market Rd','','Bangalore','Karnataka','560001','India','9876543212'),
(4,4,'Home','101 Central Blvd','','Delhi','Delhi','110001','India','9876543213'),
(5,5,'Office','202 Oak St','','Chennai','Tamil Nadu','600001','India','9876543214'),
(6,6,'Home','303 Lakeview Dr','','Kolkata','West Bengal','700001','India','9876543215'),
(7,7,'Office','404 Hilltop Ct','','Hyderabad','Telangana','500001','India','9876543216'),
(8,8,'Home','505 Pine St','','Ahmedabad','Gujarat','380001','India','9876543217'),
(9,9,'Home','606 Riverside Rd','','Jaipur','Rajasthan','302001','India','9876543218'),
(10,10,'Office','707 Cliff Rd','','Lucknow','Uttar Pradesh','226001','India','9876543219');
select * from Address;
drop table Address;
truncate table Address;

-- 3) Category

CREATE TABLE Category (
  CategoryID INT PRIMARY KEY,
  Name VARCHAR(100),
  ParentCategoryID INT,
  Description VARCHAR(255),
  CreatedAt DATETIME,
  UpdatedAt DATETIME,
  IsActive BOOLEAN,
  DisplayOrder INT,
  SEOKeyword VARCHAR(100),
  ImageURL VARCHAR(255)
);

INSERT INTO Category VALUES
(1,'Electronics',NULL,'Electronic gadgets',NOW(),NOW(),TRUE,1,'electronics','url1'),
(2,'Mobiles',1,'Smartphones',NOW(),NOW(),TRUE,2,'mobiles','url2'),
(3,'Laptops',1,'Portable computers',NOW(),NOW(),TRUE,3,'laptops','url3'),
(4,'Home Appliances',NULL,'Appliances',NOW(),NOW(),TRUE,4,'home-appliances','url4'),
(5,'Kitchen Appliances',4,'Cooking tools',NOW(),NOW(),TRUE,5,'kitchen','url5'),
(6,'Clothing',NULL,'Apparel',NOW(),NOW(),TRUE,6,'clothing','url6'),
(7,'Men',6,'Men Clothing',NOW(),NOW(),TRUE,7,'men','url7'),
(8,'Women',6,'Women Clothing',NOW(),NOW(),TRUE,8,'women','url8'),
(9,'Sports',NULL,'Sporting goods',NOW(),NOW(),TRUE,9,'sports','url9'),
(10,'Books',NULL,'Reading material',NOW(),NOW(),TRUE,10,'books','url10');
select * from Category;
drop table Category;
truncate table Category;
-- 4) Product

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  CategoryID INT,
  Name VARCHAR(150),
  SKU VARCHAR(50),
  Price DECIMAL(12,2),
  StockQuantity INT,
  Brand VARCHAR(100),
  Description TEXT,
  CreatedAt DATETIME,
  IsActive BOOLEAN,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Product VALUES
(1,2,'iPhone 14','SKU1',799.00,50,'Apple','Latest iPhone',NOW(),TRUE),
(2,3,'MacBook Pro','SKU2',1299.00,30,'Apple','Powerful laptop',NOW(),TRUE),
(3,5,'Mixer Grinder','SKU3',99.99,100,'Philips','Kitchen mixer',NOW(),TRUE),
(4,7,'Men T-Shirt','SKU4',19.99,200,'Nike','Cotton t-shirt',NOW(),TRUE),
(5,8,'Women Dress','SKU5',49.99,150,'Zara','Evening dress',NOW(),TRUE),
(6,9,'Badminton Racket','SKU6',29.99,80,'Yonex','Lightweight racket',NOW(),TRUE),
(7,10,'Thriller Novel','SKU7',9.99,300,'Penguin','Best-selling novel',NOW(),TRUE),
(8,2,'Samsung Galaxy S22','SKU8',699.00,40,'Samsung','Flagship phone',NOW(),TRUE),
(9,3,'Dell XPS 13','SKU9',999.00,25,'Dell','Ultrabook',NOW(),TRUE),
(10,5,'Air Fryer','SKU10',149.00,60,'Instant','Healthy cooking',NOW(),TRUE);
select * from Product;
drop table Product;
truncate table Product;

-- 5) ProductImage

CREATE TABLE ProductImage (
  ImageID INT PRIMARY KEY,
  ProductID INT,
  ImageURL VARCHAR(255),
  AltText VARCHAR(100),
  IsPrimary BOOLEAN,
  DisplayOrder INT,
  UploadedAt DATETIME,
  Width INT,
  Height INT,
  Format VARCHAR(10),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO ProductImage VALUES
(1,1,'url_img1','iPhone front',TRUE,1,NOW(),800,600,'jpg'),
(2,1,'url_img2','iPhone back',FALSE,2,NOW(),800,600,'jpg'),
(3,3,'url_img3','Mixer front',TRUE,1,NOW(),800,600,'jpg'),
(4,4,'url_img4','T-Shirt design',TRUE,1,NOW(),800,600,'jpg'),
(5,5,'url_img5','Dress front',TRUE,1,NOW(),800,600,'jpg'),
(6,6,'url_img6','Racket image',TRUE,1,NOW(),800,600,'jpg'),
(7,7,'url_img7','Book cover',TRUE,1,NOW(),800,600,'jpg'),
(8,8,'url_img8','Galaxy image',TRUE,1,NOW(),800,600,'jpg'),
(9,9,'url_img9','XPS image',TRUE,1,NOW(),800,600,'jpg'),
(10,10,'url_img10','AirFryer image',TRUE,1,NOW(),800,600,'jpg');
select * from ProductImage;
drop table ProductImage;
truncate table ProductImage;

-- 6) `Order`

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATETIME,
  Status VARCHAR(20),
  TotalAmount DECIMAL(12,2),
  PaymentMethod VARCHAR(50),
  ShippingAddressID INT,
  BillingAddressID INT,
  DiscountCode VARCHAR(50),
  TrackingNumber VARCHAR(50),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ShippingAddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID)
);

INSERT INTO Orders VALUES
(1,1,NOW(),'Processing',799.00,'Credit Card',1,1,NULL,'TRK123'),
(2,2,NOW(),'Shipped',1299.00,'Net Banking',2,2,'DISC10','TRK124'),
(3,3,NOW(),'Delivered',99.99,'Debit Card',3,3,NULL,'TRK125'),
(4,4,NOW(),'Cancelled',19.99,'UPI',4,4,NULL,'TRK126'),
(5,5,NOW(),'Processing',49.99,'Credit Card',5,5,'DISC5','TRK127'),
(6,6,NOW(),'Delivered',29.99,'Debit Card',6,6,NULL,'TRK128'),
(7,7,NOW(),'Shipped',9.99,'Net Banking',7,7,NULL,'TRK129'),
(8,8,NOW(),'Processing',699.00,'UPI',8,8,'DISC15','TRK130'),
(9,9,NOW(),'Delivered',999.00,'Credit Card',9,9,NULL,'TRK131'),
(10,10,NOW(),'Processing',149.00,'Debit Card',10,10,NULL,'TRK132');

select * from Orders;
drop table Orders;
truncate table Orders;
-- 7) OrderItem

CREATE TABLE OrderItem (
  OrderItemID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  UnitPrice DECIMAL(12,2),
  TotalPrice DECIMAL(12,2),
  DiscountApplied DECIMAL(12,2),
  Tax DECIMAL(12,2),
  ReturnStatus VARCHAR(20),
  ReviewID INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO OrderItem VALUES
(1,1,1,1,799.00,799.00,0.00,0.00,'None',NULL),
(2,2,2,1,1299.00,1299.00,0.00,0.00,'None',NULL),
(3,3,3,2,49.995,99.99,0.00,0.00,'None',NULL),
(4,4,4,1,19.99,19.99,0.00,0.00,'Returned',NULL),
(5,5,5,1,49.99,49.99,0.00,0.00,'None',NULL),
(6,6,6,3,29.99,89.97,0.00,0.00,'None',NULL),
(7,7,7,1,9.99,9.99,0.00,0.00,'None',NULL),
(8,8,8,1,699.00,699.00,0.00,0.00,'None',NULL),
(9,9,9,1,999.00,999.00,0.00,0.00,'None',NULL),
(10,10,10,2,149.00,298.00,0.00,0.00,'None',NULL);

select * from OrderItem;
drop table OrderItem;
truncate table OrderItem;

-- 8) Payment

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  OrderID INT,
  Amount DECIMAL(12,2),
  PaymentDate DATETIME,
  PaymentMethod VARCHAR(50),
  Status VARCHAR(20),
  TransactionID VARCHAR(100),
  Provider VARCHAR(50),
  IsRefunded BOOLEAN,
  RefundDate DATETIME,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payment VALUES
(1,1,799.00,NOW(),'Credit Card','Success','TXN123','Visa',FALSE,NULL),
(2,2,1299.00,NOW(),'Net Banking','Failed','TXN124','HDFC',FALSE,NULL),
(3,3,99.99,NOW(),'Debit Card','Success','TXN125','MasterCard',FALSE,NULL),
(4,4,19.99,NOW(),'UPI','Pending','TXN126','GooglePay',TRUE,NOW()),
(5,5,49.99,NOW(),'Credit Card','Success','TXN127','Visa',FALSE,NULL),
(6,6,29.99,NOW(),'Debit Card','Success','TXN128','MasterCard',FALSE,NULL),
(7,7,9.99,NOW(),'Net Banking','Success','TXN129','Axis',FALSE,NULL),
(8,8,699.00,NOW(),'UPI','Success','TXN130','Paytm',FALSE,NULL),
(9,9,999.00,NOW(),'Credit Card','Success','TXN131','Visa',FALSE,NULL),
(10,10,149.00,NOW(),'Debit Card','Success','TXN132','MasterCard',FALSE,NULL);

select * from Payment;
drop table Payment;
truncate table Payment;

-- 9) Shipment

CREATE TABLE Shipment (
  ShipmentID INT PRIMARY KEY,
  OrderID INT,
  ShippedDate DATETIME,
  EstimatedDelivery DATETIME,
  ActualDelivery DATETIME,
  Courier VARCHAR(50),
  TrackingNumber VARCHAR(50),
  ShippingCost DECIMAL(12,2),
  Status VARCHAR(20),
  DeliveredBy VARCHAR(100),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Shipment VALUES
(1,1,NOW(),DATE_ADD(NOW(),INTERVAL 5 DAY),NULL,'DHL','TRK123',50.00,'Shipped','Delivery Team'),
(2,2,NOW(),DATE_ADD(NOW(),INTERVAL 4 DAY),NULL,'FedEx','TRK124',75.00,'Shipped','Delivery Team'),
(3,3,NOW(),DATE_ADD(NOW(),INTERVAL 7 DAY),NOW(),'BlueDart','TRK125',40.00,'Delivered','Delivery Team'),
(4,4,NULL,NULL,NULL,NULL,'TRK126',0.00,'Cancelled',''),
(5,5,NOW(),DATE_ADD(NOW(),INTERVAL 3 DAY),NULL,'DHL','TRK127',50.00,'Shipped','Delivery Team'),
(6,6,NOW(),DATE_ADD(NOW(),INTERVAL 6 DAY),NOW(),'FedEx','TRK128',60.00,'Delivered','Delivery Team'),
(7,7,NOW(),DATE_ADD(NOW(),INTERVAL 2 DAY),NOW(),'BlueDart','TRK129',45.00,'Delivered','Delivery Team'),
(8,8,NOW(),DATE_ADD(NOW(),INTERVAL 4 DAY),NULL,'DHL','TRK130',55.00,'Shipped','Delivery Team'),
(9,9,NOW(),DATE_ADD(NOW(),INTERVAL 7 DAY),NOW(),'FedEx','TRK131',80.00,'Delivered','Delivery Team'),
(10,10,NOW(),DATE_ADD(NOW(),INTERVAL 5 DAY),NULL,'BlueDart','TRK132',45.00,'Shipped','Delivery Team');
select * from Shipment;
drop table Shipment;
truncate table Shipment;

-- 10) Review

CREATE TABLE Review (
  ReviewID INT PRIMARY KEY,
  ProductID INT,
  CustomerID INT,
  Rating INT,
  Title VARCHAR(150),
  Content TEXT,
  ReviewDate DATETIME,
  IsVerifiedPurchase BOOLEAN,
  HelpfulCount INT,
  Response TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Review VALUES
(1,1,1,5,'Excellent iPhone','Loved it!',NOW(),TRUE,10,NULL),
(2,2,2,4,'Great MacBook','Very powerful',NOW(),TRUE,5,NULL),
(3,3,3,3,'Mixer OK','Works well',NOW(),TRUE,2,NULL),
(4,4,4,2,'T-Shirt low quality','Faded quickly',NOW(),FALSE,1,'We are sorry'),
(5,5,5,5,'Beautiful Dress','Perfect fit',NOW(),TRUE,8,NULL),
(6,6,6,4,'Racket durable','Good build',NOW(),TRUE,3,NULL),
(7,7,7,5,'Awesome book','Must read!',NOW(),TRUE,15,NULL),
(8,8,8,3,'Galaxy is okay','Battery average',NOW(),TRUE,4,NULL),
(9,9,9,4,'XPS fast','Love the speed',NOW(),TRUE,6,NULL),
(10,10,10,5,'Air Fryer great','Healthy cooking',NOW(),TRUE,12,NULL);

select * from Review;
drop table Review;
truncate table Review;