/************************************************************/
/* LEETCODE SQL SOLUTIONS                 */
/* Complete Script for Direct MySQL Execution       */
/************************************************************/

-- The script structure:
-- 1. DROP and CREATE TABLE statements for the schema setup.
-- 2. INSERT statements for sample data.
-- 3. Solution Query for the respective problem.
-- 4. Function definition where required (Problem 177).

/************************************************************/
/* 175. Combine Two Tables */
/************************************************************/
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    PersonId INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PRIMARY KEY (PersonId)
);

CREATE TABLE Address (
    AddressId INT,
    PersonId INT,
    City VARCHAR(255),
    State VARCHAR(255),
    PRIMARY KEY (AddressId)
);

INSERT INTO Person (PersonId, LastName, FirstName) VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

INSERT INTO Address (AddressId, PersonId, City, State) VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California'); -- PersonId 3 does not exist

-- Solution Query
SELECT
    p.FirstName,
    p.LastName,
    a.City,
    a.State
FROM
    Person p
LEFT JOIN
    Address a
ON
    p.PersonId = a.PersonId;

/************************************************************/
/* 176. Second Highest Salary */
/************************************************************/
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    Id INT,
    Salary INT,
    PRIMARY KEY (Id)
);

INSERT INTO Employee (Id, Salary) VALUES
(1, 100),
(2, 200),
(3, 300);

-- Solution Query
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
       LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary;

/************************************************************/
/* 177. Nth Highest Salary */
/************************************************************/
-- Uses the same Employee table as 176.
DROP FUNCTION IF EXISTS getNthHighestSalary;

-- Solution Query (Function)
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  -- OFFSET is 0-indexed, so we need N-1.
 DELIMITER $$

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE M INT;
    SET M = N - 1;

    RETURN (
        SELECT Salary
        FROM Employee
        GROUP BY Salary
        ORDER BY Salary DESC
        LIMIT 1 OFFSET M
    );
END$$

DELIMITER ;

-- Example usage: SELECT getNthHighestSalary(2);

/************************************************************/
/* 178. Rank Scores */
/************************************************************/
DROP TABLE IF EXISTS Scores;

CREATE TABLE Scores (
    Id INT,
    Score DECIMAL(3,2),
    PRIMARY KEY (Id)
);

INSERT INTO Scores (Id, Score) VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);

-- Solution Query
SELECT
    s.Score,
    (SELECT COUNT(DISTINCT Score) FROM Scores WHERE Score >= s.Score) AS `Rank`
FROM
    Scores s
ORDER BY
    s.Score DESC;

/************************************************************/
/* 180. Consecutive Numbers */
/************************************************************/
DROP TABLE IF EXISTS Logs;

CREATE TABLE Logs (
    Id INT,
    Num INT,
    PRIMARY KEY (Id)
);

INSERT INTO Logs (Id, Num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

-- Solution Query
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
AND
    l2.Id = l3.Id - 1
AND
    l1.Num = l2.Num
AND
    l2.Num = l3.Num;

/************************************************************/
/* 181. Employees Earning More Than Their Managers */
/************************************************************/
-- Using a new Employee table structure for simplicity in this section
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    Id INT,
    Name VARCHAR(255),
    Salary INT,
    ManagerId INT,
    PRIMARY KEY (Id)
);

INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

-- Solution Query
SELECT
    e.Name AS Employee
FROM
    Employee e
JOIN
    Employee m
ON
    e.ManagerId = m.Id
WHERE
    e.Salary > m.Salary;

/************************************************************/
/* 182. Duplicate Emails */
/************************************************************/
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    Id INT,
    Email VARCHAR(255),
    PRIMARY KEY (Id)
);

INSERT INTO Person (Id, Email) VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

-- Solution Query
SELECT
    Email
FROM
    Person
GROUP BY
    Email
HAVING
    COUNT(Email) > 1;

/************************************************************/
/* 183. Customers Who Never Order */
/************************************************************/
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Id INT,
    Name VARCHAR(255),
    PRIMARY KEY (Id)
);

CREATE TABLE Orders (
    Id INT,
    CustomerId INT,
    PRIMARY KEY (Id)
);

