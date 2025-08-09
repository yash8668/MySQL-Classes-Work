-- single line comment --- 
/* 	multi 
	line 
    comment
*/
-- ---------------------------------------- Database queries ---------------------------------------------------------
-- create a database Healthcare_System
CREATE DATABASE Healthcare_System;

-- to work on database, you need to use it first
USE Healthcare_System;

-- --------------------------------------------------- Analysis of Database ------------------------------------------------

/*

1.Patient (patient_id,name,gender,dob,phone)
2.Doctor(doctor_id,name,specialization,phone,email)
3.Appointment (appoinment_id,patient_id,doctor_id,date,status)
4.Prescription (prescription_id,patient_id,medication,dosage,start_date)
5.Medical_Record (record_id,patient_id,diagnosis,visit_date,notes)
6.Billing (bill_id,patient_id,amount,paid,nilling_date)
7.Lab_Test (test_id,patient_id,test_name,test_date,result)
8.Insurance (insurance_id,patient_id,provider,policy_number,expiry_date)
9.Staff (staff_id,name,role,hire_date,phone)
10.Room(room_id,room_number,type,floor,occupied)

*/

-- --------------------------------------------------------- Table Queries ----------------------------------------------

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15)
);

-- Insert 10 patients into the Patient table
INSERT INTO Patient (patient_id,name,gender,dob,phone)VALUES 
 (1, 'John Doe', 'Male', '1990-01-01', '9999990001'),
 (2, 'Jane Smith', 'Female', '1985-02-02', '9999990002'),
 (3, 'Alice Brown', 'Female', '1992-03-03', '9999990003'),
 (4, 'Bob Martin', 'Male', '1988-04-04', '9999990004'),
 (5, 'Carol White', 'Female', '1991-05-05', '9999990005'),
 (6, 'David Grey', 'Male', '1983-06-06', '9999990006'),
 (7, 'Eva Green', 'Female', '1994-07-07', '9999990007'),
 (8, 'Frank Black', 'Male', '1995-08-08', '9999990008'),
 (9, 'Grace Lee', 'Female', '1989-09-09', '9999990009'),
 (10, 'Henry King', 'Male', '1996-10-10', '9999990010');
 
 -- to display table data
 select * from Patient;
 
 -- to remove complete records from table
 truncate table Patient;
 
 -- to remove complete records and attributes from table
 drop table Patient;
 
 -- 1. Select all columns
SELECT * FROM Patient;

-- 2. Get only female patients
SELECT * FROM Patient WHERE gender = 'Female';

-- 3. Get patients born before 1990
SELECT * FROM Patient WHERE dob < '1990-01-01';

-- 4. Get names and phones of all patients
SELECT name, phone FROM Patient;

-- 5. Count total patients
SELECT COUNT(*) FROM Patient;

-- 6. Get patients with phone starting with '9999990001'
SELECT * FROM Patient WHERE phone LIKE '9999990001%';

-- 7. Sort patients by DOB
SELECT * FROM Patient ORDER BY dob ASC;

-- 8. Get distinct genders
SELECT DISTINCT gender FROM Patient;

-- 9. Find patient named 'Alice Brown'
SELECT * FROM Patient WHERE name = 'Alice Brown';

-- 10. Get the youngest patient
SELECT * FROM Patient ORDER BY dob DESC LIMIT 1;

-- 1. Add email column
ALTER TABLE Patient ADD COLUMN email VARCHAR(100);

-- 2. Add address column
ALTER TABLE Patient ADD COLUMN address VARCHAR(255);

-- 3. Add blood group column
ALTER TABLE Patient ADD COLUMN blood_group VARCHAR(5);

-- 4. Add emergency_contact column
ALTER TABLE Patient ADD COLUMN emergency_contact VARCHAR(15);

-- 5. Add is_active column
ALTER TABLE Patient ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- 6. Change name column size
ALTER TABLE Patient MODIFY COLUMN name VARCHAR(150);

-- 7. Change phone column type
ALTER TABLE Patient MODIFY COLUMN phone VARCHAR(20);

-- 8. Drop blood group column
ALTER TABLE Patient DROP COLUMN blood_group;

-- 9. Rename address column to location
ALTER TABLE Patient CHANGE address location VARCHAR(255);

-- 10. Set default gender to 'Male'
ALTER TABLE Patient ALTER COLUMN gender SET DEFAULT 'Male';

-- 1. Update phone for patient_id 1
UPDATE Patient SET phone = '8888880001' WHERE patient_id = 1;

-- 2. Change name of patient_id 2
UPDATE Patient SET name = 'Jane Doe' WHERE patient_id = 2;

-- 3. Change gender of patient_id 3
UPDATE Patient SET gender = 'Other' WHERE patient_id = 3;

set SQL_SAFE_UPDATES=0; 

-- 4. Set all phones starting with '999' to NULL
UPDATE Patient SET phone = NULL WHERE phone LIKE '999%';

-- 5. Set all is_active to FALSE for old patients
UPDATE Patient SET is_active = FALSE WHERE dob < '1990-01-01';

-- 6. Change email of patient_id 4
UPDATE Patient SET email = 'bob.martin@example.com' WHERE patient_id = 4;

-- 7. Update location for patient_id 5
UPDATE Patient SET location = 'New York' WHERE patient_id = 5;

-- 8. Append " (Updated)" to all names
UPDATE Patient SET name = CONCAT(name, ' (Updated)');

-- 9. Set emergency_contact for patient_id 6
UPDATE Patient SET emergency_contact = '9876543210' WHERE patient_id = 6;

 -- 10. Increase column size to fit longer values
ALTER TABLE Patient MODIFY gender VARCHAR(30);

-- 1. Rename table Patient to Patients
ALTER TABLE Patient RENAME TO Patients;

-- Rename back for consistency
ALTER TABLE Patients RENAME TO Patient;

-- 2. Rename column name to full_name
ALTER TABLE Patient CHANGE name full_name VARCHAR(150);

-- 3. Rename column phone to contact_number
ALTER TABLE Patient CHANGE phone contact_number VARCHAR(20);

-- 4. Rename column dob to birth_date
ALTER TABLE Patient CHANGE dob birth_date DATE;

-- 5. Rename email to email_address
ALTER TABLE Patient CHANGE name patient_name VARCHAR(100);

-- 6. Rename gender to sex
ALTER TABLE Patient CHANGE gender sex VARCHAR(10);

-- 7. Rename patient_id to id
ALTER TABLE Patient CHANGE patient_id id INT;

-- 8. Rename column location to address (restore)
ALTER TABLE Patient CHANGE location address VARCHAR(255);

-- 9. Rename contact_number back to phone
ALTER TABLE Patient CHANGE contact_number phone VARCHAR(20);

-- 10. Rename full_name back to name
ALTER TABLE Patient CHANGE full_name name VARCHAR(150);

-- 1. Delete patient with id 1
DELETE FROM Patient WHERE patient_id = 1;

-- 2. Delete all patients with NULL phone
DELETE FROM Patient WHERE phone IS NULL;

-- 3. Delete patient named 'Jane Doe'
DELETE FROM Patient WHERE name = 'Jane Doe';

-- 4. Delete all male patients
DELETE FROM Patient WHERE gender = 'Male';

-- 5. Delete patients born before 1985
DELETE FROM Patient WHERE dob < '1985-01-01';

-- 6. Delete by phone pattern
DELETE FROM Patient WHERE phone LIKE '9999990002';

-- 7. Delete by address
DELETE FROM Patient WHERE address = 'New York';

-- 8. Delete where email is missing
DELETE FROM Patient WHERE email IS NULL;

-- 9. Delete patient_id 10
DELETE FROM Patient WHERE patient_id = 10;

-- 10. Delete all rows (but keep table)
DELETE FROM Patient;



CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- Insert 10 sample doctors
INSERT INTO Doctor(doctor_id,name,specialization,phone,email) VALUES 
 (1, 'Dr. John Smith', 'Cardiology', '9876543210', 'john.smith@hospital.com'),
 (2, 'Dr. Emily Davis', 'Neurology', '9876543211', 'emily.davis@hospital.com'),
 (3, 'Dr. Michael Lee', 'Orthopedics', '9876543212', 'michael.lee@hospital.com'),
 (4, 'Dr. Sarah Johnson', 'Pediatrics', '9876543213', 'sarah.johnson@hospital.com'),
 (5, 'Dr. David Clark', 'Dermatology', '9876543214', 'david.clark@hospital.com'),
 (6, 'Dr. Laura White', 'Oncology', '9876543215', 'laura.white@hospital.com'),
 (7, 'Dr. James Brown', 'Psychiatry', '9876543216', 'james.brown@hospital.com'),
 (8, 'Dr. Olivia Green', 'Gastroenterology', '9876543217', 'olivia.green@hospital.com'),
 (9, 'Dr. William Scott', 'Endocrinology', '9876543218', 'william.scott@hospital.com'),
 (10, 'Dr. Sophia Miller', 'Urology', '9876543219', 'sophia.miller@hospital.com');

