--Andrew Arrigo
--1
SELECT city
FROM Agents
WHERE aid in (SELECT aid
	      FROM Orders
	      WHERE cid = 'c006'
	      )
;
	     
--2
SELECT DISTINCT pid
FROM Orders
WHERE aid in
	    (SELECT aid
	     FROM Orders
	     WHERE cid in (
		           SELECT cid
	                   FROM Customers
	                    WHERE city = 'Kyoto'
	                  )
	     )      
ORDER BY pid DESC
;

--3
SELECT cid, name
FROM Customers
WHERE cid not in (SELECT cid
	          FROM Orders
	          WHERE aid ='a01'
	         )
;

--4
SELECT DISTINCT cid
FROM Orders
WHERE pid = 'p01'
      AND cid in (SELECT cid
	          FROM Orders
	          WHERE pid = 'p07'	   
	          )
;

--5
SELECT DISTINCT pid
FROM Orders
WHERE aid in (
		 SELECT aid
		 FROM Orders
		 WHERE cid != 'a08'
	     )
ORDER BY pid DESC
;

--6
SELECT name, discount, city
FROM Customers
WHERE cid in (
	      SELECT cid
	      FROM Orders
	      WHERE aid in (
			    SELECT aid
			    FROM Agents
			    WHERE city in ('New York', 'Tokyo')
		           )
	      )   
;

--7
SELECT name
FROM Customers
WHERE discount in (
		   SELECT discount
		   FROM Customers
		   WHERE city in ('Duluth', 'London')
		  )
;
		  
--8
A check constraint in SQL is a generic constraint type. This constraint allows for specification that the value in specific columns return a Boolean expression. Check constraints go after a set data type when in the process of creating a table. Only if the value ends as true or null then the check constraint has been satisfied. A benefit of using check constraints is it makes it possible to enforce rules in a database that without additional logic and it cannot be bypassed. They also provide data integrity and consistency. Overall application development productivity is increased. A good check constraint could be for signing up for a website such as an online gambling website. If the law requires a person must be 21 years of age and there is an age column, we can use a check constraint to verify that the user has entered a valid age. Another example of a good check constraint example is signing up for a website and having character requirements for a password. A check constraint can test to see if a user has submitted a valid password of digits and letters. An example of a bad check constraint is putting them on a month column of a table. The twelve months are permanent and will never result in a false result. Using a check constraint on a gambling website, like I mentioned before, would make sense for the year column to verify the users age but wouldn’t be helpful for something like picking a day in a month because those days are set and don’t change.