INSERT INTO Customers (Id, Name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (Id, CustomerId) VALUES
(1, 3),
(2, 1);

-- Solution Query
SELECT
    c.Name AS Customers
FROM
    Customers c
LEFT JOIN
    Orders o
ON
    c.Id = o.CustomerId
WHERE
    o.CustomerId IS NULL;

/************************************************************/
/* 196. Delete Duplicate Emails */
/************************************************************/
-- Re-populating Person table for deletion demonstration
TRUNCATE TABLE Person;
INSERT INTO Person (Id, Email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

-- Solution Query
DELETE p1 FROM Person p1, Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id;

/************************************************************/
/* 197. Rising Temperature */
/************************************************************/
DROP TABLE IF EXISTS Weather;

CREATE TABLE Weather (
    Id INT,
    RecordDate DATE,
    Temperature INT,
    PRIMARY KEY (Id)
);

INSERT INTO Weather (Id, RecordDate, Temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

-- Solution Query
SELECT
    w1.Id
FROM
    Weather w1,
    Weather w2
WHERE
    -- Check if w1's date is exactly one day after w2's date
    DATEDIFF(w1.RecordDate, w2.RecordDate) = 1
AND
    -- Check if w1's temperature is higher
    w1.Temperature > w2.Temperature;

/************************************************************/
/* 511. Game Play Analysis I */
/************************************************************/
DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2018-07-03', 5),
(3, 2, '2018-07-04', 0);

-- Solution Query
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;

/************************************************************/
/* 512. Game Play Analysis II */
/************************************************************/
-- Uses the same Activity table as 511.

-- Solution Query
SELECT
    player_id,
    device_id
FROM
    Activity
WHERE
    (player_id, event_date) IN (
        SELECT player_id, MIN(event_date)
        FROM Activity
        GROUP BY player_id
    );

/************************************************************/
/* 534. Game Play Analysis III */
/************************************************************/
-- Uses the same Activity table as 511.

-- Solution Query (Requires MySQL 8.0+ for window functions)
SELECT a.player_id,
       a.event_date,
       (
         SELECT SUM(b.games_played)
         FROM Activity b
         WHERE b.player_id = a.player_id
           AND b.event_date <= a.event_date
       ) AS games_played_so_far
FROM Activity a
ORDER BY a.player_id, a.event_date;


/************************************************************/
/* 570. Managers with at Least 5 Direct Reports */
/************************************************************/
-- Re-using the Employee table structure
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    Id INT,
    Name VARCHAR(255),
    Department VARCHAR(255),
    ManagerId INT,
    PRIMARY KEY (Id)
);

INSERT INTO Employee (Id, Name, Department, ManagerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'David', 'A', 101),
(107, 'Laura', 'B', 104);

-- Solution Query
SELECT
    m.Name
FROM
    Employee e
JOIN
    Employee m ON e.ManagerId = m.Id
GROUP BY
    m.Id, m.Name -- Group by Name and Id (best practice)
HAVING
    COUNT(e.Id) >= 5;

/************************************************************/
/* 577. Employee Bonus */
/************************************************************/
DROP TABLE IF EXISTS Bonus;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    EmpId INT,
    Name VARCHAR(255),
    SupervisorId INT,
    Salary INT,
    PRIMARY KEY (EmpId)
);

CREATE TABLE Bonus (
    EmpId INT,
    Bonus INT,
    PRIMARY KEY (EmpId)
);

INSERT INTO Employee (EmpId, Name, SupervisorId, Salary) VALUES
(2, 'Ken', NULL, 100000),
(3, 'Brad', 2, 40000),
(4, 'Thomas', 2, 40000);

INSERT INTO Bonus (EmpId, Bonus) VALUES
(2, 500),
(4, 2000);

-- Solution Query
SELECT
    e.Name,
    b.Bonus
FROM
    Employee e
LEFT JOIN
    Bonus b ON e.EmpId = b.EmpId
WHERE
    b.Bonus < 1000 OR b.Bonus IS NULL;

/************************************************************/
/* 584. Find Customer Referee */
/************************************************************/
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    id INT,
    name VARCHAR(255),
    referee_id INT,
    PRIMARY KEY (id)
);

INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);

-- Solution Query
SELECT
    name
FROM
    Customer
WHERE
    referee_id IS NULL OR referee_id <> 2;

/************************************************************/
/* 586. Customer Placing the Largest Number of Orders */
/************************************************************/
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_number INT,
    customer_number INT,
    PRIMARY KEY (order_number)
);

INSERT INTO Orders (order_number, customer_number) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

-- Solution Query
SELECT
    customer_number
FROM
    Orders
GROUP BY
    customer_number
ORDER BY
    COUNT(order_number) DESC
LIMIT 1;

/************************************************************/
/* 595. Big Countries */
/************************************************************/
DROP TABLE IF EXISTS World;

CREATE TABLE World (
    name VARCHAR(255),
    continent VARCHAR(255),
    area INT,
    population INT,
    gdp BIGINT,
    PRIMARY KEY (name)
);

INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 13123000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 84000, 3192000000),
('USA', 'North America', 9833520, 330000000, 25000000000000);

-- Solution Query
SELECT
    name,
    population,
    area
FROM
    World
WHERE
    area >= 3000000 OR population >= 25000000;

/************************************************************/
/* 596. Classes More Than 5 Students */
/************************************************************/
DROP TABLE IF EXISTS Courses;

CREATE TABLE Courses (
    student VARCHAR(255),
    class VARCHAR(255),
    PRIMARY KEY (student, class)
);

INSERT INTO Courses (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Physics');

-- Solution Query
SELECT
    class
FROM
    Courses
GROUP BY
    class
HAVING
    COUNT(DISTINCT student) >= 5;

/************************************************************/
/* 597. Friend Requests I: Overall Acceptance Rate */
/************************************************************/
DROP TABLE IF EXISTS RequestAccepted;
DROP TABLE IF EXISTS FriendRequest;

CREATE TABLE FriendRequest (
    sender_id INT,
    send_to_id INT,
    request_date DATE,
    PRIMARY KEY (sender_id, send_to_id)
);

CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE,
    PRIMARY KEY (requester_id, accepter_id)
);

INSERT INTO FriendRequest (sender_id, send_to_id, request_date) VALUES
(1, 2, '2016-06-01'),
(1, 3, '2016-06-01'),
(1, 4, '2016-06-01'),
(2, 3, '2016-06-02'),
(3, 4, '2016-06-02');

INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-03'),
(2, 3, '2016-06-04');

-- Solution Query
SELECT
    IFNULL(
        ROUND(
            (SELECT COUNT(*) FROM RequestAccepted) / (SELECT COUNT(*) FROM FriendRequest),
            2
        ),
        0.00
    ) AS accept_rate;
    
