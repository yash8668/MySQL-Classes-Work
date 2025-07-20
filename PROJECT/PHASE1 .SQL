-- single line comment -- 
/* 
multi 
line 
comment 
*/

-- CREATE A DATABASE  QUERIES -- 
create database Construction_RealEstate; 

use  Construction_RealEstate;

drop database  Construction_RealEstate;

--  ----------------------- Database Analyze ---------------------------

/*
T1 : Projects(ProjectID, Name, Type, StartDate, EndDate, Status, Budget, ManagerID, Location, Description)

T2 : Sites(SiteID, ProjectID, Address, AreaSqFt, Status, City, State, ZipCode, GeoCoordinates, LandType)

T3 : Contractors(ContractorID, Name, Email, Phone, Address, Specialization, ExperienceYears, LicenseNo, Rating, Status)

T4 : Clients(ClientID, FullName, Email, Phone, Address, City, State, ZipCode, PreferredPropertyType, RegistrationDate)

T5 : Agents(AgentID, Name, Email, Phone, Address, ExperienceYears, Specialization, Rating, Status, CommissionRate)

T6 : PropertyListings(PropertyID, ProjectID, Title, Type, AreaSqFt, Price, Status, Floor, Facing, Description)

T7 : Sales(SaleID, PropertyID, ClientID, AgentID, SaleDate, FinalPrice, PaymentMode, Status, AgreementSigned, Remarks)

T8 : Leads(LeadID, ClientID, PropertyID, Source, Status, AssignedAgentID, InquiryDate, FollowUpDate, Priority, Notes)

T9 : Employees(EmployeeID, FullName, Email, Phone, Department, Role, Salary, HireDate, ManagerID, Status)

T10 : Vendors(VendorID, CompanyName, ContactName, Email, Phone, Address, ServiceType, Rating, GSTNumber, Status)

T11 : Materials(MaterialID, Name, Category, Unit, PricePerUnit, StockQuantity, SupplierID, LastUpdated, Status, Remarks)

T12 : PurchaseOrders(OrderID, VendorID, MaterialID, OrderDate, DeliveryDate, Quantity, TotalCost, Status, ApprovedBy, Notes)

T13 : Payments(PaymentID, SaleID, Amount, PaymentDate, Method, Status, TransactionID, BankName, ReceivedBy, Remarks)

T14 : Inspections(InspectionID, SiteID, InspectorName, InspectionDate, Result, Status, NextInspection, AssignedBy, ApprovedBy, Remarks)

T15 : MaintenanceRequests(RequestID, PropertyID, ClientID, RequestDate, IssueType, Description, AssignedTo, CompletionDate, Status, Feedback)

T16 : Leases(LeaseID, PropertyID, ClientID, StartDate, EndDate, RentAmount, DepositAmount, AgreementSigned, Status, Notes)

T17 : LegalDocuments(DocumentID, PropertyID, DocumentType, IssueDate, ExpiryDate, FilePath, VerifiedBy, Status, UploadDate, Remarks)

T18 : Permits(PermitID, SiteID, Type, IssuedBy, IssueDate, ExpiryDate, FilePath, VerifiedBy, Status, Notes)

T19 : ConstructionPhases(PhaseID, ProjectID, PhaseName, StartDate, EndDate, SupervisorID, Budget, ActualCost, Status, Remarks)

T20 : Tasks(TaskID, PhaseID, TaskName, AssignedTo, StartDate, EndDate, ProgressPercent, Status, Priority, Remarks)

T21 : Equipment(EquipmentID, Name, Type, Quantity, PurchaseDate, AssignedToSite, MaintenanceDate, VendorID, Status, Remarks)

T22 : SiteVisits(VisitID, SiteID, VisitorName, VisitDate, Purpose, GuidedBy, DurationMinutes, Status, Feedback, Notes)

T23 : Budgets(BudgetID, ProjectID, PhaseID, Amount, ApprovedBy, ApprovalDate, Category, Year, Status, Remarks)

T24 : Invoices(InvoiceID, OrderID, VendorID, InvoiceDate, DueDate, TotalAmount, PaidAmount, Status, GeneratedBy, Notes)

T25 : Feedback(FeedbackID, ClientID, PropertyID, SubmittedDate, Rating, Comments, AgentID, Resolved, Response, Status)
 
*/

-- 1. Projects
-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Status VARCHAR(30) NOT NULL,
    Budget DECIMAL(12,2),
    ManagerID INT,
    Location VARCHAR(100),
    Description TEXT
);

-- Insert 20 sample records into Projects
INSERT INTO Projects VALUES 
(1, 'Skyline Residency', 'Residential', '2022-01-15', '2024-06-30', 'Ongoing', 15000000.00, 3, 'Mumbai', 'Luxury housing near city center.'),
(2, 'Green Tech Park', 'Commercial', '2021-11-10', '2023-12-15', 'Completed', 22000000.00, 5, 'Pune', 'Commercial park with green spaces.'),
(3, 'Riverfront Villas', 'Residential', '2022-05-01', '2025-01-31', 'Ongoing', 18000000.00, 4, 'Ahmedabad', 'High-end villas along the river.'),
(4, 'TechnoHub', 'Industrial', '2021-06-20', '2023-10-10', 'Completed', 30000000.00, 2, 'Hyderabad', 'IT industrial area development.'),
(5, 'Central Plaza', 'Mixed-Use', '2022-02-28', '2025-05-30', 'Ongoing', 25000000.00, 6, 'Chennai', 'Retail and residential complex.'),
(6, 'Sunshine Apartments', 'Residential', '2022-03-10', '2024-08-15', 'Ongoing', 14000000.00, 3, 'Navi Mumbai', 'Affordable apartment block.'),
(7, 'Galaxy Business Tower', 'Commercial', '2021-07-01', '2023-11-20', 'Completed', 19500000.00, 5, 'Bengaluru', 'Corporate office tower.'),
(8, 'Eastern Industrial Zone', 'Industrial', '2020-12-15', '2023-09-10', 'Completed', 27000000.00, 8, 'Kolkata', 'Manufacturing and logistics hub.'),
(9, 'Metro Heights', 'Residential', '2022-04-01', '2024-10-10', 'Ongoing', 16000000.00, 1, 'Delhi', 'Mid-range residential flats.'),
(10, 'TechGarden Complex', 'Commercial', '2021-08-12', '2023-12-01', 'Completed', 20000000.00, 7, 'Noida', 'Business park with coworking spaces.'),
(11, 'Lakeview Enclave', 'Residential', '2022-06-05', '2025-02-20', 'Ongoing', 17500000.00, 4, 'Bhopal', 'Gated community near lake.'),
(12, 'Trade Tower', 'Commercial', '2020-10-25', '2023-07-31', 'Completed', 21000000.00, 9, 'Jaipur', 'Modern commercial tower.'),
(13, 'Eastern Bay Homes', 'Residential', '2022-01-01', '2024-12-15', 'Ongoing', 15500000.00, 2, 'Kochi', 'Premium residential area.'),
(14, 'AutoTech Park', 'Industrial', '2021-04-20', '2023-12-10', 'Completed', 26000000.00, 6, 'Chakan', 'Automobile manufacturing hub.'),
(15, 'Urban Nexus', 'Mixed-Use', '2022-07-18', '2025-03-25', 'Ongoing', 24500000.00, 10, 'Nagpur', 'Integrated city space.'),
(16, 'Palm Residency', 'Residential', '2022-03-22', '2024-07-05', 'Ongoing', 14500000.00, 5, 'Surat', 'High-rise luxury apartments.'),
(17, 'Smart Biz Park', 'Commercial', '2020-09-10', '2023-08-20', 'Completed', 23000000.00, 8, 'Indore', 'Tech-enabled commercial spaces.'),
(18, 'GreenField Industrial Estate', 'Industrial', '2021-12-15', '2024-11-15', 'Ongoing', 28000000.00, 7, 'Vadodara', 'Industrial sheds and plots.'),
(19, 'Hilltop View', 'Residential', '2022-05-25', '2024-09-10', 'Ongoing', 16500000.00, 3, 'Shimla', 'Scenic hillside apartments.'),
(20, 'Urban Square', 'Mixed-Use', '2022-08-01', '2025-04-01', 'Ongoing', 25500000.00, 9, 'Thane', 'Mall, offices, and homes.');

-- ----- to display  table data --------------------------

select*from Projects ;

-- ------ to remove complete records from table --------------

truncate  table Projects;

-- ------- to remove  complete records and attribute form table  -------

drop table Projects;

-- 2. Sites
CREATE TABLE Sites (
    SiteID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    Address TEXT NOT NULL,
    AreaSqFt DECIMAL(10,2) NOT NULL CHECK (AreaSqFt > 0),
    Status VARCHAR(30),
    GeoCoordinates VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    LandType VARCHAR(50),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE
);
INSERT INTO Sites VALUES
(1, 1, 'Sector 45, Navi Mumbai', 10250.75, 'Cleared', '19.0330,72.9258', 'Mumbai', 'Maharashtra', '400706', 'Residential'),
(2, 2, 'Hinjewadi Phase 2', 8500.00, 'Under Construction', '18.5953,73.7386', 'Pune', 'Maharashtra', '411057', 'Commercial'),
(3, 3, 'Sabarmati Riverfront', 9800.50, 'Surveyed', '23.0225,72.5714', 'Ahmedabad', 'Gujarat', '380005', 'Residential'),
(4, 4, 'Gachibowli Industrial Area', 12000.00, 'Approved', '17.4449,78.3498', 'Hyderabad', 'Telangana', '500032', 'Industrial'),
(5, 5, 'T Nagar Center', 8900.25, 'Excavation Started', '13.0449,80.2676', 'Chennai', 'Tamil Nadu', '600017', 'Mixed-Use'),
(6, 6, 'Palm Beach Road', 7500.75, 'Cleared', '19.0334,73.0297', 'Navi Mumbai', 'Maharashtra', '400705', 'Residential'),
(7, 7, 'Outer Ring Road', 11000.30, 'Foundation Laid', '12.9716,77.5946', 'Bengaluru', 'Karnataka', '560103', 'Commercial'),
(8, 8, 'Dhulagarh Industrial Belt', 12550.00, 'Ongoing', '22.5645,88.3433', 'Kolkata', 'West Bengal', '711302', 'Industrial'),
(9, 9, 'Dwarka Sector 21', 9600.00, 'Surveyed', '28.5562,77.1000', 'Delhi', 'Delhi', '110075', 'Residential'),
(10, 10, 'Sector 142', 10300.50, 'In Progress', '28.5630,77.3344', 'Noida', 'Uttar Pradesh', '201305', 'Commercial'),
(11, 11, 'Kolar Road', 8700.40, 'Survey Complete', '23.2332,77.4323', 'Bhopal', 'Madhya Pradesh', '462042', 'Residential'),
(12, 12, 'Tonk Road', 9900.20, 'Approved', '26.9124,75.7873', 'Jaipur', 'Rajasthan', '302018', 'Commercial'),
(13, 13, 'Vytilla Junction', 7850.60, 'Ongoing', '9.9674,76.3006', 'Kochi', 'Kerala', '682019', 'Residential'),
(14, 14, 'MIDC Phase 3', 13300.00, 'Site Prep', '18.7483,73.4072', 'Chakan', 'Maharashtra', '410501', 'Industrial'),
(15, 15, 'Wardha Road', 9700.70, 'Excavated', '21.1458,79.0882', 'Nagpur', 'Maharashtra', '440015', 'Mixed-Use'),
(16, 16, 'Adajan Road', 8600.00, 'Surveyed', '21.1702,72.8311', 'Surat', 'Gujarat', '395009', 'Residential'),
(17, 17, 'Vijay Nagar', 9300.20, 'Cleared', '22.7196,75.8577', 'Indore', 'Madhya Pradesh', '452010', 'Commercial'),
(18, 18, 'Makarpura GIDC', 12100.90, 'Cleared', '22.2950,73.2092', 'Vadodara', 'Gujarat', '390010', 'Industrial'),
(19, 19, 'Boileauganj Area', 7900.00, 'In Review', '31.1048,77.1734', 'Shimla', 'Himachal Pradesh', '171001', 'Residential'),
(20, 20, 'Ghodbunder Road', 10050.40, 'Excavation Started', '19.2183,72.9781', 'Thane', 'Maharashtra', '400615', 'Mixed-Use');

-- ----- to display  table data --------------------------

select*from Sites ;

