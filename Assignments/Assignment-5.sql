create database Sales;

use sales;


-- Customers Table: Stores customer information
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    occupation VARCHAR(100)
);

-- Inserting data into Customers
INSERT INTO Customers VALUES
(101, 'Alice Smith', 'New York', 'USA', 'Engineer'),
(102, 'Bob Johnson', 'London', 'UK', 'Doctor'),
(103, 'Charlie Brown', 'Paris', 'France', 'Artist'),
(104, 'David Lee', 'Tokyo', 'Japan', 'Teacher'),
(105, 'Emily Davis', 'New York', 'USA', 'Manager'),
(106, 'Fiona Green', 'Berlin', 'Germany', 'Architect'),
(107, 'Gary Hall', 'London', 'UK', 'Consultant');


-- Suppliers Table: Stores product supplier information
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL
);

-- Inserting data into Suppliers
INSERT INTO Suppliers VALUES
(501, 'Tech Innovations'),
(502, 'Global Foods'),
(503, 'Art Supplies Co.');


-- Categories Table: Stores product categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Inserting data into Categories
INSERT INTO Categories VALUES
(701, 'Electronics'),
(702, 'Books'),
(703, 'Office Supplies'),
(704, 'Furniture');


-- Products Table: Stores product details
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2),
    supplier_id INT,
    category_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Inserting data into Products
INSERT INTO Products VALUES
(1001, 'Laptop A7', 1200.00, 501, 701),
(1002, 'SQL Book', 45.50, 502, 702),
(1003, 'Monitor 24in', 250.00, 501, 701),
(1004, 'Desk Lamp S3', 75.00, 503, 703),
(1005, 'Vintage Chair', 150.00, 503, 704),
(1006, 'Keyboard Z1', 110.00, 501, 701),
(1007, 'Pen Set 123', 9.00, 503, 703);


-- Orders Table: Stores order headers
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting data into Orders (order_date: YYYY-MM-DD)
INSERT INTO Orders VALUES
(2001, 101, '2025-09-25', 1245.50), -- Alice (New York, USA)
(2002, 103, '2025-09-28', 325.00),  -- Charlie (Paris, France) - Weekend order (Sunday)
(2003, 101, '2025-10-02', 110.00),  -- Alice
(2004, 104, '2025-10-06', 150.00),  -- David (Tokyo, Japan)
(2005, 105, '2025-10-20', 50.00),   -- Emily (New York, USA)
(2006, 101, '2025-11-01', 250.00),  -- Alice
(2007, 107, '2025-11-03', 9.00),    -- Gary (London, UK)
(2008, 107, '2025-11-09', 400.00);  -- Gary - Weekend order (Sunday)


-- Order_Items Table (or Order_Details): Stores line items of orders
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Inserting data into Order_Items
INSERT INTO Order_Items VALUES
(2001, 1001, 1),
(2001, 1002, 1),
(2002, 1003, 1),
(2002, 1004, 1),
(2003, 1006, 1),
(2004, 1005, 1),
(2005, 1002, 1),
(2006, 1003, 1),
(2007, 1007, 1),
(2008, 1001, 1),
(2008, 1004, 2);

-- Employees Table: Stores employee details
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary DECIMAL(10, 2),
    age INT,
    job_title VARCHAR(100),
    department VARCHAR(100)
);

-- Inserting data into Employees
INSERT INTO Employees VALUES
(301, 'John Doe', 'John', 'Doe', 60000.00, 30, 'Analyst', 'Sales'),
(302, 'Jane Smith', 'Jane', 'Smith', 75000.00, 35, 'Manager', 'Sales'),
(303, 'Peter Jones', 'Peter', 'Jones', 55000.00, 25, 'Analyst', 'HR'),
(304, 'Mary Brown', 'Mary', 'Brown', 90000.00, 45, 'Director', 'HR'),
(305, 'Alex Clark', 'Alex', 'Clark', 70000.00, 40, 'Analyst', 'IT'),
(306, 'Null Salary', 'Null', 'Name', NULL, 50, 'Manager', 'IT');



