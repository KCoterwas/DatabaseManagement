-- Kim Coterwas
-- Lab 6

-- 1. Display the name and city of customers who live in any city that makes the most 
--    different kinds of products. (There are two cities that make the most different
--    products. Return the name and city of customers from either one of those.)



-- 2. Display the names of products whose priceUSD is strictly above the average 
--    priceUSD, in reverse-alphabetical order.

SELECT name
FROM products
WHERE priceUSD > (SELECT Avg(priceUSD)
      		  FROM products)
ORDER BY name DESC;

-- 3. Display customer name, pid ordered, and the total for all orders, sorted by 
--    total from high to low.

SELECT c.name, o.pid, o.dollars
FROM orders o
INNER JOIN customers c ON c.cid = o.cid
ORDER BY o.dollars DESC;

-- 4. Display all customer names (in alphabetical order) and their total ordered, 
--    and nothing more. Use coalesce to avoid showing NULLs.



-- 5. Display the names of all customers who bought products from agents based in 
--    Tokyo along with the names of the products they ordered, and the names of the 
--    agents who sold it to them.



-- 6. Write a query to check the accuracy of the dollars column in the Orders table.
--    This means calculating Orders.dollars from data in other tables and comparing 
--    those values to the values in Orders.dollars. Display all rows in Orders where 
--    Orders.dollars is incorrect, if any.

SELECT *
FROM (SELECT o.*, o.qty*p.priceUSD*(1-(discount/100)) AS truedollars
      FROM orders o
      INNER JOIN products p on o.pid = p.pid
      INNER JOIN customers c on o.cid = c.cid) AS tmptable
WHERE dollars != truedollars

-- 7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give 
--    example queries in SQL to demonstrate. (Feel free to use the CAP2 database to 
--    make your points here.)