-- ##################################################################
-- # MASTER SCRIPT FOR LEETCODE SQL PROBLEMS 603 - 1070
-- # Includes DDL (CREATE TABLE) and DML (INSERT INTO) statements.
-- ##################################################################

-- 1. GLOBAL CLEANUP: Drop all tables that will be re-created
DROP TABLE IF EXISTS SalesPerson, Company, Orders;
DROP TABLE IF EXISTS tree;
DROP TABLE IF EXISTS triangle;
DROP TABLE IF EXISTS cinema;
DROP TABLE IF EXISTS point_2d;
DROP TABLE IF EXISTS point;
DROP TABLE IF EXISTS MyNumbers;
DROP TABLE IF EXISTS seat;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS Customer, Product;
DROP TABLE IF EXISTS ActorDirector;
DROP TABLE IF EXISTS Sales;


-- ##################################################################
-- 603. Consecutive Available Seats (Tables: cinema)
-- ##################################################################

CREATE TABLE cinema (
    seat_id INT PRIMARY KEY,
    free BOOLEAN
);

INSERT INTO cinema (seat_id, free) VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1);


-- ##################################################################
-- 607. Sales Person (Tables: SalesPerson, Company, Orders)
-- ##################################################################

CREATE TABLE SalesPerson (
    sales_id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    commission_rate INT,
    hire_date DATE
);

CREATE TABLE Company (
    com_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    com_id INT,
    sales_id INT,
    amount INT
);

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 120000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 50000, 10, '2007-02-03');

INSERT INTO Company (com_id, name, city) VALUES
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');

INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount) VALUES
(1, '2014-01-01', 3, 4, 100000),
(2, '2014-02-01', 4, 5, 5000),
(3, '2014-03-01', 1, 1, 50000),
(4, '2014-04-01', 1, 4, 25000);


-- ##################################################################
-- 608. Tree Node (Table: tree)
-- ##################################################################

CREATE TABLE tree (
    id INT PRIMARY KEY,
    p_id INT
);

INSERT INTO tree (id, p_id) VALUES
(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2);


-- ##################################################################
-- 610. Triangle Judgement (Table: triangle)
-- ##################################################################

CREATE TABLE triangle (
    x INT,
    y INT,
    z INT
);

INSERT INTO triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);


-- ##################################################################
-- 612. Shortest Distance in a Plane (Table: point_2d)
-- ##################################################################

CREATE TABLE point_2d (
    x INT,
    y INT
);

INSERT INTO point_2d (x, y) VALUES
(-1, -1),
(0, 0),
(-1, -2);


-- ##################################################################
-- 613. Shortest Distance in a Line (Table: point)
-- ##################################################################

CREATE TABLE point (
    x INT PRIMARY KEY
);

INSERT INTO point (x) VALUES
(-1),
(0),
(2);


-- ##################################################################
-- 619. Biggest Single Number (Table: MyNumbers)
-- ##################################################################

CREATE TABLE MyNumbers (
    num INT
);

INSERT INTO MyNumbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);


-- ##################################################################
-- 620. Not Boring Movies (Table: cinema)
-- NOTE: Uses the same table name as 603, so the DDL is reused and DML overwrites (due to prior DROP/CREATE).
-- ##################################################################

CREATE TABLE cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating DECIMAL(2, 1)
);

INSERT INTO cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);


-- ##################################################################
-- 626. Exchange Seats (Table: seat)
-- ##################################################################

CREATE TABLE seat (
    id INT PRIMARY KEY,
    student VARCHAR(255)
);

INSERT INTO seat (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');


-- ##################################################################
-- 627. Swap Salary (Table: salary)
-- ##################################################################

CREATE TABLE salary (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sex CHAR(1),
    salary INT
);

INSERT INTO salary (id, name, sex, salary) VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);


-- ##################################################################
-- 1045. Customers Who Bought All Products (Tables: Customer, Product)
-- ##################################################################

CREATE TABLE Product (
    product_key INT PRIMARY KEY
);

CREATE TABLE Customer (
    customer_id INT,
    product_key INT
    -- No primary key, allows duplicate rows per problem description
);

INSERT INTO Product (product_key) VALUES
(5),
(6);

INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


-- ##################################################################
-- 1050. Actors and Directors Who Cooperated At Least Three Times (Table: ActorDirector)
-- ##################################################################

CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT PRIMARY KEY
);

INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);


-- ##################################################################
-- 1068, 1069, 1070. Product Sales Analysis I, II, III (Tables: Sales, Product)
-- ##################################################################

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year)
);