-- to display table data
select * from Doctor;

-- to remove complete records from table
truncate table Doctor;

-- to remove complete records and attributes from table
drop table Dcoctor;

-- 1. Select all doctors
SELECT * FROM Doctor;

-- 2. Select only names of doctors
SELECT name FROM Doctor;

-- 3. Select doctors with specialization 'Cardiology'
SELECT * FROM Doctor WHERE specialization = 'Cardiology';

-- 4. Select doctors whose name starts with 'Dr. S'
SELECT * FROM Doctor WHERE name LIKE 'Dr. S%';

-- 5. Count total number of doctors
SELECT COUNT(*) AS total_doctors FROM Doctor;

-- 6. Get unique specializations
SELECT DISTINCT specialization FROM Doctor;

-- 7. Select doctors with phone number ending in '10'
SELECT * FROM Doctor WHERE phone LIKE '%10';

-- 8. Order doctors by name ascending
SELECT * FROM Doctor ORDER BY name ASC;

-- 9. Find doctor by email
SELECT * FROM Doctor WHERE email = 'sophia.miller@hospital.com';

-- 10. Find doctors with email from hospital.com
SELECT * FROM Doctor WHERE email LIKE '%@hospital.com';

-- 1. Add gender column
ALTER TABLE Doctor ADD COLUMN gender VARCHAR(10);

-- 2. Add department column
ALTER TABLE Doctor ADD COLUMN department VARCHAR(100);

-- 3. Add experience column
ALTER TABLE Doctor ADD COLUMN experience_years INT;

-- 4. Add joining_date column
ALTER TABLE Doctor ADD COLUMN joining_date DATE;

-- 5. Add is_active column
ALTER TABLE Doctor ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- 6. Modify phone number size
ALTER TABLE Doctor MODIFY COLUMN phone VARCHAR(20);

-- 7. Modify name column size
ALTER TABLE Doctor MODIFY COLUMN name VARCHAR(150);

-- 8. Drop experience_years column
ALTER TABLE Doctor DROP COLUMN experience_years;

-- 9. Rename gender to sex
ALTER TABLE Doctor CHANGE gender sex VARCHAR(10);

-- 10. Set default specialization
ALTER TABLE Doctor ALTER COLUMN specialization SET DEFAULT 'General';

-- 1. Update phone number for doctor_id 1
UPDATE Doctor SET phone = '9000000001' WHERE doctor_id = 1;

-- 2. Update email for doctor_id 2
UPDATE Doctor SET email = 'emily.d@hospital.com' WHERE doctor_id = 2;

-- 3. Change specialization for doctor_id 3
UPDATE Doctor SET specialization = 'Spine Surgery' WHERE doctor_id = 3;

-- 4. Set department to 'Emergency' for doctor_id 4
UPDATE Doctor SET department = 'Emergency' WHERE doctor_id = 4;

-- 5. Set all doctors as inactive
UPDATE Doctor SET is_active = FALSE;

-- 6. Update name for doctor_id 5
UPDATE Doctor SET name = 'Dr. David C. Clark' WHERE doctor_id = 5;

-- 7. Update phone format
UPDATE Doctor SET phone = CONCAT('+91-', phone);

-- 8. Update joining date for doctor_id 6
UPDATE Doctor SET joining_date = '2020-05-15' WHERE doctor_id = 6;

-- 9. Set sex for doctor_id 7
UPDATE Doctor SET sex = 'Male' WHERE doctor_id = 7;

-- 10. Change all 'Urology' doctors to 'General'
UPDATE Doctor SET specialization = 'General' WHERE specialization = 'Urology';

-- 1. Rename table Doctor to Doctors
ALTER TABLE Doctor RENAME TO Doctors;

-- Rename it back for consistency
ALTER TABLE Doctors RENAME TO Doctor;

-- 2. Rename name to full_name
ALTER TABLE Doctor CHANGE name full_name VARCHAR(150);

-- 3. Rename phone to contact_number
ALTER TABLE Doctor CHANGE phone contact_number VARCHAR(20);

-- 4. Rename email to email_address
ALTER TABLE Doctor CHANGE email email_address VARCHAR(100);

-- 5. Rename doctor_id to id
ALTER TABLE Doctor CHANGE doctor_id id INT;

-- 6. Rename specialization to expertise
ALTER TABLE Doctor CHANGE specialization expertise VARCHAR(50);

-- 7. Rename sex back to gender
ALTER TABLE Doctor CHANGE sex gender VARCHAR(10);

-- 8. Rename department to unit
ALTER TABLE Doctor CHANGE department unit VARCHAR(100);

-- 9. Rename contact_number back to phone
ALTER TABLE Doctor CHANGE contact_number phone VARCHAR(20);

-- 10. Rename full_name back to name
ALTER TABLE Doctor CHANGE full_name name VARCHAR(150);

-- 1. Delete doctor with id 1
DELETE FROM Doctor WHERE doctor_id = 1;

-- 2. Delete doctor by name
DELETE FROM Doctor WHERE name = 'Dr. Emily Davis';

-- 3. Delete all doctors in 'General' specialization
DELETE FROM Doctor WHERE specialization = 'General';

-- 4. Delete doctors with email from a specific domain
DELETE FROM Doctor WHERE email LIKE '%sophia.miller%';

-- 5. Delete doctors with phone ending in 15
DELETE FROM Doctor WHERE phone LIKE '%15';

-- 6. Delete doctors who are inactive
DELETE FROM Doctor WHERE is_active = FALSE;

-- 7. Delete doctors from department 'Emergency'
DELETE FROM Doctor WHERE department = 'Emergency';

-- 8. Delete all Neurologists
DELETE FROM Doctor WHERE specialization = 'Neurology';

-- 9. Delete doctor by email
DELETE FROM Doctor WHERE email = 'david.clark@hospital.com';

-- 10. Delete all records (keep table)
DELETE FROM Doctor;

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    status VARCHAR(20)
);

-- Insert 10 sample appointments
INSERT INTO Appointment (appoinment_id,patient_id,doctor_id,date,status) VALUES
 (1, 1, 1, '2025-07-01', 'Scheduled'),
 (2, 2, 2, '2025-07-02', 'Completed'),
 (3, 3, 3, '2025-07-03', 'Cancelled'),
 (4, 4, 4, '2025-07-04', 'Scheduled'),
 (5, 5, 5, '2025-07-05', 'Completed'),
 (6, 6, 6, '2025-07-06', 'Scheduled'),
 (7, 7, 7, '2025-07-07', 'Pending'),
 (8, 8, 8, '2025-07-08', 'Scheduled'),
 (9, 9, 9, '2025-07-09', 'Completed'),
 (10, 10, 10, '2025-07-10', 'Scheduled');
 
 -- to display table data
 select * from Appoinment;
 
 -- to remove complete records from table
 truncate table Appoinment;
 
 -- to remove complete records and attributes from table
 drop table Appoinment;
 
 -- 1. Select all appointments
SELECT * FROM Appointment;

-- 2. Select only completed appointments
SELECT * FROM Appointment WHERE status = 'Completed';

-- 3. Select upcoming appointments (after today)
SELECT * FROM Appointment WHERE date > CURDATE();

-- 4. Select appointments for a specific doctor
SELECT * FROM Appointment WHERE doctor_id = 3;

-- 5. Select appointments by patient ID
SELECT * FROM Appointment WHERE patient_id = 5;

-- 6. Get the count of each status type
SELECT status, COUNT(*) FROM Appointment GROUP BY status;

-- 7. Select the earliest appointment
SELECT * FROM Appointment ORDER BY date ASC LIMIT 1;

-- 8. Select the latest appointment
SELECT * FROM Appointment ORDER BY date DESC LIMIT 1;

-- 9. Get all distinct appointment statuses
SELECT DISTINCT status FROM Appointment;

-- 10. List appointments scheduled this week
SELECT * FROM Appointment WHERE WEEK(date) = WEEK(CURDATE());

-- 1. Add appointment_time column
ALTER TABLE Appointment ADD COLUMN appointment_time TIME;

-- 2. Add remarks column
ALTER TABLE Appointment ADD COLUMN remarks TEXT;

-- 3. Add duration column
ALTER TABLE Appointment ADD COLUMN duration_minutes INT;

-- 4. Add created_at column with default timestamp
ALTER TABLE Appointment ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 5. Add updated_at column
ALTER TABLE Appointment ADD COLUMN updated_at TIMESTAMP;

-- 6. Change status column to allow more characters
ALTER TABLE Appointment MODIFY COLUMN status VARCHAR(30);

