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
       			    WHERE city = 'Dallas'))
ORDER BY pid DESC;

-- 3. Get the ids and names of customers who did not place an order through agent a01.

SELECT cid, name
FROM customers
WHERE cid NOT IN (SELECT cid
       	      	  FROM orders
     	      	  WHERE aid IN ('a01'));

-- 4. Get the ids of customers who ordered both product p01 and p07.

SELECT cid
FROM customers
WHERE cid IN (SELECT cid
      	      FROM orders
      	      WHERE pid IN ('p01') 
                AND cid IN (SELECT cid
      	      				      FROM orders
      	    				        WHERE pid IN ('p07'))); 

-- there were two missing parenthesis here!!!!

-- 5. Get the ids of products not ordered by any customers who placed any order through agent
-- a07 in pid order from highest to lowest.

SELECT pid
FROM orders
WHERE cid NOT IN (SELECT cid
	          FROM orders
	          WHERE aid IN ('a07'))   
ORDER BY pid DESC;

-- there was a semicolon here!!!

-- 6. Get the name, discounts, and city for all customers who place orders through agents in
-- London or New York.

SELECT name, discount, city
FROM customers
WHERE cid IN (SELECT cid
	      FROM orders
	      WHERE aid IN (SELECT aid
		            FROM agents
		            WHERE city IN ('London', 'New York')));

-- 7. Get all customers who have the same discount as that of any customers in Dallas or London.

SELECT cid
FROM customers
WHERE discount IN (SELECT discount
	           FROM customers
	           WHERE city IN ('Dallas', 'London'));  -- there was a missing parenthesis here!!!!

-- 8. Check constraints are limitations put into the database to specify only certain entries that 
-- can be entered into the database. These are good for making sure there is consistency within
-- the database when checking for a matching value within an entity. A good example of a check constraint
-- would be the use of gender. Limiting the entries to only male or female is a valid and realistic
-- restriction for a database. A bad example of a check constraint would be names. Limiting the entries
-- to a few names is unrealistic, for it is highly unlikely for people to share the same name. 