-- ------ to remove complete records from table --------------

truncate  table Sites;

-- ------- to remove  complete records and attribute form table  -------

drop table Sites;

-- 3. Contractors
CREATE TABLE Contractors (
    ContractorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    Specialization VARCHAR(100),
    ExperienceYears INT CHECK (ExperienceYears >= 0),
    LicenseNo VARCHAR(50) UNIQUE,
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 0 AND 5),
    Status VARCHAR(30)
);
INSERT INTO Contractors VALUES
(1, 'Alpha Builders', 'contact@alphabuild.com', '9876543210', 'Sector 17, Navi Mumbai', 'Residential Construction', 10, 'LIC001A', 4.5, 'Active'),
(2, 'MegaStruct Pvt Ltd', 'info@megast.com', '9823456780', 'Banjara Hills, Hyderabad', 'Commercial Projects', 12, 'LIC002B', 4.2, 'Active'),
(3, 'Green Earth Dev', 'hello@greenearth.in', '9812345678', 'Whitefield, Bengaluru', 'Eco-Conscious Building', 8, 'LIC003C', 4.7, 'Active'),
(4, 'BuildRight Co.', 'buildright@gmail.com', '9871234560', 'MG Road, Pune', 'Mixed Use', 9, 'LIC004D', 4.3, 'Active'),
(5, 'UrbanConstructs', 'urbanconstructs@yahoo.com', '9765432109', 'Sector 62, Noida', 'Residential', 11, 'LIC005E', 4.1, 'Active'),
(6, 'InfraZone Ltd', 'support@infrazone.com', '9999999999', 'Salt Lake, Kolkata', 'Industrial', 13, 'LIC006F', 4.6, 'Active'),
(7, 'NextGen Infra', 'contact@nextgeninfra.com', '9815566778', 'Anna Nagar, Chennai', 'Commercial', 7, 'LIC007G', 4.4, 'Active'),
(8, 'SkyBuilders', 'info@skybuilders.in', '9900001111', 'Churchgate, Mumbai', 'High-Rise', 10, 'LIC008H', 4.3, 'Active'),
(9, 'Stark Constructions', 'starkconst@gmail.com', '9922334455', 'Sector 49, Gurugram', 'Smart Homes', 6, 'LIC009I', 4.0, 'Active'),
(10, 'Vision Infra', 'admin@visioninfra.com', '9833344556', 'Indiranagar, Bengaluru', 'Tech Parks', 14, 'LIC010J', 4.8, 'Active'),
(11, 'Unity Engineers', 'unityeng@outlook.com', '9798989898', 'Ambattur, Chennai', 'Warehouses', 5, 'LIC011K', 3.9, 'Active'),
(12, 'Reliable Infra', 'reliableinfra@xyz.com', '9876767676', 'Gandhinagar, Gujarat', 'Residential', 7, 'LIC012L', 4.1, 'Active'),
(13, 'BuildTrust Ltd', 'info@buildtrust.in', '9822233445', 'Viman Nagar, Pune', 'Mixed-Use', 9, 'LIC013M', 4.2, 'Active'),
(14, 'UrbanRise', 'urbanrise@infra.com', '9911223344', 'Lajpat Nagar, Delhi', 'Affordable Housing', 6, 'LIC014N', 4.0, 'Active'),
(15, 'Quantum Build', 'hello@quantumbuild.com', '9887766554', 'Vashi, Navi Mumbai', 'High-Tech', 10, 'LIC015O', 4.6, 'Active'),
(16, 'Everest Infra', 'contact@everestinfra.com', '9933445566', 'Hitech City, Hyderabad', 'Commercial', 8, 'LIC016P', 4.4, 'Active'),
(17, 'Elite Developers', 'elite@dev.in', '9844556677', 'JP Nagar, Bengaluru', 'Luxury Homes', 7, 'LIC017Q', 4.5, 'Active'),
(18, 'EcoBuild India', 'info@ecobuild.in', '9811223344', 'Nizampet, Hyderabad', 'Green Building', 6, 'LIC018R', 4.3, 'Active'),
(19, 'SilverStone Ltd', 'silver@stone.com', '9767888899', 'Pimpri, Pune', 'Industrial', 12, 'LIC019S', 4.2, 'Active'),
(20, 'Fusion Projects', 'fusionproj@gmail.com', '9845566777', 'Kharghar, Navi Mumbai', 'Mixed', 9, 'LIC020T', 4.1, 'Active');

-- ----- to display  table data --------------------------

select*from Contractors ;

-- ------ to remove complete records from table --------------

truncate  table Contractors;

-- ------- to remove  complete records and attribute form table  -------

drop table Contractors;

-- 4. Clients
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    PreferredType VARCHAR(50),
    RegistrationDate DATE NOT NULL
);
INSERT INTO Clients VALUES
(1, 'Ravi Kumar', 'ravi.kumar@gmail.com', '9876543210', 'Sector 12, Noida', 'Noida', 'Uttar Pradesh', '201301', 'Residential', '2024-01-10'),
(2, 'Sunita Sharma', 'sunita.s@gmail.com', '9823456789', 'MG Road, Pune', 'Pune', 'Maharashtra', '411001', 'Commercial', '2023-12-20'),
(3, 'Amit Joshi', 'amit.j@rediffmail.com', '9812345678', 'Andheri West', 'Mumbai', 'Maharashtra', '400058', 'Residential', '2024-03-15'),
(4, 'Nisha Mehra', 'nisha.mehra@yahoo.com', '9871234567', 'Sector 15', 'Chandigarh', 'Chandigarh', '160015', 'Residential', '2023-11-25'),
(5, 'Pooja Desai', 'pooja.d@gmail.com', '9765432109', 'Lalbagh Road', 'Bengaluru', 'Karnataka', '560027', 'Mixed-Use', '2024-01-05'),
(6, 'Anil Kapoor', 'anil.k@hotmail.com', '9999999999', 'Kukatpally', 'Hyderabad', 'Telangana', '500072', 'Residential', '2023-10-01'),
(7, 'Seema Reddy', 'seema.r@outlook.com', '9815566778', 'Anna Nagar', 'Chennai', 'Tamil Nadu', '600040', 'Residential', '2024-02-15'),
(8, 'Vivek Sen', 'vivek.s@gmail.com', '9900001111', 'Salt Lake', 'Kolkata', 'West Bengal', '700064', 'Commercial', '2023-12-01'),
(9, 'Rohit Patil', 'rohit.patil@xyz.com', '9922334455', 'Bandra West', 'Mumbai', 'Maharashtra', '400050', 'Residential', '2024-03-20'),
(10, 'Ananya Das', 'ananya.d@gmail.com', '9833344556', 'Rajarhat', 'Kolkata', 'West Bengal', '700135', 'Residential', '2023-11-15'),
(11, 'Mohit Jain', 'mohit.j@abc.com', '9798989898', 'Sector 49', 'Gurgaon', 'Haryana', '122018', 'Commercial', '2024-01-25'),
(12, 'Sneha Rao', 'sneha.rao@outlook.com', '9876767676', 'BTM Layout', 'Bengaluru', 'Karnataka', '560076', 'Residential', '2023-12-05'),
(13, 'Ajay Nair', 'ajay.nair@gmail.com', '9822233445', 'Vyttila', 'Kochi', 'Kerala', '682019', 'Residential', '2024-02-01'),
(14, 'Tanvi Shah', 'tanvi.shah@xyz.com', '9911223344', 'Satellite', 'Ahmedabad', 'Gujarat', '380015', 'Mixed-Use', '2023-11-10'),
(15, 'Harsh Vora', 'harsh.vora@gmail.com', '9887766554', 'Adajan', 'Surat', 'Gujarat', '395009', 'Residential', '2024-03-10'),
(16, 'Kavita Joshi', 'kavita.j@gmail.com', '9933445566', 'Model Town', 'Delhi', 'Delhi', '110009', 'Commercial', '2023-10-20'),
(17, 'Rakesh Kumar', 'rakesh.k@abc.com', '9844556677', 'Shivaji Nagar', 'Bhopal', 'Madhya Pradesh', '462003', 'Residential', '2024-01-18'),
(18, 'Neha Saxena', 'neha.saxena@gmail.com', '9811223344', 'MIDC Area', 'Nashik', 'Maharashtra', '422001', 'Industrial', '2023-12-25'),
(19, 'Manoj Tiwari', 'manoj.t@gmail.com', '9767888899', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'Residential', '2024-02-28'),
(20, 'Priya Kapoor', 'priya.kapoor@xyz.com', '9845566777', 'Sector 63', 'Noida', 'Uttar Pradesh', '201307', 'Mixed-Use', '2023-11-30');

-- ----- to display  table data --------------------------

select*from Clients ;

-- ------ to remove complete records from table --------------

truncate  table Clients;

-- ------- to remove  complete records and attribute form table  -------

drop table Clients;

-- 5. Agents
CREATE TABLE Agents (
    AgentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    ExperienceYears INT CHECK (ExperienceYears >= 0),
    Specialization VARCHAR(100),
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 0 AND 5),
    Status VARCHAR(30),
    CommissionRate DECIMAL(5,2)
);
INSERT INTO Agents VALUES
(1, 'Ramesh Verma', 'ramesh.verma@agency.com', '9876543201', 'Noida Sec 50', 8, 'Residential Sales', 4.3, 'Active', 1.50),
(2, 'Deepa Shah', 'deepa.shah@realtyhub.com', '9823456782', 'Kothrud, Pune', 6, 'Commercial', 4.6, 'Active', 2.00),
(3, 'Karan Mehta', 'karan.meh@homesale.com', '9812345673', 'Powai, Mumbai', 5, 'Luxury Flats', 4.5, 'Active', 2.25),
(4, 'Snehal Patil', 'snehal.patil@agentx.in', '9871234569', 'Chinchwad, Pune', 7, 'Mixed-Use', 4.2, 'Active', 1.80),
(5, 'Ankit Rathi', 'ankit.rathi@xproperty.com', '9765432111', 'Vile Parle, Mumbai', 9, 'Industrial', 4.4, 'Active', 1.75),
(6, 'Neeta Joshi', 'neeta.j@buildrealty.com', '9999999991', 'Sector 51, Gurugram', 10, 'Residential', 4.7, 'Active', 2.00),
(7, 'Abhishek Yadav', 'abhishek.y@delhihomes.com', '9815566781', 'Dwarka, Delhi', 4, 'Affordable Housing', 4.0, 'Active', 1.20),
(8, 'Prerna Gupta', 'prerna.g@dreamland.com', '9900001112', 'Banjara Hills', 6, 'High-Rise', 4.5, 'Active', 1.60),
(9, 'Rohit Agarwal', 'rohit.a@skyview.com', '9922334456', 'Salt Lake', 5, 'Luxury', 4.3, 'Active', 2.50),
(10, 'Shraddha Kapoor', 'shraddha.k@agents.in', '9833344557', 'Velachery, Chennai', 8, 'Smart Homes', 4.6, 'Active', 2.10),
(11, 'Jay Patel', 'jay.p@realtors.in', '9798989899', 'Ellisbridge, Ahmedabad', 7, 'Residential', 4.1, 'Active', 1.50),
(12, 'Komal Rana', 'komal.r@realtors.in', '9876767677', 'Malviya Nagar, Jaipur', 6, 'Commercial', 4.2, 'Active', 1.70),
(13, 'Tushar Singh', 'tushar.s@agentsindia.com', '9822233446', 'Sadar, Nagpur', 5, 'Plots', 4.3, 'Active', 1.85),
(14, 'Anjali Nair', 'anjali.n@flatdeal.in', '9911223345', 'Thane East', 9, 'Apartments', 4.7, 'Active', 2.10),
(15, 'Vikram Reddy', 'vikram.r@estatex.com', '9887766555', 'Secunderabad', 3, 'Independent Homes', 3.9, 'Active', 1.30),
(16, 'Megha Jain', 'megha.jain@abc.com', '9933445567', 'JP Nagar, Bengaluru', 6, 'Residential', 4.4, 'Active', 2.25),
(17, 'Rajesh Singh', 'rajesh.s@abc.com', '9844556678', 'Indira Nagar', 7, 'Industrial', 4.1, 'Active', 1.90),
(18, 'Pallavi Das', 'pallavi.d@realmart.com', '9811223345', 'Alambagh', 5, 'Mid-Range Homes', 4.0, 'Active', 1.65),
(19, 'Mohit Sinha', 'mohit.sinha@urbanagent.com', '9767888890', 'Gomti Nagar', 8, 'Luxury Properties', 4.6, 'Active', 2.35),
(20, 'Swati Vora', 'swati.v@agentpro.in', '9845566778', 'Paldi, Ahmedabad', 4, 'Commercial', 4.2, 'Active', 1.70);