-- 7. Rename column 'date' to 'appointment_date'
ALTER TABLE Appointment CHANGE date appointment_date DATE;

-- 8. Drop the remarks column
ALTER TABLE Appointment DROP COLUMN remarks;

-- 9. Set default value for status as 'Pending'
ALTER TABLE Appointment ALTER COLUMN status SET DEFAULT 'Pending';

-- 10. Add foreign key constraints (example, assuming referenced tables exist)
-- ALTER TABLE Appointment ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES Patient(patient_id);
-- ALTER TABLE Appointment ADD CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id);

-- 1. Update appointment status to 'Completed' for ID 1
UPDATE Appointment SET status = 'Completed' WHERE appointment_id = 1;

-- 2. Change doctor for appointment_id 2
UPDATE Appointment SET doctor_id = 5 WHERE appointment_id = 2;

-- 3. Reschedule appointment_id 3
UPDATE Appointment SET appointment_date = '2025-07-15' WHERE appointment_id = 3;

-- 4. Update time for appointment_id 4
UPDATE Appointment SET appointment_time = '10:30:00' WHERE appointment_id = 4;

-- 5. Update status for all past appointments to 'Expired'
UPDATE Appointment SET status = 'Expired' WHERE appointment_date < CURDATE();

-- 6. Set duration for appointment_id 5
UPDATE Appointment SET duration_minutes = 45 WHERE appointment_id = 5;

-- 7. Change status of all 'Pending' appointments to 'Scheduled'
UPDATE Appointment SET status = 'Scheduled' WHERE status = 'Pending';

-- 8. Update multiple fields for appointment_id 6
UPDATE Appointment SET appointment_time = '14:00:00', duration_minutes = 30 WHERE appointment_id = 6;

-- 9. Add remarks to appointment_id 7
UPDATE Appointment SET remarks = 'First-time consultation' WHERE appointment_id = 7;

-- 10. Update updated_at timestamp for all records
UPDATE Appointment SET updated_at = NOW();

-- 1. Rename Appointment table to Appointments
ALTER TABLE Appointment RENAME TO Appointments;

-- 2. Rename back for consistency
ALTER TABLE Appointments RENAME TO Appointment;

-- 3. Rename appointment_id to id
ALTER TABLE Appointment CHANGE appointment_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Appointment CHANGE patient_id pat_id INT;

-- 5. Rename doctor_id to doc_id
ALTER TABLE Appointment CHANGE doctor_id doc_id INT;

-- 6. Rename status to appointment_status
ALTER TABLE Appointment CHANGE status appointment_status VARCHAR(30);

-- 7. Rename appointment_date back to date
ALTER TABLE Appointment CHANGE appointment_date date DATE;

-- 8. Rename appointment_time to appt_time
ALTER TABLE Appointment CHANGE appointment_time appt_time TIME;

-- 9. Rename duration_minutes to appt_duration
ALTER TABLE Appointment CHANGE duration_minutes appt_duration INT;

-- 10. Rename created_at to booked_on
ALTER TABLE Appointment CHANGE created_at booked_on TIMESTAMP;

-- 1. Delete appointment with ID 1
DELETE FROM Appointment WHERE appointment_id = 1;

-- 2. Delete all completed appointments
DELETE FROM Appointment WHERE status = 'Completed';

-- 3. Delete all cancelled appointments
DELETE FROM Appointment WHERE status = 'Cancelled';

-- 4. Delete appointments for patient_id = 5
DELETE FROM Appointment WHERE patient_id = 5;

-- 5. Delete appointments before July 5, 2025
DELETE FROM Appointment WHERE date < '2025-07-05';

-- 6. Delete appointments with NULL time
DELETE FROM Appointment WHERE appointment_time IS NULL;

-- 7. Delete appointments where doctor_id = 3
DELETE FROM Appointment WHERE doctor_id = 3;

-- 8. Delete all expired appointments
DELETE FROM Appointment WHERE status = 'Expired';

-- 9. Delete all appointments for doctor_id = 10
DELETE FROM Appointment WHERE doctor_id = 10;

-- 10. Delete all appointments (but keep table structure)
DELETE FROM Appointment;


CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    medication VARCHAR(100),
    dosage VARCHAR(50),
    start_date DATE
);

-- Insert 10 sample prescriptions
INSERT INTO Prescription (prescription_id,patient_id,medication,dosage,start_date) VALUES 
 (1, 1, 'Paracetamol', '500mg', '2025-07-01'),
 (2, 2, 'Amoxicillin', '250mg', '2025-07-02'),
 (3, 3, 'Ibuprofen', '400mg', '2025-07-03'),
 (4, 4, 'Cetirizine', '10mg', '2025-07-04'),
 (5, 5, 'Azithromycin', '500mg', '2025-07-05'),
 (6, 6, 'Vitamin D', '1000 IU', '2025-07-06'),
 (7, 7, 'Lisinopril', '10mg', '2025-07-07'),
 (8, 8, 'Metformin', '500mg', '2025-07-08'),
 (9, 9, 'Atorvastatin', '20mg', '2025-07-09'),
 (10, 10, 'Omeprazole', '20mg', '2025-07-10');

-- to display table data
select * from Prescription;

-- to remove complete records from table
truncate table Prescription;

-- to remove complete records and attributes from table
drop table Prescription;

-- 1. Select all prescriptions
SELECT * FROM Prescription;

-- 2. Select prescriptions for patient_id = 3
SELECT * FROM Prescription WHERE patient_id = 3;

-- 3. Select all unique medications
SELECT DISTINCT medication FROM Prescription;

-- 4. Select prescriptions with dosage '500mg'
SELECT * FROM Prescription WHERE dosage = '500mg';

-- 5. Select prescriptions started after July 5, 2025
SELECT * FROM Prescription WHERE start_date > '2025-07-05';

-- 6. Count prescriptions per patient
SELECT patient_id, COUNT(*) FROM Prescription GROUP BY patient_id;

-- 7. Find the latest prescription
SELECT * FROM Prescription ORDER BY start_date DESC LIMIT 1;

-- 8. List all medications in alphabetical order
SELECT medication FROM Prescription ORDER BY medication ASC;

-- 9. Count distinct dosages
SELECT COUNT(DISTINCT dosage) FROM Prescription;

-- 10. Select prescriptions containing 'statin' in the medication name
SELECT * FROM Prescription WHERE medication LIKE '%statin%';


-- 1. Add column frequency
ALTER TABLE Prescription ADD COLUMN frequency VARCHAR(50);

-- 2. Add column duration_days
ALTER TABLE Prescription ADD COLUMN duration_days INT;

-- 3. Add column prescribed_by
ALTER TABLE Prescription ADD COLUMN prescribed_by VARCHAR(100);

-- 4. Add column notes
ALTER TABLE Prescription ADD COLUMN notes TEXT;

-- 5. Add column refillable
ALTER TABLE Prescription ADD COLUMN refillable BOOLEAN DEFAULT FALSE;

-- 6. Modify medication column size
ALTER TABLE Prescription MODIFY COLUMN medication VARCHAR(150);

-- 7. Modify dosage column to support more characters
ALTER TABLE Prescription MODIFY COLUMN dosage VARCHAR(100);

-- 8. Drop the notes column
ALTER TABLE Prescription DROP COLUMN notes;

-- 9. Set default dosage to '1 tablet'
ALTER TABLE Prescription ALTER COLUMN dosage SET DEFAULT '1 tablet';

-- 10. Add issued_at timestamp
ALTER TABLE Prescription ADD COLUMN issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- 1. Update dosage for prescription_id 1
UPDATE Prescription SET dosage = '650mg' WHERE prescription_id = 1;

-- 2. Change medication name for prescription_id 2
UPDATE Prescription SET medication = 'Penicillin' WHERE prescription_id = 2;

-- 3. Update start_date for prescription_id 3
UPDATE Prescription SET start_date = '2025-07-11' WHERE prescription_id = 3;

-- 4. Update all dosages from '500mg' to '1 tablet'
UPDATE Prescription SET dosage = '1 tablet' WHERE dosage = '500mg';

-- 5. Set prescribed_by for prescription_id 4
UPDATE Prescription SET prescribed_by = 'Dr. John Smith' WHERE prescription_id = 4;

-- 6. Mark refillable for prescription_id 5
UPDATE Prescription SET refillable = TRUE WHERE prescription_id = 5;

-- 7. Set duration_days = 7 for all prescriptions
UPDATE Prescription SET duration_days = 7;

-- 8. Update frequency for prescription_id 6
UPDATE Prescription SET frequency = 'Once Daily' WHERE prescription_id = 6;

-- 9. Update medication and dosage for prescription_id 7
UPDATE Prescription SET medication = 'Enalapril', dosage = '5mg' WHERE prescription_id = 7;

