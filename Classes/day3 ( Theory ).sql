-- Single line Comment

/* 
Multi 
Line 
Comment
*/

-- database related queries --
 
create database Travelagent21;

use Travelagent21;

drop database travelagent21;



-- ----------------------------------- Topics of the Day-------------------------

-- Data Types, Constraints, Clauses & Cammands

/*
Reference - 

1. Daily Sessions, Google Classroom
2. discuss your doubts/ideas/daily work with Batchmates -------> Ask with your mentor
3. Github, w3 school
4. Chatgpt, blackbox.ai
5. canva, 15 minuts revision in morning & 15 minuts revision at night before sleep.
*/

-- Data types

/*

The data type of a column in a MySQL database tells us what kind of values that column can hold, 
such as:
-- Integer (whole numbers)
-- Character (text)
-- Date and Time (dates and times)
-- Binary (raw data)
-- Enum (a list of allowed values)
-- Set (a list of allowed values)
-- Time (time of day)
-- Timestamp (date and time)
-- Year (year)
-- Float (decimal values)
-- Double (decimal values)
-- Decimal (decimal values)

Every column in a database table must have a name and a data type.
When creating a table, an SQL developer needs to choose the right data type for each column. 
This helps MySQL know what kind of data to expect and how to work with it.

Datatypes defines the type & size of data to be stored in an attribute. as- id int (1,2,3,...)
In MySQL, there are three main categories of data types:

String: For text values (e.g., names, descriptions).
Numeric: For numbers (e.g., ages, prices).
Date and Time: For dates and times (e.g., birthdays, timestamps).

Note- Choosing the correct data type is important for ensuring data accuracy and efficient storage.

*/

-- Constraints 
/*
In MySQL, constraints are rules applied to columns in a database table to enforce data integrity and 
ensure the accuracy and reliability of the data stored in the database. Constraints help maintain the 
quality of the data by restricting the types of data that can be entered into a table and by defining 
relationships between tables.


Types of Constraints in MySQL

1. NOT NULL

Ensures that a column cannot have a NULL value.

Example:

CREATE TABLE Students (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL
);

2.UNIQUE

Ensures that all values in a column are unique.
Example:

CREATE TABLE Employees (
    Email VARCHAR(100) UNIQUE
);

3. PRIMARY KEY

Uniquely identifies each record in a table.
Combines NOT NULL and UNIQUE constraints.

Example:

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

4. FOREIGN KEY

Ensures referential integrity between two tables.
A column in one table refers to the primary key of another table.

Example:

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

5. CHECK

Ensures that all values in a column satisfy a specific condition.

Example:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

6. DEFAULT

Assigns a default value to a column if no value is specified.

Example:

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Status VARCHAR(20) DEFAULT 'Active'
);

7. AUTO_INCREMENT

Automatically generates a unique value for a column whenever a new record is inserted.

Example:

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50)
);


8. INDEX

Improves the performance of queries by creating an index on specified columns.
While not a direct constraint, it enforces rules like uniqueness when combined with UNIQUE.

Example:

CREATE UNIQUE INDEX idx_email ON Employees(Email);

Benefits of Using Constraints

Data Integrity: Ensures valid and consistent data.
Error Prevention: Avoids accidental insertion of invalid or duplicate data.
Relational Consistency: Maintains proper relationships between tables.
Constraints are essential tools for maintaining a well-structured and reliable database system.
*/


 /*
 In MySQL, commands are instructions that you use to interact with the database. 
 They allow you to perform various operations such as creating databases and tables, 
 inserting and updating data, querying data, and managing user permissions. 
 MySQL commands can be categorized into several types based on their functionality:

DDL(Data Definition Language): Defines database structures (CREATE, ALTER, DROP, TRUNCATE).
DML(Data Manipulation Language): Manipulates data (INSERT, UPDATE, DELETE).
DQL(Data Query Language): Queries data (SELECT).
DCL(Data Control Language): Controls access (GRANT, REVOKE).
TCL(Transaction Control Language): Manages transactions (COMMIT, ROLLBACK, SAVEPOINT).

*/


