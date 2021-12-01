# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM city c WHERE c.name LIKE "ping%" ORDER BY population;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM city c WHERE c.name LIKE "ran%" ORDER BY c.population DESC;

# 3: Count all cities
SELECT COUNT(c.name) FROM city c
WHERE c.name IS NOT NULL;

# 4: Get the average population of all cities
SELECT AVG(c.population) AS "average population" FROM city c ;

# 5: Get the biggest population found in any of the cities
SELECT MAX(c.population) AS "biggest population" FROM city c ;

# 6: Get the smallest population found in any of the cities
SELECT MIN(c.Population) AS 'smallest population' FROM city c ;

# 7: Sum the population of all cities with a population below 10000
SELECT SUM(c.population) AS "Sum the population below 10000" FROM city c 
WHERE c.population < 10000;

# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(c.name) AS "Country codes MOZ,VNM" FROM city c
WHERE c.countrycode IN ('MOZ','VNM') ;

# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT COUNT(IF (c.countrycode ='MOZ',1, NULL)) 'MOZ count' ,
COUNT(IF (c.countrycode ='VNM',1, NULL)) 'VNM count'
FROM city c;

# 10: Get average population of cities in MOZ and VNM
SELECT AVG(c.population) AS "avg of MOZ and VNM" FROM city c
WHERE c.countrycode IN('MOZ','VNM');

# 11: Get the countrycodes with more than 200 cities -??
SELECT c.countrycode, ROW_NUMBER() OVER () FROM city c ;

# 12: Get the countrycodes with more than 200 cities ordered by city count - ??-
SELECT c.countrycode,c.name, ROW_NUMBER() OVER () AS "city count" FROM city c 
ORDER BY "city count" DESC;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT cl.Language AS "Languages " , c.population FROM countrylanguage cl INNER JOIN city c
ON  cl.CountryCode = c.countrycode AND c.population BETWEEN 400 AND 500 ;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT c.name ,cl.Language FROM countrylanguage cl INNER JOIN city c
ON  cl.CountryCode = c.countrycode AND c.population BETWEEN 500 AND 600 ;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT c.name ,cl.Language FROM countrylanguage cl INNER JOIN city c
ON  cl.CountryCode = c.countrycode AND c.population = 122199 ;

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT c2.name FROM city c1,city c2 
WHERE c1.countrycode = c2.countrycode AND 
c1.population = 122199 AND c2.population <> 122199;

# 17: What are the city names in the country where Luanda is capital?
SELECT c.name FROM country c INNER JOIN city cy 
 ON  c.Code = cy.countrycode AND cy.name = "Luanda" ;
 
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT cy.name FROM city cy INNER JOIN country c
 ON  c.Code = cy.countrycode AND c.region = 
 (SELECT c.region FROM country c INNER JOIN city cy ON c.Code = cy.countrycode AND cy.name ="Yaren" );
 
# 19: What unique languages are spoken in the countries in the same region as the city named Riga

SELECT Distinct( cl.language) FROM countrylanguage cl INNER JOIN country c
 ON  cl.countrycode  = c.Code AND
 c.region = (SELECT c.region FROM country c INNER JOIN city cy ON c.Code = cy.countrycode AND cy.name ="Riga" );

# 20: Get the name of the most populous city
SELECT c.name AS "populous city" FROM city c WHERE c.population = (SELECT MAX(c.population) FROM city c);
