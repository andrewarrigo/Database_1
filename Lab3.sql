--1
SELECT ordNumber, totalUSD
FROM Orders;

--2
SELECT name, city
FROM Agents
WHERE name = 'Smith';

--3
SELECT pid, name, priceUSD
FROM Products
WHERE quantity>200100;

--4
SELECT name, city
FROM Customers
WHERE city =  'Duluth';

--5
SELECT name, city
FROM Agents
WHERE city<>'New York' AND city<>'Duluth';

--6
SELECT *
FROM Products
WHERE priceUSD>=1 AND city<>'Dallas' AND city<>'Duluth';

--7
SELECT *
FROM Orders
WHERE month = 'Feb' OR month = 'May';

--8
SELECT *
FROM Orders
WHERE month = 'Feb' AND totalUSD>=600;

--9
SELECT *
FROM Customers
WHERE customers.cid = 'c005';