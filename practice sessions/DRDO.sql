-- single comment ---
/* 
multi
line 
comment 
*/
create database drdo;
use drdo;

-- --------------------------------------- Database Analysis --------------------------------------------
/*
T1 : Scientists: ScientistID, Name, Gender, DOB, Email, Phone, Specialization, DepartmentID, JoinDate, Status
T2 : Departments: DepartmentID, Name, HeadID, Location, ContactEmail, ContactPhone, EstablishedYear, Budget, ResearchDomain, Status
T3 : Projects: ProjectID, Name, StartDate, EndDate, DepartmentID, LeadScientistID, Budget, Status, Objective, Outcome
T4 : Labs: LabID, Name, Location, DirectorID, EstablishedYear, Specialization, StaffCount, EquipmentCount, Budget, Status
T5 : Technologies: TechID, Name, Type, ProjectID, Description, DevelopedYear, PatentID, UsageArea, ExportStatus, Status
T6 : Missions: MissionID, Name, Objective, LaunchDate, DurationMonths, ProjectID, LeadLabID, Result, FundingAgency, Status
T7 : Collaborations: CollabID, PartnerName, PartnerType, Country, ProjectID, MoUSignedDate, DurationYears, Contribution, ContactPerson, Status
T8 : Awards: AwardID, Title, Year, RecipientID, RecipientType, Organization, Description, AwardType, PrizeAmount, Status
T9 : Publications: PublicationID, Title, AuthorID, DepartmentID, PublishDate, Journal, DOI, ImpactFactor, CitationCount, Status
T10 : Equipments: EquipmentID, Name, LabID, PurchaseDate, Cost, WarrantyYears, Vendor, Status, UsageArea, MaintenanceDue

*/

-- Table 1 : Scientists
create table scientists (
  scientistid int primary key,
  name varchar(100),
  gender varchar(10),
  dob date,
  email varchar(100),
  phone varchar(15),
  specialization varchar(100),
  departmentid int,
  joindate date,
  status varchar(20)
);

INSERT INTO Scientists 
(ScientistID, Name, Gender, DOB, Email, Phone, Specialization, DepartmentID, JoinDate, Status) VALUES
(1,'Dr. A Sharma','Male','1975-05-12','a.sharma@drdo.in','9876543210','Aeronautics',1,'2005-08-15','Active'),
(2,'Dr. B Iyer','Female','1980-11-20','b.iyer@drdo.in','9876543211','Rocketry',2,'2008-03-22','Active'),
(3,'Dr. C Rao','Male','1972-02-05','c.rao@drdo.in','9876543212','AI',3,'2003-11-10','Retired'),
(4,'Dr. D Singh','Female','1985-07-18','d.singh@drdo.in','9876543213','Materials','1','2010-06-01','Active'),
(5,'Dr. E Patel','Male','1978-09-09','e.patel@drdo.in','9876543214','Robotics',2,'2007-04-12','Active'),
(6,'Dr. F Gupta','Female','1982-12-30','f.gupta@drdo.in','9876543215','Cybersecurity',3,'2011-09-05','Active'),
(7,'Dr. G Kumar','Male','1970-01-25','g.kumar@drdo.in','9876543216','Underwater Vehicles',1,'2000-01-01','Retired'),
(8,'Dr. H Mehta','Female','1990-03-14','h.mehta@drdo.in','9876543217','Biotechnology',4,'2015-07-20','Active'),
(9,'Dr. I Reddy','Male','1983-10-02','i.reddy@drdo.in','9876543218','Propulsion',2,'2009-01-15','Active'),
(10,'Dr. J Das','Female','1976-06-06','j.das@drdo.in','9876543219','Sensors',3,'2006-02-28','Retired');

-- all data show 
select*from Scientists;
-- delete table 
Drop  table Scientists ; 
-- delete  the records 
truncate table Scientists;  

-- Table 2 : Departments
create table departments (
  departmentid int primary key,
  name varchar(100),
  headid int,
  location varchar(100),
  contactemail varchar(100),
  contactphone varchar(15),
  establishedyear int,
  budget decimal(15,2),
  researchdomain varchar(100),
  status varchar(20)
);

