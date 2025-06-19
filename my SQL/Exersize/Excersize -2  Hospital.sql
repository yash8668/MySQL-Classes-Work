-- ----------------------- single line comment -----------
  /*
   multi line comment 
  */
   
  -- create database Hospital
  
  Create database Hospital ;
  drop database Hospital ;
   -- ---to work on this database , you need to use it first 
   -- ------ to execute ( ctrl + enter ) --
   use Hospital  ;
 /*

T1: Patients(PatientID, Name, Age, Gender, DOB, Contact, Email, Address, BloodType, EmergencyContact),

T2: Doctors(DoctorID, Name, Specialty, Department, Phone, Email, Qualification, ExperienceYears, Gender, Status),

T3: Appointments(AppointmentID, PatientID, DoctorID, Date, Time, Reason, Status, RoomNumber, CreatedAt, UpdatedAt),

T4: Rooms(RoomID, RoomNumber, Type, Floor, Capacity, Status, IsOccupied, Department, PricePerDay, Notes),

T5: Admissions(AdmissionID, PatientID, RoomID, AdmissionDate, DischargeDate, Diagnosis, TreatmentPlan, DoctorID, Insurance, Status),

T6: Treatments(TreatmentID, PatientID, DoctorID, TreatmentDate, Description, Medication, Dosage, DurationDays, Notes, Status),

T7: Prescriptions(PrescriptionID, PatientID, DoctorID, Medication, Dosage, Frequency, Duration, IssueDate, Instructions, Status),

T8: Bills(BillID, PatientID, AdmissionID, Amount, Date, PaymentStatus, PaymentMethod, Discount, InsuranceProvider, DueDate),

T9: Staff(StaffID, Name, Role, Department, Phone, Email, Gender, JoiningDate, Shift, Status),

T10: MedicalRecords(RecordID, PatientID, DoctorID, RecordDate, Symptoms, Diagnosis, LabResults, PrescribedMedications, Notes, Status)

*/
   --  ----- create table queries 
   --  ----- table-1 Patients  ------- 
   create table Patients(
   PatientID int primary key ,
   Name varchar (100),
   Age int ,
   Gender varchar (100),
   DOB varchar (100),
   Contact  varchar(100),
   Email varchar (100),
   Address varchar (100),
   BloodType varchar (100),
   EmergencyContact varchar(50)
   );
   
   
insert into Patients
values
(1, 'Aarav Mehta', 30, 'Male', '1995-04-10', '9876543210', 'aarav.mehta@example.com', 'Mumbai, India', 'B+', 9123456789),
(2, 'Diya Sharma', 25, 'Female', '1999-01-25', '9856237410', 'diya.sharma@example.com', 'Delhi, India', 'A+', 9988776655),
(3, 'Rohan Patil', 40, 'Male', '1984-07-12', '9836547120', 'rohan.patil@example.com', 'Pune, India', 'O+', 9876501234),
(4, 'Sneha Joshi', 35, 'Female', '1989-02-18', '9812354789', 'sneha.joshi@example.com', 'Nagpur, India', 'AB-', 9765432180),
(5, 'Kunal Verma', 28, 'Male', '1996-06-30', '9823123456', 'kunal.verma@example.com', 'Bhopal, India', 'A-', 9654321870),
(6, 'Meera Nair', 45, 'Female', '1979-10-22', '9800012345', 'meera.nair@example.com', 'Kochi, India', 'O-', 9876123456),
(7, 'Rahul Singh', 32, 'Male', '1992-11-05', '9887654321', 'rahul.singh@example.com', 'Lucknow, India', 'B-', 9123456700),
(8, 'Anjali Desai', 38, 'Female', '1986-03-15', '9898989898', 'anjali.desai@example.com', 'Surat, India', 'A+', 9345678123),
(9, 'Nikhil Gupta', 29, 'Male', '1995-08-09', '9871234567', 'nikhil.gupta@example.com', 'Jaipur, India', 'AB+', 9988771122),
(10, 'Priya Iyer', 31, 'Female', '1993-12-20', '9845123678', 'priya.iyer@example.com', 'Chennai, India', 'O+', 9012345678);