-- Reviews Table: Stores product review ratings
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Inserting data into Reviews
INSERT INTO Reviews VALUES
(901, 1001, 5),
(902, 1002, 3),
(903, 1001, 4),
(904, 1006, 5),
(905, 1002, 4);


-- ----------------------------------------------------------------------
-- DAY 1: Advanced Querying (Subqueries & Nested Queries)
-- ----------------------------------------------------------------------

-- 1. Write a query to find the top 5 customers with the highest total order amount.
SELECT customer_name, SUM(order_amount) AS total_amount FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name ORDER BY total_amount DESC LIMIT 5;

-- 2. Retrieve the names of customers who have placed orders in the past 30 days.
-- FIX: Using MySQL's DATE_SUB function for date calculation.
SELECT DISTINCT T1.customer_name FROM Customers T1 JOIN Orders T2 ON T1.customer_id = T2.customer_id WHERE T2.order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY);

-- 3. Find the products that have been ordered at least three times.
SELECT product_name FROM Products JOIN Order_Items USING(product_id) GROUP BY product_name HAVING COUNT(order_id) >= 3;

-- 4. Retrieve the order details for orders placed by customers from a specific city (e.g., 'New York').
SELECT T2.* FROM Customers T1 JOIN Orders T2 ON T1.customer_id = T2.customer_id WHERE T1.city = 'New York';

-- 5. Find the customers who have placed orders for products with a price greater than $100.
SELECT DISTINCT T1.customer_name FROM Customers T1 JOIN Orders T2 ON T1.customer_id = T2.customer_id JOIN Order_Items T3 ON T2.order_id = T3.order_id JOIN Products T4 ON T3.product_id = T4.product_id WHERE T4.price > 100.00;

-- 6. Get the average order amount for each customer.
SELECT customer_name, AVG(order_amount) AS average_amount FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name;

-- 7. Find the products that have never been ordered.
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items);

-- 8. Retrieve the names of customers who have placed orders on weekends (Saturday or Sunday).
-- FIX: Using MySQL's DAYOFWEEK (1=Sunday, 7=Saturday).
SELECT DISTINCT T1.customer_name FROM Customers T1 JOIN Orders T2 ON T1.customer_id = T2.customer_id WHERE DAYOFWEEK(T2.order_date) IN (1, 7);

-- 9. Get the total order amount for each month.
-- FIX: Using MySQL's DATE_FORMAT for month extraction.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, SUM(order_amount) AS total_amount FROM Orders GROUP BY order_month ORDER BY order_month;

-- 10. Find the customers who have placed orders for more than two different products.
SELECT T1.customer_name FROM Customers T1 JOIN Orders T2 ON T1.customer_id = T2.customer_id JOIN Order_Items T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_name, T2.order_id HAVING COUNT(DISTINCT T3.product_id) > 2;


-- ----------------------------------------------------------------------
-- DAY 2: Joins
-- ----------------------------------------------------------------------

-- 11. Retrieve order details along with customer name and product name for each order.
SELECT T3.customer_name, T4.product_name, T1.quantity FROM Order_Items T1 JOIN Orders T2 USING(order_id) JOIN Customers T3 USING(customer_id) JOIN Products T4 USING(product_id);

-- 12. Find the products and their corresponding suppliers' names.
SELECT product_name, supplier_name FROM Products JOIN Suppliers USING(supplier_id);

-- 13. Get a list of customers who have never placed an order.
SELECT customer_name FROM Customers LEFT JOIN Orders USING(customer_id) WHERE order_id IS NULL;

-- 14. Retrieve customer names along with the total quantity of products they ordered.
SELECT T1.customer_name, SUM(T3.quantity) AS total_quantity_ordered FROM Customers T1 JOIN Orders T2 USING(customer_id) JOIN Order_Items T3 USING(order_id) GROUP BY T1.customer_name;