-- ----- to display  table data --------------------------

select*from Agents ;

-- ------ to remove complete records from table --------------

truncate  table Agents;

-- ------- to remove  complete records and attribute form table  -------

drop table Agents;

-- 6. PropertyListings
CREATE TABLE PropertyListings (
    PropertyID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    Title VARCHAR(100),
    Type VARCHAR(50),
    Area DECIMAL(10,2) CHECK (Area > 0),
    Price DECIMAL(12,2) CHECK (Price >= 0),
    Status VARCHAR(30),
    Floor INT,
    Facing VARCHAR(20),
    Description TEXT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) 
);
INSERT INTO PropertyListings VALUES
(1, 1, '2BHK Skyline Flat', 'Residential', 900.50, 4500000.00, 'Available', 5, 'East', 'Modern 2BHK with amenities'),
(2, 2, 'TechPark Floor 3', 'Commercial', 1200.00, 8000000.00, 'Sold', 3, 'North', 'IT office space with parking'),
(3, 3, 'RiverView Villa', 'Residential', 1800.75, 9500000.00, 'Available', 1, 'West', 'Luxury villa with river view'),
(4, 4, 'Industrial Shed A1', 'Industrial', 5000.00, 12000000.00, 'Available', 0, 'North-East', 'Manufacturing shed'),
(5, 5, 'Retail Shop G1', 'Commercial', 300.00, 2000000.00, 'Booked', 0, 'South', 'Ground floor shop in plaza'),
(6, 6, 'Affordable Flat 1BHK', 'Residential', 600.00, 2500000.00, 'Available', 2, 'East', 'Budget home near school'),
(7, 7, 'Office Space 2nd Floor', 'Commercial', 1000.00, 7000000.00, 'Sold', 2, 'South-East', 'Furnished office'),
(8, 8, 'Warehouse Plot A', 'Industrial', 8000.00, 18000000.00, 'Available', 0, 'West', 'Logistics hub'),
(9, 9, 'CityView Apartment', 'Residential', 1000.00, 5200000.00, 'Available', 6, 'North', '6th-floor city view'),
(10, 10, 'StartUp Hub', 'Commercial', 1100.00, 7500000.00, 'Available', 1, 'East', 'Tech startup space'),
(11, 11, 'LakeFacing House', 'Residential', 1500.00, 8200000.00, 'Booked', 0, 'West', 'Facing Bhopal lake'),
(12, 12, 'Business Tower Floor 5', 'Commercial', 1300.00, 9000000.00, 'Available', 5, 'South', 'Corporate setting'),
(13, 13, 'HillTop Studio', 'Residential', 700.00, 3000000.00, 'Available', 3, 'North-East', 'Compact studio'),
(14, 14, 'AutoZone Plot B', 'Industrial', 9000.00, 15000000.00, 'Available', 0, 'South', 'Auto component factory'),
(15, 15, 'Urban Nexus Condo', 'Mixed-Use', 950.00, 4800000.00, 'Sold', 4, 'East', 'Smart home condo'),
(16, 16, 'Luxury Tower Flat', 'Residential', 1600.00, 10500000.00, 'Available', 8, 'West', 'Sea-facing penthouse'),
(17, 17, 'TechBiz Suite', 'Commercial', 1400.00, 8700000.00, 'Booked', 3, 'South', 'IT-ready office'),
(18, 18, 'Industrial Zone C3', 'Industrial', 10000.00, 20000000.00, 'Available', 0, 'East', 'Heavy industry space'),
(19, 19, 'Scenic Hillside Flat', 'Residential', 1200.00, 6000000.00, 'Available', 2, 'West', 'Cool climate location'),
(20, 20, 'Retail + Office Block', 'Mixed-Use', 1800.00, 10000000.00, 'Sold', 1, 'South-East', 'Retail + Work Suite');

-- ----- to display  table data --------------------------

select*from PropertyListings ;

-- ------ to remove complete records from table --------------

truncate  table PropertyListings;

-- ------- to remove  complete records and attribute form table  -------

drop table PropertyListings;

-- 7. Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    ClientID INT NOT NULL,
    AgentID INT NOT NULL,
    SaleDate DATE NOT NULL,
    FinalPrice DECIMAL(12,2) CHECK (FinalPrice >= 0),
    PaymentMode VARCHAR(30),
    Status VARCHAR(30),
    AgreementSigned BOOLEAN DEFAULT FALSE,
    Remarks TEXT,
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);
INSERT INTO Sales VALUES
(1, 1, 1, 1, '2024-01-15', 9500000.00, 'Bank Transfer', 'Completed', TRUE, 'Finalized with all documents'),
(2, 2, 2, 2, '2024-01-20', 8700000.00, 'Cheque', 'Pending', FALSE, 'Waiting for agent confirmation'),
(3, 3, 3, 3, '2024-02-01', 12500000.00, 'Cash', 'Completed', TRUE, 'Immediate possession'),
(4, 4, 4, 4, '2024-02-10', 6300000.00, 'Online', 'Completed', TRUE, 'GST included'),
(5, 5, 5, 5, '2024-02-20', 5000000.00, 'Bank Transfer', 'Cancelled', FALSE, 'Client backed out'),
(6, 6, 6, 6, '2024-03-01', 8100000.00, 'Cheque', 'Completed', TRUE, 'Broker assisted'),
(7, 7, 7, 7, '2024-03-05', 9300000.00, 'Cash', 'Completed', TRUE, 'All formalities done'),
(8, 8, 8, 8, '2024-03-15', 8800000.00, 'Online', 'Pending', FALSE, 'Documents pending'),
(9, 9, 9, 9, '2024-03-25', 9900000.00, 'Bank Transfer', 'Completed', TRUE, 'Government taxes paid'),
(10, 10, 10, 10, '2024-04-01', 6500000.00, 'Cheque', 'Completed', TRUE, 'All verified'),
(11, 11, 11, 11, '2024-04-10', 7100000.00, 'Online', 'Completed', TRUE, 'Possession in 2 weeks'),
(12, 12, 12, 12, '2024-04-15', 7800000.00, 'Cash', 'Pending', FALSE, 'Buyer requested delay'),
(13, 13, 13, 13, '2024-04-20', 8500000.00, 'Bank Transfer', 'Completed', TRUE, 'Transferred to registry'),
(14, 14, 14, 14, '2024-04-25', 9200000.00, 'Online', 'Completed', TRUE, 'Broker fee adjusted'),
(15, 15, 15, 15, '2024-05-01', 9900000.00, 'Cash', 'Completed', TRUE, 'Under possession'),
(16, 16, 16, 16, '2024-05-05', 10500000.00, 'Cheque', 'Pending', FALSE, 'Token paid'),
(17, 17, 17, 17, '2024-05-10', 11000000.00, 'Bank Transfer', 'Completed', TRUE, 'All taxes paid'),
(18, 18, 18, 18, '2024-05-15', 6700000.00, 'Online', 'Completed', TRUE, 'Loan approved'),
(19, 19, 19, 19, '2024-05-20', 7200000.00, 'Cash', 'Pending', FALSE, 'Awaiting builder NOC'),
(20, 20, 20, 20, '2024-05-25', 8000000.00, 'Online', 'Completed', TRUE, 'All cleared');

-- ----- to display  table data --------------------------

select*from Sales ;

-- ------ to remove complete records from table --------------

truncate  table Sales;

-- ------- to remove  complete records and attribute form table  -------

drop table Sales;

-- 8. Leads
CREATE TABLE Leads (
    LeadID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    PropertyID INT,
    Source VARCHAR(50),
    Status VARCHAR(30),
    AssignedAgentID INT,
    InquiryDate DATE NOT NULL,
    FollowUpDate DATE,
    Notes TEXT,
    Priority VARCHAR(20),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID),
    FOREIGN KEY (AssignedAgentID) REFERENCES Agents(AgentID)
);
INSERT INTO Leads VALUES
(1, 1, 1, 'Website', 'New', 301, '2024-01-05', '2024-01-10', 'First visit scheduled', 'High'),
(2, 2, 2, 'Referral', 'Contacted', 302, '2024-01-08', '2024-01-12', 'Wants 2BHK flat', 'Medium'),
(3, 3, 3, 'Facebook', 'Followed Up', 303, '2024-01-10', '2024-01-15', 'Shared brochure', 'High'),
(4, 4, 4, 'Event', 'New', 304, '2024-01-12', '2024-01-18', 'Visited booth at expo', 'Low'),
(5, 5, 5, 'WhatsApp', 'Contacted', 305, '2024-01-14', '2024-01-20', 'Requested callback', 'Medium'),
(6, 6, 6, 'Instagram', 'New', 306, '2024-01-17', '2024-01-25', 'Interested in commercial space', 'High'),
(7, 7, 7, 'Website', 'Contacted', 307, '2024-01-20', '2024-01-27', 'Needs site visit', 'High'),
(8, 8, 8, 'YouTube', 'New', 308, '2024-01-22', '2024-01-30', 'Looking for villa', 'Medium'),
(9, 9, 9, 'Email', 'Followed Up', 309, '2024-01-24', '2024-02-01', 'Sent quotation', 'High'),
(10, 10, 10, 'Referral', 'New', 310, '2024-01-26', '2024-02-02', 'Interested in resale', 'Low'),
(11, 11, 11, 'Walk-in', 'Contacted', 301, '2024-01-28', '2024-02-05', 'Discussed options', 'Medium'),
(12, 12, 12, 'Website', 'New', 302, '2024-01-30', '2024-02-06', 'Shared location details', 'Medium'),
(13, 13, 13, 'Facebook', 'Followed Up', 303, '2024-02-01', '2024-02-08', 'Sent site video', 'High'),
(14, 14, 14, 'WhatsApp', 'New', 304, '2024-02-03', '2024-02-10', 'Needs price list', 'Low'),
(15, 15, 15, 'Event', 'Contacted', 305, '2024-02-05', '2024-02-12', 'Discussed payment plan', 'Medium'),
(16, 16, 16, 'Google Ads', 'New', 306, '2024-02-07', '2024-02-14', 'Budget constraint', 'Low'),
(17, 17, 17, 'Email', 'Followed Up', 307, '2024-02-09', '2024-02-16', 'Sent legal docs', 'High'),
(18, 18, 18, 'Referral', 'New', 308, '2024-02-11', '2024-02-18', 'Needs financial help', 'Medium'),
(19, 19, 19, 'Instagram', 'Contacted', 309, '2024-02-13', '2024-02-20', 'Booked appointment', 'High'),
(20, 20, 20, 'Walk-in', 'New', 310, '2024-02-15', '2024-02-22', 'Follow up in March', 'Low');

-- ----- to display  table data --------------------------

select*from Leads ;

-- ------ to remove complete records from table --------------

truncate  table Leads;

-- ------- to remove  complete records and attribute form table  -------

drop table Leads;

-- 9. Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    Role VARCHAR(50),
    ManagerID INT,
    Status VARCHAR(30),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Employees VALUES