/*
Clauses are components of a SQL statement that specify the actions to be performed on 
the data in a database. Each clause serves a specific purpose and helps to define the 
structure and behavior of the SQL query. Clauses can be combined to create complex 
queries that retrieve, manipulate, or manage data.

the main clauses in MySQL include:
SELECT: Retrieves data from a database table.
FROM: Specifies the table(s) to retrieve data from.
WHERE: Filters data based on conditions.
GROUP BY: Groups data based on one or more columns.
HAVING: Filters grouped data based on conditions.
ORDER BY: Sorts data in ascending or descending order.
LIMIT: Limits the number of rows returned.

*/

/*
Clauses Vs Cammands --

Commands: 
These are the main instructions you use to interact with the database 
(e.g., SELECT, INSERT, UPDATE, DELETE, CREATE, etc.). They perform specific actions on the database.

Clauses: 
These are parts of SQL statements that provide additional details or conditions to the commands 
(e.g., WHERE, ORDER BY, GROUP BY, etc.). They help refine the command's operation.

Select * from students where name = 'Kavya';

In essence, commands are the actions you want to perform, while clauses are the conditions 
or modifications that help define how those actions should be executed. Understanding both is crucial 
for effective database management and querying.
 
*/

 
 -- Types of Clauses
 /*
 
 1. WHERE Clause
The WHERE clause is used to filter records in a table based on specific conditions. 
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE condition;  

2. DISTINCT Clause
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax:

SELECT DISTINCT column1  
FROM table_name;  

3. FROM Clause
The FROM clause specifies the table or tables from which the data is retrieved. 
It is a mandatory part of the SELECT statement and can also be used with joins for 
combining data from multiple tables.

Syntax:

SELECT column1, column2  
FROM table_name; 

4. ORDER BY Clause
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order 
based on one or more columns.

Syntax:

SELECT column1, column2  
FROM table_name  
ORDER BY column_name [ASC|DESC];  

5. GROUP BY Clause
The GROUP BY clause groups rows with the same values into summary rows, 
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;

6. HAVING Clause
The HAVING clause is used to filter grouped data after the GROUP BY clause. 
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition;  

7. LIMIT (or FETCH or TOP) Clause
The LIMIT clause is used to restrict the number of rows returned by a query. 
Different databases may use variations like FETCH or TOP.

Syntax (MySQL):

SELECT column1, column2  
FROM table_name  
LIMIT number_of_rows;  

8. JOIN Clause
The JOIN clause is used to combine rows from two or more tables based on a related column.

Syntax:

SELECT columns  
FROM table1  
JOIN table2  
ON table1.common_column = table2.common_column;  

9. UNION Clause
The UNION clause is used to combine the results of two or more SELECT statements. 
Duplicate rows are removed by default.

Syntax:

SELECT column1, column2  
FROM table1  
UNION  
SELECT column1, column2  
FROM table2;  

10.INTO Clause
The INTO clause is used to insert query results into a new table or export data.

Syntax:

SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  

11.CASE Clause
The CASE clause allows conditional logic in SQL queries, similar to an if-else statement.

Syntax:

SELECT column1,  
       CASE  
           WHEN condition1 THEN result1  
           WHEN condition2 THEN result2  
           ELSE result3  
       END AS alias_name  
FROM table_name; 

12. IN Clause
The IN clause is used to filter records based on a list of values.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name IN (value1, value2, ...);  

13. BETWEEN Clause
The BETWEEN clause filters data within a specified range, inclusive of the boundaries.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  

14. LIKE Clause
The LIKE clause is used to search for a specified pattern in a column. Wildcards include % (any number of 
characters) and _ (a single character).

example-  Develearn
1. (Start with)  Dev%
2. (End with)  %earn
3. (contain with) %le%

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  

15. EXISTS Clause
The EXISTS clause checks for the existence of rows in a subquery.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery); 

16. AS Clause
The AS clause is used to provide an alias (temporary name) for columns or tables, 
improving query readability.

Syntax:

SELECT column_name AS alias_name  
FROM table_name;    
 
 */


/*
SELECT Query : 

The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  
*/
