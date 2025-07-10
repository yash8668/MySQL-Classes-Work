-- ----------------------- single line comment -----------
  /*
   multi line comment 
  */
  -- create database Army
  create database army ;
  -- to work on database first , you need to first 
  drop database army;
  use army; 
  
  -- --- database analysis -----------------------------------------
  /*
 
  T1 : units ( UnitId , Unitname, CommandingId , BaseLocation  , EstablishOn , Division , type , personnelCount , unitCode ,status)
  T2 : soldiers(SoldierId  , FirstName , LastName, rank , DateOfBirth, Gender, EnlistmentDate , UnitId , BloodGroup , Nationality )
  T3:  Weapons  (WeaponId , WeaponName , type , caliber , quentity ,Condition, manufacturer, AquierDate,unitId , serialNumber)
  T4: Vehicles ( vehicleid , Model ,Type ,LicensePlate ,Status , assignedUnit, ManufactureYear,ServiceDueDate ,FuelType,ArmorLevel,ArmorLevel)
  T5: TrainingPrograms ( trainingId , Title , Description , DuretionsDays , StartDate , EndDate , TrainerId , Location , type , evaluationMethod )
  T6: AttendanceLogs ( LogId , SoldeirId, date , TimeIn , TimeOut, Status ,Location ,Supervisorid , Remarks , UnitId )
  T7: MedicalRecords ( RecordId, SoldeirId ,CheackupDate , Diagnosis , Treatment , DocterID , HospitalId , FollowUpDate ,BloodePressure ,Notes )
  T8: injuries ( injuriesId , SoldierID , Date , Location , type , severity , treatment , HospitalId, ReportedBy , RecoveryStatus )
  T9: Missions ( MissionId , Title , Description , StartDate , EndDate , Location  , objective ,  CommanmderId , UnitId, Status )
  T10: MissionReports (ReportId ,MissionId , ReportDate , PreparedBy , Summery , Outcome , Casualities , ResourcesUsed , Duration ,Recommandations )
  
 
 */
 
 
 -- table 1  units
 -- create a table Units  ( UnitId , Unitname, CommandingId , BaseLocation  , EstablishOn , Division , type , personnelCount , unitCode ,status)
 create table Units ( 
 UnitId int primary key ,
 Unitname varchar(100),
 CommandingId int  ,
 BaseLocation varchar(100)  ,
 EstablishOn date  ,
 Division varchar(100) ,
 type varchar(100) ,
 personnelCount int  , 
 unitCode varchar(100) ,
 status varchar (100)
 );
 
 -- insert  value in Units table 
insert into Units
value 
  (1, '1st Recon Company',      101, 'Fort Bravo',       '2010-08-15', '1st Armored',   'Recon',    120, 'RC-101', 'Active'),
  (2, '2nd Infantry Battalion', 102, 'Camp Eagle',       '2012-05-01', '2nd Infantry',  'Infantry', 200, 'IB-202', 'Reserve'),
  (3, '3rd Signals Squadron',   103, 'Station Foxtrot',  '2014-11-12', '2nd Signals',   'Signals',   80, 'SS-303', 'Active'),
  (4, '4th Armor Regiment',     104, 'Camp Delta',       '2009-02-28', '3rd Armored',   'Armor',     300, 'AR-404', 'Active'),
  (5, '5th Support Platoon',    105, 'Camp Echo',        '2018-07-20', 'Support Division','Support',150, 'SP-505', 'Active');

select*from Units ;
truncate table Units ;
drop table units ;
 
-- -- table 2 soldiers
-- create table  soldiers(SoldierId  , FirstName , LastName, rank , DateOfBirth, Gender, EnlistmentDate , UnitId , BloodGroup , Nationality )
create table Soldiers (
 SoldierId int primary key ,
 FirstName varchar(50),
 LastName varchar(50) , 
 Ranks varchar (10)  ,
 DateOfBirth  Date, 
 Gender varchar (20) ,
 EnlistmentDate date ,
 UnitId int ,
 BloodGroup varchar(10) ,
 Nationality varchar (50),
 foreign key (UnitId) references Units (UnitId)
 );

 -- insert value in Soldiers table 
 insert into Soldiers 
 values
  (1, 'John',    'Doe',      'CPL', '1990-01-15', 'Male',   '2010-03-10', 1, 'O+',  'Indian'),
  (2, 'Priya',   'Singh',    'SGT', '1992-07-23', 'Female', '2012-06-12', 2, 'B+',  'Indian'),
  (3, 'Raj',     'Patel',    'PVT', '1995-11-05', 'Male',   '2015-09-20', 3, 'A-',  'Indian'),
  (4, 'Meera',   'Khan',     'LCL', '1989-04-30', 'Female', '2009-02-15', 1, 'AB+', 'Indian'),
  (5, 'Arun',    'Gupta',    'PFC', '1993-12-12', 'Male',   '2013-11-11', 2, 'O-',  'Indian');
 