-- 10. Update issued_at for all records to current timestamp
UPDATE Prescription SET issued_at = NOW();

-- 1. Rename table Prescription to Prescriptions
ALTER TABLE Prescription RENAME TO Prescriptions;

-- 2. Rename back to Prescription
ALTER TABLE Prescriptions RENAME TO Prescription;

-- 3. Rename prescription_id to id
ALTER TABLE Prescription CHANGE prescription_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Prescription CHANGE patient_id pat_id INT;

-- 5. Rename medication to medicine
ALTER TABLE Prescription CHANGE medication medicine VARCHAR(150);

-- 6. Rename dosage to dosage_info
ALTER TABLE Prescription CHANGE dosage dosage_info VARCHAR(100);

-- 7. Rename frequency to dose_frequency
ALTER TABLE Prescription CHANGE frequency dose_frequency VARCHAR(50);

-- 8. Rename prescribed_by to doctor_name
ALTER TABLE Prescription CHANGE prescribed_by doctor_name VARCHAR(100);

-- 9. Rename start_date to prescription_date
ALTER TABLE Prescription CHANGE start_date prescription_date DATE;

-- 10. Rename duration_days to treatment_days
ALTER TABLE Prescription CHANGE duration_days treatment_days INT;

-- 1. Delete prescription with ID 1
DELETE FROM Prescription WHERE prescription_id = 1;

-- 2. Delete all prescriptions with dosage '250mg'
DELETE FROM Prescription WHERE dosage = '250mg';

-- 3. Delete prescriptions for patient_id = 4
DELETE FROM Prescription WHERE patient_id = 4;

-- 4. Delete prescriptions starting before July 5
DELETE FROM Prescription WHERE start_date < '2025-07-05';

-- 5. Delete prescriptions not refillable
DELETE FROM Prescription WHERE refillable = FALSE;

-- 6. Delete all prescriptions for medication 'Paracetamol'
DELETE FROM Prescription WHERE medication = 'Paracetamol';

-- 7. Delete prescriptions without a doctor name
DELETE FROM Prescription WHERE prescribed_by IS NULL;

-- 8. Delete prescriptions with duration_days > 30
DELETE FROM Prescription WHERE duration_days > 30;

-- 9. Delete prescriptions with frequency 'Once Daily'
DELETE FROM Prescription WHERE frequency = 'Once Daily';

-- 10. Delete all records (but keep the table)
DELETE FROM Prescription;

CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis VARCHAR(100),
    visit_date DATE,
    notes TEXT
);

-- Insert sample medical records into Medical_Record table
INSERT INTO Medical_Record (record_id,patient_id,diagnosis,visit_date,notes) VALUES
 (1, 1, 'Fever', '2025-07-01', 'High temperature and fatigue'),
 (2, 2, 'Diabetes', '2025-07-02', 'Regular follow-up'),
 (3, 3, 'Asthma', '2025-07-03', 'Difficulty breathing during night'),
 (4, 4, 'Hypertension', '2025-07-04', 'Blood pressure above normal'),
 (5, 5, 'Migraine', '2025-07-05', 'Headache with light sensitivity'),
 (6, 6, 'Fracture', '2025-07-06', 'Healing leg fracture'),
 (7, 7, 'Allergy', '2025-07-07', 'Skin rash due to pollen'),
 (8, 8, 'COVID-19', '2025-07-08', 'Mild symptoms observed'),
 (9, 9, 'Thyroid', '2025-07-09', 'TSH levels slightly elevated'),
 (10, 10, 'Anxiety', '2025-07-10', 'Reported stress and panic attacks');

-- to display table data
select * from  Medical_Record;

-- to remove complete records from table
truncate table  Medical_Record;

-- to remove complete records and attributes from table
drop table  Medical_Record;

-- 1. Select all medical records
SELECT * FROM Medical_Record;

-- 2. Select records for patient_id 5
SELECT * FROM Medical_Record WHERE patient_id = 5;

-- 3. Get distinct diagnoses
SELECT DISTINCT diagnosis FROM Medical_Record;

-- 4. Find all records after July 5, 2025
SELECT * FROM Medical_Record WHERE visit_date > '2025-07-05';

-- 5. Count number of records per diagnosis
SELECT diagnosis, COUNT(*) FROM Medical_Record GROUP BY diagnosis;

-- 6. Get the earliest visit record
SELECT * FROM Medical_Record ORDER BY visit_date ASC LIMIT 1;

-- 7. Get the latest visit record
SELECT * FROM Medical_Record ORDER BY visit_date DESC LIMIT 1;

-- 8. Select records with notes containing 'stress'
SELECT * FROM Medical_Record WHERE notes LIKE '%stress%';

-- 9. Count total records
SELECT COUNT(*) FROM Medical_Record;

-- 10. List diagnoses in alphabetical order
SELECT diagnosis FROM Medical_Record ORDER BY diagnosis;

-- 1. Add column doctor_id
ALTER TABLE Medical_Record ADD COLUMN doctor_id INT;

-- 2. Add column prescription_id
ALTER TABLE Medical_Record ADD COLUMN prescription_id INT;

-- 3. Add column severity_level
ALTER TABLE Medical_Record ADD COLUMN severity_level VARCHAR(20);

-- 4. Add column follow_up_needed
ALTER TABLE Medical_Record ADD COLUMN follow_up_needed BOOLEAN DEFAULT FALSE;

-- 5. Add column visit_time
ALTER TABLE Medical_Record ADD COLUMN visit_time TIME;

-- 6. Modify diagnosis column size
ALTER TABLE Medical_Record MODIFY COLUMN diagnosis VARCHAR(150);

-- 7. Change notes column to MEDIUMTEXT
ALTER TABLE Medical_Record MODIFY COLUMN notes MEDIUMTEXT;

-- 8. Drop column visit_time
ALTER TABLE Medical_Record DROP COLUMN visit_time;

-- 9. Set default severity_level to 'Moderate'
ALTER TABLE Medical_Record ALTER COLUMN severity_level SET DEFAULT 'Moderate';

-- 10. Add column updated_at with default current timestamp
ALTER TABLE Medical_Record ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 1. Update diagnosis for record_id 1
UPDATE Medical_Record SET diagnosis = 'Viral Fever' WHERE record_id = 1;

-- 2. Set follow_up_needed to true for record_id 3
UPDATE Medical_Record SET follow_up_needed = TRUE WHERE record_id = 3;

-- 3. Update severity_level to 'High' for COVID-19 case
UPDATE Medical_Record SET severity_level = 'High' WHERE diagnosis = 'COVID-19';

-- 4. Change visit_date for record_id 5
UPDATE Medical_Record SET visit_date = '2025-07-15' WHERE record_id = 5;

-- 5. Update doctor_id for record_id 6
UPDATE Medical_Record SET doctor_id = 4 WHERE record_id = 6;

-- 6. Update notes for record_id 2
UPDATE Medical_Record SET notes = 'Diabetes well managed with medication' WHERE record_id = 2;

-- 7. Update all TSH-related notes to add lab test info
UPDATE Medical_Record SET notes = CONCAT(notes, ' | Lab test advised') WHERE diagnosis = 'Thyroid';

-- 8. Update prescription_id for record_id 8
UPDATE Medical_Record SET prescription_id = 101 WHERE record_id = 8;

-- 9. Set updated_at to current time for all records
UPDATE Medical_Record SET updated_at = NOW();

-- 10. Mark all fracture cases as needing follow-up
UPDATE Medical_Record SET follow_up_needed = TRUE WHERE diagnosis = 'Fracture';


-- 1. Rename table to Medical_Records
ALTER TABLE Medical_Record RENAME TO Medical_Records;

-- 2. Rename it back to Medical_Record
ALTER TABLE Medical_Records RENAME TO Medical_Record;

-- 3. Rename record_id to id
ALTER TABLE Medical_Record CHANGE record_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Medical_Record CHANGE patient_id pat_id INT;

-- 5. Rename diagnosis to diagnosis_info
ALTER TABLE Medical_Record CHANGE diagnosis diagnosis_info VARCHAR(150);

-- 6. Rename visit_date to appointment_date
ALTER TABLE Medical_Record CHANGE visit_date appointment_date DATE;

-- 7. Rename notes to remarks
ALTER TABLE Medical_Record CHANGE notes remarks MEDIUMTEXT;

-- 8. Rename severity_level to condition_severity
ALTER TABLE Medical_Record CHANGE severity_level condition_severity VARCHAR(20);

-- 9. Rename doctor_id to attending_doctor
ALTER TABLE Medical_Record CHANGE doctor_id attending_doctor INT;

-- 10. Rename prescription_id to prescribed_id
ALTER TABLE Medical_Record CHANGE prescription_id prescribed_id INT;


