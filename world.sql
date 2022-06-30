USE world;

--  Question 1
SELECT COUNT(ct.id) FROM city ct
 INNER JOIN country co ON ct.countrycode = co.code
WHERE ct.countrycode = "USA";

-- Question 2
SELECT name, population, lifeexpectancy FROM country WHERE name = "argentina";

-- Question 3
SELECT name FROM country GROUP BY lifeexpectancy  HAVING MAX(lifeexpectancy IS NOT NULL) ORDER BY lifeexpectancy DESC LIMIT 1;

-- Question 4
SELECT ct.name FROM city ct
 INNER JOIN country co ON ct.id = co.capital
WHERE co.name ="spain";

-- Question 5
SELECT cl.language FROM countrylanguage cl
 INNER JOIN country co ON cl.countrycode = co.code
WHERE co.region = "southeast asia";

-- Question 6
SELECT name FROM city WHERE name LIKE "f%" LIMIT 25;

-- Question 7
SELECT COUNT(ct.name) FROM city ct
 INNER JOIN country co ON ct.countrycode = co.code
WHERE co.code = "CHN";

-- Question 8
SELECT name FROM country WHERE population > 0 GROUP BY population HAVING (population IS NOT NULL) ORDER BY population LIMIT 1 ;

-- Question 9 
SELECT COUNT(name IS NOT NULL) FROM country;

-- Question 10
SELECT name FROM country GROUP BY surfacearea ORDER BY surfacearea DESC LIMIT 10;

-- Question 11
SELECT name
FROM city
WHERE countrycode = (
 SELECT code
 FROM country
 WHERE name = "japan"
 ) GROUP BY population ORDER BY population DESC LIMIT 5;
 
 -- Question 12
 UPDATE country SET headofstate = "Elizabeth II" WHERE headofstate = "Elisabeth II";
SELECT name, code FROM country WHERE headofstate = "Elizabeth II";

-- Question 13


-- Question 14
SELECT language FROM countrylanguage GROUP BY language HAVING COUNT(LANGUAGE) = 1;

-- Question 15
SELECT gnp, name FROM country GROUP BY name ORDER BY gnp DESC LIMIT 10;

-- Question 16
SELECT co.name FROM country co
 INNER JOIN countrylanguage cl ON co.code = cl.countrycode
GROUP BY co.name ORDER BY COUNT(cl.countrycode) DESC LIMIT 10;

-- Question 17
SELECT co.name FROM country co
 INNER JOIN countrylanguage cl ON co.code = cl.countrycode
WHERE language = "german" AND percentage > 50;

-- Question 18
SELECT MIN(lifeexpectancy),  name FROM country GROUP BY lifeexpectancy HAVING lifeexpectancy > 0 AND lifeexpectancy IS NOT NULL ORDER BY lifeexpectancy LIMIT 1;

-- QUESTION 19
SELECT governmentform, COUNT(governmentform) FROM country GROUP BY governmentform ORDER BY COUNT(governmentform) DESC LIMIT 3;

-- Question 20
SELECT COUNT(indepyear) FROM country WHERE indepyear IS NOT NULL;