1. Find all rows that have an ingredient name of Brussels sprouts.
EXPLAIN ANALYZE
SELECT * FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

Without index:
![alt](http://imgur.com/YTAZBdw)
With index:
![alt](http://imgur.com/WZLpYyA)

2. Calculate the total count of rows of ingredients with a name of Brussels sprouts.
EXPLAIN ANALYZE
SELECT count(name) FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

Without index:
![alt](http://imgur.com/BSpFssH)
With index:
![alt](http://imgur.com/nz5AtaJ)

3. Find all Brussels sprouts ingredients having a unit type of gallon(s).
EXPLAIN ANALYZE
SELECT * FROM ingredients
WHERE name LIKE '%Brussels sprouts%'
AND unit LIKE '%gallon(s)%';

Without index:
![alt](http://imgur.com/urNdteH)
With index:
![alt](http://imgur.com/Wbm9t5C)

4. Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.
EXPLAIN ANALYZE
SELECT * FROM ingredients
WHERE name LIKE '%Brussels sprouts%'
OR name LIKE '%j%'
AND unit LIKE '%gallon(s)%';

Without index:
![alt](http://imgur.com/9hOrxhE)
With index:
![alt](http://imgur.com/NuHxRC8)

5. Implement a database index to speed up your above SQL queries.

CREATE INDEX ON ingredients(name);



All the screenshots:
![alt](http://imgur.com/a/Vz2Gn)
