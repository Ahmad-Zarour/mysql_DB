INSERT INTO player (personal_number,`name`,age)
VALUES 
	("19600521-1234", "Johan Andersson" ,25), 
    ("19900125-2020", "Sami Sergio",28),
	("19810102-3366", "Peter johanson",40),
	("19750822-5252", "Sara Gorge",52),
	("19991111-2288", "Anna Fred",22),
	("19911011-2288", "Nicklas Jansson",29),
	("19890506-2288", "Annika Persson",39);
    
INSERT INTO competition(competition_name,`date`)
VALUES 
	("Big Golf Cup Skövde","2021-05-10"),
	("Internation Golf Cup Vänersborg","2020-04-10"),
	("Big Bang Golf Torllhättan","2021-011-25");
    
INSERT INTO player_competition(personal_number,competition_name)
VALUES 
	("19600521-1234","Big Golf Cup Skövde"),
	("19911011-2288","Big Golf Cup Skövde"),
	("19890506-2288","Big Golf Cup Skövde"),
	("19900125-2020","Internation Golf Cup Vänersborg"),
	("19750822-5252","Internation Golf Cup Vänersborg"),
	("19810102-3366","Big Bang Golf Torllhättan");
    
INSERT INTO rain (rain_type,wind_speed)
VALUES 
	("Hail","10m/s"),
	("Heavy Rain","30m/s"),
	("light Rain","18m/s"),
	("Rain","20m/s");
    
INSERT INTO competition_rain (competition_name,rain_id,`time`)
VALUES 
	("Big Golf Cup Skövde",1,"12:00:00"),
	("Internation Golf Cup Vänersborg",2,"13:30:00"),
	("Big Bang Golf Torllhättan",4,"14:30:00");
    
INSERT INTO jacket (size,material,model,personal_number)
VALUES 
	("M","fleece","Light jacket","19600521-1234"),
	("M","goretex","Heavy jacket","19600521-1234"),
	("XL","goretex","Rain jacket","19900125-2020"),
	("S","cotton","Normal jacket","19991111-2288"),
	("L","fleece","Normal jacket","19890506-2288");
    
INSERT INTO construction (serial_number,hardness)
VALUES 
	("SN010508WD",10), 
	("SN050508WD",5), 
	("SN200508MT",20);

INSERT INTO club(club_number,material,personal_number,construction_sn) 
VALUES 
	(101,"Woode","19911011-2288","SN010508WD"),
	(201,"Woode","19890506-2288","SN050508WD"),
	(309,"Metal","19900125-2020","SN200508MT"),
	(309,"Metal","19600521-1234","SN200508MT");
