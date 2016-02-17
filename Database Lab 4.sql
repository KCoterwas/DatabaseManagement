-- Lab 4
-- 1. Get the cities of agents booking an order for a customer whose cid whose cid is 'c002'.

SELECT city
FROM agents
WHERE aid in (SELECT aid
	      FROM orders
	      WHERE cid = 'c002');

-- 2. Get the ids of products ordered through any agent who take at least one order from a 
-- customer in Dallas, sorted by pid from highest to lowest. (This is not the same as asking 
-- for ids of products ordered by customers in Dallas.)

SELECT pid
FROM orders
WHERE aid IN (SELECT aid
              FROM orders
              WHERE cid IN (SELECT cid
       			    FROM customers
       			    WHERE city = 'Dallas'));

-- 3. Get the ids and names of customers who did not place an order through agent a01.

SELECT cid, name
FROM customers
WHERE cid NOT IN (SELECT cid
       	      	  FROM orders
     	      	  WHERE aid IN ('a01'));

-- 4. Get the ids of customers who ordered both product p01 and p07.

SELECT cid
FROM orders
WHERE pid IN (SELECT pid
       FROM products
       WHERE pid = 'p01' AND pid = 'p07');

-- 5. Get the ids of products not ordered by any customers who placed any order through agent
-- a07 in pid order from highest to lowest.

SELECT 
FROM 
WHERE

-- 6. Get the name, discounts, and city for all customers who place orders through agent a07
-- in pid order from highest to lowest.

SELECT 
FROM 
WHERE

-- 7. Get all customers who have the same discount as that of any customers in Dallas or London.

SELECT 
FROM 
WHERE

-- 8. ESSAY ON CHECK CONSTRAINTS