-- 1. Delete record with record_id = 1
DELETE FROM Medical_Record WHERE record_id = 1;

-- 2. Delete all allergy-related records
DELETE FROM Medical_Record WHERE diagnosis = 'Allergy';

-- 3. Delete records before July 5, 2025
DELETE FROM Medical_Record WHERE visit_date < '2025-07-05';

-- 4. Delete records with no remarks
DELETE FROM Medical_Record WHERE notes IS NULL OR notes = '';

-- 5. Delete records with severity_level = 'Low'
DELETE FROM Medical_Record WHERE severity_level = 'Low';

-- 6. Delete records for patient_id = 9
DELETE FROM Medical_Record WHERE patient_id = 9;

-- 7. Delete all records with COVID-19 diagnosis
DELETE FROM Medical_Record WHERE diagnosis = 'COVID-19';

-- 8. Delete all records that do not need follow-up
DELETE FROM Medical_Record WHERE follow_up_needed = FALSE;

-- 9. Delete records with NULL doctor_id
DELETE FROM Medical_Record WHERE doctor_id IS NULL;

-- 10. Delete all records (but keep the table)
DELETE FROM Medical_Record;


CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    paid BOOLEAN,
    billing_date DATE
);

-- Insert 10 sample billing records
INSERT INTO Billing (bill_id,patient_id,amount,paid,nilling_date) VALUES
 (1, 1, 500.00, TRUE, '2025-07-01'),
 (2, 2, 1200.50, FALSE, '2025-07-02'),
 (3, 3, 800.00, TRUE, '2025-07-03'),
 (4, 4, 1500.75, FALSE, '2025-07-04'),
 (5, 5, 250.00, TRUE, '2025-07-05'),
 (6, 6, 600.00, TRUE, '2025-07-06'),
 (7, 7, 950.25, FALSE, '2025-07-07'),
 (8, 8, 300.00, TRUE, '2025-07-08'),
 (9, 9, 450.00, TRUE, '2025-07-09'),
 (10, 10, 700.00, FALSE, '2025-07-10');
 
 -- to display table data
 select * from Billing;
 
 -- to remove complete records from table
 truncate table Billing;
 
 -- to remove complete records and attributes from table
 drop table Billing;
 

-- 1. Select all billing records
SELECT * FROM Billing;

-- 2. Select unpaid bills
SELECT * FROM Billing WHERE paid = FALSE;

-- 3. Select paid bills
SELECT * FROM Billing WHERE paid = TRUE;

-- 4. Select bills greater than 1000
SELECT * FROM Billing WHERE amount > 1000;

-- 5. Select bills for patient_id 5
SELECT * FROM Billing WHERE patient_id = 5;

-- 6. Count total number of bills
SELECT COUNT(*) FROM Billing;

-- 7. Get the highest billed amount
SELECT MAX(amount) FROM Billing;

-- 8. Get bills ordered by billing_date descending
SELECT * FROM Billing ORDER BY billing_date DESC;

-- 9. Group bills by payment status
SELECT paid, COUNT(*) FROM Billing GROUP BY paid;

-- 10. Calculate total amount billed
SELECT SUM(amount) FROM Billing;

-- 1. Add column payment_mode
ALTER TABLE Billing ADD COLUMN payment_mode VARCHAR(50);

-- 2. Add column transaction_id
ALTER TABLE Billing ADD COLUMN transaction_id VARCHAR(100);

-- 3. Add column remarks
ALTER TABLE Billing ADD COLUMN remarks TEXT;

-- 4. Add column tax_amount
ALTER TABLE Billing ADD COLUMN tax_amount DECIMAL(10,2);

-- 5. Add column created_at
ALTER TABLE Billing ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 6. Modify amount column to support larger values
ALTER TABLE Billing MODIFY COLUMN amount DECIMAL(12,2);

-- 7. Change payment_mode column length
ALTER TABLE Billing MODIFY COLUMN payment_mode VARCHAR(100);

-- 8. Drop remarks column
ALTER TABLE Billing DROP COLUMN remarks;

-- 9. Set default value of paid column to FALSE
ALTER TABLE Billing ALTER COLUMN paid SET DEFAULT FALSE;

-- 10. Add column billing_type
ALTER TABLE Billing ADD COLUMN billing_type VARCHAR(20);

-- 1. Update amount for bill_id 1
UPDATE Billing SET amount = 550.00 WHERE bill_id = 1;

-- 2. Mark bill_id 2 as paid
UPDATE Billing SET paid = TRUE WHERE bill_id = 2;

-- 3. Update payment_mode for bill_id 3
UPDATE Billing SET payment_mode = 'Credit Card' WHERE bill_id = 3;

-- 4. Set transaction_id for bill_id 4
UPDATE Billing SET transaction_id = 'TXN004ABC' WHERE bill_id = 4;

-- 5. Update tax_amount for all bills over 1000
UPDATE Billing SET tax_amount = amount * 0.18 WHERE amount > 1000;

-- 6. Set billing_type as 'Outpatient' for all
UPDATE Billing SET billing_type = 'Outpatient';

-- 7. Change billing_type to 'Inpatient' for bill_id 7
UPDATE Billing SET billing_type = 'Inpatient' WHERE bill_id = 7;

-- 8. Update created_at to NOW for bill_id 5
UPDATE Billing SET created_at = NOW() WHERE bill_id = 5;

-- 9. Add transaction_id for all paid bills
UPDATE Billing SET transaction_id = CONCAT('TXN', bill_id) WHERE paid = TRUE;

-- 10. Round amount to nearest integer
UPDATE Billing SET amount = ROUND(amount, 0);

-- 1. Rename table to Billings
ALTER TABLE Billing RENAME TO Billings;

-- 2. Rename back to Billing
ALTER TABLE Billings RENAME TO Billing;

-- 3. Rename bill_id to id
ALTER TABLE Billing CHANGE bill_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Billing CHANGE patient_id pat_id INT;

-- 5. Rename amount to total_amount
ALTER TABLE Billing CHANGE amount total_amount DECIMAL(12,2);

-- 6. Rename paid to is_paid
ALTER TABLE Billing CHANGE paid is_paid BOOLEAN;

-- 7. Rename billing_date to date_of_billing
ALTER TABLE Billing CHANGE billing_date date_of_billing DATE;

-- 8. Rename created_at to created_on
ALTER TABLE Billing CHANGE created_at created_on TIMESTAMP;

-- 9. Rename payment_mode to pay_mode
ALTER TABLE Billing CHANGE payment_mode pay_mode VARCHAR(100);

-- 10. Rename billing_type to bill_category
ALTER TABLE Billing CHANGE billing_type bill_category VARCHAR(20);


-- 1. Delete bill with id 1
DELETE FROM Billing WHERE bill_id = 1;

-- 2. Delete all paid bills
DELETE FROM Billing WHERE paid = TRUE;

-- 3. Delete bills under amount 300
DELETE FROM Billing WHERE amount < 300;

-- 4. Delete bills for patient_id 6
DELETE FROM Billing WHERE patient_id = 6;

-- 5. Delete bills before July 5, 2025
DELETE FROM Billing WHERE billing_date < '2025-07-05';

-- 6. Delete bills with NULL transaction_id
DELETE FROM Billing WHERE transaction_id IS NULL;

-- 7. Delete bills where billing_type = 'Inpatient'
DELETE FROM Billing WHERE billing_type = 'Inpatient';

-- 8. Delete all unpaid bills
DELETE FROM Billing WHERE paid = FALSE;

-- 9. Delete bills with tax_amount over 300
DELETE FROM Billing WHERE tax_amount > 300;

-- 10. Delete all records but keep the structure
DELETE FROM Billing;

CREATE TABLE Lab_Test (
    test_id INT PRIMARY KEY,
    patient_id INT,
    test_name VARCHAR(100),
    test_date DATE,
    result VARCHAR(100)
);

-- Insert 10 sample lab test records
INSERT INTO Lab_Test (test_id,patient_id,test_name,test_date,result) VALUES 
(1, 1, 'Blood Sugar', '2025-07-01', 'Normal'),
(2, 2, 'X-Ray', '2025-07-02', 'Fracture Detected'),
(3, 3, 'CBC', '2025-07-03', 'Mild Anemia'),
(4, 4, 'Lipid Profile', '2025-07-04', 'High Cholesterol'),
(5, 5, 'COVID-19 PCR', '2025-07-05', 'Negative'),
(6, 6, 'Urine Test', '2025-07-06', 'Normal'),
(7, 7, 'Thyroid Panel', '2025-07-07', 'TSH Elevated'),
(8, 8, 'Liver Function Test', '2025-07-08', 'Normal'),
(9, 9, 'MRI Brain', '2025-07-09', 'Normal'),
(10, 10, 'Allergy Test', '2025-07-10', 'Pollen Allergy');

