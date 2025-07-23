USE airline123; -- Set the context to the airline database

-- Functions 

/*

Functions in MySQL are predefined operations that can be used to perform calculations, manipulate data, 
and retrieve specific information. These functions make it easier to work with strings, numbers, dates, and more. 
Functions--- 1. Built-in functions (sum(),avg(),count()...)    
             2. User defined functions.

They are categorized as follows based on their functionality: 

1. String Functions
These functions are used to manipulate and process string data.

LENGTH(str): Returns the length of a string.

CONCAT(str1, str2, ...): Concatenates two or more strings.

UPPER(str): Converts a string to uppercase.

LOWER(str): Converts a string to lowercase.

SUBSTRING(str, start, length): Returns a substring from a string.


2. Numeric Functions
These functions perform operations on numeric data.

ROUND(number, decimals): Rounds a number to a specified number of decimal places.

FLOOR(number): Returns the largest integer less than or equal to a number.

CEIL(number): Returns the smallest integer greater than or equal to a number.

ABS(number): Returns the absolute value of a number.


3. Date and Time Functions
These functions are used to manipulate and format date and time values.

NOW(): Returns the current date and time.

CURDATE(): Returns the current date.

DATE_FORMAT(date, format): Formats a date according to a specified format.

DATEDIFF(date1, date2): Returns the difference in days between two dates.


4. Aggregate Functions
These functions perform calculations on a set of values and return a single value.

COUNT(expression): Returns the number of rows that match a specified condition.

SUM(column): Returns the sum of a numeric column.

AVG(column): Returns the average value of a numeric column.

MAX(column): Returns the maximum value of a column.

MIN(column): Returns the minimum value of a column.


5. Control Flow Functions
These functions allow for conditional logic in SQL queries.

IF(condition, true_value, false_value): Returns one value if the condition is true and another value 
if it is false.

CASE: Provides a way to perform conditional logic in a more complex manner.


6. Conversion Functions
These functions convert data from one type to another.

CAST(expression AS type): Converts an expression to a specified data type.

CONVERT(expression, type): Similar to CAST, but with different syntax.


7. JSON Functions
These functions are used to work with JSON data types.

JSON_EXTRACT(json_doc, path): Extracts data from a JSON document.

JSON_ARRAYAGG(value): Aggregates values into a JSON array.


8. User -Defined Functions (UDFs)
MySQL allows users to create their own functions for specific tasks.

*/

select*from Flights;
-- String Functions

-- 1. Convert Flight Numbers to Uppercase
SELECT UPPER(Flight_Number) AS Uppercase_Flight_Number FROM Flights;

-- 2. Convert Departure Airport Names to Lowercase
SELECT LOWER(Departure_Airport) AS Lowercase_Departure_Airport FROM Flights;

-- 3. Concatenate Flight Number and Departure Airport
SELECT CONCAT(Flight_Number, ' - ', Departure_Airport) AS Flight_Info FROM Flights;

-- 4. Get Length of Flight Numbers
SELECT Flight_Number, LENGTH(Flight_Number) AS Flight_Number_Length FROM Flights;

-- 5. Get Length of Departure Airport Names
SELECT Departure_Airport, LENGTH(Departure_Airport) AS Airport_Name_Length FROM Flights;

-- 6. Extract Substring from Flight Number
SELECT Flight_Number, SUBSTRING(Flight_Number, 2, 3) AS Flight_Substring FROM Flights; 
-- Extracts characters from position 3

-- 7. Find Flights with Flight Numbers Starting with 'AI'
SELECT * FROM Flights WHERE Flight_Number LIKE 'AI%';

-- 8. Find Flights with Departure Airports Containing 'Delhi'
SELECT * FROM Flights WHERE Departure_Airport LIKE '%Delhi%';

-- 9. Replace 'Delhi' with 'New Delhi' in Departure Airports
SELECT Flight_Number, REPLACE(Departure_Airport, 'Delhi', 'New Delhi') AS Updated_Departure_Airport FROM Flights;

-- 10. Find Flights with Flight Numbers Ending in '01'
SELECT * FROM Flights WHERE Flight_Number LIKE '%01';
SELECT * FROM Flights;

-- Numeric Functions
select*from flights;
-- 1. Calculate the Average Flight Duration
SELECT AVG(Flight_Duration) AS Average_Flight_Duration FROM Flights;

-- 2. Calculate the Total Number of Seats Available
SELECT SUM(Seats_Available) AS Total_Seats_Available FROM Flights;

-- 3. Find the Longest Flight Duration
SELECT MAX(Flight_Duration) AS Longest_Flight_Duration FROM Flights;

-- 4. Find the Shortest Flight Duration
SELECT MIN(Flight_Duration) AS Shortest_Flight_Duration FROM Flights;

-- 5. Count the Total Number of Flights
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 6. Calculate the Average Number of Available Seats per Flight
SELECT AVG(Seats_Available) AS Average_Seats_Per_Flight FROM Flights;

-- 7. Find the Total Flight Duration for All Flights
SELECT SUM(Flight_Duration) AS Total_Flight_Duration FROM Flights;

-- 8. Count the Number of Flights with More Than 50 Seats Available
SELECT COUNT(*) AS Flights_With_Over_50_Seats FROM Flights WHERE Seats_Available > 50;

-- 9. Calculate the Average Flight Duration for Flights Departing from Delhi
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Delhi FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- 10. Find the Total Number of Flights to Mumbai
SELECT COUNT(*) AS Total_Flights_To_Mumbai FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';

-- Date and Time Functions

-- Extracts the date from the departure time
SELECT DATE(Departure_Time) AS Departure_Date FROM Flights; 