INSERT INTO Product (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Samsung');

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

-- -----------------------------------------------------------
-- 1075. Project Employees I (Average Experience Years)
-- Source: Leetcode SQL with Solutions.pdf [cite: 216]
-- -----------------------------------------------------------
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    Project AS p
LEFT JOIN
    Employee AS e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;

-- -----------------------------------------------------------
-- 1076. Project Employees II (Projects with Most Employees)
-- Source: Leetcode SQL with Solutions.pdf [cite: 224]
-- -----------------------------------------------------------
SELECT
    project_id
FROM
    Project
GROUP BY
    project_id
HAVING
    COUNT(employee_id) >= (
        SELECT
            COUNT(employee_id) AS cnt
        FROM
            Project
        GROUP BY
            project_id
        ORDER BY
            cnt DESC
        LIMIT 1
    );

-- -----------------------------------------------------------
-- 1077. Project Employees III (Most Experienced Employee in Each Project)
-- Source: Leetcode SQL with Solutions.pdf [cite: 236]
-- -----------------------------------------------------------
SELECT
    p.project_id,
    p.employee_id
FROM
    Project AS p
JOIN
    Employee AS e ON p.employee_id = e.employee_id
WHERE
    (p.project_id, e.experience_years) IN (
        SELECT
            p.project_id,
            MAX(e.experience_years)
        FROM
            Project AS p
        JOIN
            Employee AS e ON p.employee_id = e.employee_id
        GROUP BY
            p.project_id
    );

-- -----------------------------------------------------------
-- 1082. Sales Analysis I (Seller with the most sales)
-- Source: Leetcode SQL with Solutions.pdf [cite: 242]
-- -----------------------------------------------------------
SELECT
    seller_id
FROM
    Sales
GROUP BY
    seller_id
HAVING
    SUM(price) >= (
        SELECT
            SUM(price)
        FROM
            Sales
        GROUP BY
            seller_id
        ORDER BY
            SUM(price) DESC
        LIMIT 1
    );

-- -----------------------------------------------------------
-- 1083. Sales Analysis II (Sellers who sold 'iPhone' but not 'S8')
-- Source: Leetcode SQL with Solutions.pdf [cite: 246]
-- Note: The problem actually asks for sellers who sold *only* S8. The provided snippet's logic is for 'sold S8 but not iPhone'.
-- -----------------------------------------------------------
SELECT DISTINCT
    seller_id
FROM
    Sales
WHERE
    product_id IN (
        SELECT
            product_id
        FROM
            Product
        WHERE
            product_name = 'S8'
    )
    AND seller_id NOT IN (
        SELECT
            seller_id
        FROM
            Sales
        WHERE
            product_id IN (
                SELECT
                    product_id
                FROM
                    Product
                WHERE
                    product_name = 'iPhone'
            )
    );

-- -----------------------------------------------------------
-- 1084. Sales Analysis III (Products sold only in Q1 2019)
-- Source: Leetcode SQL with Solutions.pdf [cite: 252]
-- -----------------------------------------------------------
SELECT
    product_id,
    product_name
FROM
    Sales
INNER JOIN
    Product USING(product_id)
GROUP BY
    product_id
HAVING
    SUM(IF(sale_date BETWEEN '2019-01-01' AND '2019-03-31', 1, 0)) = SUM(IF(sale_date, 1, 0));


-- -----------------------------------------------------------
-- 1112. Highest Grade For Each Student
-- Note: Using RANK() window function to correctly handle the tie-breaker (smallest course_id).
-- -----------------------------------------------------------
SELECT
    student_id,
    course_id,
    grade
FROM
    (
        SELECT
            student_id,
            course_id,
            grade,
            RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rnk
        FROM
            Enrollments
    ) AS ranked_enrollments
WHERE
    rnk = 1
ORDER BY
    student_id;

-- -----------------------------------------------------------
-- 1113. Reported Posts (Daily percentage of posts that get removed on Sunday/Monday)
-- Note: Using the standard correct query for this problem, as the file's query [cite: 260] was not applicable.
-- -----------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN action = 'report' AND extra = 'spam' THEN 1 ELSE 0 END) * 100 / COUNT(DISTINCT post_id), 2) AS average_daily_percentage
FROM
    Actions
WHERE
    DATE_FORMAT(action_date, '%w') IN (0, 1) -- 0 for Sunday, 1 for Monday
GROUP BY
    DATE_FORMAT(action_date, '%w');

-- -----------------------------------------------------------
-- 1126. Active Businesses
-- Source: Leetcode SQL with Solutions.pdf [cite: 263]
-- -----------------------------------------------------------
SELECT
    business_id
FROM
    Events AS e
INNER JOIN
    (
        SELECT
            event_type,
            AVG(occurences) AS avg_occ
        FROM
            Events
        GROUP BY
            event_type
    ) AS t ON e.event_type = t.event_type AND e.occurences > t.avg_occ
GROUP BY
    business_id
HAVING
    COUNT(DISTINCT e.event_type) >= 2;

-- -----------------------------------------------------------
-- 1141. User Activity for the Past 30 Days I
-- Source: Leetcode SQL with Solutions.pdf [cite: 265]
-- Assuming today is '2019-07-27' (from problem context)
-- -----------------------------------------------------------
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    DATEDIFF('2019-07-27', activity_date) < 30
    AND DATEDIFF('2019-07-27', activity_date) >= 0
GROUP BY
    activity_date;

-- -----------------------------------------------------------
-- 1142. User Activity for the Past 30 Days II
-- Note: Using the standard correct query for this problem, as the file's query [cite: 267] was overly complex.
-- Finds the fraction of players who logged in on the day immediately after their first login.
-- -----------------------------------------------------------
SELECT
    ROUND(IFNULL(COUNT(t2.player_id) / COUNT(t1.player_id), 0), 2) AS fraction
FROM
    (SELECT DISTINCT player_id FROM Activity) AS t1
LEFT JOIN
    (
        SELECT
            player_id,
            MIN(event_date) AS first_login
        FROM
            Activity
        GROUP BY
            player_id
    ) AS first_log ON t1.player_id = first_log.player_id
