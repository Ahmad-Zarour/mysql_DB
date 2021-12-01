-- 1. Hämta ålder för spelaren Johan Andersson.

SELECT p.age
FROM player p
WHERE personal_number = "19600521-1234";

-- 2. Hämta datum för tävlingen Big Golf Cup Skövde.
SELECT c.date
FROM competition c
WHERE competition_name = "Big Golf Cup Skövde";

-- 3. Hämta materialet för Johan Anderssons klubba.

SELECT c.material 
FROM player p 
JOIN club c
USING(personal_number)
WHERE p.name = "Johan Andersson";

-- 4. Hämta alla jackor som tillhör Johan Andersson.

SELECT j.size ,j.material ,j.model
FROM player p JOIN jacket j
USING(personal_number)
WHERE p.name = "Johan Andersson";

-- 5. Hämta alla spelare som deltog i Big Golf Cup Skövde.

SELECT p.name 
FROM competition c 
INNER JOIN player_competition pc
	ON c.competition_name = pc.competition_name
INNER JOIN player p
	ON p.personal_number = pc.personal_number
WHERE c.competition_name = "Big Golf Cup Skövde";

-- 6. Hämta regnens vindstyrka för Big Golf Cup Skövde.  

SELECT r.wind_speed
FROM competition  c 
INNER JOIN competition_rain  cr 
	ON c.competition_name = cr.competition_name
INNER JOIN rain r
ON r.rain_id = cr.rain_id
WHERE c.competition_name = "Big Golf Cup Skövde";

-- 7. Hämta alla spelare som är under 30 år.
SELECT p.name , p.age
FROM player p
WHERE age < 30;

-- 8. Ta bort Johan Anderssons jackor.

DELETE j
FROM player p INNER JOIN jacket j
USING(personal_number)
WHERE p.name = "Johan Andersson";
    
-- 9. Ta bort Nicklas Jansson.

DELETE FROM player p
WHERE p.name = "Nicklas Jansson";

-- 10. Hämta medelåldern för alla spelare.

SELECT AVG (age) "average age of Players"
FROM player;