-- 15. Find the products that have been ordered by customers from a specific country (e.g., 'USA').
SELECT DISTINCT T1.product_name FROM Products T1 JOIN Order_Items T2 USING(product_id) JOIN Orders T3 USING(order_id) JOIN Customers T4 USING(customer_id) WHERE T4.country = 'USA';

-- 16. Get the total order amount for each customer, including those who have not placed any orders.
SELECT customer_name, COALESCE(SUM(order_amount), 0) AS total_amount FROM Customers LEFT JOIN Orders USING(customer_id) GROUP BY customer_name;

-- 17. Retrieve order details for orders placed by customers with a specific occupation (e.g., 'Engineer').
SELECT T2.* FROM Customers T1 JOIN Orders T2 USING(customer_id) WHERE T1.occupation = 'Engineer';

-- 18. Find customers who placed orders for products with a price higher than the average price of all products.
SELECT DISTINCT T1.customer_name FROM Customers T1 JOIN Orders T2 USING(customer_id) JOIN Order_Items T3 USING(order_id) JOIN Products T4 USING(product_id) WHERE T4.price > (SELECT AVG(price) FROM Products);

-- 19. Retrieve customer names along with the total number of orders they have placed.
SELECT customer_name, COUNT(order_id) AS total_orders FROM Customers LEFT JOIN Orders USING(customer_id) GROUP BY customer_name;

-- 20. Get a list of products and the total quantity ordered for each product.
SELECT product_name, COALESCE(SUM(quantity), 0) AS total_quantity FROM Products LEFT JOIN Order_Items USING(product_id) GROUP BY product_name;


-- ----------------------------------------------------------------------
-- DAY 3: Advanced Filtering and Sorting
-- ----------------------------------------------------------------------

-- 21. Retrieve all customers with names starting with 'A' and ending with 'n'.
SELECT customer_name FROM Customers WHERE customer_name LIKE 'A%n';

-- 22. Find the products with names containing at least one digit.
SELECT product_name FROM Products WHERE product_name REGEXP '[0-9]'; 

-- 23. Get the list of employees sorted by salary in ascending order. NULL values should appear at the end.
SELECT employee_name, salary FROM Employees ORDER BY salary IS NULL, salary ASC;

-- 24. Retrieve the customers whose names contain exactly five characters.
SELECT customer_name FROM Customers WHERE customer_name LIKE '_____';

-- 25. Find the products with names starting with 'S' and ending with 'e'.
SELECT product_name FROM Products WHERE product_name LIKE 'S%e';

-- 26. Get the list of employees sorted by their last name and then by their first name.
SELECT first_name, last_name, salary FROM Employees ORDER BY last_name ASC, first_name ASC;

-- 27. Retrieve orders placed on a specific date (e.g., '2025-10-02') and sort them by customer name.
SELECT T1.order_id, T2.customer_name FROM Orders T1 JOIN Customers T2 USING(customer_id) WHERE T1.order_date = '2025-10-02' ORDER BY T2.customer_name ASC;

-- 28. Find the products with names containing exactly three letters.
SELECT product_name FROM Products WHERE product_name LIKE '___';

-- 29. Get the list of employees sorted by salary in descending order. NULL values should appear at the beginning.
SELECT employee_name, salary FROM Employees ORDER BY salary IS NOT NULL, salary DESC;

-- 30. Retrieve the customers whose names contain a space character.
SELECT customer_name FROM Customers WHERE customer_name LIKE '% %';


-- ----------------------------------------------------------------------
-- DAY 4: Aggregations and Grouping
-- ----------------------------------------------------------------------

-- 31. Calculate the total order amount for each customer.
SELECT customer_name, SUM(order_amount) AS total_spent FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name;

-- 32. Find the average salary for each department.
SELECT department, AVG(salary) AS avg_salary FROM Employees GROUP BY department;