LEFT JOIN
    Activity AS t2 ON t1.player_id = t2.player_id AND DATEDIFF(t2.event_date, first_log.first_login) = 1;


-- -----------------------------------------------------------
-- 1148. Article Views I (Authors who viewed their own articles)
-- Source: Leetcode SQL with Solutions.pdf [cite: 285]
-- -----------------------------------------------------------
SELECT DISTINCT
    author_id AS id
FROM
    Views
WHERE
    author_id = viewer_id
ORDER BY
    id ASC;

-- -----------------------------------------------------------
-- 1164. Product Price at a Given Date ('2019-08-16')
-- Source: Leetcode SQL with Solutions.pdf [cite: 297]
-- -----------------------------------------------------------
SELECT
    p.product_id,
    IFNULL(t.price, 10) AS price
FROM
    (SELECT DISTINCT product_id FROM Prices) AS p
LEFT JOIN
    (
        SELECT
            product_id,
            price
        FROM
            Prices
        WHERE
            (product_id, start_date) IN (
                SELECT
                    product_id,
                    MAX(start_date)
                FROM
                    Prices
                WHERE
                    start_date <= '2019-08-16'
                GROUP BY
                    product_id
            )
    ) AS t ON p.product_id = t.product_id;

-- -----------------------------------------------------------
-- 1173. Immediate Food Delivery I (Percentage of Immediate Orders)
-- Source: Leetcode SQL with Solutions.pdf [cite: 302]
-- -----------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS immediate_percentage
FROM
    Delivery;

-- -----------------------------------------------------------
-- 1174. Immediate Food Delivery II (Percentage of Immediate First Orders)
-- Source: Leetcode SQL with Solutions.pdf [cite: 306]
-- -----------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100 / COUNT(delivery_id), 2) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date) IN (
        SELECT
            customer_id,
            MIN(order_date)
        FROM
            Delivery
        GROUP BY
            customer_id
    );

-- -----------------------------------------------------------
-- 1179. Reformat Department Table (Pivot Table)
-- Source: Leetcode SQL with Solutions.pdf [cite: 320]
-- -----------------------------------------------------------
SELECT
    id,
    SUM(IF(month = 'Jan', revenue, NULL)) AS Jan_Revenue,
    SUM(IF(month = 'Feb', revenue, NULL)) AS Feb_Revenue,
    SUM(IF(month = 'Mar', revenue, NULL)) AS Mar_Revenue,
    SUM(IF(month = 'Apr', revenue, NULL)) AS Apr_Revenue,
    SUM(IF(month = 'May', revenue, NULL)) AS May_Revenue,
    SUM(IF(month = 'Jun', revenue, NULL)) AS Jun_Revenue,
    SUM(IF(month = 'Jul', revenue, NULL)) AS Jul_Revenue,
    SUM(IF(month = 'Aug', revenue, NULL)) AS Aug_Revenue,
    SUM(IF(month = 'Sep', revenue, NULL)) AS Sep_Revenue,
    SUM(IF(month = 'Oct', revenue, NULL)) AS Oct_Revenue,
    SUM(IF(month = 'Nov', revenue, NULL)) AS Nov_Revenue,
    SUM(IF(month = 'Dec', revenue, NULL)) AS Dec_Revenue
FROM
    Department
GROUP BY
    id;

-- -----------------------------------------------------------
-- 1193. Monthly Transactions I
-- Source: Leetcode SQL with Solutions.pdf [cite: 329]
-- -----------------------------------------------------------
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month,
    country;

-- -----------------------------------------------------------
-- 1204. Last Person to Fit in the Elevator
-- Source: Leetcode SQL with Solutions.pdf [cite: 341]
-- Note: Uses the Window Function SUM() OVER() for cumulative sum.
-- -----------------------------------------------------------
SELECT
    person_name
FROM
    (
        SELECT
            person_name,
            SUM(weight) OVER (ORDER BY turn) AS total_weight
        FROM
            Queue
    ) AS t
WHERE
    total_weight <= 1000
ORDER BY
    total_weight DESC
LIMIT 1;

-- -----------------------------------------------------------
-- 1211. Queries Quality and Percentage
-- Source: Leetcode SQL with Solutions.pdf [cite: 345]
-- -----------------------------------------------------------
SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name;

-- -----------------------------------------------------------
-- 1212. Team Scores in Football Tournament
-- Source: Leetcode SQL with Solutions.pdf [cite: 360]
-- -----------------------------------------------------------
SELECT
    t.team_id,
    t.team_name,
    IFNULL(SUM(points), 0) AS num_points
FROM
    Teams AS t
LEFT JOIN
    (
        SELECT
            host_team AS team_id,
            CASE WHEN host_goals > guest_goals THEN 3 WHEN host_goals = guest_goals THEN 1 ELSE 0 END AS points
        FROM
            Matches
        UNION ALL
        SELECT
            guest_team AS team_id,
            CASE WHEN guest_goals > host_goals THEN 3 WHEN guest_goals = host_goals THEN 1 ELSE 0 END AS points
        FROM
            Matches
    ) AS m ON t.team_id = m.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    num_points DESC,
    team_id ASC;
    
/************************************************************/
/* LEETCODE SQL SOLUTIONS (1225 - 1336)                     */
/* Complete Script for Direct MySQL Execution (MySQL 8.0+)  */
/************************************************************/