-- Extracts the time from the departure time
SELECT TIME(Departure_Time) AS Departure_Time FROM Flights; 

-- Calculates the flight duration in minutes
SELECT TIMESTAMPDIFF(MINUTE, Departure_Time, Arrival_Time) AS Flight_Duration_Minutes FROM Flights; 
SELECT TIMESTAMPDIFF(HOUR, Departure_Time, Arrival_Time) AS Flight_Duration_hours FROM Flights; 
SELECT TIMESTAMPDIFF(SECOND, Departure_Time, Arrival_Time) AS Flight_Duration_second FROM Flights; 

-- Calculates the flight duration in date
SELECT TIMESTAMPDIFF(MONTH, Departure_Time, Arrival_Time) AS Flight_Duration_month FROM Flights; 
SELECT TIMESTAMPDIFF(DAY, Departure_Time, Arrival_Time) AS Flight_Duration_day FROM Flights; 
SELECT TIMESTAMPDIFF(YEAR, Departure_Time, Arrival_Time) AS Flight_Duration_year FROM Flights; 
select*from  flights ; 
-- Aggregate Functions

-- 1. Count the Total Number of Flight
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 2. Count the Number of Unique Departure Airports
SELECT COUNT(DISTINCT Departure_Airport) AS Unique_Departure_Airports FROM Flights;

-- 3. Concatenate Distinct Flight Numbers
SELECT GROUP_CONCAT(DISTINCT Flight_Number) AS Flight_Numbers FROM Flights;

-- 4. Count the Number of Flights by Status
SELECT Status, COUNT(*) AS Flight_Count 
FROM Flights 
GROUP BY Status;

-- 5. Calculate the Average Number of Seats Available Across All Flights
SELECT AVG(Seats_Available) AS Average_Seats_Available FROM Flights;

-- HOME WORK --
 -- string function --
-- 1 . covert the Arrival airport to UPPERCASE
select upper(Arrival_Airport) as Upper_Arrival_airport from flights ; 
-- 2. convert the  Arrival airport to LOWERCASE
select lower(Arrival_Airport) as Lower_Arrival_airport from flights ; 
-- 3. Concatetent the  flight  id  and  seat Available 
select concat(Flight_id, '-' ,seats_Available ) as flight_info  from flights;
-- 4. get the length of the  aircraft tyep
select length(Aircraft_Type) as lenght_aircraft_type from flights ;
-- 5. get the length of  the status 
select length(Status) as length_status  from flights ; 
-- 6 . Extract the substring for Arrival_Airport 
select substring(Arrival_Airport , 2 , 5) as substring_arrival_airport from flights ;   
-- 7. Find Flights with Arrival_Airport Starting with 'D'
select*from  flights  where Arrival_airport like 'D%';
-- 8. find flights with departure_airport are specific location 'mumbai'
select*from flights  where departure_airport like '%Mumbai%';
-- 9. replace the on time  to not on time  from status 
select flight_number, replace(status ,'on time ' ,'not time') as replace_status  from flights;
-- 10  Find Flights with Aircraft_type ending with  with '737'
select* from flights where aircraft_type like '%737' ;

-- numeric function
-- 1  Calculate the Sum  seats available  for Flights Departing from Delhi 
 select Departure_Airport, sum(seats_available) as sum_seats from flights where Departure_Airport = 'Delhi (DEL)';
-- 2 the  hights seat   in seats avilable 
select max(seats_available) as max_seats from flights ; 
-- 3 the minmum seats are avlable   in seats avilable  column
select min(seats_available) as min_seats from flights ; 
-- 4. Calculate the Average Flight Duration for Flights Departing from mumbai (BOM)
select AVG(flight_duration) as avrage_flight from flights where departure_airport= 'mumbai (BOM)';
-- 5. count the total mubai flights 
select count(*) as count_flight_mumbai from  flights where  departure_airport = 'mumbai (BOM)'; 
select count(*) as count_flight_delhi from flights where departure_airport = 'Delhi (DEL)' ; 
-- 6 COUNT THE TOTAL FLIGHT ID 
SELECT COUNT(*)  AS  TOTAL_FLIGHT_ID FROM FLIGHTS ; 
-- 7 COUNT  THE FLIGHT DURATIONS  BUT NOT DUPLICATE VALUE
SELECT COUNT(distinct FLIGHT_DURATION )  AS DURATIONS  FROM FLIGHTS ;
-- 8 EXTRACT THE MAXIMUM FLIGHT DURATION 
SELECT MAX(FLIGHT_DURATION ) AS MAX_DURATIONS FROM FLIGHTS ;
-- 8  SUM OF THE  FLIGHT DURATION 
SELECT SUM(FLIGHT_DURATION  )  AS SUM_FLIGHT_DURATIONS FROM FLIGHTS; 
SELECT *FROM  FLIGHTS ;   

-- date and time 
-- show the only date in arrival time column 
select date(Arrival_time ) as date_arrival  from flights ; 

-- show the only time in arrival  time column 
select time(Arrival_time ) as date_arrival  from flights ; 
-- 
select time(status ) as date_arrival  from flights ; 

-- use the timestapdiff   and count the arival time 
select timestampdiff(  second,Arrival_time , departure_time) as timestam_arrival_second from  flights ;
select timestampdiff( minute,Arrival_time , departure_time) as timestam_arrival_minute from  flights ;
select timestampdiff(  hour,Arrival_time , departure_time) as timestam_arrival_hours from  flights ;

select timestampdiff(  day ,Arrival_time , departure_time) as timestam_arrival_day from  flights ;
select timestampdiff(  month,Arrival_time , departure_time) as timestam_arrival_month from  flights ;
select timestampdiff(  year,Arrival_time , departure_time) as timestam_arrival_year from  flights ;
