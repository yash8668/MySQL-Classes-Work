use abc;
-- table 10. Reviews
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    ReviewDate DATE,
    Title VARCHAR(100),
    VerifiedPurchase BOOLEAN DEFAULT FALSE,
    HelpfulVotes INT DEFAULT 0,
    Status VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    on delete cascade
    on update cascade,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    on delete cascade
    on update cascade
);
INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'Excellent laptop, great performance!', '2025-07-10', 'Superb Laptop', TRUE, 15, 'Published'),
(2, 2, 2, 4, 'Decent for the price.', '2025-07-10', 'Value for Money', TRUE, 9, 'Published'),
(3, 3, 3, 5, 'Amazing phone!', '2025-07-10', 'iPhone Love', TRUE, 20, 'Published'),
(4, 4, 4, 4, 'Good features but a bit pricey.', '2025-07-10', 'Premium Experience', TRUE, 5, 'Published'),
(5, 5, 5, 3, 'Sound quality is okay.', '2025-07-10', 'Average Product', TRUE, 2, 'Pending'),
(6, 6, 6, 5, 'Excellent sound and bass!', '2025-07-10', 'Boom Boom', TRUE, 12, 'Published'),
(7, 7, 7, 2, 'Stopped working after a month.', '2025-07-10', 'Disappointed', TRUE, 1, 'Rejected'),
(8, 8, 8, 4, 'Nice and smooth.', '2025-07-10', 'Good Mouse', TRUE, 3, 'Published'),
(9, 9, 9, 4, 'Reliable network product.', '2025-07-10', 'Router Review', TRUE, 6, 'Published'),
(10, 10, 10, 5, 'Fast and compact.', '2025-07-10', 'Perfect HDD', TRUE, 10, 'Published');
 select*from Reviews;
 
 
 --  1. Arithmetic Operators
 SELECT ReviewID, HelpfulVotes, HelpfulVotes + 5 AS UpdatedHelpfulVotes
FROM Reviews;

SELECT ReviewID, HelpfulVotes, HelpfulVotes * 2 AS DoubleVotes
FROM Reviews;

SELECT ReviewID, HelpfulVotes, Rating, HelpfulVotes / Rating AS VotesPerStar
FROM Reviews;

SELECT ReviewID, Rating, Rating - 1 AS AdjustedRating
FROM Reviews;

SELECT * FROM Reviews
WHERE HelpfulVotes % 2 = 0 ;

SELECT * FROM Reviews
WHERE HelpfulVotes * 3 > 30;


select*from  Reviews ;