drop table Patients;
truncate table Patients;
select*from Patients;

 --  ----- table-2 Doctors------- 
create table  Doctors( 
DoctorID int primary key ,
Name varchar (100),
Specialty varchar (100),
Department varchar (100),
Phone varchar (100),
Email varchar(100),
Qualification varchar (100),
ExperienceYears  year , 
Gender varchar (100),
Status varchar (100) 
);

insert into Doctors
values 
(1, 'Dr. Ramesh Kumar', 'Cardiology', 'Heart', '9876543210', 'ramesh.kumar@hospital.com', 'MD Cardiology', 2012, 'Male', 'Active'),
(2, 'Dr. Anita Sharma', 'Neurology', 'Brain', '9856237410', 'anita.sharma@hospital.com', 'DM Neurology', 2015, 'Female', 'Active'),
(3, 'Dr. Pooja Desai', 'Pediatrics', 'Child Care', '9836547120', 'pooja.desai@hospital.com', 'MD Pediatrics', 2010, 'Female', 'Active'),
(4, 'Dr. Rajesh Verma', 'Orthopedics', 'Bones', '9812354789', 'rajesh.verma@hospital.com', 'MS Ortho', 2008, 'Male', 'On Leave'),
(5, 'Dr. Neha Joshi', 'Dermatology', 'Skin', '9823123456', 'neha.joshi@hospital.com', 'MD Dermatology', 2014, 'Female', 'Active'),
(6, 'Dr. Vikram Singh', 'Surgery', 'General Surgery', '9800012345', 'vikram.singh@hospital.com', 'MS Surgery', 2005, 'Male', 'Retired'),
(7, 'Dr. Kavita Nair', 'Gynaecology', 'Women Health', '9887654321', 'kavita.nair@hospital.com', 'MD Gynaecology', 2016, 'Female', 'Active'),
(8, 'Dr. Sameer Bhat', 'ENT', 'Ear, Nose, Throat', '9898989898', 'sameer.bhat@hospital.com', 'MS ENT', 2011, 'Male', 'Active'),
(9, 'Dr. Meenakshi Rao', 'Psychiatry', 'Mental Health', '9871234567', 'meenakshi.rao@hospital.com', 'MD Psychiatry', 2009, 'Female', 'Active'),
(10, 'Dr. Arjun Mehta', 'Oncology', 'Cancer', '9845123678', 'arjun.mehta@hospital.com', 'DM Oncology', 2013, 'Male', 'Active');

drop table Doctors;
truncate table Doctors;
select*from Doctors;

-- table 3 Appointments
create table Appointments(
AppointmentID int primary key,
PatientID int ,
DoctorID int ,
Date date,
Time time,
Reason varchar (100),
Status varchar(100),
RoomNumber int,
CreatedAt datetime,
UpdatedAt datetime,
foreign key(patientId) references Patients(patientId),
foreign key(DoctorId) references Doctors (DoctorId)
);