(101, 'Rahul Mehta', 'Sales', 'rahul@realbuild.com', '9876543210', '2021-06-01', 55000.00, 'Manager', NULL, 'Active'),
(102, 'Sneha Rao', 'HR', 'sneha@realbuild.com', '9823456712', '2021-07-15', 40000.00, 'HR Executive', 101, 'Active'),
(103, 'Vikram Das', 'Sales', 'vikram@realbuild.com', '9812345678', '2021-08-01', 45000.00, 'Agent', 101, 'Active'),
(104, 'Priya Shah', 'Tech', 'priya@realbuild.com', '9871234567', '2021-09-05', 60000.00, 'Developer', 101, 'Active'),
(105, 'Ankit Roy', 'Accounts', 'ankit@realbuild.com', '9865432109', '2021-10-10', 48000.00, 'Accountant', 101, 'Active'),
(106, 'Nisha Iyer', 'Tech', 'nisha@realbuild.com', '9856123456', '2021-11-15', 61000.00, 'QA Engineer', 104, 'Active'),
(107, 'Amit Sinha', 'Sales', 'amit@realbuild.com', '9843210987', '2021-12-20', 47000.00, 'Agent', 101, 'Active'),
(108, 'Ritu Jain', 'Sales', 'ritu@realbuild.com', '9832109876', '2022-01-25', 46000.00, 'Agent', 101, 'Active'),
(109, 'Neha Gupta', 'HR', 'neha@realbuild.com', '9821098765', '2022-02-15', 42000.00, 'HR Executive', 102, 'Active'),
(110, 'Karan Verma', 'Sales', 'karan@realbuild.com', '9810987654', '2022-03-10', 49000.00, 'Agent', 101, 'Active'),
(111, 'Divya Joshi', 'Tech', 'divya@realbuild.com', '9809876543', '2022-04-01', 62000.00, 'Developer', 104, 'Active'),
(112, 'Raj Patel', 'Sales', 'raj@realbuild.com', '9798765432', '2022-04-15', 46000.00, 'Agent', 101, 'Active'),
(113, 'Kavita Bansal', 'Accounts', 'kavita@realbuild.com', '9787654321', '2022-05-10', 50000.00, 'Accountant', 105, 'Active'),
(114, 'Manoj Kumar', 'Sales', 'manoj@realbuild.com', '9776543210', '2022-06-05', 48000.00, 'Agent', 101, 'Active'),
(115, 'Alisha Kapoor', 'Sales', 'alisha@realbuild.com', '9765432109', '2022-06-20', 47000.00, 'Agent', 101, 'Active'),
(116, 'Yash More', 'Support', 'yash@realbuild.com', '9754321098', '2022-07-10', 45000.00, 'Support Exec', 101, 'Active'),
(117, 'Arjun Singh', 'Tech', 'arjun@realbuild.com', '9743210987', '2022-08-01', 63000.00, 'Sr Developer', 104, 'Active'),
(118, 'Sana Khan', 'Sales', 'sana@realbuild.com', '9732109876', '2022-08-15', 49000.00, 'Agent', 101, 'Active'),
(119, 'Mehul Desai', 'Support', 'mehul@realbuild.com', '9721098765', '2022-09-01', 46000.00, 'Support Exec', 116, 'Active'),
(120, 'Tanvi Nair', 'Admin', 'tanvi@realbuild.com', '9710987654', '2022-09-15', 44000.00, 'Admin Assistant', 101, 'Active');

-- ----- to display  table data --------------------------

select*from Employees ;

-- ------ to remove complete records from table --------------

truncate  table Employees;

-- ------- to remove  complete records and attribute form table  -------

drop table Employees;

-- 10. Vendors
CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    ServiceType VARCHAR(50),
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 0 AND 5),
    GSTNumber VARCHAR(20) UNIQUE,
    Status VARCHAR(30)
);
INSERT INTO Vendors VALUES
(201, 'BuildMax Ltd.', 'Arvind Rao', 'arvind@buildmax.com', '9988776655', 'Mumbai', 'Cement', 4.5, 'GSTIN12345', 'Approved'),
(202, 'SteelKing Pvt.', 'Ravi Shah', 'ravi@steelking.com', '9977665544', 'Pune', 'Steel', 4.7, 'GSTIN12346', 'Approved'),
(203, 'UltraBlocks', 'Vishal Patil', 'vishal@ultrablocks.com', '9966554433', 'Nashik', 'Bricks', 4.3, 'GSTIN12347', 'Approved'),
(204, 'GlassTech', 'Neeraj Singh', 'neeraj@glasstech.com', '9955443322', 'Delhi', 'Glass', 4.6, 'GSTIN12348', 'Approved'),
(205, 'RoofLine', 'Amit Pandey', 'amit@roofline.com', '9944332211', 'Mumbai', 'Roofing', 4.4, 'GSTIN12349', 'Approved'),
(206, 'PaintWorld', 'Sonal Mehta', 'sonal@paintworld.com', '9933221100', 'Ahmedabad', 'Paint', 4.2, 'GSTIN12350', 'Approved'),
(207, 'WoodCrafts', 'Nitin Joshi', 'nitin@woodcrafts.com', '9922110099', 'Bangalore', 'Wood', 4.3, 'GSTIN12351', 'Approved'),
(208, 'TilesMart', 'Jaya Iyer', 'jaya@tilesmart.com', '9911009988', 'Hyderabad', 'Tiles', 4.4, 'GSTIN12352', 'Approved'),
(209, 'PlumbIt', 'Rajesh Nair', 'rajesh@plumbit.com', '9900998877', 'Chennai', 'Plumbing', 4.1, 'GSTIN12353', 'Approved'),
(210, 'ElectricZone', 'Maya Jain', 'maya@electriczone.com', '9899887766', 'Delhi', 'Electrical', 4.6, 'GSTIN12354', 'Approved'),
(211, 'CementPro', 'Pawan Sinha', 'pawan@cementpro.com', '9888776655', 'Nagpur', 'Cement', 4.5, 'GSTIN12355', 'Approved'),
(212, 'PipePlus', 'Mohit K', 'mohit@pipeplus.com', '9877665544', 'Kolkata', 'Pipes', 4.4, 'GSTIN12356', 'Approved'),
(213, 'ReadyMix', 'Geeta L', 'geeta@readymix.com', '9866554433', 'Pune', 'Concrete', 4.7, 'GSTIN12357', 'Approved'),
(214, 'StoneAge', 'Aakash R', 'aakash@stoneage.com', '9855443322', 'Mumbai', 'Granite', 4.2, 'GSTIN12358', 'Approved'),
(215, 'WindowWorks', 'Renu B', 'renu@windowworks.com', '9844332211', 'Delhi', 'Windows', 4.3, 'GSTIN12359', 'Approved'),
(216, 'DoorKings', 'Suresh K', 'suresh@doorkings.com', '9833221100', 'Chennai', 'Doors', 4.6, 'GSTIN12360', 'Approved'),
(217, 'FixPro', 'Kiran M', 'kiran@fixpro.com', '9822110099', 'Bangalore', 'Fixing', 4.2, 'GSTIN12361', 'Approved'),
(218, 'SafetyFirst', 'Namita I', 'namita@safetyfirst.com', '9811009988', 'Lucknow', 'Safety', 4.8, 'GSTIN12362', 'Approved'),
(219, 'BuildSmart', 'Kartik C', 'kartik@buildsmart.com', '9800998877', 'Jaipur', 'Construction', 4.5, 'GSTIN12363', 'Approved'),
(220, 'ColorCrafters', 'Rita P', 'rita@colorcrafters.com', '9799887766', 'Surat', 'Paint', 4.3, 'GSTIN12364', 'Approved');

-- ----- to display  table data --------------------------

select*from Vendors ;

-- ------ to remove complete records from table --------------

truncate  table Vendors;

-- ------- to remove  complete records and attribute form table  -------

drop table Vendors;

-- 11. Materials
CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Unit VARCHAR(20),
    PricePerUnit DECIMAL(10,2) CHECK (PricePerUnit >= 0),
    StockQuantity DECIMAL(10,2) CHECK (StockQuantity >= 0),
    SupplierID INT NOT NULL,
    LastUpdated DATE,
    Status VARCHAR(30),
    Remarks TEXT
);

INSERT INTO Materials (MaterialID, Name, Category, Unit, PricePerUnit, StockQuantity, SupplierID, LastUpdated, Status, Remarks) VALUES
(1, 'Cement', 'Construction', 'Bags', 320.00, 500.00, 1, '2025-06-01', 'Available', 'High-quality cement'),
(2, 'Steel Rods', 'Construction', 'Kg', 60.50, 1200.00, 2, '2025-06-02', 'Available', 'Used for columns'),
(3, 'Bricks', 'Masonry', 'Units', 8.00, 10000.00, 3, '2025-06-03', 'Available', 'Red clay bricks'),
(4, 'Sand', 'Construction', 'Cubic Feet', 55.00, 2000.00, 4, '2025-06-04', 'Available', 'River sand'),
(5, 'Tiles', 'Finishing', 'Box', 700.00, 300.00, 5, '2025-06-05', 'Available', 'Floor tiles'),
(6, 'Paint', 'Finishing', 'Litres', 150.00, 400.00, 6, '2025-06-06', 'Available', 'Exterior paint'),
(7, 'Glass', 'Finishing', 'Sheets', 900.00, 150.00, 7, '2025-06-07', 'Available', 'Tempered glass'),
(8, 'Concrete Blocks', 'Masonry', 'Units', 25.00, 2000.00, 8, '2025-06-08', 'Available', 'Hollow blocks'),
(9, 'Wood Planks', 'Carpentry', 'Pieces', 220.00, 500.00, 9, '2025-06-09', 'Available', 'Used for doors'),
(10, 'PVC Pipes', 'Plumbing', 'Metres', 45.00, 1000.00, 10, '2025-06-10', 'Available', 'Water supply lines'),
(11, 'Wire', 'Electrical', 'Rolls', 650.00, 100.00, 1, '2025-06-11', 'Available', 'Copper wire'),
(12, 'Switches', 'Electrical', 'Units', 35.00, 1000.00, 2, '2025-06-12', 'Available', 'Modular switches'),
(13, 'Lights', 'Electrical', 'Units', 300.00, 200.00, 3, '2025-06-13', 'Available', 'LED lights'),
(14, 'Cement Blocks', 'Construction', 'Units', 28.00, 1200.00, 4, '2025-06-14', 'Available', 'Solid blocks'),
(15, 'Plywood', 'Carpentry', 'Sheets', 950.00, 300.00, 5, '2025-06-15', 'Available', 'Marine plywood'),
(16, 'Adhesive', 'Finishing', 'Tins', 120.00, 350.00, 6, '2025-06-16', 'Available', 'Tile adhesive'),
(17, 'Roof Sheets', 'Construction', 'Sheets', 1100.00, 250.00, 7, '2025-06-17', 'Available', 'Aluminum sheets'),
(18, 'Insulation', 'Electrical', 'Rolls', 850.00, 100.00, 8, '2025-06-18', 'Available', 'Thermal insulation'),
(19, 'Sealant', 'Plumbing', 'Tubes', 70.00, 300.00, 9, '2025-06-19', 'Available', 'Waterproof sealant'),
(20, 'Nails', 'Carpentry', 'Kg', 80.00, 500.00, 10, '2025-06-20', 'Available', 'Iron nails');

-- ----- to display  table data --------------------------

select*from Materials ;

-- ------ to remove complete records from table --------------

truncate  table Materials;

-- ------- to remove  complete records and attribute form table  -------

drop table Materials;

-- 12. PurchaseOrders
CREATE TABLE PurchaseOrders (
    OrderID INT PRIMARY KEY,
    VendorID INT NOT NULL,
    MaterialID INT NOT NULL,
    OrderDate DATE NOT NULL,
    DeliveryDate DATE,
    Quantity DECIMAL(10,2) CHECK (Quantity > 0),
    TotalCost DECIMAL(12,2) CHECK (TotalCost >= 0),
    Status VARCHAR(30),
    ApprovedBy INT,
    Notes TEXT,
    FOREIGN KEY (MaterialID) REFERENCES Materials(MaterialID),
    FOREIGN KEY (ApprovedBy) REFERENCES Employees(EmployeeID)
);
drop table PurchaseOrders;
INSERT INTO PurchaseOrders (OrderID, VendorID, MaterialID, OrderDate, DeliveryDate, Quantity, TotalCost, Status, ApprovedBy, Notes) VALUES
(1, 1, 1, '2025-06-01', '2025-06-05', 100.00, 32000.00, 'Delivered', 101, 'Urgent delivery'),
(2, 2, 2, '2025-06-02', '2025-06-06', 200.00, 12100.00, 'Delivered', 102, 'Column materials'),
(3, 3, 3, '2025-06-03', '2025-06-07', 500.00, 4000.00, 'Delivered', 103, 'Wall bricks'),
(4, 4, 4, '2025-06-04', '2025-06-08', 300.00, 16500.00, 'Pending', 104, 'Foundation sand'),
(5, 5, 5, '2025-06-05', '2025-06-10', 100.00, 70000.00, 'Delivered', 105, 'Interior flooring'),
(6, 6, 6, '2025-06-06', '2025-06-09', 50.00, 7500.00, 'Pending', 106, 'Paint order'),
(7, 7, 7, '2025-06-07', '2025-06-11', 30.00, 27000.00, 'Delivered', 107, 'Glass panels'),
(8, 8, 8, '2025-06-08', '2025-06-12', 400.00, 10000.00, 'Delivered', 108, 'Masonry blocks'),
(9, 9, 9, '2025-06-09', '2025-06-13', 100.00, 22000.00, 'Delivered', 109, 'Door planks'),
(10, 10, 10, '2025-06-10', '2025-06-14', 200.00, 9000.00, 'Pending', 110, 'Plumbing lines'),
(11, 11, 11, '2025-06-11', '2025-06-15', 20.00, 13000.00, 'Delivered', 111, 'Wiring'),
(12, 12, 12, '2025-06-12', '2025-06-16', 50.00, 1750.00, 'Delivered', 112, 'Switches'),
(13, 13, 13, '2025-06-13', '2025-06-17', 25.00, 7500.00, 'Pending', 113, 'Lighting'),
(14, 14, 14, '2025-06-14', '2025-06-18', 100.00, 2800.00, 'Delivered', 114, 'Block delivery'),
(15, 15, 15, '2025-06-15', '2025-06-20', 60.00, 57000.00, 'Pending',115, 'Plywood'),
(16, 16, 16, '2025-06-16', '2025-06-21', 40.00, 4800.00, 'Pending', 116, 'Adhesive'),
(17, 17, 17, '2025-06-17', '2025-06-22', 50.00, 55000.00, 'Delivered', 117, 'Roof materials'),
(18, 18, 18, '2025-06-18', '2025-06-23', 20.00, 17000.00, 'Pending', 118, 'Thermal sheets'),
(19, 19, 19, '2025-06-19', '2025-06-24', 30.00, 2100.00, 'Delivered', 119, 'Sealants'),
(20, 20, 20, '2025-06-20', '2025-06-25', 40.00, 3200.00, 'Delivered', 120, 'Nails supply');