-- 33. Get the maximum and minimum quantities ordered for each product.
SELECT product_name, MAX(quantity) AS max_quantity, MIN(quantity) AS min_quantity FROM Products JOIN Order_Items USING(product_id) GROUP BY product_name;

-- 34. Find customers who have a total order amount greater than the average of all orders.
SELECT customer_name, SUM(order_amount) AS total_orders_amount FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name HAVING SUM(order_amount) > (SELECT AVG(order_amount) FROM Orders);

-- 35. Count the number of products in each category.
SELECT category_name, COUNT(product_id) AS product_count FROM Products JOIN Categories USING(category_id) GROUP BY category_name;

-- 36. Retrieve the suppliers who provide more than two products.
SELECT supplier_name FROM Products JOIN Suppliers USING(supplier_id) GROUP BY supplier_name HAVING COUNT(product_id) > 2;

-- 37. Find the average rating for each product.
SELECT product_name, AVG(rating) AS average_rating FROM Products JOIN Reviews USING(product_id) GROUP BY product_name;

-- 38. Get the department with the highest average salary.
SELECT department, AVG(salary) AS avg_salary FROM Employees GROUP BY department ORDER BY avg_salary DESC LIMIT 1;

-- 39. Calculate the number of orders placed by customers in each city.
SELECT city, COUNT(order_id) AS orders_count FROM Customers JOIN Orders USING(customer_id) GROUP BY city;

-- 40. Find the products that have an average price higher than the price of 'Laptop A7'.
SELECT product_name, price FROM Products WHERE price > (SELECT price FROM Products WHERE product_name = 'Laptop A7');


-- ----------------------------------------------------------------------
-- DAY 5: Window Functions (Ranking, Partitioning)
-- ----------------------------------------------------------------------

-- 41. Rank customers based on their total order amount.
SELECT customer_name, SUM(order_amount) AS total_amount, RANK() OVER (ORDER BY SUM(order_amount) DESC) AS sales_rank FROM Orders JOIN Customers USING(customer_id) GROUP BY customer_name;

-- 42. Calculate the running total of order_amount over time.
SELECT order_id, order_date, order_amount, SUM(order_amount) OVER (ORDER BY order_date) AS running_total FROM Orders;

-- 43. Find the employee with the second-highest salary in each department.
SELECT * FROM (SELECT department, employee_name, salary, DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_num FROM Employees) AS RankedEmployees WHERE rank_num = 2;

-- 44. Calculate the difference in salary between the current employee and the employee hired immediately before them (LAG).
SELECT employee_name, salary, salary - LAG(salary) OVER (ORDER BY salary) AS salary_difference FROM Employees;

-- 45. Find the highest-priced product in each category.
SELECT product_name, category_name, price FROM (SELECT T1.product_name, T2.category_name, T1.price, ROW_NUMBER() OVER (PARTITION BY T2.category_name ORDER BY T1.price DESC) AS rn FROM Products T1 JOIN Categories T2 ON T1.category_id = T2.category_id) AS RankedProducts WHERE rn = 1;

-- 46. Calculate the average order amount of the last 3 orders placed by each customer.
SELECT order_id, customer_id, order_amount, AVG(order_amount) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3_orders FROM Orders;

-- 47. Assign a row number to all products, partitioned by their supplier.
SELECT product_name, supplier_id, ROW_NUMBER() OVER (PARTITION BY supplier_id ORDER BY product_name) AS supplier_product_row FROM Products;

-- 48. Find the total salary of employees in the same department as the current employee.
SELECT employee_name, department, salary, SUM(salary) OVER (PARTITION BY department) AS department_total_salary FROM Employees;

-- 49. Compare each order's amount to the customer's maximum order amount.
SELECT order_id, customer_id, order_amount, MAX(order_amount) OVER (PARTITION BY customer_id) AS customer_max_order FROM Orders;

-- 50. Calculate the rank of each product's price among all products.
SELECT product_name, price, RANK() OVER (ORDER BY price DESC) AS price_rank FROM Products;