insert into Appointments
values 
(1, 1, 2, '2025-06-15', '10:30:00', 'Headache & dizziness', 'Scheduled', 101, '2025-06-10 09:15:00', '2025-06-10 09:15:00'),
(2, 3, 1, '2025-06-16', '11:00:00', 'Heart palpitations', 'Scheduled', 102, '2025-06-11 10:00:00', '2025-06-11 10:00:00'),
(3, 5, 4, '2025-06-17', '12:00:00', 'Knee pain', 'Scheduled', 103, '2025-06-12 12:00:00', '2025-06-12 12:00:00'),
(4, 2, 3, '2025-06-15', '09:45:00', 'Fever & cough', 'Completed', 104, '2025-06-09 08:30:00', '2025-06-15 10:00:00'),
(5, 7, 5, '2025-06-18', '14:30:00', 'Skin allergy', 'Scheduled', 105, '2025-06-13 13:00:00', '2025-06-13 13:00:00'),
(6, 4, 6, '2025-06-16', '15:00:00', 'Post-surgery follow-up', 'Scheduled', 106, '2025-06-12 11:30:00', '2025-06-12 11:30:00'),
(7, 6, 9, '2025-06-20', '10:00:00', 'Anxiety issues', 'Scheduled', 107, '2025-06-14 08:00:00', '2025-06-14 08:00:00'),
(8, 8, 8, '2025-06-19', '11:15:00', 'Ear pain', 'Cancelled', 108, '2025-06-13 09:30:00', '2025-06-17 09:30:00'),
(9, 10, 7, '2025-06-22', '09:00:00', 'Routine checkup', 'Scheduled', 109, '2025-06-14 10:45:00', '2025-06-14 10:45:00'),
(10, 9, 10, '2025-06-21', '13:00:00', 'Cancer consultation', 'Scheduled', 110, '2025-06-13 15:15:00', '2025-06-13 15:15:00');

drop table Doctors;
truncate table Doctors;
select*from Doctors;

-- table 4 Rooms
create  table Rooms(
RoomID int primary key,
RoomNumber  int , 
Type varchar(100),
Floor int ,
Capacity int , 
Status varchar (100),
IsOccupied varchar(100),
Department varchar (100),
PricePerDay int ,
Notes varchar(100)
);

insert into Rooms 
values 
(1, 101, 'Single', 1, 1, 'Available', 'No', 'General', 1500, 'Well ventilated'),
(2, 102, 'Double', 1, 2, 'Occupied', 'Yes', 'Cardiology', 2500, 'Near nurses station'),
(3, 201, 'ICU', 2, 1, 'Available', 'No', 'Critical Care', 5000, 'Equipped with ventilator'),
(4, 202, 'General Ward', 2, 6, 'Occupied', 'Yes', 'Orthopedics', 800, 'Shared ward'),
(5, 301, 'Single Deluxe', 3, 1, 'Available', 'No', 'Neurology', 3500, 'Has attached bathroom'),
(6, 302, 'Private', 3, 1, 'Under Maintenance', 'No', 'Gynaecology', 1800, 'Leakage issue'),
(7, 401, 'Double Deluxe', 4, 2, 'Available', 'No', 'Pediatrics', 2800, 'Bright and spacious'),
(8, 402, 'General Ward', 4, 8, 'Occupied', 'Yes', 'Dermatology', 700, 'Crowded'),
(9, 501, 'Isolation', 5, 1, 'Available', 'No', 'Infectious Diseases', 4000, 'Soundproofed'),
(10, 502, 'ICU', 5, 1, 'Occupied', 'Yes', 'Oncology', 5200, '24/7 monitoring');

drop table Rooms;
truncate table Rooms;
select*from Rooms ;

-- table 5 Admissions
create table  Admissions(
AdmissionID int primary key ,
PatientID int ,
RoomID int,
AdmissionDate date ,
DischargeDate date, 
Diagnosis varchar (100),
TreatmentPlan  varchar(100),
DoctorID int ,
Insurance varchar(100),
Status varchar(100),
foreign key(patientId) references Patients(patientId),
foreign key(RoomId) references Rooms(RoomId),
foreign key(DoctorId) references Doctors (DoctorId)
);