-- ----- to display  table data --------------------------

select*from PurchaseOrders ;

-- ------ to remove complete records from table --------------

truncate  table PurchaseOrders;

-- ------- to remove  complete records and attribute form table  -------

drop table PurchaseOrders;

-- 13. Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    SaleID INT NOT NULL,
    Amount DECIMAL(12,2) CHECK (Amount >= 0),
    PaymentDate DATE NOT NULL,
    Method VARCHAR(30),
    Status VARCHAR(30),
    TransactionID VARCHAR(100) UNIQUE,
    BankName VARCHAR(50),
    ReceivedBy INT,
    Remarks TEXT,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);
INSERT INTO Payments (PaymentID, SaleID, Amount, PaymentDate, Method, Status, TransactionID, BankName, ReceivedBy, Remarks) VALUES
(1, 1, 1500000.00, '2025-06-01', 'Bank Transfer', 'Completed', 'TXN1001', 'HDFC Bank', 1, 'Full payment received'),
(2, 2, 1250000.00, '2025-06-02', 'Credit Card', 'Completed', 'TXN1002', 'ICICI Bank', 2, 'Confirmed'),
(3, 3, 980000.00, '2025-06-03', 'Cheque', 'Pending', 'TXN1003', 'SBI', 3, 'Cheque clearance pending'),
(4, 4, 2000000.00, '2025-06-04', 'NEFT', 'Completed', 'TXN1004', 'Axis Bank', 4, 'Successful'),
(5, 5, 1750000.00, '2025-06-05', 'Cash', 'Completed', 'TXN1005', 'Kotak', 5, 'Cash collected'),
(6, 6, 1120000.00, '2025-06-06', 'UPI', 'Completed', 'TXN1006', 'Paytm Payments Bank', 6, 'Instant pay'),
(7, 7, 1050000.00, '2025-06-07', 'IMPS', 'Completed', 'TXN1007', 'BOI', 7, 'Fast payment'),
(8, 8, 1450000.00, '2025-06-08', 'RTGS', 'Completed', 'TXN1008', 'Canara Bank', 8, 'Secure'),
(9, 9, 950000.00, '2025-06-09', 'UPI', 'Pending', 'TXN1009', 'Google Pay', 9, 'Awaiting confirmation'),
(10, 10, 890000.00, '2025-06-10', 'Debit Card', 'Completed', 'TXN1010', 'HSBC', 10, 'Card swipe'),
(11, 11, 760000.00, '2025-06-11', 'Cash', 'Completed', 'TXN1011', 'ICICI', 1, 'Final'),
(12, 12, 1230000.00, '2025-06-12', 'NEFT', 'Completed', 'TXN1012', 'PNB', 2, 'Success'),
(13, 13, 650000.00, '2025-06-13', 'Cheque', 'Pending', 'TXN1013', 'IDFC First', 3, 'On hold'),
(14, 14, 1320000.00, '2025-06-14', 'UPI', 'Completed', 'TXN1014', 'Paytm', 4, 'UPI payment'),
(15, 15, 990000.00, '2025-06-15', 'Cash', 'Completed', 'TXN1015', 'Union Bank', 5, 'Done'),
(16, 16, 810000.00, '2025-06-16', 'Bank Transfer', 'Completed', 'TXN1016', 'HDFC Bank', 6, 'Ok'),
(17, 17, 770000.00, '2025-06-17', 'NEFT', 'Completed', 'TXN1017', 'Axis Bank', 7, 'Clear'),
(18, 18, 930000.00, '2025-06-18', 'UPI', 'Completed', 'TXN1018', 'PhonePe', 8, 'Received'),
(19, 19, 850000.00, '2025-06-19', 'RTGS', 'Completed', 'TXN1019', 'ICICI Bank', 9, 'Approved'),
(20, 20, 1150000.00, '2025-06-20', 'Bank Transfer', 'Completed', 'TXN1020', 'Yes Bank', 10, 'On time');

-- ----- to display  table data --------------------------

select*from Payments ;

-- ------ to remove complete records from table --------------

truncate  table Payments;

-- ------- to remove  complete records and attribute form table  -------

drop table Payments;

-- 14. Inspections
CREATE TABLE Inspections (
    InspectionID INT PRIMARY KEY,
    SiteID INT NOT NULL,
    InspectorName VARCHAR(100),
    InspectionDate DATE NOT NULL,
    Result VARCHAR(30),
    Remarks TEXT,
    Status VARCHAR(30),
    NextInspection DATE,
    AssignedBy INT,
    ApprovedBy INT,
    FOREIGN KEY (SiteID) REFERENCES Sites(SiteID)
);

INSERT INTO Inspections VALUES
(1, 1, 'Inspector 1', '2024-09-15', 'Pass', 'Routine inspection 1', 'Scheduled', '2025-03-17', 6, 4),
(2, 17, 'Inspector 2', '2025-04-14', 'Fail', 'Routine inspection 2', 'Delayed', '2025-05-03', 6, 7),
(3, 4, 'Inspector 3', '2024-08-27', 'Fail', 'Routine inspection 3', 'Completed', '2024-12-18', 3, 5),
(4, 8, 'Inspector 4', '2024-11-01', 'Fail', 'Routine inspection 4', 'Completed', '2025-01-30', 7, 3),
(5, 15, 'Inspector 5', '2024-05-23', 'Pending', 'Routine inspection 5', 'Scheduled', '2025-04-20', 2, 6),
(6, 14, 'Inspector 6', '2025-02-17', 'Pass', 'Routine inspection 6', 'Delayed', '2025-06-08', 9, 4),
(7, 20, 'Inspector 7', '2024-03-07', 'Pass', 'Routine inspection 7', 'Completed', '2025-01-18', 3, 3),
(8, 12, 'Inspector 8', '2024-04-14', 'Pass', 'Routine inspection 8', 'Completed', '2024-09-09', 3, 4),
(9, 19, 'Inspector 9', '2024-03-22', 'Fail', 'Routine inspection 9', 'Completed', '2025-01-07', 3, 1),
(10, 20, 'Inspector 10', '2024-06-21', 'Fail', 'Routine inspection 10', 'Delayed', '2024-10-11', 10, 4),
(11, 2, 'Inspector 11', '2025-05-21', 'Pending', 'Routine inspection 11', 'Scheduled', '2025-10-19', 5, 3),
(12, 6, 'Inspector 12', '2025-03-13', 'Fail', 'Routine inspection 12', 'Scheduled', '2025-06-17', 4, 4),
(13, 8, 'Inspector 13', '2024-01-06', 'Pass', 'Routine inspection 13', 'Completed', '2024-10-12', 5, 3),
(14, 2, 'Inspector 14', '2024-04-18', 'Pending', 'Routine inspection 14', 'Scheduled', '2025-01-17', 10, 5),
(15, 5, 'Inspector 15', '2024-03-25', 'Fail', 'Routine inspection 15', 'Completed', '2025-01-06', 1, 6),
(16, 6, 'Inspector 16', '2024-10-30', 'Fail', 'Routine inspection 16', 'Completed', '2025-06-09', 10, 2),
(17, 5, 'Inspector 17', '2024-11-30', 'Fail', 'Routine inspection 17', 'Scheduled', '2025-02-21', 2, 1),
(18, 4, 'Inspector 18', '2025-04-02', 'Pass', 'Routine inspection 18', 'Scheduled', '2025-10-06', 4, 2),
(19, 7, 'Inspector 19', '2024-02-21', 'Pass', 'Routine inspection 19', 'Completed', '2024-10-20', 2, 9),
(20, 10, 'Inspector 20', '2025-01-04', 'Pending', 'Routine inspection 20', 'Scheduled', '2025-05-23', 6, 9);

-- ----- to display  table data --------------------------

select*from Inspections ;

-- ------ to remove complete records from table --------------

truncate  table Inspections;

-- ------- to remove  complete records and attribute form table  -------

drop table Inspections;

