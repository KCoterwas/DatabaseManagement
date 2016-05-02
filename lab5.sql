--Kim Coterwas
--Lab 5

--1. Show the cities of agents booking an order for a customer whose id is 'c002'. 
--   Use joins; no subqueries.

SELECT a.city
FROM agents a, orders o
WHERE a.aid = o.aid
AND o.cid = 'c002';

--2. Show the ids of products ordered through any agent who makes at least one order
--   for a customer in Dallas, sorted by pid from highest to lowest. Use joins; no subqueries

SELECT DISTINCT o.pid
FROM orders o, customers c
WHERE o.cid = c.cid
AND c.city = 'Dallas'
ORDER BY pid DESC;

--3. Show the names of customers who have never placed an order. Use a subquery.

SELECT name
FROM customers
WHERE cid NOT IN (SELECT cid
		  FROM orders);

--4. Show the names of customers who have never placed an order. Use an outer join.

SELECT c.name
FROM customers c
LEFT OUTER JOIN orders o ON c.cid = o.cid
WHERE o.ordno IS NULL;

--5. Show the names of customers who placed at least one order through an agent in their
--   own city, along with those agent(s') names.

SELECT DISTINCT c.name, a.name
FROM orders o
INNER JOIN agents a ON o.aid = a.aid
INNER JOIN customers c ON o.cid = c.cid
WHERE c.city = a.city;


--6. Show the names of customers and agents living in the same city, along with the name 
--   of the shared city, regardless of whether or not the customer has ever placed an order
--   with that agent.

SELECT c.name, a.name, c.city
FROM customers c, agents a
WHERE c.city = a.city;

--7. Show the name and city of customers who live in the city that makes the fewest 
--   different kinds of products (Hint: Use count and group by on the Products table.)

SELECT c.name, c.city
FROM customers c
WHERE c.city IN (SELECT city
		 FROM products
		 GROUP BY city
		 ORDER BY count(pid) ASC
		 LIMIT 1);