insert into Admissions
values
(1, 1, 2, '2025-06-10', '2025-06-14', 'Migraine', 'Medication & Rest', 2, 'Yes', 'Discharged'),
(2, 3, 1, '2025-06-11', NULL, 'Chest Pain', 'Cardiac Monitoring', 1, 'No', 'Admitted'),
(3, 5, 4, '2025-06-12', '2025-06-15', 'Fracture', 'Casting & Physiotherapy', 4, 'Yes', 'Discharged'),
(4, 2, 3, '2025-06-09', '2025-06-13', 'Viral Fever', 'IV Fluids & Monitoring', 3, 'No', 'Discharged'),
(5, 7, 5, '2025-06-14', NULL, 'Skin Rash', 'Topical Treatment', 5, 'Yes', 'Admitted'),
(6, 4, 6, '2025-06-13', NULL, 'Post-Surgery Recovery', 'Observation', 6, 'Yes', 'Admitted'),
(7, 6, 7, '2025-06-10', '2025-06-12', 'Anxiety Disorder', 'Therapy & Medication', 9, 'Yes', 'Discharged'),
(8, 8, 8, '2025-06-15', NULL, 'Ear Infection', 'Antibiotics', 8, 'No', 'Admitted'),
(9, 10, 10, '2025-06-16', NULL, 'Cancer Consultation', 'Chemo Evaluation', 10, 'Yes', 'Admitted'),
(10, 9, 9, '2025-06-12', '2025-06-14', 'Flu', 'Rest & Fluids', 7, 'No', 'Discharged');

drop table Admissions;
truncate table Admissions;
select*from Admissions;

-- table 6 Treatments
create table  Treatments(
TreatmentID int primary key ,
PatientID int , 
DoctorID int , 
TreatmentDate date, 
Description varchar(100),
Medication varchar(100),
Dosage varchar(100),
DurationDays int , 
Notes varchar(100), 
Status varchar(100),
foreign key(patientId) references Patients(patientId),
foreign key(DoctorId) references Doctors (DoctorId)
);

insert into Treatments
values 
(1, 1, 2, '2025-06-15', 'Headache treatment', 'Paracetamol', '500 mg', 3, 'Keep hydrated', 'Completed'),
(2, 2, 3, '2025-06-16', 'Fever management', 'Ibuprofen', '200 mg', 5, 'Take after meals', 'Ongoing'),  
(3, 3, 1, '2025-06-14', 'Chest pain evaluation', 'Aspirin', '75 mg', 30, 'Daily dosage', 'Ongoing'),
(4, 4, 4, '2025-06-16', 'Post-surgery pain', 'Morphine', '2 mg', 2, 'Monitor vitals', 'Completed'),
(5, 5, 5, '2025-06-17', 'Skin rash treatment', 'Hydrocortisone', '1 %', 7, 'Apply twice daily', 'Ongoing'),
(6, 6, 6, '2025-06-14', 'Post-surgery recovery', 'Amoxicillin', '500 mg', 10, 'Finish course', 'Ongoing'),
(7, 7, 7, '2025-06-15', 'Anxiety management', 'Diazepam', '5 mg', 14, 'Monitor response', 'Ongoing'),
(8, 8, 8, '2025-06-18', 'Ear infection', 'Amoxicillin', '250 mg', 7, 'Check hearing', 'Scheduled'),
(9, 9, 9, '2025-06-19', 'Asthma maintenance', 'Salbutamol', '100 mcg', 30, 'Use as needed', 'Ongoing'),
(10, 10, 10, '2025-06-20', 'Cancer consultation', 'Methotrexate', '15 mg', 1, 'First dose', 'Scheduled');

drop table  Treatments;
truncate table Treatments;
select*from Treatments;

--  table 7 Prescriptions
create table  Prescriptions(
PrescriptionID int primary key , 
PatientID int , 
DoctorID int, 
Medication varchar(100), 
Dosage varchar(100), 
Frequency varchar(100), 
Duration varchar(100), 
IssueDate date , 
Instructions varchar(100), 
Status varchar (100),
foreign key(patientId) references Patients(patientId),
foreign key(DoctorId) references Doctors (DoctorId)
);