-- 2 Comparison Operators ( = , ! OR <> , < , > , <=, >= ,   LIKE  , NOT LIKE  ,  
select * from Reviews where helpfulvotes = 1;


select*from Reviews where helpfulvotes != 1 ;
select*from reviews where  helpfulvotes <>  20 ;

select *from  reviews  where rating > 3;
 
select *from  reviews  where rating < 3; 

select *from  reviews  where rating >= 3;

select *from  reviews  where rating <= 3;

select*from  reviews where ReviewText like ('S%')  limit 2;

select*from  reviews where ReviewText not like ('S%')  limit  9 ;



-- 3 Logical Operators ( AND , OR , NOT , XOR )  

select*from  reviews;


select *FROM REVIEWS  WHERE HELPFULVOTES  between  '10'  AND '20' ;

select*from reviews
where ( helpfulvotes > 5 OR rating > 4 )  ;

SELECT * FROM Reviews 
WHERE NOT Status = 'Published';
 

select* from reviews 
where ( Status = 'Published' AND  helpfulvotes > 5 ) OR RATING < 4 ;

-- 4 ASSIGMENT  OPERATORES (= , += , -= , *= , /= , %= , MOD , DIV )  


UPDATE Reviews
SET HelpfulVotes = 25
WHERE ReviewID = 1;

update reviews 
set HelpfulVotes = HelpfulVotes + 5
where reviewid ;

update reviews 
set  helpfulvotes =  helpfulvotes - 5  
where reviewid =  3 ;

update reviews
set helpfulvotes = helpfulvotes*5
where reviewid = 3;

update reviews 
set helpfulvotes = helpfulvotes / 5
where reviewid = 3 ;

update reviews 
set helpfulvotes = helpfulvotes % 3
where reviewid = 6 ; 

update reviews
set helpfulvotes  = helpfulvotes MOD 5  
 where  reviewid = 3 ; 
 
SELECT*FROM REVIEWS  ;


--  BITWISE  OPRATORS   (  & ,  | , ^  ,  ~  , << , >> ) 
  
SELECT ReviewID, HelpfulVotes
FROM Reviews
WHERE HelpfulVotes & 1 = 1;


SELECT ReviewID,HelpfulVotes,  (HelpfulVotes | 2) AS ModifiedVotes
FROM Reviews;

 SELECT ReviewID, HELPFULVOTES ,  HelpfulVotes ^ 1 AS FlipLSB FROM Reviews;

 SELECT ReviewID, HELPFULVOTES ,  ~ HelpfulVotes  AS YASH  FROM Reviews;

SELECT REVIEWID , HELPFULVOTES ,  HELPFULVOTES <<  3 FROM  REVIEWS ;

SELECT REVIEWID , HELPFULVOTES ,  HELPFULVOTES >>  3 FROM  REVIEWS ;

SELECT*FROM reviews;
  
-- 6. String Operators  (  CONCAT , || )   
SELECT ReviewID,TITLE , CONCAT(Title, ' - Rating: ', Rating) AS CONNECT_TWO_TABLES 
FROM Reviews;

 SELECT  REVIEWID , TITLE , RATING ,  TITLE || ' - RATING:  ' || RATING AS FullTitle
 FROM REVIEWS ; 
 
--  7. Other Operators (  IN , NOT IN ,  BETWEEN , NOT BETWEEN , IS NULL , IS NOT NULL , EXISTS , NOT EXISTS )
SELECT*FROM reviews 
WHERE RATING IN  ( 4,5)   ;  
 
 SELECT*FROM REVIEWS 
 WHERE RATING  NOT IN  ( 4, 5 ) ;
 
 SELECT*FROM reviews 
 WHERE HelpfulVotes BETWEEN 0 AND  8;  
  
  SELECT*FROM REVIEWS 
  WHERE HelpfulVotes NOT between 0  AND  8 ;
  

 SELECT * FROM REVIEWS where reviewtext IS NULL  ;
 
  SELECT * FROM REVIEWS where reviewtext IS not NULL  ;
  
  
  -- Clauses {Where, Distinct, From, Order By, Group By, Having}
  
   select*from reviews where rating = 5 ; 
   SELECT rating, COUNT(*) AS NumberOfreviews FROM reviews GROUP BY rating;
   select rating , count(*) asspecific_number_of_reviews from  reviews  group by rating having ( Rating > 3) ; 
   select rating , reviewid , productid  , title  from  reviews;
   select distinct reviewid from  reviews  ;
   select*from reviews   order by rating asc ; 
   
   
   --  limit (  or fetch or top ) 
   select * from reviews where ReviewID  limit 6   ;
  select *from  reviews  where reviewid limit 6 offset 2  ;
  
  
  select *from  reviews;
  SELECT*FROM customers;
  SELECT*FROM  products;
  -- joins (  inner join  , left join  , right join  ) 
  -- INNER JOIN
SELECT  customers.CUSTOMERID ,customers.FirstName, reviews.reviewtext
from customers
inner join reviews  on  customers.CustomerID= reviews.CustomerID ;
-- Right join- 
SELECT  customers.CUSTOMERID ,customers.FirstName, reviews.reviewtext
from  reviews
right join customers  on  customers.CustomerID= reviews.CustomerID ;
-- Left join  
SELECT  customers.CUSTOMERID ,customers.FirstName, reviews.reviewtext
from  reviews
left join customers on  customers.CustomerID= reviews.CustomerID ;

-- 9. UNION Clause

SELECT  reviewid , rating  from reviews where rating > 3  
UNION 
SELECT  reviewid , rating  from reviews where Rating = 2;

 select  customerid , firstname  ,  lastname ,  zipcode  from customers where  zipcode < 600000 
 union
 select CustomerID , firstname, lastname , zipcode  from customers  where  zipcode = '700001';
 
--  tables Alias
select customerid  from customers as customers_table ;
-- column alias 
select customerid as customer_id from  customers;

SELECT*FROM  products;
select p.productid , p.productname ,p.QuantityPerUnit from products p ;