-- 15. MaintenanceRequests
CREATE TABLE MaintenanceRequests (
    RequestID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    ClientID INT NOT NULL,
    RequestDate DATE NOT NULL,
    IssueType VARCHAR(50),
    Description TEXT,
    Status VARCHAR(30),
    AssignedTo INT,
    CompletionDate DATE,
    Feedback TEXT,
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO MaintenanceRequests VALUES
(1, 2, 2, '2024-09-03', 'Plumbing', 'Issue description 1', 'Resolved', 2, '2025-01-10', 'Client feedback 1'),
(2, 17, 8, '2024-01-28', 'Structural', 'Issue description 2', 'In Progress', 2, '2025-01-28', 'Client feedback 2'),
(3, 4, 11, '2025-06-14', 'Electrical', 'Issue description 3', 'Resolved', 10, '2025-12-14', 'Client feedback 3'),
(4, 6, 6, '2025-01-21', 'Plumbing', 'Issue description 4', 'Resolved', 9, '2025-11-21', 'Client feedback 4'),
(5, 9, 20, '2024-04-09', 'Painting', 'Issue description 5', 'Pending', 9, '2024-08-09', 'Client feedback 5'),
(6, 7, 9, '2024-03-02', 'Electrical', 'Issue description 6', 'Pending', 7, '2025-06-02', 'Client feedback 6'),
(7, 7, 17, '2025-04-21', 'Painting', 'Issue description 7', 'Pending', 1, '2025-12-21', 'Client feedback 7'),
(8, 9, 4, '2025-01-08', 'Electrical', 'Issue description 8', 'Pending', 4, '2025-07-08', 'Client feedback 8'),
(9, 5, 14, '2025-05-30', 'Electrical', 'Issue description 9', 'Resolved', 7, '2025-07-30', 'Client feedback 9'),
(10, 6, 18, '2024-02-29', 'Electrical', 'Issue description 10', 'In Progress', 9, '2024-10-29', 'Client feedback 10'),
(11, 2, 11, '2025-06-07', 'Painting', 'Issue description 11', 'Pending', 6, '2025-11-07', 'Client feedback 11'),
(12, 7, 6, '2024-06-11', 'Painting', 'Issue description 12', 'Resolved', 1, '2025-04-11', 'Client feedback 12'),
(13, 13, 8, '2024-03-03', 'Plumbing', 'Issue description 13', 'Pending', 7, '2025-05-03', 'Client feedback 13'),
(14, 11, 15, '2024-12-24', 'Electrical', 'Issue description 14', 'Resolved', 9, '2025-02-24', 'Client feedback 14'),
(15, 15, 17, '2024-03-30', 'Painting', 'Issue description 15', 'Resolved', 5, '2025-03-30', 'Client feedback 15'),
(16, 4, 13, '2024-11-28', 'Plumbing', 'Issue description 16', 'Resolved', 2, '2025-01-28', 'Client feedback 16'),
(17, 3, 7, '2025-01-10', 'Painting', 'Issue description 17', 'Pending', 3, '2025-03-10', 'Client feedback 17'),
(18, 17, 9, '2024-09-24', 'Structural', 'Issue description 18', 'Pending', 6, '2025-04-24', 'Client feedback 18'),
(19, 1, 5, '2024-08-09', 'Painting', 'Issue description 19', 'Resolved', 5, '2025-04-09', 'Client feedback 19'),
(20, 18, 12, '2025-01-13', 'Plumbing', 'Issue description 20', 'In Progress', 3, '2025-07-13', 'Client feedback 20');

-- ----- to display  table data --------------------------

select*from MaintenanceRequests ;

-- ------ to remove complete records from table --------------

truncate  table MaintenanceRequests;

-- ------- to remove  complete records and attribute form table  -------

drop table MaintenanceRequests;

-- 16. Leases
CREATE TABLE Leases (
    LeaseID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    ClientID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    RentAmount DECIMAL(10,2) CHECK (RentAmount >= 0),
    DepositAmount DECIMAL(12,2) CHECK (DepositAmount >= 0),
    Status VARCHAR(30),
    AgreementSigned BOOLEAN DEFAULT FALSE,
    Notes TEXT,
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
INSERT INTO Leases VALUES
(1, 1, 1, '2024-01-01', '2025-01-01', 15000.00, 45000.00, 'Active', TRUE, 'Yearly lease.'),
(2, 2, 2, '2024-02-15', '2025-02-14', 18000.00, 54000.00, 'Active', TRUE, 'Includes maintenance.'),
(3, 3, 3, '2023-12-01', '2024-11-30', 12000.00, 36000.00, 'Renewed', TRUE, 'Lease renewed.'),
(4, 4, 4, '2024-03-01', '2025-02-28', 20000.00, 60000.00, 'Active', TRUE, 'Fully furnished.'),
(5, 5, 5, '2024-04-10', '2025-04-09', 16000.00, 48000.00, 'Active', TRUE, 'For residential purpose.'),
(6, 6, 6, '2024-05-01', NULL, 14000.00, 42000.00, 'Pending', FALSE, 'Documents awaited.'),
(7, 7, 7, '2024-06-01', NULL, 17000.00, 51000.00, 'Processing', FALSE, 'In progress.'),
(8, 8, 8, '2024-06-10', '2025-06-09', 19000.00, 57000.00, 'Active', TRUE, 'Lease confirmed.'),
(9, 9, 9, '2024-07-01', '2025-06-30', 21000.00, 63000.00, 'Active', TRUE, 'Commercial lease.'),
(10, 10, 10, '2023-07-01', '2024-06-30', 15000.00, 45000.00, 'Expired', TRUE, 'Awaiting renewal.'),
(11, 11, 11, '2024-08-01', NULL, 14500.00, 43500.00, 'Active', TRUE, 'Includes parking.'),
(12, 12, 12, '2024-09-01', '2025-08-31', 17000.00, 51000.00, 'Active', TRUE, 'Near metro.'),
(13, 13, 13, '2024-10-01', NULL, 18000.00, 54000.00, 'Pending', FALSE, 'Agreement under review.'),
(14, 14, 14, '2024-11-01', '2025-10-31', 20000.00, 60000.00, 'Active', TRUE, 'Premium property.'),
(15, 15, 15, '2024-12-01', '2025-11-30', 15500.00, 46500.00, 'Active', TRUE, 'Gated community.'),
(16, 16, 16, '2025-01-01', NULL, 16000.00, 48000.00, 'Processing', FALSE, 'Awaiting approval.'),
(17, 17, 17, '2025-02-01', '2026-01-31', 17500.00, 52500.00, 'Active', TRUE, 'Company lease.'),
(18, 18, 18, '2025-03-01', NULL, 18500.00, 55500.00, 'Pending', FALSE, 'Verification pending.'),
(19, 19, 19, '2025-04-01', '2026-03-31', 19500.00, 58500.00, 'Active', TRUE, 'Luxury apartment.'),
(20, 20, 20, '2025-05-01', '2026-04-30', 20500.00, 61500.00, 'Active', TRUE, 'Includes clubhouse access.');

-- ----- to display  table data --------------------------

select*from Leases ;

-- ------ to remove complete records from table --------------

truncate  table Leases;

-- ------- to remove  complete records and attribute form table  -------

drop table Leases;

-- 17. LegalDocuments
CREATE TABLE LegalDocuments (
    DocumentID INT PRIMARY KEY,
    PropertyID INT NOT NULL,
    DocumentType VARCHAR(50),
    IssueDate DATE,
    ExpiryDate DATE,
    FilePath VARCHAR(255),
    VerifiedBy INT,
    Status VARCHAR(30),
    UploadDate DATE,
    Remarks TEXT,
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID)
);
drop table LegalDocuments;
INSERT INTO LegalDocuments VALUES
(1, 1, 'Ownership', '2023-01-01', '2033-01-01', '/docs/ownership_101.pdf', 301, 'Verified', '2023-01-05', 'All good.'),
(2, 2, 'Tax Certificate', '2022-12-15', '2032-12-15', '/docs/tax_102.pdf', 302, 'Verified', '2022-12-20', 'Valid.'),
(3, 3, 'Occupancy Certificate', '2023-03-10', NULL, '/docs/oc_103.pdf', 303, 'Pending', '2023-03-12', 'Awaiting signature.'),
(4, 4, 'Encumbrance', '2022-05-01', '2027-05-01', '/docs/enc_104.pdf', 304, 'Verified', '2022-05-05', 'Clear.'),
(5, 5, 'NOC', '2023-06-01', '2028-06-01', '/docs/noc_105.pdf', 305, 'Rejected', '2023-06-03', 'Incomplete info.'),
(6, 6, 'Legal Title', '2023-02-01', '2033-02-01', '/docs/title_106.pdf', 306, 'Verified', '2023-02-05', 'Valid.'),
(7, 7, 'Tax Certificate', '2024-01-01', '2034-01-01', '/docs/tax_107.pdf', 307, 'Verified', '2024-01-03', 'Confirmed.'),
(8, 8, 'Encumbrance', '2024-01-20', '2029-01-20', '/docs/enc_108.pdf', 308, 'Verified', '2024-01-22', 'No issues.'),
(9, 9, 'Sale Deed', '2022-07-01', NULL, '/docs/sale_109.pdf', 309, 'Pending', '2022-07-03', 'Under review.'),
(10, 10, 'Tax Certificate', '2023-11-01', '2033-11-01', '/docs/tax_110.pdf', 310, 'Verified', '2023-11-03', 'Genuine.'),
(11, 11, 'NOC', '2022-09-15', '2027-09-15', '/docs/noc_111.pdf', 301, 'Verified', '2022-09-17', 'OK.'),
(12, 12, 'Sale Agreement', '2023-05-05', NULL, '/docs/sale_agreement_112.pdf', 302, 'Verified', '2023-05-07', 'Completed.'),
(13, 13, 'Legal Title', '2022-10-01', '2032-10-01', '/docs/title_113.pdf', 303, 'Rejected', '2022-10-04', 'Mismatch in data.'),
(14, 14, 'Ownership', '2024-04-10', '2034-04-10', '/docs/own_114.pdf', 304, 'Verified', '2024-04-11', 'Confirmed.'),
(15, 15, 'Tax Certificate', '2023-07-01', '2033-07-01', '/docs/tax_115.pdf', 305, 'Pending', '2023-07-03', 'Under process.'),
(16, 16, 'NOC', '2023-03-01', '2028-03-01', '/docs/noc_116.pdf', 306, 'Verified', '2023-03-03', 'Valid.'),
(17, 17, 'Sale Deed', '2022-08-01', NULL, '/docs/sale_117.pdf', 307, 'Verified', '2022-08-03', 'Legitimate.'),
(18, 18, 'Encumbrance', '2023-12-01', '2028-12-01', '/docs/enc_118.pdf', 308, 'Verified', '2023-12-03', 'Good.'),
(19, 19, 'Tax Certificate', '2023-01-01', '2033-01-01', '/docs/tax_119.pdf', 309, 'Verified', '2023-01-03', 'Approved.'),
(20, 20, 'NOC', '2024-06-01', '2029-06-01', '/docs/noc_120.pdf', 310, 'Verified', '2024-06-03', 'Valid document.');

-- ----- to display  table data --------------------------

select*from LegalDocuments ;

-- ------ to remove complete records from table --------------

truncate  table LegalDocuments;

-- ------- to remove  complete records and attribute form table  -------

drop table LegalDocuments;

-- 18. Permits
CREATE TABLE Permits (
    PermitID INT PRIMARY KEY,
    SiteID INT NOT NULL,
    Type VARCHAR(50),
    IssuedBy VARCHAR(100),
    IssueDate DATE,
    ExpiryDate DATE,
    Status VARCHAR(30),
    FilePath VARCHAR(255),
    VerifiedBy INT,
    Notes TEXT,
    FOREIGN KEY (SiteID) REFERENCES Sites(SiteID)
);

INSERT INTO Permits VALUES
(1, 1, 'Building', 'Municipal Authority', '2022-01-10', '2027-01-10', 'Approved', '/permits/permit_1.pdf', 301, 'Clear'),
(2, 2, 'Construction', 'City Dept.', '2022-03-15', '2027-03-15', 'Approved', '/permits/permit_2.pdf', 302, 'Inspected'),
(3, 3, 'Renovation', 'Govt Office', '2022-05-01', NULL, 'Pending', '/permits/permit_3.pdf', 303, 'Submitted'),
(4, 4, 'Occupancy', 'Urban Office', '2022-07-20', '2027-07-20', 'Approved', '/permits/permit_4.pdf', 304, 'Done'),
(5, 5, 'Electric', 'Energy Board', '2023-02-01', '2028-02-01', 'Rejected', '/permits/permit_5.pdf', 305, 'Issue in wiring'),
(6, 6, 'Water Supply', 'Water Dept.', '2022-09-01', '2027-09-01', 'Approved', '/permits/permit_6.pdf', 306, 'Granted'),
(7, 7, 'Drainage', 'Municipality', '2023-03-10', NULL, 'Pending', '/permits/permit_7.pdf', 307, 'Reviewing'),
(8, 8, 'Parking', 'City Authority', '2023-06-01', '2028-06-01', 'Approved', '/permits/permit_8.pdf', 308, 'Inspected'),
(9, 9, 'Fire Safety', 'Fire Dept.', '2023-01-01', '2028-01-01', 'Approved', '/permits/permit_9.pdf', 309, 'Compliant'),
(10, 10, 'Green Building', 'Environment Dept.', '2024-01-10', NULL, 'Pending', '/permits/permit_10.pdf', 310, 'Awaiting test'),
(11, 11, 'Sewage', 'Water Board', '2022-04-01', '2027-04-01', 'Approved', '/permits/permit_11.pdf', 301, 'Cleared'),
(12, 12, 'Building', 'Construction Dept.', '2023-05-01', '2028-05-01', 'Approved', '/permits/permit_12.pdf', 302, 'Clean'),
(13, 13, 'Construction', 'Gov Authority', '2023-06-10', '2028-06-10', 'Rejected', '/permits/permit_13.pdf', 303, 'Docs missing'),
(14, 14, 'Road Access', 'P.W.D.', '2023-08-01', '2028-08-01', 'Approved', '/permits/permit_14.pdf', 304, 'Valid'),
(15, 15, 'Fire NOC', 'Fire Dept.', '2022-11-01', '2027-11-01', 'Approved', '/permits/permit_15.pdf', 305, 'Safe'),
(16, 16, 'Gas Connection', 'Gas Board', '2024-01-01', '2029-01-01', 'Pending', '/permits/permit_16.pdf', 306, 'Processing'),
(17, 17, 'Power Backup', 'Electricity Board', '2023-04-01', '2028-04-01', 'Approved', '/permits/permit_17.pdf', 307, 'Installed'),
(18, 18, 'Fire Clearance', 'Fire Safety Dept.', '2023-10-01', NULL, 'Pending', '/permits/permit_18.pdf', 308, 'Audit needed'),
(19, 19, 'Water Tank', 'City Authority', '2022-12-01', '2027-12-01', 'Approved', '/permits/permit_19.pdf', 309, 'Passed'),
(20, 20, 'Safety', 'Urban Planning Dept.', '2023-09-01', '2028-09-01', 'Approved', '/permits/permit_20.pdf', 310, 'Complete');

-- ----- to display  table data --------------------------

select*from Permits ;

-- ------ to remove complete records from table --------------

truncate  table Permits;

-- ------- to remove  complete records and attribute form table  -------

drop table Permits;

-- 19. ConstructionPhases
CREATE TABLE ConstructionPhases (
    PhaseID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    PhaseName VARCHAR(100),
    StartDate DATE NOT NULL,
    EndDate DATE,
    Status VARCHAR(30),
    SupervisorID INT,
    Budget DECIMAL(12,2),
    ActualCost DECIMAL(12,2),
    Remarks TEXT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO ConstructionPhases VALUES
(1, 1, 'Site Clearing', '2023-01-01', '2023-01-15', 'Completed', 301, 100000.00, 95000.00, 'Cleared trees and debris'),
(2, 2, 'Foundation Laying', '2023-02-01', '2023-03-15', 'Completed', 302, 500000.00, 480000.00, 'Poured concrete'),
(3, 3, 'Framing', '2023-04-01', '2023-06-01', 'In Progress', 303, 750000.00, 600000.00, 'Wood framing ongoing'),
(4, 4, 'Roofing', '2023-06-15', '2023-07-30', 'Pending', 304, 200000.00, NULL, 'Roof materials ordered'),
(5, 5, 'Exterior Finishing', '2023-08-01', '2023-09-15', 'Pending', 305, 300000.00, NULL, 'Painting and siding planned'),
(6, 6, 'Plumbing Setup', '2023-03-01', '2023-03-20', 'Completed', 306, 150000.00, 145000.00, 'Pipes and valves installed'),
(7, 7, 'Electrical Wiring', '2023-04-01', '2023-04-25', 'Completed', 307, 180000.00, 175000.00, 'Wires and boxes fixed'),
(8, 8, 'HVAC Installation', '2023-05-01', '2023-05-25', 'In Progress', 308, 220000.00, 210000.00, 'Units installed'),
(9, 9, 'Flooring', '2023-07-01', '2023-07-15', 'Pending', 309, 120000.00, NULL, 'Tiles and laminates received'),
(10, 10, 'Interior Painting', '2023-08-01', '2023-08-10', 'Pending', 310, 80000.00, NULL, 'Colors selected'),
(11, 11, 'Site Inspection', '2023-09-01', '2023-09-05', 'Pending', 301, 40000.00, NULL, 'Planned'),
(12, 12, 'Waterproofing', '2023-03-15', '2023-03-25', 'Completed', 302, 60000.00, 59000.00, 'Applied coating'),
(13, 13, 'Boundary Wall', '2023-02-10', '2023-03-01', 'Completed', 303, 70000.00, 68000.00, 'Done'),
(14, 14, 'Lift Installation', '2023-06-01', '2023-06-20', 'In Progress', 304, 250000.00, 240000.00, 'Cabin installed'),
(15, 15, 'Landscaping', '2023-08-15', '2023-08-25', 'Pending', 305, 90000.00, NULL, 'Design finalized'),
(16, 16, 'Security System', '2023-07-20', '2023-07-30', 'Pending', 306, 65000.00, NULL, 'Awaiting hardware'),
(17, 17, 'Window Fittings', '2023-05-10', '2023-05-20', 'Completed', 307, 85000.00, 80000.00, 'Glass and aluminum'),
(18, 18, 'Ceiling Work', '2023-06-10', '2023-06-25', 'Completed', 308, 95000.00, 94000.00, 'POP done'),
(19, 19, 'Final Inspection', '2023-09-10', '2023-09-15', 'Pending', 309, 30000.00, NULL, 'Not started yet'),
(20, 20, 'Handover Phase', '2023-10-01', '2023-10-10', 'Pending', 310, 10000.00, NULL, 'Pending legal check');

-- ----- to display  table data --------------------------

select*from ConstructionPhases ;

-- ------ to remove complete records from table --------------

truncate  table ConstructionPhases;

-- ------- to remove  complete records and attribute form table  -------

drop table ConstructionPhases;

-- 20. Tasks
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    PhaseID INT NOT NULL,
    TaskName VARCHAR(100),
    AssignedTo INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(30),
    ProgressPercent INT CHECK (ProgressPercent BETWEEN 0 AND 100),
    Remarks TEXT,
    Priority VARCHAR(20),
    FOREIGN KEY (PhaseID) REFERENCES ConstructionPhases(PhaseID)
);
INSERT INTO Tasks VALUES
(1, 1, 'Tree Removal', 301, '2023-01-01', '2023-01-05', 'Completed', 100, 'Done without delay', 'High'),
(2, 1, 'Site Leveling', 302, '2023-01-06', '2023-01-15', 'Completed', 100, 'Smooth base created', 'Medium'),
(3, 2, 'Digging Trenches', 303, '2023-02-01', '2023-02-05', 'Completed', 100, 'No issues faced', 'High'),
(4, 2, 'Pouring Concrete', 304, '2023-02-06', '2023-03-15', 'Completed', 100, 'Curing done properly', 'High'),
(5, 3, 'Wall Framing', 305, '2023-04-01', '2023-05-10', 'In Progress', 70, 'Framing beams', 'High'),
(6, 3, 'Door Installation', 306, '2023-05-11', '2023-06-01', 'In Progress', 60, 'Doors fixed', 'Medium'),
(7, 4, 'Material Receiving', 307, '2023-06-15', '2023-06-18', 'Pending', 0, 'Scheduled', 'Low'),
(8, 4, 'Shingles Placement', 308, '2023-06-19', '2023-07-30', 'Pending', 0, 'Not started', 'Medium'),
(9, 5, 'Wall Painting', 309, '2023-08-01', '2023-08-10', 'Pending', 0, 'Color testing', 'Low'),
(10, 5, 'Exterior Cladding', 310, '2023-08-11', '2023-09-15', 'Pending', 0, 'Panel ordering', 'Medium'),
(11, 6, 'Pipe Laying', 301, '2023-03-01', '2023-03-10', 'Completed', 100, 'Connected main supply', 'High'),
(12, 6, 'Leak Testing', 302, '2023-03-11', '2023-03-20', 'Completed', 100, 'No leaks found', 'High'),
(13, 7, 'Wiring', 303, '2023-04-01', '2023-04-20', 'Completed', 100, 'Routed wires', 'High'),
(14, 7, 'Switchboards', 304, '2023-04-21', '2023-04-25', 'Completed', 100, 'Fitted all boards', 'Medium'),
(15, 8, 'HVAC Units Placement', 305, '2023-05-01', '2023-05-20', 'In Progress', 90, 'Duct work remaining', 'High'),
(16, 8, 'Ventilation Testing', 306, '2023-05-21', '2023-05-25', 'In Progress', 50, 'Ongoing', 'Medium'),
(17, 9, 'Tile Layout', 307, '2023-07-01', '2023-07-10', 'Pending', 0, 'Delivery awaited', 'Medium'),
(18, 9, 'Laminate Setup', 308, '2023-07-11', '2023-07-15', 'Pending', 0, 'To be scheduled', 'Low'),
(19, 10, 'Primer Coating', 309, '2023-08-01', '2023-08-05', 'Pending', 0, 'Selected vendor', 'Low'),
(20, 10, 'Final Paint', 310, '2023-08-06', '2023-08-10', 'Pending', 0, 'Awaiting base layer', 'Low');

-- ----- to display  table data --------------------------

select*from Tasks ;

-- ------ to remove complete records from table --------------

truncate  table Tasks;

-- ------- to remove  complete records and attribute form table  -------

drop table Tasks;

-- 21. Equipment
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Quantity INT CHECK (Quantity >= 0),
    PurchaseDate DATE,
    Status VARCHAR(30),
    AssignedToSite INT,
    MaintenanceDate DATE,
    VendorID INT,
    Remarks TEXT
);