-- to display table data
select * from Lab_Test;

-- to remove complete records from table
truncate table Lab_Test;

-- to remove complete records and attributes from table
drop table Lab_Test;

-- 1. Select all lab test records
SELECT * FROM Lab_Test;

-- 2. Select lab tests for patient_id = 4
SELECT * FROM Lab_Test WHERE patient_id = 4;

-- 3. Select tests with result = 'Normal'
SELECT * FROM Lab_Test WHERE result = 'Normal';

-- 4. Count total tests conducted
SELECT COUNT(*) FROM Lab_Test;

-- 5. List all unique test names
SELECT DISTINCT test_name FROM Lab_Test;

-- 6. Select tests done after July 5
SELECT * FROM Lab_Test WHERE test_date > '2025-07-05';

-- 7. Find earliest test conducted
SELECT * FROM Lab_Test ORDER BY test_date ASC LIMIT 1;

-- 8. Find latest test conducted
SELECT * FROM Lab_Test ORDER BY test_date DESC LIMIT 1;

-- 9. Count tests by patient
SELECT patient_id, COUNT(*) FROM Lab_Test GROUP BY patient_id;

-- 10. Select tests with result containing 'High'
SELECT * FROM Lab_Test WHERE result LIKE '%High%';

-- 1. Add column lab_name
ALTER TABLE Lab_Test ADD COLUMN lab_name VARCHAR(100);

-- 2. Add column technician
ALTER TABLE Lab_Test ADD COLUMN technician VARCHAR(100);

-- 3. Add column cost
ALTER TABLE Lab_Test ADD COLUMN cost DECIMAL(10,2);

-- 4. Add column status
ALTER TABLE Lab_Test ADD COLUMN status VARCHAR(20);

-- 5. Add column reviewed_by
ALTER TABLE Lab_Test ADD COLUMN reviewed_by VARCHAR(100);

-- 6. Modify result column length
ALTER TABLE Lab_Test MODIFY COLUMN result VARCHAR(150);

-- 7. Modify test_name column size
ALTER TABLE Lab_Test MODIFY COLUMN test_name VARCHAR(150);

-- 8. Drop the reviewed_by column
ALTER TABLE Lab_Test DROP COLUMN reviewed_by;

-- 9. Set default status as 'Pending'
ALTER TABLE Lab_Test ALTER COLUMN status SET DEFAULT 'Pending';

-- 10. Add column report_time
ALTER TABLE Lab_Test ADD COLUMN report_time TIME;

-- 1. Update result for test_id = 1
UPDATE Lab_Test SET result = 'High Sugar' WHERE test_id = 1;

-- 2. Change lab_name for test_id = 2
UPDATE Lab_Test SET lab_name = 'City Lab' WHERE test_id = 2;

-- 3. Set cost for all MRI and X-Ray tests
UPDATE Lab_Test SET cost = 1200.00 WHERE test_name IN ('MRI Brain', 'X-Ray');

-- 4. Update technician for test_id = 3
UPDATE Lab_Test SET technician = 'Ravi Kumar' WHERE test_id = 3;

-- 5. Set status as 'Completed' for test_id = 5
UPDATE Lab_Test SET status = 'Completed' WHERE test_id = 5;

-- 6. Update all COVID-19 tests to status 'Reported'
UPDATE Lab_Test SET status = 'Reported' WHERE test_name = 'COVID-19 PCR';

-- 7. Set report_time for test_id = 4
UPDATE Lab_Test SET report_time = '10:30:00' WHERE test_id = 4;

-- 8. Mark all tests for patient_id = 7 as completed
UPDATE Lab_Test SET status = 'Completed' WHERE patient_id = 7;

-- 9. Update result for test_id = 6 to show 'Urine Normal'
UPDATE Lab_Test SET result = 'Urine Normal' WHERE test_id = 6;

-- 10. Update all results containing 'Normal' to 'Within Range'
UPDATE Lab_Test SET result = 'Within Range' WHERE result = 'Normal';


-- 1. Rename table to LabTests
ALTER TABLE Lab_Test RENAME TO LabTests;

-- 2. Rename it back to Lab_Test
ALTER TABLE LabTests RENAME TO Lab_Test;

-- 3. Rename test_id to id
ALTER TABLE Lab_Test CHANGE test_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Lab_Test CHANGE patient_id pat_id INT;

-- 5. Rename test_name to name_of_test
ALTER TABLE Lab_Test CHANGE test_name name_of_test VARCHAR(150);

-- 6. Rename result to test_result
ALTER TABLE Lab_Test CHANGE result test_result VARCHAR(150);

-- 7. Rename test_date to date_of_test
ALTER TABLE Lab_Test CHANGE test_date date_of_test DATE;

-- 8. Rename status to test_status
ALTER TABLE Lab_Test CHANGE status test_status VARCHAR(20);

-- 9. Rename technician to lab_technician
ALTER TABLE Lab_Test CHANGE technician lab_technician VARCHAR(100);

-- 10. Rename report_time to time_of_report
ALTER TABLE Lab_Test CHANGE report_time time_of_report TIME;

-- 1. Delete test with id 1
DELETE FROM Lab_Test WHERE test_id = 1;

-- 2. Delete all COVID-19 test records
DELETE FROM Lab_Test WHERE test_name = 'COVID-19 PCR';

-- 3. Delete records with result = 'Normal'
DELETE FROM Lab_Test WHERE result = 'Normal';

-- 4. Delete all tests before July 5
DELETE FROM Lab_Test WHERE test_date < '2025-07-05';

-- 5. Delete tests for patient_id = 9
DELETE FROM Lab_Test WHERE patient_id = 9;

-- 6. Delete tests where technician is NULL
DELETE FROM Lab_Test WHERE technician IS NULL;

-- 7. Delete tests with cost > 1000
DELETE FROM Lab_Test WHERE cost > 1000;

-- 8. Delete tests with result containing 'Elevated'
DELETE FROM Lab_Test WHERE result LIKE '%Elevated%';

-- 9. Delete all incomplete tests
DELETE FROM Lab_Test WHERE status != 'Completed';

-- 10. Delete all records from table
DELETE FROM Lab_Test;


CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY,
    patient_id INT,
    provider VARCHAR(100),
    policy_number VARCHAR(50),
    expiry_date DATE
);

-- Insert 10 sample insurance records
INSERT INTO Insurance (insurance_id,patient_id,provider,policy_number,expiry_date)VALUES 
(1, 1, 'Star Health', 'ST123456', '2026-01-01'),
(2, 2, 'ICICI Lombard', 'IC789012', '2025-12-15'),
(3, 3, 'HDFC Ergo', 'HD345678', '2026-03-20'),
(4, 4, 'Bajaj Allianz', 'BA901234', '2025-08-31'),
(5, 5, 'New India Assurance', 'NI567890', '2026-06-10'),
(6, 6, 'Religare', 'RE112233', '2025-11-25'),
(7, 7, 'SBI General', 'SB445566', '2026-04-18'),
(8, 8, 'Tata AIG', 'TA778899', '2025-09-05'),
(9, 9, 'Oriental Insurance', 'OR990011', '2026-02-28'),
(10, 10, 'United India', 'UI223344', '2025-10-30');

-- to display table data
select * from Insurance;

-- to remove complete records from table
truncate table Insurance;

-- to remove complete records and attributes from table
drop table Insurance;

-- 1. Select all insurance records
SELECT * FROM Insurance;

-- 2. Select insurance for patient_id = 5
SELECT * FROM Insurance WHERE patient_id = 5;

-- 3. Select all unique insurance providers
SELECT DISTINCT provider FROM Insurance;

-- 4. Select insurance policies expiring before 2026
SELECT * FROM Insurance WHERE expiry_date < '2026-01-01';

-- 5. Count number of policies per provider
SELECT provider, COUNT(*) FROM Insurance GROUP BY provider;

-- 6. Find the earliest expiring policy
SELECT * FROM Insurance ORDER BY expiry_date ASC LIMIT 1;

-- 7. Find the latest expiring policy
SELECT * FROM Insurance ORDER BY expiry_date DESC LIMIT 1;

-- 8. Select insurance records where policy_number starts with 'ST'
SELECT * FROM Insurance WHERE policy_number LIKE 'ST%';

-- 9. Count total insurance records
SELECT COUNT(*) FROM Insurance;

-- 10. Get insurance providers ordered alphabetically
SELECT provider FROM Insurance ORDER BY provider;

-- 1. Add column coverage_amount
ALTER TABLE Insurance ADD COLUMN coverage_amount DECIMAL(10,2);

-- 2. Add column policy_type
ALTER TABLE Insurance ADD COLUMN policy_type VARCHAR(50);

-- 3. Add column issued_date
ALTER TABLE Insurance ADD COLUMN issued_date DATE;

