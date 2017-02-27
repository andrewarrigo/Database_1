--1
SELECT name, city
FROM Customers
WHERE customers.city in (SELECT city
			 FROM Products p
			 GROUP BY p.city
			 ORDER BY count(*) DESC
			 LIMIT 1
			)
;	

--2
 SELECT name
 FROM Products
 WHERE priceUSD < (SELECT AVG(priceUSD)
                   FROM products
                  )
 ORDER BY name DESC
 ;

--3
  SELECT customers.name, orders.pid, SUM(totalUSD) AS totalDollars
 FROM Customers, Orders 
 WHERE customers.cid = orders.cid
 GROUP BY customers.name, orders.pid
 ORDER BY totalDollars ASC 
 ;

--4
SELECT customers.name, COALESCE(SUM(totalUSD), '0.00') AS SUMtotalDollars
FROM Customers left outer join Orders on customers.cid = orders.cid
GROUP BY customers.name, orders.cid
ORDER BY customers.name ASC
;

--5

 SELECT customers.name, products.name, agents.name
 FROM Customers, Orders, Products, Agents
 WHERE customers.cid = orders.cid
   AND orders.aid = agents.aid
   AND orders.pid = products.pid
   AND agents.city = 'Newark'
 ;

--6
SELECT o.*, CheckDollars_totalUSD AS "CorrectTotalUSD" 
FROM Orders o, (SELECT o.ordnumber, c.discount, p.priceUSD, o.qty, 
		     ((o.qty * p.priceUSD) - (o.qty * p.priceUSD * (c.discount/100))) AS CheckDollars_totalUSD
		FROM Customers c, Orders o, Products p
		WHERE o.cid = c.cid
		AND o.pid = p.pid 
	       ) chck
WHERE chck.ordnumber = o.ordnumber
AND CheckDollars_totalUSD != o.totalUSD 
; 

--7
In SQL a left outer join will show all rows on the left table even if there are no matching columns on the right table. A right outer join will show all rows of a table on the right side of the outer join even if no rows on the left table match. As said in class, a good use for outer joins would be for seeing nurses who are not with paired with patients. For example, in Lab 5, question 4 I used an outer join to show customers who have never placed an order:

SELECT name
FROM Customers left outer join orders on orders.cid = customers.cid
WHERE orders.cid is NULL
;
  
  