INSERT INTO Departments
(DepartmentID, Name, HeadID, Location, ContactEmail, ContactPhone, EstablishedYear, Budget, ResearchDomain, Status) VALUES
(1,'Aeronautics Dept',1,'Delhi','aero@drdo.in','0112345678',1958,500000000.00,'Aircraft','Active'),
(2,'Rocketry Dept',2,'Hyderabad','rocketry@drdo.in','0401234567',1960,600000000.00,'Missiles','Active'),
(3,'Cyber Systems Dept',3,'Bangalore','cyber@drdo.in','0801234567',2000,300000000.00,'AI & Cyber','Active'),
(4,'Bioengineering Dept',8,'Chennai','bio@drdo.in','0441234567',1995,200000000.00,'Biotech','Active'),
(5,'Materials Dept',4,'Mumbai','materials@drdo.in','0221234567',1970,250000000.00,'Advanced Materials','Active'),
(6,'Robotics Dept',5,'Pune','robotics@drdo.in','0201234567',1985,150000000.00,'Robotics','Active'),
(7,'Underwater Vehicles Dept',7,'Visakhapatnam','underwater@drdo.in','0891234567',1975,180000000.00,'Naval Vehicles','Retired'),
(8,'Sensors Dept',10,'Delhi','sensors@drdo.in','0118765432',1990,170000000.00,'Sensor Tech','Active'),
(9,'Propulsion Dept',9,'Hyderabad','propulsion@drdo.in','0409876543',1965,400000000.00,'Engines','Active'),
(10,'Biotech Dept',8,'Chennai','biotech2@drdo.in','0447654321',2005,220000000.00,'Biotech','Active'); 

-- all data show 
select*from Departments ;
-- delete table 
Drop  table Departments ; 
-- delete  the records 
truncate table Departments ;  

-- Table 3 : Projects
create table projects (
  projectid int primary key,
  name varchar(100),
  startdate date,
  enddate date,
  departmentid int,
  leadscientistid int,
  budget decimal(15,2),
  status varchar(20),
  objective text,
  outcome text
);

INSERT INTO Projects
(ProjectID, Name, StartDate, EndDate, DepartmentID, LeadScientistID, Budget, Status, Objective, Outcome) VALUES
(100,'Project AeroX','2020-01-01','2023-12-31',1,1,120000000.00,'Ongoing','Develop X-series aircraft','In testing'),
(101,'Missile Z','2018-05-15','2022-11-30',2,2,250000000.00,'Completed','Develop Z guided missile','Operational'),
(102,'Cyber Shield','2021-03-01','2024-03-01',3,6,80000000.00,'Ongoing','AI-based cybersecurity platform','Prototype'),
(103,'BioMed Arm','2019-07-20','2022-08-30',4,8,60000000.00,'Completed','Biomechatronic prosthetic arm','Delivered'),
(104,'RoboHelper','2022-01-10','2025-01-10',6,5,90000000.00,'Ongoing','Assistive robot for labs','Beta'),
(105,'Material-X','2017-09-05','2021-12-10',5,4,70000000.00,'Completed','Advanced composite material','Manufactured'),
(106,'Submarine Drone','2015-03-12','2019-04-15',7,7,110000000.00,'Completed','Unmanned underwater drone','Deployed'),
(107,'SensorNet','2023-02-02','2026-02-02',8,10,50000000.00,'Ongoing','Networked sensor grid','Early stage'),
(108,'Engine Turbo','2016-11-25','2020-12-15',9,9,130000000.00,'Completed','High-thrust propulsion engine','Field test'),
(109,'Bio Reactor','2020-06-06','2023-06-06',10,8,40000000.00,'Completed','Industrial bio-reactor','Commercialized');

-- all data show 
select*from Projects ;
-- delete table 
Drop  table Projects ; 
-- delete  the records 
truncate table Projects ;  


-- Table 4 : Labs
create table labs (
  labid int primary key,
  name varchar(100),
  location varchar(100),
  directorid int,
  establishedyear int,
  specialization varchar(100),
  staffcount int,
  equipmentcount int,
  budget decimal(15,2),
  status varchar(20)
);