-- 4. Add column is_active
ALTER TABLE Insurance ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- 5. Add column remarks
ALTER TABLE Insurance ADD COLUMN remarks TEXT;

-- 6. Modify provider column length
ALTER TABLE Insurance MODIFY COLUMN provider VARCHAR(150);

-- 7. Modify policy_number column length
ALTER TABLE Insurance MODIFY COLUMN policy_number VARCHAR(100);

-- 8. Drop remarks column
ALTER TABLE Insurance DROP COLUMN remarks;

-- 9. Set default policy_type as 'Health'
ALTER TABLE Insurance ALTER COLUMN policy_type SET DEFAULT 'Health';

-- 10. Add created_at column with default timestamp
ALTER TABLE Insurance ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 1. Update provider for insurance_id = 1
UPDATE Insurance SET provider = 'Star Health Insurance' WHERE insurance_id = 1;

-- 2. Set is_active = FALSE for expired policy
UPDATE Insurance SET is_active = FALSE WHERE expiry_date < CURRENT_DATE;

-- 3. Update coverage_amount for insurance_id = 2
UPDATE Insurance SET coverage_amount = 500000 WHERE insurance_id = 2;

-- 4. Set issued_date for insurance_id = 3
UPDATE Insurance SET issued_date = '2023-03-20' WHERE insurance_id = 3;

-- 5. Change policy_type to 'Comprehensive' for insurance_id = 4
UPDATE Insurance SET policy_type = 'Comprehensive' WHERE insurance_id = 4;

-- 6. Set coverage_amount = 250000 for all policies from 'Religare'
UPDATE Insurance SET coverage_amount = 250000 WHERE provider = 'Religare';

-- 7. Update created_at to NOW for insurance_id = 5
UPDATE Insurance SET created_at = NOW() WHERE insurance_id = 5;

-- 8. Set is_active = TRUE for insurance_id = 6
UPDATE Insurance SET is_active = TRUE WHERE insurance_id = 6;

-- 9. Set policy_type to 'Individual' where NULL
UPDATE Insurance SET policy_type = 'Individual' WHERE policy_type IS NULL;

-- 10. Update expiry_date for insurance_id = 7
UPDATE Insurance SET expiry_date = '2026-05-01' WHERE insurance_id = 7;

-- 1. Rename table to Insurances
ALTER TABLE Insurance RENAME TO Insurances;

-- 2. Rename it back to Insurance
ALTER TABLE Insurances RENAME TO Insurance;

-- 3. Rename insurance_id to id
ALTER TABLE Insurance CHANGE insurance_id id INT;

-- 4. Rename patient_id to pat_id
ALTER TABLE Insurance CHANGE patient_id pat_id INT;

-- 5. Rename provider to insurance_provider
ALTER TABLE Insurance CHANGE provider insurance_provider VARCHAR(150);

-- 6. Rename policy_number to policy_no
ALTER TABLE Insurance CHANGE policy_number policy_no VARCHAR(100);

-- 7. Rename expiry_date to valid_till
ALTER TABLE Insurance CHANGE expiry_date valid_till DATE;

-- 8. Rename is_active to active_status
ALTER TABLE Insurance CHANGE is_active active_status BOOLEAN;

-- 9. Rename coverage_amount to insured_amount
ALTER TABLE Insurance CHANGE coverage_amount insured_amount DECIMAL(10,2);

-- 10. Rename created_at to created_on
ALTER TABLE Insurance CHANGE created_at created_on TIMESTAMP;

-- 1. Delete record with insurance_id = 1
DELETE FROM Insurance WHERE insurance_id = 1;

-- 2. Delete all policies that expired
DELETE FROM Insurance WHERE expiry_date < CURRENT_DATE;

-- 3. Delete policies by provider 'Tata AIG'
DELETE FROM Insurance WHERE provider = 'Tata AIG';

-- 4. Delete policies where coverage_amount is NULL
DELETE FROM Insurance WHERE coverage_amount IS NULL;

-- 5. Delete all inactive policies
DELETE FROM Insurance WHERE is_active = FALSE;

-- 6. Delete policies issued before 2023
DELETE FROM Insurance WHERE issued_date < '2023-01-01';

-- 7. Delete policies with policy_type = 'Individual'
DELETE FROM Insurance WHERE policy_type = 'Individual';

-- 8. Delete policies for patient_id = 10
DELETE FROM Insurance WHERE patient_id = 10;

-- 9. Delete policies where policy number starts with 'SB'
DELETE FROM Insurance WHERE policy_number LIKE 'SB%';

-- 10. Delete all records from the table
DELETE FROM Insurance;


CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE,
    phone VARCHAR(15)
);

-- Insert 10 sample staff records
INSERT INTO Staff (staff_id,name,role,hire_date,phone) VALUES 
(1, 'Dr. Neha Sharma', 'Doctor', '2020-01-15', '9876543210'),
(2, 'Ravi Patil', 'Nurse', '2021-03-10', '9123456789'),
(3, 'Sunita Desai', 'Receptionist', '2019-06-01', '9012345678'),
(4, 'Dr. Rajeev Mehta', 'Doctor', '2018-07-20', '9988776655'),
(5, 'Meena Joshi', 'Pharmacist', '2022-09-12', '8899001122'),
(6, 'Amit Thakur', 'Technician', '2020-11-03', '7766554433'),
(7, 'Sana Khan', 'Nurse', '2021-12-01', '9900887766'),
(8, 'Karan Malhotra', 'Admin', '2017-05-14', '8007009001'),
(9, 'Dr. Pooja Rao', 'Doctor', '2022-01-25', '9123987654'),
(10, 'Deepak Yadav', 'Security', '2019-02-18', '9765432109');

-- to display table data
select * from Staff;

-- to remove complete records from table
truncate table Staff;

-- to remove complete records and attributes from table
drop table Staff;



-- 1. Select all staff records
SELECT * FROM Staff;

-- 2. Select all staff with role 'Doctor'
SELECT * FROM Staff WHERE role = 'Doctor';

-- 3. Select staff hired after 2020
SELECT * FROM Staff WHERE hire_date > '2020-01-01';

-- 4. Count staff by role
SELECT role, COUNT(*) FROM Staff GROUP BY role;

-- 5. Find the earliest hired staff
SELECT * FROM Staff ORDER BY hire_date ASC LIMIT 1;

-- 6. List staff names ordered alphabetically
SELECT name FROM Staff ORDER BY name ASC;

-- 7. Select staff with phone number starting with '91'
SELECT * FROM Staff WHERE phone LIKE '91%';

-- 8. Count total number of staff
SELECT COUNT(*) FROM Staff;

-- 9. Select staff roles without repetition
SELECT DISTINCT role FROM Staff;

-- 10. Select staff hired in the year 2021
SELECT * FROM Staff WHERE YEAR(hire_date) = 2021;

-- 1. Add column email
ALTER TABLE Staff ADD COLUMN email VARCHAR(100);

-- 2. Add column department
ALTER TABLE Staff ADD COLUMN department VARCHAR(50);

-- 3. Add column shift
ALTER TABLE Staff ADD COLUMN shift VARCHAR(20);

-- 4. Add column salary
ALTER TABLE Staff ADD COLUMN salary DECIMAL(10,2);

-- 5. Add column active_status
ALTER TABLE Staff ADD COLUMN active_status BOOLEAN DEFAULT TRUE;

-- 6. Modify name column length
ALTER TABLE Staff MODIFY COLUMN name VARCHAR(150);

-- 7. Modify phone column to support longer numbers
ALTER TABLE Staff MODIFY COLUMN phone VARCHAR(20);

-- 8. Drop column shift
ALTER TABLE Staff DROP COLUMN shift;

-- 9. Set default department to 'General'
ALTER TABLE Staff ALTER COLUMN department SET DEFAULT 'General';

-- 10. Add column created_at timestamp
ALTER TABLE Staff ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- 1. Update phone number for staff_id = 1
UPDATE Staff SET phone = '9876512345' WHERE staff_id = 1;

-- 2. Set department for all doctors
UPDATE Staff SET department = 'Medical' WHERE role = 'Doctor';

-- 3. Update salary for staff_id = 2
UPDATE Staff SET salary = 30000.00 WHERE staff_id = 2;

-- 4. Change active_status to FALSE for staff hired before 2020
UPDATE Staff SET active_status = FALSE WHERE hire_date < '2020-01-01';

-- 5. Update department for nurses
UPDATE Staff SET department = 'Nursing' WHERE role = 'Nurse';

-- 6. Set email for staff_id = 3
UPDATE Staff SET email = 'sunita.desai@hospital.com' WHERE staff_id = 3;

-- 7. Increase salary by 10% for all doctors
UPDATE Staff SET salary = salary * 1.1 WHERE role = 'Doctor';