INSERT INTO Equipment VALUES
(1, 'Excavator', 'Heavy', 2, '2023-01-05', 'Active', 1, '2024-06-01', 1, 'Used for site clearing'),
(2, 'Cement Mixer', 'Medium', 3, '2023-02-10', 'Active', 2, '2024-06-10', 2, 'Routine maintenance'),
(3, 'Scaffolding', 'Light', 50, '2023-03-12', 'In Use', 3, '2024-07-01', 3, 'Steel material'),
(4, 'Drilling Machine', 'Medium', 5, '2023-01-20', 'Under Repair', 4, '2024-05-15', 4, 'Motor issue'),
(5, 'Welding Machine', 'Medium', 4, '2023-02-15', 'Active', 5, '2024-07-10', 5, 'Working fine'),
(6, 'Crane', 'Heavy', 1, '2023-01-25', 'Active', 6, '2024-06-05', 6, 'Routine inspection needed'),
(7, 'Dump Truck', 'Heavy', 3, '2023-01-10', 'Active', 7, '2024-06-08', 7, 'Daily fuel check'),
(8, 'Generator', 'Medium', 4, '2023-03-01', 'In Use', 8, '2024-06-15', 8, 'Supplies backup power'),
(9, 'Concrete Vibrator', 'Light', 6, '2023-04-10', 'Active', 9, '2024-07-12', 9, 'Recently calibrated'),
(10, 'Ladder', 'Light', 20, '2023-03-25', 'In Use', 10, '2024-07-01', 10, 'Multi-size'),
(11, 'Air Compressor', 'Medium', 2, '2023-05-05', 'Active', 11, '2024-06-20', 11, 'Pressure tested'),
(12, 'Jackhammer', 'Heavy', 3, '2023-04-15', 'Active', 12, '2024-06-22', 12, 'Bit sharpened'),
(13, 'Paint Sprayer', 'Medium', 5, '2023-06-10', 'In Use', 13, '2024-06-25', 13, 'Fine spray'),
(14, 'Tile Cutter', 'Light', 7, '2023-07-01', 'Active', 14, '2024-07-05', 14, 'Blade replaced'),
(15, 'Measuring Wheel', 'Light', 10, '2023-07-12', 'In Use', 15, '2024-07-10', 15, 'Calibrated'),
(16, 'Concrete Pump', 'Heavy', 1, '2023-05-20', 'Active', 16, '2024-06-30', 16, 'Tested flow'),
(17, 'Survey Drone', 'Light', 2, '2023-06-25', 'Active', 17, '2024-07-15', 17, 'Battery OK'),
(18, 'Laser Level', 'Light', 4, '2023-07-05', 'Active', 18, '2024-07-18', 18, 'Level aligned'),
(19, 'Water Tanker', 'Heavy', 2, '2023-05-15', 'In Use', 19, '2024-07-20', 19, 'Hoses cleaned'),
(20, 'Portable Toilet', 'Light', 6, '2023-07-10', 'Active', 20, '2024-07-22', 20, 'Serviced');

-- ----- to display  table data --------------------------

select*from Equipment ;

-- ------ to remove complete records from table --------------

truncate  table Equipment;

-- ------- to remove  complete records and attribute form table  -------

drop table Equipment;