select*from Soldiers;
truncate table Soldiers ;
 drop table Soldiers ;
 
-- table 3 Weapons 
-- create table Weapons  (WeaponId , WeaponName , type , caliber , quentity ,Condition, manufacturer, AquierDate,unitId , serialNumber)

create table  Weapons 
(WeaponId  int primary key  ,
 WeaponName varchar (100)  ,
type varchar (100)  , 
caliber varchar(50) ,
quentity int ,
Conditions  varchar (100), 
manufacturer varchar(50),
 AquierDate date ,
 UnitId int  ,
 serialNumber varchar (100),
 foreign key (Unitid) references Units(UnitId)
 );
 
 -- insert value Weapons table 
 insert into Weapons
 value 
(1, 'AK-47',        'Rifle',    '7.62×39mm', 20, 'Good',     'Kalashnikov', '2005-05-10', 1, 'AK47-0001'),
(2, 'M16A2',        'Rifle',    '5.56×45mm', 15, 'Excellent', 'Colt',        '2006-08-20', 2, 'M16-0002'),
(3, 'Glock 17',     'Pistol',   '9×19mm',    30, 'New',       'Glock GmbH',  '2010-11-01', 3, 'GLK17-0003'),
(4, 'M249 SAW',     'LMG',      '5.56×45mm', 5,  'Fair',      'FN Herstal',  '2008-01-15', 1, 'M249-0004'),
(5, 'Barrett M82',  'Sniper Rifle','.50 BMG',   2,  'Good',      'Barrett',     '2012-07-30', 2, 'BR82-0005');

 select*from Weapons;
 truncate table Weapons;
 drop table Weapons ;
 
 -- table 4 Vehicles 
 -- create table Vehicles ( vehicleid , Model ,Type ,LicensePlate ,Status , assignedUnit, ManufactureYear,ServiceDueDate ,FuelType,ArmorLevel,)
 create table Vehicles
 ( vehicleid int primary key ,
 Model varchar (50) ,
 Type  varchar  (100) ,
 LicensePlate  varchar (50) ,
 Status varchar (50) ,
 assignedUnit int ,
 ManufactureYear  int ,
 ServiceDueDate  date ,
 FuelType varchar(100) ,
 ArmorLevel varchar(50)
 );
-- insert value Vehicles table  
insert into  vehicles
value  
  (1, 'Tata Safari',        'SUV',     'MH12AB1234', 'Active',   1, 2020, '2026-05-01', 'Diesel', 'Light'),
  (2, 'Mahindra Bolero',    'Pickup',  'MH14CD5678', 'Active',   2, 2018, '2025-12-15', 'Diesel', 'None'),
  (3, 'Maruti Ertiga',      'MPV',     'MH13EF9101', 'Maintenance', 3, 2019, '2025-10-10', 'Petrol','None'),
  (4, 'Ashok Leyland Truck','Truck',   'MH11GH2345', 'Active',   1, 2015, '2025-08-20', 'Diesel', 'Medium'),
  (5, 'Mahindra Scorpio',   'SUV',     'MH15IJ6789', 'Reserve',  2, 2021, '2027-03-05', 'Petrol','Light');

select*from vehicles;
truncate table vehicles;
drop table vehicles ;