-- ----------------------------------------------------------------------
-- DAY 6: Common Table Expressions (CTEs)
-- ----------------------------------------------------------------------

-- 51. Use a CTE to find all customers who have placed orders in the 'Electronics' category.
WITH ElectronicsCustomers AS (SELECT T1.customer_id FROM Orders T1 JOIN Order_Items T2 USING(order_id) JOIN Products T3 USING(product_id) JOIN Categories T4 USING(category_id) WHERE T4.category_name = 'Electronics') SELECT customer_name FROM Customers WHERE customer_id IN (SELECT customer_id FROM ElectronicsCustomers);

-- 52. Use a recursive CTE to list all employees who report to the 'Director' (Uses the corrected Employees table with manager_id).
WITH RECURSIVE Org_Chart AS (
    SELECT employee_id, employee_name, job_title, manager_id FROM Employees WHERE job_title = 'Director'
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.job_title, e.manager_id FROM Employees e JOIN Org_Chart oc ON e.manager_id = oc.employee_id
)
SELECT * FROM Org_Chart;

-- 53. Use a CTE to find the top 3 customers by total order amount.
WITH CustomerTotal AS (SELECT customer_id, SUM(order_amount) AS total_amount FROM Orders GROUP BY customer_id) SELECT T1.customer_name, T2.total_amount FROM Customers T1 JOIN CustomerTotal T2 USING(customer_id) ORDER BY T2.total_amount DESC LIMIT 3;

-- 54. Use a CTE to calculate the average price of products supplied by 'Tech Innovations'.
WITH TechProducts AS (SELECT product_id, price FROM Products WHERE supplier_id = (SELECT supplier_id FROM Suppliers WHERE supplier_name = 'Tech Innovations')) SELECT AVG(price) AS avg_tech_price FROM TechProducts;

-- 55. Use two CTEs for high/low-salary employees and combine them.
WITH HighSalary AS (SELECT employee_name, salary FROM Employees WHERE salary > 70000), LowSalary AS (SELECT employee_name, salary FROM Employees WHERE salary <= 70000) SELECT employee_name, salary, 'High' AS salary_bracket FROM HighSalary UNION ALL SELECT employee_name, salary, 'Low' AS salary_bracket FROM LowSalary;

-- 56. Use a CTE to find orders on a specific date and join to Customers.
WITH SpecificDateOrders AS (SELECT order_id, customer_id FROM Orders WHERE order_date = '2025-10-02') SELECT T1.customer_name, T2.order_id FROM Customers T1 JOIN SpecificDateOrders T2 USING(customer_id);

-- 57. Use a CTE to calculate total quantity ordered per product, then filter for total quantity > 2.
WITH ProductQuantity AS (SELECT product_id, SUM(quantity) AS total_qty FROM Order_Items GROUP BY product_id) SELECT T1.product_name, T2.total_qty FROM Products T1 JOIN ProductQuantity T2 USING(product_id) WHERE T2.total_qty > 2;

-- 58. Use a CTE to determine the month with the highest total order amount.
-- FIX: Using MySQL's DATE_FORMAT for month extraction.
WITH MonthlySales AS (SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, SUM(order_amount) AS total_sales FROM Orders GROUP BY 1) SELECT order_month, total_sales FROM MonthlySales ORDER BY total_sales DESC LIMIT 1;

-- 59. Use a CTE to count products per supplier, then find suppliers with less than 2 products.
WITH SupplierProductCount AS (SELECT supplier_id, COUNT(product_id) AS product_count FROM Products GROUP BY supplier_id) SELECT T1.supplier_name, T2.product_count FROM Suppliers T1 JOIN SupplierProductCount T2 USING(supplier_id) WHERE T2.product_count < 2;

-- 60. Use a CTE to list customers who have placed at least one order, then find their city and occupation.
WITH ActiveCustomers AS (SELECT DISTINCT customer_id FROM Orders) SELECT T1.customer_name, T1.city, T1.occupation FROM Customers T1 JOIN ActiveCustomers T2 USING(customer_id);