INSERT INTO Labs
(LabID, Name, Location, DirectorID, EstablishedYear, Specialization, StaffCount, EquipmentCount, Budget, Status) VALUES
(201,'Aero Lab', 'Delhi',1,1958,'Aeronautics',150,120,200000000.00,'Active'),
(202,'Rocket Lab','Hyderabad',2,1960,'Missile testing',200,150,250000000.00,'Active'),
(203,'Cyber Lab','Bangalore',3,2000,'Cybersecurity',100,80,120000000.00,'Active'),
(204,'Bio Lab','Chennai',8,1995,'Biotechnology',80,70,90000000.00,'Active'),
(205,'Material Lab','Mumbai',4,1970,'Materials science',120,100,110000000.00,'Active'),
(206,'Robo Lab','Pune',5,1985,'Robotics',90,85,95000000.00,'Active'),
(207,'Underwater Lab','Visakhapatnam',7,1975,'Naval Vehicles',60,50,80000000.00,'Retired'),
(208,'Sensor Lab','Delhi',10,1990,'Sensors',70,65,85000000.00,'Active'),
(209,'Propulsion Lab','Hyderabad',9,1965,'Engines',130,110,180000000.00,'Active'),
(210,'BioTech Lab','Chennai',8,2005,'Biotech R&D',75,60,88000000.00,'Active');

-- all data show 
select*from Labs ;
-- delete table 
Drop  table Labs ; 
-- delete  the records 
truncate table Labs ;  

-- Table 5 : Technologies

create table technologies (
  techid int primary key,
  name varchar(100),
  type varchar(50),
  projectid int,
  description text,
  developedyear int,
  patentid varchar(50),
  usagearea varchar(100),
  exportstatus boolean,
  status varchar(20)
);

INSERT INTO Technologies
(TechID, Name, Type, ProjectID, Description, DevelopedYear, PatentID, UsageArea, ExportStatus, Status) VALUES
(301,'AeroWing-X','Aircraft Tech',100,'Composite wing design',2021,'PAT1001','Commercial Aircraft',TRUE,'Active'),
(302,'MissileZ-Guidance','Guidance System',101,'Advanced tracking guidance',2019,'PAT1011','Defense',FALSE,'Active'),
(303,'CyberSec-AI','Software',102,'AI intrusion detection',2022,'PAT1021','Cybersecurity',FALSE,'Ongoing'),
(304,'Prosthetic Arm V2','Biomechatronics',103,'Lightweight robotic arm',2021,'PAT1031','Medical',TRUE,'Active'),
(305,'AssistRobot Beta','Robot',104,'Lab assistant robot',2023,'PAT1041','Research Labs',FALSE,'Testing'),
(306,'CompositeMat-X','Material',105,'High-strength composite',2020,'PAT1051','Construction',TRUE,'Active'),
(307,'SubDrone Mk‑I','Drone',106,'Underwater drone prototype',2018,'PAT1061','Naval Surveillance',FALSE,'Retired'),
(308,'SensorGrid 1.0','Sensor Network',107,'Distributed sensor nodes',2024,'PAT1071','Border Monitoring',FALSE,'Early'),
(309,'TurboEngine‑H','Engine',108,'High efficiency turbine',2019,'PAT1081','Aerospace',TRUE,'Active'),
(310,'BioReactor‑C','Biotech',109,'High-yield biological reactor',2022,'PAT1091','Industrial Biotech',TRUE,'Commercial');

-- all data show 
select*from Technologies ;
-- delete table 
Drop  table Technologies ; 
-- delete  the records 
truncate table Technologies ; 
 
-- Table 6 : Missions
create table missions (
  missionid int primary key,
  name varchar(100),
  objective text,
  launchdate date,
  durationmonths int,
  projectid int,
  leadlabid int,
  result text,
  fundingagency varchar(100),
  status varchar(20)
);

INSERT INTO Missions
(MissionID, Name, Objective, LaunchDate, DurationMonths, ProjectID, LeadLabID, Result, FundingAgency, Status) VALUES
(401,'AeroTest Flight','Test AeroX aircraft',STR_TO_DATE('2023-05-10','%Y-%m-%d'),6,100,201,'Successful','DRDO','Completed'),
(402,'Z‑Missile Trial','Test Missile Z',STR_TO_DATE('2021-12-01','%Y-%m-%d'),3,101,202,'Accurate strike','DRDO','Completed'),
(403,'Cyber Shield Launch','Deploy cybersecurity platform','2024-04-01',24,102,203,'Beta live','Ministry of Home','Ongoing'),
(404,'Prosthetic Test','Clinical trial arm','2022-09-15',12,103,204,'Positive feedback','Health Ministry','Completed'),
(405,'Robo Beta Demo','Lab demo robot','2023-08-20',6,104,206,'Operational','DRDO','Ongoing'),
(406,'Material-X Field','Test material strength','2020-06-30',9,105,205,'Exceeded targets','Materials Board','Completed'),
(407,'Drone Patrol','Underwater patrol deployment','2018-07-10',12,106,207,'Field deployed','Naval Board','Completed'),
(408,'SensorNet Demo','Sensor network test','2025-03-01',18,107,208,'In progress','DRDO','Ongoing'),
(409,'Engine Trial','Turbo engine field test','2019-02-15',8,108,209,'Successful','Aerospace Board','Completed'),
(410,'Bio Reactor Roll‑out','Industrial scale test','2023-10-01',15,109,210,'Commercial launch','Industry Partner','Completed');

