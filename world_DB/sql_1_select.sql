# SQL select query exercise
Use world;
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
 SELECT "Hello World", 123;

# 2: Get everything from the city table
# (Hint: Many many rows)
SELECT * FROM world.city;

# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
SELECT * FROM city 
WHERE district= "aceh";

# 4: Get only the name of the cities where the countrycode is "bfa"
SELECT c.name FROM city c 
WHERE countrycode= "bfa";

# 5: Get both the name and district of the cities where the countrycode is "tto"
SELECT c.name, c.district FROM city c
WHERE countrycode= "tto";

# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
SELECT c.name AS nm, c.district AS dist FROM city c
WHERE countrycode = "arm";

# 7: Get the cities with a name that starts with "bor"
SELECT c.name From city c
WHERE c.name LIKE "bro%";

# 8: Get the cities with a name that contains the string "orto"
SELECT c.name From city c
WHERE c.name LIKE "%orto%";

# 9: Get the cities that has a population below 1000
SELECT * FROM city
WHERE population < 1000;

# 10: Get the unique countrycodes from the cities that has a population below 1000
SELECT DISTINCT c.countrycode FROM city c
WHERE population < 1000; 

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT * From city c 
WHERE c.CountryCode ="UKR" AND  population > 1000000; 

# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
SELECT c.name , c.population FROM city c 
WHERE c.population < 200 OR  c.population > 9500000 ;

# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT c.name, c.CountryCode FROM city c
WHERE c.CountryCode IN ('TJK','MRT','AND','PNG','SJM');

# 14: Get the cities with a population between 200 and 700 inclusive
SELECT c.name,c.population FROM city c
WHERE c.population BETWEEN 200 and 700;

# 15: Get the countries with a population between 8000 and 20000 inclusive
SELECT * FROM country c 
WHERE c.population BETWEEN 8000 and 20000;

# 16: Get the name of the countries with a independence year (indepyear) before year 0
SELECT c.name FROM country c
WHERE c.indepyear <0;

# 17: Get the countries that has no recorded independence year and a population above 1000000
SELECT c.name FROM country c
WHERE c.indepyear IS NULL AND c.population > 1000000;

# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT * FROM country c
WHERE c.SurfaceArea <10 AND c.LifeExpectancy IS NOT NULL;
