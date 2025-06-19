-- single line comment 

/* 
Multi 
Line 
Comment 
*/

-- ------------------------------------------------ DataBase Analysis -----------------------------------------------------------------------------------
/* 
1. Railway Reservation System
 Trains: train_id, name, type, capacity, status
 Passengers: passenger_id, name, age, gender, contact
 Bookings: booking_id, train_id, passenger_id, seat_no, date
 route_id, source, destination, distance, duration
 Stations: station_id, name, location, code, platform_count

2. Management System
 Flights: flight_id, airline, departure, arrival, duration
 Tickets: ticket_id, flight_id, seat_class, price, status
 Passengers: passenger_id, name, passport_no, nationality, age
 Airports: airport_id, name, city, country, terminals
 Crew: crew_id, name, role, flight_id, experience_years

3. Company HR Management
 Employees: emp_id, name, email, dept_id, doj
 Departments: dept_id, name, location, head_id, budget
 Salaries: emp_id, base_salary, bonus, tax, net_pay
 Projects: project_id, name, manager_id, deadline, budget
 Attendance: emp_id, date, status, in_time, out_time

4. E-commerce Platform
 Products: product_id, name, price, stock, category
 Users: user_id, name, email, address, join_date
 Orders: order_id, user_id, date, total_amount, status
 Payments: payment_id, order_id, mode, status, amount
 Reviews: review_id, product_id, user_id, rating, comment

5. Hospital Management System
 Patients: patient_id, name, age, gender, admitted_on
 Doctors: doctor_id, name, specialty, contact, room_no
 Appointments: app_id, patient_id, doctor_id, date, status
 Medications: med_id, name, type, dosage, side_effects
 Rooms: room_id, type, capacity, availability, price

6. University/College Database
 Students: student_id, name, dob, dept, contact
 Courses: course_id, title, dept, credits, semester
 Faculties: faculty_id, name, dept, designation, email
 Enrollment: student_id, course_id, semester, year, status
 Results: student_id, course_id, marks, grade, semester

7. Library Management System
 Books: book_id, title, author_id, genre, copies
 Members: member_id, name, address, contact, join_date
 Issues: issue_id, member_id, book_id, issue_date, due_date
 Returns: return_id, issue_id, return_date, fine, status
 Authors: author_id, name, nationality, dob, books_written

8. Cinema Ticket Booking
 Movies: movie_id, title, genre, duration, rating
 Shows: show_id, movie_id, screen_id, time, date
Screens: screen_id, capacity, type, location, audio_system
 Tickets: ticket_id, show_id, seat_no, price, status
 Customers: cust_id, name, email, mobile, city

9.  Hotel Booking System
 Rooms: room_id, type, price, availability, floor
 Guests: guest_id, name, phone, email, id_proof
 Bookings: booking_id, guest_id, room_id, check_in, check_out
 Services: service_id, name, charge, duration, availability
 Staff: staff_id, name, role, contact, shift

10.Online Learning Platform
 Courses: course_id, title, category, duration, rating
 Instructors: instructor_id, name, expertise, email, course_id
 Students: student_id, name, email, join_date, level
 Enrollments: enroll_id, student_id, course_id, date, status
 Quizzes: quiz_id, course_id, title, total_marks, duration

11. Banking System
 Accounts: acc_id, cust_id, type, balance, open_date
 Customers: cust_id, name, address, phone, dob
 Transactions: txn_id, acc_id, amount, type, date
 Loans: loan_id, acc_id, amount, interest_rate, term
 Branches: branch_id, name, city, manager, ifsc

12. Vehicle Registration System
 Vehicles: vehicle_id, type, brand, model, year
 Owners: owner_id, name, address, contact, dob
 Registrations: reg_id, vehicle_id, owner_id, date, valid_till
 Insurance: policy_id, vehicle_id, provider, amount, expiry
 Inspectors: inspector_id, name, region, contact, duty_days

13. Sports Tournament
 Teams: team_id, name, coach, city, rank
 Players: player_id, name, age, team_id, position
 Matches: match_id, team1_id, team2_id, venue_id, date
 Venues: venue_id, name, city, capacity, pitch_type
 Results: match_id, winner_id, score, mvp, duration

14. Food Delivery System
 Restaurants: res_id, name, location, rating, open_time
 Dishes: dish_id, res_id, name, price, category
 Orders: order_id, cust_id, dish_id, quantity, status
 Customers: cust_id, name, address, phone, email
 Delivery: delivery_id, order_id, delivery_person, time, rating

15. Gym/Fitness Center
 Members: member_id, name, age, gender, contact
 Trainers: trainer_id, name, specialty, experience, contact
 Subscriptions: sub_id, member_id, start_date, duration, amount
 Sessions: session_id, trainer_id, type, date, duration
 Equipment: eq_id, name, quantity, maintenance_date, area

16. Crime Records System
 Cases: case_id, type, date, location, status
 Criminals: criminal_id, name, crime_type, age, status
 Victims: victim_id, name, age, contact, case_id
 Officers: officer_id, name, rank, station, contact
 Courts: court_id, name, location, judge_name, jurisdiction

17.  Online Exam System
 Students: student_id, name, email, course, batch
 Exams: exam_id, subject, date, duration, total_marks
 Questions: ques_id, exam_id, text, marks, level
 Answers: ans_id, student_id, ques_id, response, correct
 Results: result_id, student_id, exam_id, score, grade

18.  Inventory Management
 Items: item_id, name, category, price, reorder_level
 Suppliers: supplier_id, name, contact, city, rating
 Stock: item_id, quantity, location, last_update, status
 Purchases: purchase_id, supplier_id, date, total_amount, status
 Shipments: shipment_id, item_id, quantity, dispatch_date, delivery_date

19. Freelance Platform
 Freelancers: freelancer_id, name, skill, rate, rating
 Clients: client_id, name, industry, location, contact
 Projects: project_id, title, client_id, freelancer_id, deadline
 Payments: payment_id, project_id, amount, mode, status
 Reviews: review_id, freelancer_id, client_id, rating, feedback

20. Transport Management
 Vehicles: vehicle_id, type, capacity, reg_no, model
 Drivers: driver_id, name, license_no, contact, experience
 Routes: route_id, source, destination, distance, stops
 Schedules: schedule_id, vehicle_id, route_id, time, day
 Bookings: booking_id, schedule_id, user_id, seat_no, fare

21. NGO Management
 Volunteers: vol_id, name, age, contact, skill
 Events: event_id, name, location, date, type
 Donors: donor_id, name, amount, contact, recurring
 Donations: donation_id, donor_id, amount, date, campaign_id
 Campaigns: campaign_id, name, goal, status, location

22. Job Portal
 Jobs: job_id, title, company_id, salary, location
 Companies: company_id, name, sector, contact, website
 Applicants: applicant_id, name, email, resume, skills
 Applications: app_id, job_id, applicant_id, date, status
 Interviews: interview_id, app_id, date, mode, result

23. Music Streaming App
 Songs: song_id, title, artist_id, duration, genre
 Artists: artist_id, name, country, debut_year, genre
 Albums: album_id, name, artist_id, release_year, type
 Playlists: playlist_id, user_id, name, created_on, genre
 Users: user_id, name, email, plan, signup_date

24. Pet Clinic
 Pets: pet_id, name, species, breed, age
 Owners: owner_id, name, contact, address, email
 Appointments: app_id, pet_id, vet_id, date, issue
 Vets: vet_id, name, specialty, contact, experience
 Treatments: treat_id, app_id, medicine, duration, cost

25. Travel Agency
 Packages: package_id, name, price, duration, type
 Destinations: dest_id, name, country, climate, rating
 Clients: client_id, name, contact, email, nationality
 Bookings: booking_id, client_id, package_id, date, members
 Payments: payment_id, booking_id, amount, method, status

*/