--  table 5  TrainingPrograms
-- create table TrainingPrograms ( trainingId , Title , Description , DuretionsDays , StartDate , EndDate , TrainerId , Location , type , evaluationMethod )  
create table TrainingPrograms ( 
trainingId int primary key , 
Title  varchar (100) ,
Description text (100)  ,
DuretionsDays  varchar(50),
StartDate date  , 
 EndDate  date ,
 TrainerId int  ,
 Location  varchar(100),
 type  varchar(50),
 evaluationMethod varchar(50) 
 );  
 -- insert table trainingPrograms
 insert into trainingPrograms
 values
  (1, 'Basic Combat Training', 'Introductory military skills', '10',
   '2025-07-01', '2025-07-10', 201, 'Fort Bravo', 'Combat', 'Written'),
  (2, 'Advanced Marksmanship', 'Rifle firing techniques', '7',
   '2025-07-15', '2025-07-21', 202, 'Camp Echo', 'Shooting', 'Practical'),
  (3, 'First Aid & Survival', 'Medical response in field', '5',
   '2025-08-01', '2025-08-05', 203, 'Station Foxtrot', 'Medical', 'Practical'),
  (4, 'Leadership Workshop', 'Command strategies & team building', '3',
   '2025-08-10', '2025-08-12', 204, 'Fort Delta', 'Leadership', 'Group'),
  (5, 'Vehicle Maintenance', 'Maintaining military vehicles', '4',
   '2025-08-20', '2025-08-24', 205, 'Base Charlie', 'Technical', 'Written');
   
select*from trainingPrograms ;
truncate table trainingPrograms ;
drop table trainingPrograms ;

-- table 6 AttendanceLogs 
--  create table AttendanceLogs ( LogId , SoldeirId, date , TimeIn , TimeOut, Status ,Location ,Supervisorid , Remarks , UnitId )
create table AttendanceLogs (
LogId int primary key ,
 SoldierId int ,
 UnitId int,
 date date  , 
 TimeIn Time  ,
 TimeOut  time ,
 Status  varchar (100),
 Location varchar (100) ,
 SupervisorId int  ,
 Remarks text ,
 foreign key (SoldierId) references Soldiers(SoldierId), 
 foreign key (UnitId) references Units (UnitId)
 );
 
 -- insert value  in AttendanceLogs
 insert into AttendanceLogs
 values 
  (1, 1, 1, '2025-06-10', '08:00:00', '17:00:00', 'Present',   'Fort Bravo',   301, 'All good'),
  (2, 2, 2, '2025-06-10', '08:15:00', '16:45:00', 'Present',   'Camp Echo',    302, ''),
  (3, 3, 3, '2025-06-10', '09:00:00', '18:00:00', 'Late',      'Station Foxtrot',303,'Traffic delay'),
  (4, 4, 1, '2025-06-10', '08:00:00', '17:00:00', 'Present',   'Fort Bravo',   301, ''),
  (5, 5, 2, '2025-06-10', '08:30:00', '17:10:00', 'Present',   'Camp Echo',    302, 'Arrived late bus');

 
 select*from  AttendanceLogs;
 truncate table  AttendanceLogs;
 drop table  AttendanceLogs;

 -- table 7 MedicalRecords
 -- create table MedicalRecords
 create table MedicalRecords( RecordId int primary key,
 SoldierId  int ,
 CheackupDate  date not null,
 Diagnosis text not null , 
 Treatment text ,
 DocterID int ,
 HospitalId int ,
 FollowUpDate  date ,
 BloodePressure int ,
 Notes text ,
 foreign key (SoldierId) references Soldiers(SoldierId)
 );
 
 -- insert value MedicalRecords table
insert into MedicalRecords 
values
  (1, 1, '2025-06-05', 'Routine Check-up',     'Physiotherapy',          401, 101, '2026-06-05', 118,  'All within normal limits'),
  (2, 2, '2025-06-06', 'Elevated BP',          'Lifestyle advice', 402, 102, '2025-06-20', 128,  'Slightly elevated, retest in 2 weeks'),
  (3, 3, '2025-06-07', 'Stage 1 Hypertension', 'Prescribed ACE inhibitor', 403, 101, '2025-07-07', 132,  'Stage 1 hypertension confirmed'),
  (4, 4, '2025-06-08', 'Flu-like symptoms',    'Fluids & rest', 404, 103, '2025-06-22', 115,  'Normal BP during illness'),
  (5, 5, '2025-06-09', 'Post-injury check-up', 'Physiotherapy', 405, 102, '2025-07-09', 122,  'BP normal for age/gender');

 select*from MedicalRecords ; 
 truncate table  MedicalRecords ; 
 drop table  MedicalRecords ; 
 