-- all data show 
select*from Missions ;
-- delete table 
Drop  table Missions ; 
-- delete  the records 
truncate table Missions ;  

-- Table 7 : Collaborations
create table collaborations (
  collabid int primary key,
  partnername varchar(100),
  partnertype varchar(50),
  country varchar(50),
  projectid int,
  mousigneddate date,
  durationyears int,
  contribution text,
  contactperson varchar(100),
  status varchar(20)
);

INSERT INTO Collaborations
(CollabID, PartnerName, PartnerType, Country, ProjectID, MoUSignedDate, DurationYears, Contribution, ContactPerson, Status) VALUES
(501,'NASA','International','USA',100,'2020-02-15',5,'Technical expertise','Dr. A Sharma','Active'),
(502,'ISRO','Government','India',101,'2018-04-20',4,'Testing facilities','Dr. B Iyer','Completed'),
(503,'Fraunhofer','Private','Germany',102,'2021-06-05',3,'Cybertech research','Dr. C Rao','Ongoing'),
(504,'MIT','Academic','USA',103,'2019-08-10',4,'Biomechatronics guidance','Dr. D Singh','Completed'),
(505,'Siemens','Private','Germany',104,'2022-01-01',3,'Robot sensors','Dr. E Patel','Ongoing'),
(506,'TCS','Corporate','India',105,'2017-10-15',5,'Material testing','Dr. F Gupta','Completed'),
(507,'DRDC','Government','Canada',106,'2015-03-01',4,'Naval drone data','Dr. G Kumar','Retired'),
(508,'Cambridge Univ','Academic','UK',107,'2023-02-02',3,'Sensor algorithms','Dr. H Mehta','Ongoing'),
(509,'Rolls‑Royce','Corporate','UK',108,'2016-11-25',4,'Engine design','Dr. I Reddy','Completed'),
(510,'Biocon','Corporate','India',109,'2020-06-06',5,'Biotech commercialization','Dr. H Mehta','Ongoing');

-- all data show 
select*from Collaborations ;
-- delete table 
Drop  table Collaborations ; 
-- delete  the records 
truncate table Collaborations ;  

-- Table 8 : Awards
create table awards (
  awardid int primary key,
  title varchar(100),
  year int,
  recipientid int,
  recipienttype varchar(20),
  organization varchar(100),
  description text,
  awardtype varchar(50),
  prizeamount decimal(10,2),
  status varchar(20)
);

INSERT INTO Awards
(AwardID, Title, Year, RecipientID, RecipientType, Organization, Description, AwardType, PrizeAmount, Status) VALUES
(601,'Best Aeronautics Scientist',2022,1,'Scientist','DRDO','Outstanding contributions','Individual',500000.00,'Active'),
(602,'Missile Excellence Award',2021,2,'Scientist','DRDO','Breakthrough missile project','Individual',750000.00,'Active'),
(603,'Cyber Innovation',2023,3,'Scientist','Govt of India','Cybersecurity platform','Individual',600000.00,'Active'),
(604,'Bioengineering Medal',2022,8,'Scientist','DRDO','Prosthetic arm project','Individual',550000.00,'Active'),
(605,'Robotics Pioneer',2024,5,'Scientist','DRDO','RoboHelper project','Individual',500000.00,'Ongoing'),
(606,'Materials Science Award',2021,4,'Scientist','DRDO','Material‑X development','Individual',650000.00,'Active'),
(607,'Underwater Tech Award',2019,7,'Scientist','Naval Board','Submarine drone','Individual',700000.00,'Retired'),
(608,'Sensor Tech Medal',2025,10,'Scientist','DRDO','Sensor network','Individual',520000.00,'Ongoing'),
(609,'Propulsion Excellence',2020,9,'Scientist','DRDO','Turbo engine','Individual',580000.00,'Active'),
(610,'Biotech Commercialization',2023,8,'Scientist','Industry Partner','Bio Reactor','Individual',620000.00,'Active');