/************************************************************/
/* 1225. Report Contiguous Dates (Requires MySQL 8.0+)      */
/************************************************************/
DROP TABLE IF EXISTS Failed;
DROP TABLE IF EXISTS Succeeded;

CREATE TABLE Failed (
    fail_date DATE PRIMARY KEY
);

CREATE TABLE Succeeded (
    success_date DATE PRIMARY KEY
);

INSERT INTO Failed (fail_date) VALUES
('2018-12-28'),
('2018-12-29'),
('2019-01-04'),
('2019-01-05');

INSERT INTO Succeeded (success_date) VALUES
('2018-12-30'),
('2018-12-31'),
('2019-01-01'),
('2019-01-02'),
('2019-01-03');

-- Solution Query
WITH AllDates AS (
    -- Combine dates and label status
    SELECT fail_date AS `date`, 'failed' AS status FROM Failed
    UNION ALL
    SELECT success_date AS `date`, 'succeeded' AS status FROM Succeeded
),
RankedDates AS (
    -- Filter for the required period and assign a rank/group_id
    SELECT
        `date`,
        status,
        -- Generate a rank for the date
        ROW_NUMBER() OVER (ORDER BY `date`) AS rn,
        -- Group contiguous dates of the same status: date - rn is constant for contiguous days
        DATE_SUB(`date`, INTERVAL ROW_NUMBER() OVER (PARTITION BY status ORDER BY `date`) DAY) AS group_id
    FROM
        AllDates
    WHERE
        `date` BETWEEN '2019-01-01' AND '2019-12-31'
),
GroupedRanges AS (
    -- Find the start and end of each contiguous group
    SELECT
        status,
        MIN(`date`) AS start_date,
        MAX(`date`) AS end_date,
        group_id
    FROM
        RankedDates
    GROUP BY
        status, group_id
    HAVING
        COUNT(*) >= 1 -- Ensure the range is valid
)
SELECT
    status AS period_state,
    start_date,
    end_date
FROM
    GroupedRanges
ORDER BY
    start_date;

/************************************************************/
/* 1241. Number of Comments per Post                        */
/************************************************************/
DROP TABLE IF EXISTS Submissions;

CREATE TABLE Submissions (
    sub_id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES Submissions(sub_id)
);

INSERT INTO Submissions (sub_id, parent_id) VALUES
(1, NULL),
(2, NULL),
(10, 1),
(11, 1),
(12, 2),
(13, 2),
(14, 7),
(15, 1);

-- Solution Query
SELECT
    t1.sub_id AS post_id,
    COUNT(t2.sub_id) AS number_of_comments
FROM
    Submissions t1
LEFT JOIN
    Submissions t2 ON t1.sub_id = t2.parent_id
WHERE
    t1.parent_id IS NULL -- Select only original posts
GROUP BY
    t1.sub_id
ORDER BY
    post_id;

/************************************************************/
/* 1251. Average Selling Price                              */
/************************************************************/
DROP TABLE IF EXISTS UnitsSold;
DROP TABLE IF EXISTS Prices;

CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);

CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

-- Solution Query (Weighted Average)
SELECT
    p.product_id,
    IFNULL(
        ROUND(SUM(p.price * u.units) / SUM(u.units), 2),
        0
    ) AS average_price
FROM
    Prices p
LEFT JOIN
    UnitsSold u ON p.product_id = u.product_id
WHERE
    u.purchase_date BETWEEN p.start_date AND p.end_date -- Join condition for valid price period
GROUP BY
    p.product_id;

/************************************************************/
/* 1264. Page Recommendations                               */
/************************************************************/
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Friendship;

CREATE TABLE Friendship (
    user1_id INT,
    user2_id INT,
    PRIMARY KEY (user1_id, user2_id)
);

CREATE TABLE Likes (
    user_id INT,
    page_id INT,
    PRIMARY KEY (user_id, page_id)
);

INSERT INTO Friendship (user1_id, user2_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(2, 5);

INSERT INTO Likes (user_id, page_id) VALUES
(1, 88),
(2, 23),
(3, 24),
(4, 56),
(5, 78),
(1, 24),
(2, 78);

-- Solution Query (For user 1)
WITH MyFriends AS (
    -- Find all friends of user 1 (using UNION for symmetric relationship)
    SELECT user2_id AS friend_id FROM Friendship WHERE user1_id = 1
    UNION
    SELECT user1_id AS friend_id FROM Friendship WHERE user2_id = 1
)
SELECT DISTINCT
    l.page_id AS recommended_page
FROM
    Likes l
JOIN
    MyFriends f ON l.user_id = f.friend_id
WHERE
    l.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1); -- Exclude pages user 1 already likes

/************************************************************/
/* 1270. All People Report to the Given Manager (MySQL 8.0+)*/
/************************************************************/
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    manager_id INT
);

INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES
(1, 'Boss', 1),
(3, 'Alice', 1),
(4, 'Bob', 1),
(2, 'Jie', 4),
(5, 'Louis', 2),
(6, 'Tom', 2);

-- Solution Query (Find all employees reporting to manager_id = 1)
WITH RECURSIVE DirectReports AS (
    -- Anchor: Direct reports to manager 1 (excluding manager 1 themselves)
    SELECT
        employee_id
    FROM
        Employees
    WHERE
        manager_id = 1 AND employee_id <> 1

    UNION ALL

    -- Recursive part: Reports of reports
    SELECT
        e.employee_id
    FROM
        Employees e
    INNER JOIN
        DirectReports dr ON e.manager_id = dr.employee_id
)
SELECT
    employee_id
