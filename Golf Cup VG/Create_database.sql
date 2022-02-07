
DROP DATABASE Golf_Cup_VG;
CREATE DATABASE Golf_Cup_VG;
USE golf_cup_vg;

CREATE TABLE player (
    personal_number CHAR(13) UNIQUE NOT NULL PRIMARY KEY,
    `name` VARCHAR(99),
	age SMALLINT
)ENGINE=INNODB;

CREATE TABLE jacket (
	jacket_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	size VARCHAR(10) NOT NULL,
	material VARCHAR(50) ,
	model VARCHAR(50) ,
	personal_number VARCHAR(13) NOT NULL,
	FOREIGN KEY (personal_number) 
		REFERENCES player (personal_number) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

-- pk is competition name
CREATE TABLE competition (
    competition_name VARCHAR(99) UNIQUE NOT NULL PRIMARY KEY,
    `date` DATE NOT NULL
)ENGINE=INNODB;

-- many-to-many association table
CREATE TABLE player_competition (
	personal_number VARCHAR(13) NOT NULL,
    competition_name VARCHAR(99) NOT NULL,
    PRIMARY KEY (personal_number,competition_name),
    FOREIGN KEY (personal_number)
        REFERENCES player (personal_number) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (competition_name)
        REFERENCES competition(competition_name) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;


CREATE TABLE construction (
   serial_number VARCHAR(99) NOT NULL PRIMARY KEY,
   hardness SMALLINT NOT NULL
)ENGINE=INNODB;


CREATE TABLE club (
    club_number INT UNSIGNED PRIMARY KEY,
    material VARCHAR(99),
    personal_number VARCHAR(13) NOT NULL,
    construction_sn VARCHAR(99) NOT NULL,
    FOREIGN KEY (personal_number ) 
		REFERENCES player (personal_number) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (construction_sn)
		REFERENCES construction (serial_number) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE rain (
	rain_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rain_type VARCHAR(50) NOT NULL,
    wind_speed VARCHAR(20) NOT NULL
)ENGINE=INNODB;

-- As the relation between rain and competition is many-to-many and has a time 
CREATE TABLE competition_rain(
	competition_name VARCHAR(99) UNIQUE NOT NULL,
    rain_id INT UNSIGNED AUTO_INCREMENT ,
    `time` TIME NOT NULL,
    PRIMARY KEY (competition_name,rain_id),
    FOREIGN KEY (competition_name)
        REFERENCES competition (competition_name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (rain_id)
        REFERENCES rain(rain_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;