-- table 8 injuries
-- create table  injuries ( injuriesId , SoldierID , Date , Location , type , severity , treatment , HospitalId, ReportedBy , RecoveryStatus )
create table injuries ( 
injuriesId  int primary key ,
 SoldierID  int ,
 Date date  ,
 Location varchar(50) ,
 type varchar(50) ,
 severity varchar(50) ,
 treatment text ,
 HospitalId int, 
 ReportedBy int  ,
 RecoveryStatus varchar (100),
 foreign key (SoldierId) references Soldiers(SoldierId)
 );
 
 insert into injuries
 values
  (1, 1, '2025-06-01', 'Field',       'Fracture', 'Moderate',   'Cast applied',     101, 501, 'Under treatment'),
  (2, 2, '2025-06-02', 'Training',    'Sprain',   'Mild',       'Rest & Ice',       102, 502, 'Recovered'),
  (3, 3, '2025-06-03', 'Base',        'Cut',      'Minor',      'Stitches',         103, 503, 'Recovered'),
  (4, 4, '2025-06-04', 'Patrol',      'Bruise',   'Mild',       'Cold compress',    104, 504, 'Under treatment'),
  (5, 5, '2025-06-05', 'Vehicle Bay', 'Concussion','Severe',    'Hospitalization',  105, 505, 'In recovery');

  select*from MedicalRecords ; 
 truncate table  MedicalRecords ; 
 drop table  MedicalRecords ; 
 
 -- table 9 Missions 
-- create table Missions ( MissionId , Title , Description , StartDate , EndDate , Location  , objective ,  CommanmderId , UnitId, Status )
create table Missions
( MissionId int primary key ,
 Title varchar (100) ,
 Description  text ,
 StartDate date ,
 EndDate date ,
 Location varchar (50) ,
 objective text ,
 CommanmderId  int , 
 UnitId int ,
 Status varchar(100),
 foreign key (UnitId) references Units (UnitId)
 );
 
 insert  into Missions
 values 
  (1, 'Operation Dawn',         'Secure forward base',           '2025-06-15', '2025-06-20', 'Fort Bravo',     'Establish perimeter', 101, 1, 'Planned'),
  (2, 'Recon Patrol Alpha',     'Gather intel north',           '2025-06-18', '2025-06-18', 'Sector Echo',    'Map enemy positions', 102, 2, 'Ongoing'),
  (3, 'Supply Run Bravo',       'Deliver supplies to unit 3',   '2025-06-17', '2025-06-17', 'Route Charlie',  'Resupply ammo and food', 103, 3, 'Completed'),
  (4, 'Night Watch',            'Monitor border activity',      '2025-06-16', '2025-06-19', 'Border Post Zulu','Prevent incursions', 101, 1, 'Ongoing'),
  (5, 'Evacuation Drill',       'Test rapid evac procedures',   '2025-07-01', '2025-07-01', 'Camp Delta',     'Assess evacuation timings', 104, 2, 'Planned');

select *from  Missions ;
truncate table Missions ;
drop table Missions ;

-- table 10 MissionReports
-- create table MissionReports (ReportId ,MissionId , ReportDate , PreparedBy , Summery , Outcome , Casualities , ResourcesUsed , Duration ,Recommandations ) 
 create table MissionReports (ReportId int primary key ,
 MissionId int ,
 ReportDate date ,
 PreparedBy int ,
 Summery  text, 
 Outcome text ,
 Casualities  int,
 ResourcesUsed text ,
 Duration int ,
 Recommandations text,
 foreign key(MissionId) references Missions(MissionId)
 ) ;
 
 insert into MissionReports
 values
   (1, 1, '2025-06-21', 201, 'Initial staging complete', 'Perimeter established', 0, 'Transport, Supplies', 5, 'Expand guard posts'),
  (2, 2, '2025-06-18', 202, 'Recon north sector', 'Intel gathered', 0, 'Drones, Optics', 1, 'Increase drone coverage'),
  (3, 3, '2025-06-17', 203, 'Supply run executed', 'All supplies delivered', 0, 'Trucks, Fuel', 1, 'Consider convoy escorts'),
  (4, 4, '2025-06-19', 201, 'Night patrol summary', 'No incursions detected', 0, 'Night-vision gear', 3, 'Rotate night shifts'),
  (5, 5, '2025-07-01', 204, 'Evacuation drill results', 'Evac time improved', 1, 'Ambulance, Radios', 1, 'Run drill monthly');
  
select*from MissionReports;
truncate table MissionReports ;
drop table MissionReports;
  