-- 22. SiteVisits
CREATE TABLE SiteVisits (
    VisitID INT PRIMARY KEY,
    SiteID INT NOT NULL,
    VisitorName VARCHAR(100),
    VisitDate DATE NOT NULL,
    Purpose VARCHAR(100),
    GuidedBy INT,
    DurationMinutes INT CHECK (DurationMinutes >= 0),
    Feedback TEXT,
    Status VARCHAR(30),
    Notes TEXT,
    FOREIGN KEY (SiteID) REFERENCES Sites(SiteID)
);
INSERT INTO SiteVisits VALUES
(1, 1, 'Ravi Mehta', '2023-06-01', 'Progress Check', 101, 60, 'Positive visit', 'Completed', 'On track'),
(2, 2, 'Sneha Kulkarni', '2023-06-05', 'Quality Audit', 102, 90, 'Detailed report submitted', 'Completed', 'Minor issues'),
(3, 3, 'Manish Sharma', '2023-06-10', 'Investor Visit', 103, 30, 'Photo shared', 'Completed', 'Impressed with phase 1'),
(4, 4, 'Priya Singh', '2023-06-15', 'Client Tour', 104, 45, 'Follow-up scheduled', 'Completed', 'Liked location'),
(5, 5, 'Amit Rane', '2023-06-20', 'Vendor Meeting', 105, 50, 'Deal confirmed', 'Completed', 'Finalized HVAC model'),
(6, 6, 'Neha Patil', '2023-06-25', 'Supervisory Check', 106, 70, 'Approved', 'Completed', 'Workforce satisfactory'),
(7, 7, 'Varun Jha', '2023-07-01', 'Structural Review', 107, 60, 'Corrective action taken', 'Completed', 'Minor adjustments needed'),
(8, 8, 'Deepa Rao', '2023-07-05', 'Real Estate Agent', 108, 40, 'Follow-up pending', 'Completed', 'Interested for resale tie-up'),
(9, 9, 'Rajesh Iyer', '2023-07-10', 'New Contractor Check', 109, 55, 'Orientation planned', 'Completed', 'Onboarding done'),
(10, 10, 'Karan Desai', '2023-07-12', 'Safety Audit', 110, 90, 'Certificate issued', 'Completed', 'Passed all checks'),
(11, 11, 'Pooja Verma', '2023-07-15', 'Compliance Audit', 101, 80, 'Notes provided', 'Completed', 'Meets standards'),
(12, 12, 'Arun Kumar', '2023-07-18', 'Investor Feedback', 102, 35, 'Positive', 'Completed', 'Liked layout'),
(13, 13, 'Seema Patel', '2023-07-20', 'Site Inspection', 103, 60, 'Clean site', 'Completed', 'Well maintained'),
(14, 14, 'Rohan Singh', '2023-07-22', 'Client Visit', 104, 45, 'Good orientation', 'Completed', 'Interested in Phase 2'),
(15, 15, 'Meera Joshi', '2023-07-25', 'Vendor Quality Check', 105, 55, 'Materials accepted', 'Completed', 'Good quality'),
(16, 16, 'Sunita Rao', '2023-07-28', 'Team Meeting', 106, 50, 'Planning next stage', 'Completed', 'Meeting held'),
(17, 17, 'Ajay Mehta', '2023-07-30', 'Structural Review', 107, 65, 'Minor rework needed', 'Completed', 'Reviewed beam joints'),
(18, 18, 'Nisha Sharma', '2023-08-01', 'Safety Drill', 108, 120, 'All safe', 'Completed', 'Team trained'),
(19, 19, 'Vikas Gupta', '2023-08-03', 'Landscape Review', 109, 40, 'Approved layout', 'Completed', 'Green areas OK'),
(20, 20, 'Kavita Bansal', '2023-08-05', 'Hand-over Visit', 110, 90, 'Customer satisfied', 'Completed', 'All docs delivered');

-- ----- to display  table data --------------------------

select*from SiteVisits ;

-- ------ to remove complete records from table --------------

truncate  table SiteVisits;

-- ------- to remove  complete records and attribute form table  -------

drop table SiteVisits;

-- 23. Budgets
CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY,
    ProjectID INT NOT NULL,
    PhaseID INT,
    Amount DECIMAL(12,2) CHECK (Amount >= 0),
    ApprovedBy INT,
    ApprovalDate DATE,
    Remarks TEXT,
    Category VARCHAR(50),
    Year INT CHECK (Year >= 2000),
    Status VARCHAR(30),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (PhaseID) REFERENCES ConstructionPhases(PhaseID),
    FOREIGN KEY (ApprovedBy) REFERENCES Employees(EmployeeID)
);
INSERT INTO Budgets VALUES
(1, 1, 1, 100000.00, 101, '2023-01-01', 'Initial site prep', 'Construction', 2023, 'Approved'),
(2, 2, 2, 500000.00, 102, '2023-02-01', 'Foundation work', 'Structure', 2023, 'Approved'),
(3, 3, 3, 750000.00, 103, '2023-03-01', 'Framing budget', 'Structure', 2023, 'Approved'),
(4, 4, 4, 200000.00, 104, '2023-04-01', 'Roofing budget', 'Finishing', 2023, 'Pending'),
(5, 5, 5, 300000.00, 105, '2023-05-01', 'Exterior finishing', 'Finishing', 2023, 'Pending'),
(6, 6, 6, 150000.00, 106, '2023-06-01', 'Plumbing', 'Mechanical', 2023, 'Approved'),
(7, 7, 7, 180000.00, 107, '2023-07-01', 'Electrical', 'Mechanical', 2023, 'Approved'),
(8, 8, 8, 220000.00, 108, '2023-08-01', 'HVAC', 'Mechanical', 2023, 'Pending'),
(9, 9, 9, 120000.00, 109, '2023-09-01', 'Flooring', 'Interior', 2023, 'Pending'),
(10, 10, 10, 80000.00, 110, '2023-10-01', 'Painting', 'Interior', 2023, 'Pending'),
(11, 11, 11, 110000.00, 101, '2024-01-01', 'Security systems', 'Mechanical', 2024, 'Approved'),
(12, 12, 12, 130000.00, 102, '2024-02-01', 'Landscaping', 'Exterior', 2024, 'Approved'),
(13, 13, 13, 90000.00, 103, '2024-03-01', 'Lighting', 'Interior', 2024, 'Pending'),
(14, 14, 14, 160000.00, 104, '2024-04-01', 'Lift installation', 'Mechanical', 2024, 'Pending'),
(15, 15, 15, 70000.00, 105, '2024-05-01', 'Decor', 'Interior', 2024, 'Pending'),
(16, 16, 16, 85000.00, 106, '2024-06-01', 'Access control', 'Mechanical', 2024, 'Approved'),
(17, 17, 17, 95000.00, 107, '2024-07-01', 'Window fittings', 'Exterior', 2024, 'Approved'),
(18, 18, 18, 105000.00, 108, '2024-08-01', 'Ceiling works', 'Interior', 2024, 'Pending'),
(19, 19, 19, 35000.00, 109, '2024-09-01', 'Final inspection', 'Inspection', 2024, 'Pending'),
(20, 20, 20, 15000.00, 110, '2024-10-01', 'Handover logistics', 'Closing', 2024, 'Pending');

-- ----- to display  table data --------------------------

select*from Budgets ;

-- ------ to remove complete records from table --------------

truncate  table Budgets;

-- ------- to remove  complete records and attribute form table  -------

drop table Budgets;

-- 24. Invoices
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    VendorID INT NOT NULL,
    InvoiceDate DATE NOT NULL,
    DueDate DATE,
    TotalAmount DECIMAL(12,2) CHECK (TotalAmount >= 0),
    PaidAmount DECIMAL(12,2) CHECK (PaidAmount >= 0),
    Status VARCHAR(30),
    GeneratedBy INT,
    Notes TEXT,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrders(OrderID)
);
INSERT INTO Invoices VALUES
(1, 1, 1, '2023-06-01', '2023-06-10', 100000.00, 100000.00, 'Paid', 101, 'Cleared'),
(2, 2, 2, '2023-06-05', '2023-06-15', 250000.00, 250000.00, 'Paid', 102, 'Goods delivered'),
(3, 3, 3, '2023-06-10', '2023-06-20', 50000.00, 50000.00, 'Paid', 103, 'Routine delivery'),
(4, 4, 4, '2023-06-15', '2023-06-25', 175000.00, 175000.00, 'Paid', 104, 'As per PO'),
(5, 5, 5, '2023-06-20', '2023-06-30', 88000.00, 88000.00, 'Paid', 105, 'Completed'),
(6, 6, 6, '2023-06-25', '2023-07-05', 132000.00, 132000.00, 'Paid', 106, 'Routine'),
(7, 7, 7, '2023-07-01', '2023-07-10', 95000.00, 95000.00, 'Paid', 107, 'Parts received'),
(8, 8, 8, '2023-07-05', '2023-07-15', 160000.00, 160000.00, 'Paid', 108, 'HVAC installed'),
(9, 9, 9, '2023-07-10', '2023-07-20', 74000.00, 74000.00, 'Paid', 109, 'Flooring done'),
(10, 10, 10, '2023-07-12', '2023-07-22', 65000.00, 65000.00, 'Paid', 110, 'Paint supply'),
(11, 11, 1, '2024-01-01', '2024-01-11', 110000.00, 110000.00, 'Paid', 101, 'Security installed'),
(12, 12, 2, '2024-02-01', '2024-02-11', 130000.00, 130000.00, 'Paid', 102, 'Garden prep'),
(13, 13, 3, '2024-03-01', '2024-03-11', 90000.00, 90000.00, 'Paid', 103, 'Lighting done'),
(14, 14, 4, '2024-04-01', '2024-04-11', 160000.00, 160000.00, 'Paid', 104, 'Lift installed'),
(15, 15, 5, '2024-05-01', '2024-05-11', 70000.00, 70000.00, 'Paid', 105, 'Interior decor'),
(16, 16, 6, '2024-06-01', '2024-06-11', 85000.00, 85000.00, 'Paid', 106, 'Access control'),
(17, 17, 7, '2024-07-01', '2024-07-11', 95000.00, 95000.00, 'Paid', 107, 'Windows fitted'),
(18, 18, 8, '2024-08-01', '2024-08-11', 105000.00, 105000.00, 'Paid', 108, 'Ceiling done'),
(19, 19, 9, '2024-09-01', '2024-09-11', 35000.00, 35000.00, 'Paid', 109, 'Inspection fees'),
(20, 20, 10, '2024-10-01', '2024-10-11', 15000.00, 15000.00, 'Paid', 110, 'Handover logistics');

-- ----- to display  table data --------------------------

select*from Invoices ;

-- ------ to remove complete records from table --------------

truncate  table Invoices;

-- ------- to remove  complete records and attribute form table  -------

drop table Invoices;

-- 25. Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    PropertyID INT NOT NULL,
    SubmittedDate DATE NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    AgentID INT,
    Resolved BOOLEAN DEFAULT FALSE,
    Response TEXT,
    Status VARCHAR(30),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (PropertyID) REFERENCES PropertyListings(PropertyID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);
INSERT INTO Feedback VALUES
(1, 1, 1, '2023-06-10', 5, 'Very satisfied.', 1, TRUE, 'Thank you!', 'Resolved'),
(2, 2, 2, '2023-06-12', 4, 'Ventilation could improve.', 2, TRUE, 'Fixed ventilation.', 'Resolved'),
(3, 3, 3, '2023-06-14', 3, 'Paperwork delayed.', 3, TRUE, 'Agent coached.', 'Resolved'),
(4, 4, 4, '2023-06-16', 5, 'Excellent service.', 4, TRUE, 'Glad you liked it!', 'Resolved'),
(5, 5, 5, '2023-06-18', 2, 'Electricity issues.', 5, FALSE, NULL, 'Pending'),
(6, 6, 6, '2023-06-20', 3, 'Leak in washroom.', 6, FALSE, NULL, 'Pending'),
(7, 7, 7, '2023-06-22', 4, 'Happy with layout.', 7, TRUE, 'Thanks!', 'Resolved'),
(8, 8, 8, '2023-06-24', 5, 'Great design!', 8, TRUE, 'Appreciated.', 'Resolved'),
(9, 9, 9, '2023-06-26', 3, 'Agent slow to respond.', 9, TRUE, 'Improved agent response.', 'Resolved'),
(10, 10, 10, '2023-06-28', 4, 'Furniture decent.', 10, TRUE, 'Noted.', 'Resolved'),
(11, 11, 11, '2023-07-01', 5, 'Local amenities excellent.', 11, TRUE, 'Thanks for feedback!', 'Resolved'),
(12, 12, 12, '2023-07-03', 4, 'Nearby school good.', 12, TRUE, 'Thank you.', 'Resolved'),
(13, 13, 13, '2023-07-05', 3, 'Parking space small.', 13, TRUE, 'Acknowledged.', 'Resolved'),
(14, 14, 14, '2023-07-07', 5, 'Garden park lovely.', 14, TRUE, 'Glad you like!', 'Resolved'),
(15, 15, 15, '2023-07-09', 2, 'Noisy surroundings.', 15, FALSE, NULL, 'Pending'),
(16, 16, 16, '2023-07-11', 3, 'Less sunlight.', 16, FALSE, NULL, 'Pending'),
(17, 17, 17, '2023-07-13', 4, 'Good agent coordination.', 17, TRUE, 'Thanks!', 'Resolved'),
(18, 18, 18, '2023-07-15', 5, 'Smooth transaction.', 18, TRUE, 'Appreciate!', 'Resolved'),
(19, 19, 19, '2023-07-17', 3, 'Minor paint defects.', 19, TRUE, 'Repaint scheduled.', 'Resolved'),
(20, 20, 20 , '2023-07-19', 4, 'Comfortable design.', 20, TRUE, 'Thank you!', 'Resolved');

-- ----- to display  table data --------------------------

select*from Feedback ;

-- ------ to remove complete records from table --------------

truncate  table Feedback;

-- ------- to remove  complete records and attribute form table  -------

drop table Feedback;