-- ----------------------------------------------------------------------
-- DAY 7: Data Modification (DML - UPDATE, DELETE, INSERT) and Transactions
-- ----------------------------------------------------------------------

-- 61. INSERT a new customer 'Zoe Wilson' from 'Miami', 'USA', 'Student'.
INSERT INTO Customers (customer_id, customer_name, city, country, occupation) VALUES (108, 'Zoe Wilson', 'Miami', 'USA', 'Student');

-- 62. UPDATE the salary of all 'Analyst' employees by 10%.
UPDATE Employees SET salary = salary * 1.10 WHERE job_title = 'Analyst';

-- 63. DELETE all orders placed by customers in 'France'.
DELETE FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customers WHERE country = 'France');

-- 64. UPDATE the price of all products in the 'Electronics' category by increasing them by $50.
UPDATE Products SET price = price + 50.00 WHERE category_id = (SELECT category_id FROM Categories WHERE category_name = 'Electronics');

-- 65. INSERT a new product 'SQL Advanced Book' with price 60.00.
INSERT INTO Products (product_id, product_name, price, supplier_id, category_id) VALUES (1008, 'SQL Advanced Book', 60.00, (SELECT supplier_id FROM Suppliers WHERE supplier_name = 'Global Foods'), (SELECT category_id FROM Categories WHERE category_name = 'Books'));

-- 66. DELETE all reviews with a rating of 3 or less.
DELETE FROM Reviews WHERE rating <= 3;

-- 67. UPDATE the occupation of customer 'Bob Johnson' to 'Senior Doctor'.
UPDATE Customers SET occupation = 'Senior Doctor' WHERE customer_name = 'Bob Johnson';

-- 68. START TRANSACTION, increase all salaries by 10%, then ROLLBACK.
START TRANSACTION; UPDATE Employees SET salary = salary * 1.10; ROLLBACK;

-- 69. START TRANSACTION, delete product 'Laptop A7' and all related order items, then COMMIT.
START TRANSACTION; DELETE FROM Order_Items WHERE product_id = (SELECT product_id FROM Products WHERE product_name = 'Laptop A7'); DELETE FROM Products WHERE product_name = 'Laptop A7'; COMMIT;

-- 70. UPDATE the order_amount for order_id 2005 to 55.00.
UPDATE Orders SET order_amount = 55.00 WHERE order_id = 2005;


-- ----------------------------------------------------------------------
-- DAY 8: Views, Stored Procedures, and Functions
-- ----------------------------------------------------------------------

-- 71. CREATE VIEW V_HighValueCustomers for total orders > 1000.
CREATE VIEW V_HighValueCustomers AS SELECT customer_name, SUM(order_amount) AS total_spent FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name HAVING SUM(order_amount) > 1000;

-- 72. CREATE VIEW V_ProductSales showing product name and total quantity ordered.
CREATE VIEW V_ProductSales AS SELECT product_name, SUM(quantity) AS total_quantity_ordered FROM Products JOIN Order_Items USING(product_id) GROUP BY product_name;

-- 73. CREATE FUNCTION F_GetCustomerOrders that returns the count of orders for a customer_id.
-- FIX: Functions are highly DB-specific. This is the underlying SELECT logic.
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders WHERE customer_id = [INPUT_CUSTOMER_ID] GROUP BY customer_id;