insert into Prescriptions
values
(1, 1, 2, 'Paracetamol', '500 mg', 'TID', '5 days', '2025-06-14', 'After meals', 'Active'),
(2, 2, 3, 'Ibuprofen', '200 mg', 'BD', '7 days', '2025-06-13', 'With water', 'Active'),
(3, 3, 1, 'Aspirin', '75 mg', 'OD', '1 month', '2025-06-12', 'At bedtime', 'Active'),
(4, 4, 4, 'Omeprazole', '20 mg', 'OD', '14 days', '2025-06-11', 'Before breakfast', 'Completed'),
(5, 5, 5, 'Cefixime', '200 mg', 'BD', '10 days', '2025-06-10', 'Complete full course', 'Active'),
(6, 6, 6, 'Metformin', '500 mg', 'BD', '90 days', '2025-06-09', 'With meals', 'Active'),
(7, 7, 7, 'Diazepam', '5 mg', 'OD', '14 days', '2025-06-08', 'At night', 'Active'),
(8, 8, 8, 'Amoxicillin', '500 mg', 'TID', '7 days', '2025-06-07', 'After food', 'Active'),
(9, 9, 9, 'Salbutamol', '100 mcg', 'PRN', '30 days', '2025-06-06', 'Use inhaler as needed', 'Active'),
(10, 10, 10, 'Methotrexate', '15 mg', 'Weekly', '4 weeks', '2025-06-05', 'Monitor liver function', 'Scheduled');


drop table  Prescriptions;
truncate table Prescriptions;
select*from Prescriptions;


-- table 8 Bills
create table Bills(
BillID int primary key , 
PatientID int , 
AdmissionID int , 
Amount int, 
Date date, 
PaymentStatus varchar(100),
PaymentMethod varchar (100),
Discount int , 
InsuranceProvider varchar (100), 
DueDate  date, 
foreign key(patientId) references Patients(patientId),
foreign key(AdmissionID) references Admissions(AdmissionID)
);

insert into Bills
values 
(1, 1, 1,  5000.00, '2025-06-14', 'Pending',   'Cash',      0.00,  NULL,   '2025-07-14'),
(2, 3, 2, 15000.50, '2025-06-15', 'Paid',      'Card',     500.50,  NULL,   '2025-07-15'),
(3, 5, NULL,7500.75, '2025-06-16', 'Overdue',  'Insurance','0.00', 'ABC Health','2025-07-16'),
(4, 2, 3,  8200.00, '2025-06-17', 'Pending',   'Cash',      200.00,'XYZ Care','2025-07-17'),
(5, 4, 4,  12000.00,'2025-06-18', 'Paid',      'Card',      0.00,  NULL,   '2025-07-18'),
(6, 6, 6,  4500.25, '2025-06-19', 'Pending',   'Cash',      100.25,'ABC Health','2025-07-19'),
(7, 7, 5,  3200.00, '2025-06-20', 'Paid',      'Insurance',0.00,  'XYZ Care','2025-07-20'),
(8, 8, 8,  9800.40, '2025-06-21', 'Pending',   'Card',     300.40, NULL,   '2025-07-21'),
(9, 9, 9,  6700.00, '2025-06-22', 'Overdue',   'Insurance','0.00', 'ABC Health','2025-07-22'),
(10,10,10,20000.00, '2025-06-23', 'Pending',   'Card',     1000.00,NULL,   '2025-07-23');

drop table  Bills;
truncate table Bills;
select*from Bills;

-- table 9 Staff
create table Staff(
StaffID int primary key, 
Name varchar (100),
Role varchar (100),
Department varchar (100), 
Phone varchar(100), 
Email varchar(100), 
Gender varchar(100), 
JoiningDate date, 
Shift varchar(100), 
Status varchar (100)
);

