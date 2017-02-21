--Lab 5

--1
SELECT agents.city
FROM Agents inner join orders on orders.aid = agents.aid
	    inner join customers on customers.cid = orders.cid
WHERE customers.cid = 'c006'
;

--2
SELECT DISTINCT o1.pid
FROM Orders o1 join orders o2 on o1.aid = o2.aid
            join customers on customers.cid = o2.cid
WHERE customers.city = 'Kyoto' AND o1.aid = o2.aid
ORDER BY o1.pid DESC
;

--3
SELECT name
FROM Customers 
WHERE cid not in (SELECT orders.cid
		  FROM Orders
		  )
;

--4
SELECT name
FROM Customers left outer join orders on orders.cid = customers.cid
WHERE orders.cid is NULL
;

--5
SELECT DISTINCT customers.name
FROM Customers join Orders on customers.cid = orders.cid
	       join Agents on orders.aid = agents.aid
WHERE customers.city = agents.city
;
		
--6
SELECT customers.name, agents.name, agents.city
FROM Customers join Agents on customers.city = agents.city
;

--7
SELECT customers.name, customers.city
FROM Customers
WHERE customers.city in (SELECT p.city
			 FROM Products p
		         GROUP BY p.city
			 ORDER BY count(p.pid) ASC
			 LIMIT 1
			 )
;	