-- 8. Set created_at to NOW for staff_id = 4
UPDATE Staff SET created_at = NOW() WHERE staff_id = 4;

-- 9. Change role of staff_id = 10 to 'Maintenance'
UPDATE Staff SET role = 'Maintenance' WHERE staff_id = 10;

-- 10. Update department for Admin to 'HR'
UPDATE Staff SET department = 'HR' WHERE role = 'Admin';

-- 1. Rename table to Staff_Members
ALTER TABLE Staff RENAME TO Staff_Members;

-- 2. Rename back to Staff
ALTER TABLE Staff_Members RENAME TO Staff;

-- 3. Rename staff_id to id
ALTER TABLE Staff CHANGE staff_id id INT;

-- 4. Rename name to full_name
ALTER TABLE Staff CHANGE name full_name VARCHAR(150);

-- 5. Rename role to job_role
ALTER TABLE Staff CHANGE role job_role VARCHAR(50);

-- 6. Rename hire_date to joining_date
ALTER TABLE Staff CHANGE hire_date joining_date DATE;

-- 7. Rename phone to contact_number
ALTER TABLE Staff CHANGE phone contact_number VARCHAR(20);

-- 8. Rename email to email_address
ALTER TABLE Staff CHANGE email email_address VARCHAR(100);

-- 9. Rename department to dept
ALTER TABLE Staff CHANGE department dept VARCHAR(50);

-- 10. Rename active_status to is_active
ALTER TABLE Staff CHANGE active_status is_active BOOLEAN;

-- 1. Delete staff record with id = 1
DELETE FROM Staff WHERE staff_id = 1;

-- 2. Delete all staff with role 'Security'
DELETE FROM Staff WHERE role = 'Security';

-- 3. Delete staff hired before 2019
DELETE FROM Staff WHERE hire_date < '2019-01-01';

-- 4. Delete inactive staff
DELETE FROM Staff WHERE active_status = FALSE;

-- 5. Delete staff from department 'HR'
DELETE FROM Staff WHERE department = 'HR';

-- 6. Delete staff with salary below 20000
DELETE FROM Staff WHERE salary < 20000;

-- 7. Delete staff whose email is NULL
DELETE FROM Staff WHERE email IS NULL;

-- 8. Delete staff with name starting with 'Dr.'
DELETE FROM Staff WHERE name LIKE 'Dr.%';

-- 9. Delete all nurses
DELETE FROM Staff WHERE role = 'Nurse';

-- 10. Delete all records from table
DELETE FROM Staff;


CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    type VARCHAR(50),
    floor INT,
    occupied BOOLEAN
);

-- Insert 10 sample room records
INSERT INTO Room(room_id,room_number,type,floor,occupied) VALUES
 (1, '101', 'General', 1, TRUE),
 (2, '102', 'Private', 1, FALSE),
 (3, '201', 'ICU', 2, TRUE),
 (4, '202', 'General', 2, FALSE),
 (5, '301', 'Private', 3, TRUE),
 (6, '302', 'General', 3, FALSE),
 (7, '401', 'ICU', 4, TRUE),
 (8, '402', 'Private', 4, FALSE),
 (9, '501', 'General', 5, TRUE),
 (10, '502', 'ICU', 5, FALSE);

-- to display table data
select * from Room;

-- to remove complete records from table
truncate table Room;

-- to remove complete records and attributes from table
drop table Room;

-- 1. Select all room records
SELECT * FROM Room;

-- 2. Select rooms that are currently occupied
SELECT * FROM Room WHERE occupied = TRUE;

-- 3. Select all ICU rooms
SELECT * FROM Room WHERE type = 'ICU';

-- 4. Select rooms on floor 3
SELECT * FROM Room WHERE floor = 3;

-- 5. Count total number of rooms
SELECT COUNT(*) FROM Room;

-- 6. List room numbers for all private rooms
SELECT room_number FROM Room WHERE type = 'Private';

-- 7. Count occupied vs vacant rooms
SELECT occupied, COUNT(*) FROM Room GROUP BY occupied;

-- 8. Select rooms with room number starting with '2'
SELECT * FROM Room WHERE room_number LIKE '2%';

-- 9. List all unique room types
SELECT DISTINCT type FROM Room;

-- 10. Get all rooms ordered by floor descending
SELECT * FROM Room ORDER BY floor DESC;

-- 1. Add column bed_count
ALTER TABLE Room ADD COLUMN bed_count INT;

-- 2. Add column has_ac
ALTER TABLE Room ADD COLUMN has_ac BOOLEAN;

-- 3. Add column last_cleaned
ALTER TABLE Room ADD COLUMN last_cleaned DATE;

-- 4. Add column ward_name
ALTER TABLE Room ADD COLUMN ward_name VARCHAR(50);

-- 5. Add column notes
ALTER TABLE Room ADD COLUMN notes TEXT;

-- 6. Modify room_number column size
ALTER TABLE Room MODIFY COLUMN room_number VARCHAR(20);

-- 7. Modify type column length
ALTER TABLE Room MODIFY COLUMN type VARCHAR(100);

-- 8. Drop notes column
ALTER TABLE Room DROP COLUMN notes;

-- 9. Set default for occupied as FALSE
ALTER TABLE Room ALTER COLUMN occupied SET DEFAULT FALSE;

-- 10. Add column created_at with timestamp
ALTER TABLE Room ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 1. Update room type for room_id = 1
UPDATE Room SET type = 'Deluxe' WHERE room_id = 1;

-- 2. Set occupied = FALSE for room_id = 3
UPDATE Room SET occupied = FALSE WHERE room_id = 3;

-- 3. Set bed_count = 2 for all Private rooms
UPDATE Room SET bed_count = 2 WHERE type = 'Private';

-- 4. Mark all rooms on floor 2 as unoccupied
UPDATE Room SET occupied = FALSE WHERE floor = 2;

-- 5. Set has_ac = TRUE for ICU rooms
UPDATE Room SET has_ac = TRUE WHERE type = 'ICU';

-- 6. Update last_cleaned for room_id = 4
UPDATE Room SET last_cleaned = '2025-07-01' WHERE room_id = 4;

-- 7. Change ward_name to 'General Ward' for General rooms
UPDATE Room SET ward_name = 'General Ward' WHERE type = 'General';

-- 8. Set created_at to NOW for room_id = 5
UPDATE Room SET created_at = NOW() WHERE room_id = 5;

-- 9. Update floor = 6 for room_id = 10
UPDATE Room SET floor = 6 WHERE room_id = 10;

-- 10. Update type and bed_count for room_id = 6
UPDATE Room SET type = 'Semi-Private', bed_count = 1 WHERE room_id = 6;

-- 1. Rename table to Hospital_Rooms
ALTER TABLE Room RENAME TO Hospital_Rooms;

-- 2. Rename back to Room
ALTER TABLE Hospital_Rooms RENAME TO Room;

-- 3. Rename room_id to id
ALTER TABLE Room CHANGE room_id id INT;

-- 4. Rename room_number to room_no
ALTER TABLE Room CHANGE room_number room_no VARCHAR(20);

-- 5. Rename type to room_type
ALTER TABLE Room CHANGE type room_type VARCHAR(100);

-- 6. Rename floor to floor_number
ALTER TABLE Room CHANGE floor floor_number INT;

-- 7. Rename occupied to is_occupied
ALTER TABLE Room CHANGE occupied is_occupied BOOLEAN;

-- 8. Rename bed_count to beds
ALTER TABLE Room CHANGE bed_count beds INT;

-- 9. Rename ward_name to section
ALTER TABLE Room CHANGE ward_name section VARCHAR(50);

-- 10. Rename last_cleaned to cleaned_on
ALTER TABLE Room CHANGE last_cleaned cleaned_on DATE;

-- 1. Delete room with id = 1
DELETE FROM Room WHERE room_id = 1;

-- 2. Delete all ICU rooms
DELETE FROM Room WHERE type = 'ICU';

-- 3. Delete all unoccupied rooms
DELETE FROM Room WHERE occupied = FALSE;

-- 4. Delete rooms from floor 5
DELETE FROM Room WHERE floor = 5;

-- 5. Delete rooms where bed_count is NULL
DELETE FROM Room WHERE bed_count IS NULL;

-- 6. Delete rooms last cleaned before July 1, 2025
DELETE FROM Room WHERE last_cleaned < '2025-07-01';

-- 7. Delete rooms in 'General Ward'
DELETE FROM Room WHERE ward_name = 'General Ward';

-- 8. Delete rooms with AC
DELETE FROM Room WHERE has_ac = TRUE;

-- 9. Delete rooms with room_no starting with '3'
DELETE FROM Room WHERE room_number LIKE '3%';

-- 10. Delete all records from the table
DELETE FROM Room;