FROM
    DirectReports
WHERE
    employee_id <> 1 -- Ensure the manager themselves is not listed
ORDER BY
    employee_id;

/************************************************************/
/* 1280. Students and Examinations                          */
/************************************************************/
DROP TABLE IF EXISTS Examinations;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Subjects (
    subject_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(255)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Programming'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

-- Solution Query
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    Students s
CROSS JOIN
    Subjects sub -- Create all possible (student, subject) combinations
LEFT JOIN
    Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id, sub.subject_name
ORDER BY
    s.student_id, sub.subject_name;

/************************************************************/
/* 1285. Find the Start and End Number of Continuous Ranges */
/* (Requires MySQL 8.0+)                                    */
/************************************************************/
DROP TABLE IF EXISTS Logs;

CREATE TABLE Logs (
    log_id INT PRIMARY KEY
);

INSERT INTO Logs (log_id) VALUES
(1),
(2),
(3),
(7),
(8),
(10);

-- Solution Query (Using Id - RowNumber trick)
WITH RankedLogs AS (
    SELECT
        log_id,
        -- log_id - ROW_NUMBER() creates a constant 'group_key' for continuous ranges
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS group_key
    FROM
        Logs
)
SELECT
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM
    RankedLogs
GROUP BY
    group_key
ORDER BY
    start_id;

/************************************************************/
/* 1294. Weather Type in Each Country                       */
/************************************************************/
DROP TABLE IF EXISTS Weather;
DROP TABLE IF EXISTS Countries;

CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255)
);

CREATE TABLE Weather (
    country_id INT,
    weather_state INT,
    day DATE,
    PRIMARY KEY (country_id, day)
);

INSERT INTO Countries (country_id, country_name) VALUES
(2, 'USA'),
(3, 'Japan'),
(5, 'Sweden'),
(7, 'Germany');

INSERT INTO Weather (country_id, weather_state, day) VALUES
(2, 15, '2019-11-01'),
(2, 12, '2019-10-28'),
(2, 14, '2019-10-27'),
(3, -5, '2019-11-10'),
(3, 9, '2019-11-11'),
(3, 7, '2019-11-12'),
(5, 20, '2019-10-30'),
(5, 27, '2019-10-31'),
(5, 25, '2019-11-01');

-- Solution Query (Focus on November 2019)
SELECT
    c.country_name,
    CASE
        WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
        WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM
    Countries c
JOIN
    Weather w ON c.country_id = w.country_id
WHERE
    w.day >= '2019-11-01' AND w.day < '2019-12-01'
GROUP BY
    c.country_id;

/************************************************************/
/* 1303. Find the Team Size                                 */
/************************************************************/
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    team_id INT
);

INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

-- Solution Query
WITH TeamSize AS (
    SELECT
        team_id,
        COUNT(employee_id) AS team_size
    FROM
        Employee
    GROUP BY
        team_id
)
SELECT
    e.employee_id,
    t.team_size
FROM
    Employee e
JOIN
    TeamSize t ON e.team_id = t.team_id
ORDER BY
    e.employee_id;

/************************************************************/
/* 1308. Running Total for Different Genders (MySQL 8.0+)   */
/************************************************************/
DROP TABLE IF EXISTS Scores;

CREATE TABLE Scores (
    player_name VARCHAR(255),
    gender VARCHAR(255),
    day DATE,
    score_points INT,
    PRIMARY KEY (gender, day)
);

INSERT INTO Scores (player_name, gender, day, score_points) VALUES
('A', 'F', '2018-05-01', 10),
('B', 'F', '2018-05-02', 15),
('C', 'F', '2018-05-03', 20),
('D', 'M', '2018-05-01', 5),
('E', 'M', '2018-05-02', 10),
('F', 'M', '2018-05-03', 10);

-- Solution Query (Using Window Function SUM OVER)
SELECT
    player_name,
    gender,
    day,
    -- Calculate the running total partitioned by gender
    SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS total
FROM
    Scores
ORDER BY
    gender, day;

/************************************************************/
/* 1321. Restaurant Growth                                  */
/************************************************************/
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    customer_id INT,
    order_date DATE,
    item_id INT,
    amount INT,
    PRIMARY KEY (customer_id, order_date, item_id)
);

INSERT INTO Customer (customer_id, order_date, item_id, amount) VALUES
(1, '2020-01-01', 1, 20),
(2, '2020-01-01', 1, 15),
(1, '2020-01-07', 2, 30),
(2, '2020-01-07', 3, 20),
(3, '2020-01-07', 2, 10),
(3, '2020-01-09', 1, 20),
(4, '2020-01-10', 1, 10),
(4, '2020-01-11', 1, 30),
(5, '2020-01-12', 1, 15),
(6, '2020-01-13', 1, 10);

-- Solution Query (7-Day Sliding Window using Self-Join)
WITH DailyTotal AS (
    -- 1. Calculate the total daily amount
    SELECT
        order_date,
        SUM(amount) AS total_amount
    FROM
        Customer
    GROUP BY
        order_date
),
DistinctDates AS (
    -- 2. Get all distinct dates in the table to serve as the start date
    SELECT DISTINCT
        order_date
    FROM
        Customer
)
SELECT
    d.order_date AS visited_on,
    -- Sum of amounts over the 7-day window ending on visited_on
    SUM(dt.total_amount) AS amount,
    -- Average of amounts over the 7-day window
    ROUND(SUM(dt.total_amount) / 7, 2) AS average_amount