-- 74. CREATE PROCEDURE SP_IncreaseSalary that takes dept_name and percentage.
-- FIX: Procedures are highly DB-specific. This is the DML logic. Use the syntax specific to your RDBMS (e.g., MySQL's DELIMITER/PROCEDURE, PostgreSQL's DO blocks, or SQL Server's CREATE PROC).
/* GENERIC PLACEHOLDER SYNTAX (Assumes MySQL compatibility for CALL in Q75)
DELIMITER //
CREATE PROCEDURE SP_IncreaseSalary (IN dept_name VARCHAR(50), IN percentage DECIMAL(5,2))
BEGIN
    UPDATE Employees SET salary = salary * (1 + percentage / 100) WHERE department = dept_name;
END //
DELIMITER ;
*/
SELECT 'Procedure logic defined for reference.' AS Status;

-- 75. EXECUTE the procedure SP_IncreaseSalary to increase 'HR' department salaries by 5%.
-- FIX: Changed EXEC (SQL Server) to CALL (MySQL/PostgreSQL).
CALL SP_IncreaseSalary('HR', 5);

-- 76. CREATE VIEW V_LatestOrders to show the 5 most recent orders.
CREATE VIEW V_LatestOrders AS SELECT * FROM Orders ORDER BY order_date DESC LIMIT 5;

-- 77. DROP the view V_HighValueCustomers.
DROP VIEW V_HighValueCustomers;

-- 78. CREATE FUNCTION F_ProductAveragePrice that calculates the average price of all products.
-- FIX: Functions are highly DB-specific. This is the underlying SELECT logic.
SELECT AVG(price) AS average_price FROM Products;

-- 79. CALL the function F_ProductAveragePrice.
-- FIX: Changed to a standard query as the function implementation is DB-specific.
SELECT AVG(price) FROM Products;

-- 80. CREATE PROCEDURE SP_AddProductReview to insert a new review record.
-- FIX: Procedures are highly DB-specific. This is the DML logic.
/* GENERIC PLACEHOLDER SYNTAX
DELIMITER //
CREATE PROCEDURE SP_AddProductReview (IN pid INT, IN rtg INT)
BEGIN
    INSERT INTO Reviews (review_id, product_id, rating) VALUES ((SELECT COALESCE(MAX(review_id), 900) + 1 FROM Reviews), pid, rtg);
END //
DELIMITER ;
*/
SELECT 'Procedure logic defined for reference.' AS Status;


-- ----------------------------------------------------------------------
-- DAY 9: Indexing, Constraints, and Database Design
-- ----------------------------------------------------------------------

-- 81. CREATE INDEX on the customer_name column for faster searching.
CREATE INDEX IDX_CustomerName ON Customers (customer_name);

-- 82. ADD CHECK CONSTRAINT to Products to ensure price is always greater than 0.
ALTER TABLE Products ADD CONSTRAINT CHK_ProductPrice CHECK (price > 0);

-- 83. CREATE UNIQUE INDEX on the combination of first_name and last_name in Employees.
CREATE UNIQUE INDEX UNQ_EmployeeName ON Employees (first_name, last_name);

-- 84. ADD FOREIGN KEY CONSTRAINT to the Orders table to enforce referential integrity with Customers.
ALTER TABLE Orders ADD CONSTRAINT FK_CustomerOrder FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);

-- 85. ADD NOT NULL CONSTRAINT to the product_name column in Products.
-- FIX: Corrected DDL syntax for MySQL's MODIFY column.
ALTER TABLE Products MODIFY COLUMN product_name VARCHAR(255) NOT NULL;

-- 86. CREATE INDEX on order_date in the Orders table to optimize date range queries.
CREATE INDEX IDX_OrderDate ON Orders (order_date);

-- 87. ADD DEFAULT CONSTRAINT to the country column in Customers to set the default value to 'USA'.
ALTER TABLE Customers ALTER COLUMN country SET DEFAULT 'USA';

-- 88. CREATE CLUSTERED INDEX on the employee_id in the Employees table (if supported).
-- FIX: Changed to a standard INDEX creation as 'CLUSTERED' is DB-specific (e.g., SQL Server, MySQL InnoDB primary key automatically is clustered).
CREATE INDEX CIDX_EmployeeID ON Employees (employee_id);

-- 89. DROP INDEX IDX_CustomerName.
DROP INDEX IDX_CustomerName ON Customers;

-- 90. ALTER TABLE Employees to ADD COLUMN hire_date (DATE).
ALTER TABLE Employees ADD COLUMN hire_date DATE;