-- all data show 
select*from Awards ;
-- delete table 
Drop  table Awards ; 
-- delete  the records 
truncate table Awards ;  

-- Table 9 :  Publications
create table publications (
  publicationid int primary key,
  title varchar(200),
  authorid int,
  departmentid int,
  publishdate date,
  journal varchar(100),
  doi varchar(100),
  impactfactor decimal(4,2),
  citationcount int,
  status varchar(20)
);

INSERT INTO Publications
(PublicationID, Title, AuthorID, DepartmentID, PublishDate, Journal, DOI, ImpactFactor, CitationCount, Status) VALUES
(701,'AeroX Wing Design',1,1,'2022-03-15','J Aeronautics','10.1000/j1',5.50,120,'Published'),
(702,'Z Missile Guidance',2,2,'2021-11-01','Missile Tech J','10.1000/j2',6.10,200,'Published'),
(703,'AI Cyber Shield',6,3,'2023-05-20','CyberSec Journal','10.1000/j3',7.00,150,'Published'),
(704,'Robotic Prosthetic Arm',8,4,'2021-09-05','Biomech Eng J','10.1000/j4',5.80,80,'Published'),
(705,'Assistive Robot in Labs',5,6,'2024-02-10','Robotics Today','10.1000/j5',6.30,60,'Published'),
(706,'Composite Materials X',4,5,'2020-08-12','Materials Science','10.1000/j6',5.90,100,'Published'),
(707,'Underwater Drone Deployment',7,7,'2019-04-22','Naval Tech J','10.1000/j7',6.00,90,'Published'),
(708,'Sensor Network Architecture',10,8,'2025-01-30','Sensor Systems','10.1000/j8',7.20,40,'Published'),
(709,'Turbo Engine Performance',9,9,'2019-06-18','Propulsion Review','10.1000/j9',6.50,110,'Published'),
(710,'Industrial Bio Reactor',8,10,'2023-07-25','BioTech Industrial','10.1000/j10',7.10,70,'Published');

-- all data show 
select*from Publications ;
-- delete table 
Drop  table Publications ; 
-- delete  the records 
truncate table Publications ;  

-- Table 10 : Equipments
create table equipments (
  equipmentid int primary key,
  name varchar(100),
  labid int,
  purchasedate date,
  cost decimal(12,2),
  vendor varchar(100),
  warrantyyears int,
  status varchar(20),
  usagearea varchar(100),
  maintenancedue date
);

INSERT INTO Equipments
(EquipmentID, Name, LabID, PurchaseDate, Cost, Vendor, WarrantyYears, Status, UsageArea, MaintenanceDue) VALUES
(801,'Wind Tunnel','201',STR_TO_DATE('2020-01-10','%Y-%m-%d'),50000000.00,'GE','5','Active','Aerodynamics','2025-01-10'),
(802,'Missile Test Rig','202','2019-07-15',75000000.00,'ISRO','5','Active','Missile Testing','2024-07-15'),
(803,'Server Cluster','203','2021-03-01',20000000.00,'Dell','3','Active','Cybersecurity','2024-03-01'),
(804,'Bio Reactor','204','2022-09-20',30000000.00,'BioCorp','4','Active','Biotech','2026-09-20'),
(805,'Robotic Arm','206','2023-01-12',15000000.00,'Fanuc','2','Active','Lab Assistance','2025-01-12'),
(806,'Composite Fabricator','205','2020-05-25',25000000.00,'3M','4','Active','Materials','2024-05-25'),
(807,'Underwater Drone Platform','207','2018-08-10',60000000.00,'NavTek','5','Retired','Naval','2023-08-10'),
(808,'Sensor Node Kit','208','2024-02-05',10000000.00,'Intel','3','Active','Sensor Deployment','2027-02-05'),
(809,'Turbo Engine Test Bench','209','2019-11-11',55000000.00,'Rolls‑Royce','5','Active','Engine Testing','2024-11-11'),
(810,'Industrial Bio‑Reactor Unit','210','2023-10-01',40000000.00,'BiotechInc','4','Active','Industrial Biotech','2027-10-01');

-- all data show 
select*from Equipments ;
-- delete table 
Drop  table Equipments ; 
-- delete  the records 
truncate table Equipments ;  