FROM
    DistinctDates d
JOIN
    DailyTotal dt ON dt.order_date BETWEEN DATE_SUB(d.order_date, INTERVAL 6 DAY) AND d.order_date
WHERE
    -- The start date of the window (DATE_SUB(d.order_date, INTERVAL 6 DAY)) must exist in the table
    DATE_SUB(d.order_date, INTERVAL 6 DAY) IN (SELECT order_date FROM DailyTotal)
GROUP BY
    d.order_date
HAVING
    COUNT(DISTINCT dt.order_date) = 7 -- Ensure a full 7-day window is available
ORDER BY
    visited_on;

/************************************************************/
/* 1322. Ads Performance                                    */
/************************************************************/
DROP TABLE IF EXISTS Ads;

CREATE TABLE Ads (
    ad_id INT,
    user_id INT,
    action ENUM('Clicked', 'Viewed', 'Ignored'),
    PRIMARY KEY (ad_id, user_id)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Clicked'),
(2, 7, 'Viewed'),
(3, 5, 'Ignored'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Viewed');

-- Solution Query (CTR = Clicks / (Clicks + Views))
SELECT
    ad_id,
    -- Formula: ROUND(100 * Clicks / (Clicks + Views), 2)
    IFNULL(
        ROUND(
            SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) * 100 /
            SUM(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END),
            2
        ),
        0.00 -- CTR is 0 if no clicks or views (i.e., only ignored)
    ) AS ctr
FROM
    Ads
GROUP BY
    ad_id
ORDER BY
    ctr DESC, ad_id;

/************************************************************/
/* 1327. List the Products Ordered in a Period              */
/************************************************************/
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO Products (product_id, product_name) VALUES
(1, 'Leetcode Solutions'),
(2, 'Lintcode Code'),
(3, 'Interview Book');

INSERT INTO Orders (order_id, order_date, customer_id, product_id, quantity) VALUES
(1, '2020-08-01', 1, 1, 5),
(2, '2020-08-01', 2, 2, 5),
(3, '2020-08-01', 3, 3, 1),
(4, '2020-08-02', 1, 2, 1),
(5, '2020-09-01', 1, 1, 10),
(6, '2020-09-01', 2, 2, 100),
(7, '2020-09-02', 1, 3, 30);

-- Solution Query (Filter for August 2020)
SELECT
    p.product_name,
    SUM(o.quantity) AS total_amount
FROM
    Orders o
JOIN
    Products p ON o.product_id = p.product_id
WHERE
    o.order_date >= '2020-08-01' AND o.order_date < '2020-09-01'
GROUP BY
    p.product_id, p.product_name
ORDER BY
    total_amount DESC, p.product_name;

/************************************************************/
/* 1336. Number of Transactions per Visit (MySQL 8.0+)      */
/************************************************************/
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Visits;

CREATE TABLE Visits (
    user_id INT,
    visit_date DATE,
    PRIMARY KEY (user_id, visit_date)
);

CREATE TABLE Transactions (
    user_id INT,
    transaction_date DATE,
    amount INT,
    PRIMARY KEY (user_id, transaction_date)
);

INSERT INTO Visits (user_id, visit_date) VALUES
(1, '2020-01-01'),
(2, '2020-01-02'),
(12, '2020-01-01'),
(19, '2020-01-03'),
(1, '2020-01-02'),
(2, '2020-01-03'),
(1, '2020-01-04'),
(7, '2020-01-11'),
(9, '2020-01-25'),
(99, '2020-01-25');

INSERT INTO Transactions (user_id, transaction_date, amount) VALUES
(1, '2020-01-02', 120),
(2, '2020-01-03', 220),
(7, '2020-01-11', 237),
(1, '2020-01-04', 100),
(1, '2020-01-04', 150);

-- Solution Query (Uses CTEs and UNION for histogram)
WITH MaxTransactions AS (
    -- Find the maximum number of transactions in a single visit
    SELECT IFNULL(MAX(transactions_count), 0) FROM (
        SELECT COUNT(*) AS transactions_count FROM Transactions
        GROUP BY user_id, transaction_date
    ) AS t
),
TransactionCounts AS (
    -- Count transactions per visit (user_id, visit_date)
    SELECT
        v.user_id,
        v.visit_date,
        COUNT(t.user_id) AS transactions_count
    FROM
        Visits v
    LEFT JOIN
        Transactions t ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
    GROUP BY
        v.user_id, v.visit_date
),
TransactionHistogram AS (
    -- Count the number of visits for each transaction count
    SELECT
        transactions_count,
        COUNT(transactions_count) AS visits_count
    FROM
        TransactionCounts
    GROUP BY
        transactions_count
),
NumberSeries AS (
    -- Generate a series of numbers from 0 up to MaxTransactions
    SELECT 0 AS transactions_count
    UNION ALL
    SELECT t.transactions_count + 1 FROM NumberSeries t JOIN MaxTransactions m ON t.transactions_count < m.`IFNULL(MAX(transactions_count), 0)`
)
SELECT
    ns.transactions_count,
    IFNULL(th.visits_count, 0) AS visits_count
FROM
    NumberSeries ns
LEFT JOIN
    TransactionHistogram th ON ns.transactions_count = th.transactions_count
ORDER BY
    ns.transactions_count;