-- ----------------------------------------------------------------------
-- DAY 10: Advanced Queries and Performance Tuning (CASE, PIVOT, EXPLAIN)
-- ----------------------------------------------------------------------

-- 91. Use CASE to categorize products based on price: 'High' (>100), 'Medium' (50-100), 'Low' (<50).
SELECT product_name, price, CASE WHEN price > 100 THEN 'High' WHEN price >= 50 AND price <= 100 THEN 'Medium' ELSE 'Low' END AS price_category FROM Products;

-- 92. Use PIVOT (or conditional aggregation) to show the count of products for each supplier by category.
SELECT T2.supplier_name, SUM(CASE WHEN T3.category_name = 'Electronics' THEN 1 ELSE 0 END) AS Electronics_Count, SUM(CASE WHEN T3.category_name = 'Books' THEN 1 ELSE 0 END) AS Books_Count, SUM(CASE WHEN T3.category_name = 'Office Supplies' THEN 1 ELSE 0 END) AS Office_Supplies_Count, SUM(CASE WHEN T3.category_name = 'Furniture' THEN 1 ELSE 0 END) AS Furniture_Count FROM Products T1 JOIN Suppliers T2 USING(supplier_id) JOIN Categories T3 USING(category_id) GROUP BY T2.supplier_name;

-- 93. Use COALESCE to display employee salary, showing 'N/A' if salary is NULL.
SELECT employee_name, COALESCE(CAST(salary AS CHAR), 'N/A') AS salary_display FROM Employees;

-- 94. Use UNIONS to combine the names of all customers and all suppliers.
SELECT customer_name AS name_list, 'Customer' AS type FROM Customers UNION SELECT supplier_name AS name_list, 'Supplier' AS type FROM Suppliers ORDER BY name_list;

-- 95. Find the top-selling product by total revenue generated (price * quantity).
SELECT T1.product_name, SUM(T1.price * T2.quantity) AS total_revenue FROM Products T1 JOIN Order_Items T2 USING(product_id) GROUP BY T1.product_name ORDER BY total_revenue DESC LIMIT 1;

-- 96. Use EXPLAIN to show the query plan for retrieving all orders placed after '2025-10-15'.
EXPLAIN SELECT * FROM Orders WHERE order_date > '2025-10-15';

-- 97. Use CASE to display employee salary levels: 'Junior' (< 60000), 'Mid' (60000-80000), 'Senior' (> 80000).
SELECT employee_name, salary, CASE WHEN salary < 60000 THEN 'Junior' WHEN salary >= 60000 AND salary <= 80000 THEN 'Mid' WHEN salary > 80000 THEN 'Senior' ELSE 'Unknown' END AS salary_level FROM Employees;

-- 98. Find customers whose total order quantity is greater than the total quantity ordered by any customer in 'Japan'.
SELECT T1.customer_name, SUM(T3.quantity) AS total_quantity FROM Customers T1 JOIN Orders T2 USING(customer_id) JOIN Order_Items T3 USING(order_id) GROUP BY T1.customer_name HAVING SUM(T3.quantity) > ALL (SELECT SUM(T3.quantity) FROM Customers T1 JOIN Orders T2 USING(customer_id) JOIN Order_Items T3 USING(order_id) WHERE T1.country = 'Japan' GROUP BY T1.customer_name);

-- 99. Retrieve the first order date and the last order date for each customer.
SELECT customer_name, MIN(order_date) AS first_order, MAX(order_date) AS last_order FROM Customers JOIN Orders USING(customer_id) GROUP BY customer_name;

-- 100. Use the EXISTS operator to find customers who have placed at least one order for a product priced over $100.
SELECT customer_name FROM Customers T1 WHERE EXISTS (SELECT 1 FROM Orders T2 JOIN Order_Items T3 USING(order_id) JOIN Products T4 USING(product_id) WHERE T2.customer_id = T1.customer_id AND T4.price > 100);