insert into Staff
values 
(1, 'Rahul Jain',     'Nurse',        'Pediatrics',   '9123456780', 'rahul.jain@hospital.com',   'Male',   '2022-01-15', 'Morning',   'Active'),
(2, 'Neha Kapoor',    'Receptionist', 'Front Desk',   '9123456781', 'neha.kapoor@hospital.com',  'Female', '2020-11-01', 'Evening',   'Active'),
(3, 'Suresh Iyer',    'Technician',   'Lab',          '9123456782', 'suresh.iyer@hospital.com',  'Male',   '2023-05-10', 'Night',     'On Leave'),
(4, 'Priya Singh',    'Cleaner',      'Housekeeping', '9123456783', 'priya.singh@hospital.com',  'Female', '2021-07-20', 'Morning',   'Active'),
(5, 'Amit Deshmukh',  'Security',     'Security',     '9123456784', 'amit.deshmukh@hospital.com','Male',   '2019-09-05', 'Night',     'Inactive'),
(6, 'Anita Ghosh',    'Accountant',   'Finance',      '9123456785', 'anita.ghosh@hospital.com',  'Female', '2022-03-12', 'Morning',   'Active'),
(7, 'Vikram Patel',   'Pharmacist',   'Pharmacy',     '9123456786', 'vikram.patel@hospital.com', 'Male',   '2023-01-08', 'Evening',   'Active'),
(8, 'Sunita Rao',     'Dietitian',    'Nutrition',    '9123456787', 'sunita.rao@hospital.com',   'Female', '2021-12-22', 'Morning',   'Active'),
(9, 'Manish Kulkarni','Physiotherapist','Physiotherapy','9123456788','manish.kulkarni@hospital.com','Male','2020-06-30','Afternoon','Active'),
(10,'Latha Menon',    'IT Support',   'IT',           '9123456789', 'latha.menon@hospital.com',  'Female', '2022-08-14', 'Night',     'Active');

drop table  Staff;
truncate table Staff;
select*from Staff;


-- table 10 
create table MedicalRecords( 
RecordID int primary key, 
PatientID int not null, 
DoctorID int not null, 
RecordDate date not null, 
Symptoms varchar(255),
Diagnosis varchar(255), 
LabResults text, 
PrescribedMedications varchar(255) ,
Notes varchar(500),
Status varchar(100), 
foreign key(patientId) references Patients(patientId),
foreign key(DoctorId) references Doctors (DoctorId)
);

insert into MedicalRecords
values
(1, 1, 2, '2025-06-14', 'Headache, nausea',       'Migraine',      'Normal',            'Paracetamol 500mg',   'Advise rest',     'Active'),
(2, 2, 3, '2025-06-13', 'Fever, sore throat',       'Viral infection','Elevated WBC',     'Ibuprofen 200mg',    'Plenty fluids',   'Closed'),
(3, 3, 1, '2025-06-12', 'Chest pain',              'Angina',        'ECG abnormal',     'Aspirin 75mg',       'Refer cardiology','Active'),
(4, 4, 4, '2025-06-11', 'Knee swelling',           'Sprain',        'X-ray normal',     'Ibuprofen 400mg',    'Apply ice',       'Closed'),
(5, 5, 5, '2025-06-10', 'Skin rash',               'Dermatitis',    'Patch test pending','Hydrocortisone cream','Avoid allergen','Active'),
(6, 6, 6, '2025-06-09', 'Post-op visit',           'Healing normally','No issues',      'Amoxicillin 500mg', 'Continue course', 'Closed'),
(7, 7, 7, '2025-06-08', 'Anxiety, insomnia',       'Anxiety disorder','Normal labs',    'Diazepam 5mg',       'Counseling advised','Active'),
(8, 8, 8, '2025-06-07', 'Ear pain',                'Otitis media',  'Inflamed eardrum', 'Amoxicillin 250mg',  'Warm compress',   'Closed'),
(9, 9, 9, '2025-06-06', 'Breathlessness',          'Asthma',        'Spirometry shows obstruction','Salbutamol inhaler','Use PRN','Active'),
(10,10,10,'2025-06-05', 'Routine cancer follow-up','Under observation','CT scan scheduled','None','Next visit in 3 months','Review');


drop table  MedicalRecords;
truncate table MedicalRecords;
select*from MedicalRecords;