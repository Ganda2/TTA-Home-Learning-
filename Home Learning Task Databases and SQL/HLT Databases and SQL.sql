SHOW DATABASES;

CREATE DATABASE movies;

USE movies;

CREATE TABLE movie_list(
movie_id INT NOT NULL,
title VARCHAR (20) NOT NULL, 
release_date VARCHAR (20) NOT NULL,
genre  VARCHAR (20) NOT NULL, 
actor_id INT NOT NULL, 
lead_actor VARCHAR (20) NOT NULL,
PRIMARY KEY (movie_id)

);

EXPLAIN movie_list;

ALTER TABLE movie_list
ADD COLUMN languages VARCHAR (20) NOT NULL;

ALTER TABLE movie_list
ADD COLUMN country VARCHAR (20) NOT NULL;

EXPLAIN movie_list;

ALTER TABLE movie_list
DROP COLUMN  languages;

ALTER TABLE movie_list
DROP COLUMN country;

ALTER TABLE movie_list
MODIFY actor_id INT;

EXPLAIN movie_list;

INSERT INTO movie_list (movie_id, title,release_date,genre,	actor_id, lead_actor)
VALUES (1,'Adventure Squirrels',	'15/02/2016',	'Drama',	18,	'Jim Tickle'),
(2	,'Too Many Balloons',	'15/09/2016',	'Crime'	,2	,'Phil Stump'),
(3	,'That Not Cheese',	'26/01/2016'	,'Drama',	12	,'Justin Groove'),
(4	,'Sugar Rush',	'11/11/2016'	,'Comedy'	,4	,'Karen Trout'),
(5	,'Grandma Laughing?',	'29/08/2016'	,'Mystery',	12,	'Yulia Velasquez'),
(6	,'Luke Warm Soup',	'15/04/2016'	,'Horror' ,6,	'Skeeter McGavin'),
(7	,'Clown Parade III',	'01/06/2016'	,'Comedy',	15,	'Stan Pancake'),
(8	,'Gene Genes',	'11/08/2016',	'Sci-Fi'	,14,	'Randy Killnose'),
(9	,'A Hard Day Night',	'22/05/1964',	'Comedy',	9,	'Paul McCartney'),
(10	,'Goldfinger',	'29/05/1964','Action',	10	,'Honor Blackman'),
(11	,'Mary Poppins',	'21/03/1964',	'Comedy'	,13,	'Ed Wynn');

INSERT INTO movie_list (movie_id, title,release_date,genre,	actor_id, lead_actor)
VALUES (12,'Testing moves',	'15/02/2005',	'Drama',	18,	'Tim Tom');

SELECT * FROM movie_list;



UPDATE movie_list
SET release_date = '01/06/2010'
WHERE movie_id = 7;

SELECT * FROM movie_list;

DELETE FROM movie_list 
WHERE movie_id ='2';

SELECT * FROM movie_list;

SELECT title, release_date FROM movie_list;

SELECT * FROM movie_list 
WHERE movie_id = 3;

SELECT * FROM movie_list ORDER BY release_date;

SELECT title, genre FROM movie_list
ORDER BY title, genre;

CREATE TABLE actor_list(
actor_id INT NOT NULL,
lead_actor VARCHAR (20) NOT NULL,
director_name VARCHAR (20) NOT NULL,
gross_revenue DECIMAL(6, 2),
PRIMARY KEY (actor_id)

);

EXPLAIN actor_list;



INSERT INTO actor_list(actor_id,lead_actor,director_name,gross_revenue)
VALUES(3,'Jim Tickle','Lloyd Christmas',1200.25),
(7	,'Justin Groove',	'Justin Groove'	,3450.45),
(4	,'Karen Trout',	'Karen Trout',	2808.00),
(21	,'Yulia Velasquez',	'Purd Haply',	1700.00),
(6	,'Skeeter McGavin',	'Nick Winkle',	3000.00),
(15	,'Stan Pancake',	'Todd Waffle',	3250.00),
(8	,'Randy Killnose',	'August Clementine',	1980.00),
(9	,'Paul McCartney',	'Richard Lester',	5150.05),
(10	,'Honor Blackman',	'Guy Hamilton',	5110.00);


INSERT INTO actor_list(actor_id,lead_actor,director_name,gross_revenue)
VALUES(35,'Ava Moses','Magna Williams',1799.25);

INSERT INTO actor_list(actor_id,lead_actor,director_name,gross_revenue)
VALUES(3,'Jim Tickle','Lloyd Christmas',1200.25),
(16	,'Justin Groove',	'Justin Groove'	,3450.45),
(44	,'Karen Trout',	'Karen Trout',	2808.00),
(2	,'Yulia Velasquez',	'Purd Haply',	1700.00),
(13	,'Skeeter McGavin',	'Nick Winkle',	3000.00),
(23	,'Stan Pancake',	'Todd Waffle',	3250.00),
(32	,'Randy Killnose',	'August Clementine',	1980.00),
(5	,'Paul McCartney',	'Richard Lester',	5150.05),
(25	,'Honor Blackman',	'Guy Hamilton',	5110.00);

SELECT * From actor_list;

#-- Updated revenue which was directed by Justin Groove 
UPDATE actor_list
SET gross_revenue = 5579.99
WHERE actor_id = 12;

SELECT * FROM actor_list;

-- Joining tables

SELECT movie_list.title , actor_list.lead_actor,gross_revenue
FROM movie_list
INNER JOIN actor_list
ON movie_list.actor_id = actor_list.actor_id;


SELECT movie_list.title , movie_list.release_date ,gross_revenue
FROM movie_list
INNER JOIN actor_list
ON movie_list.actor_id = actor_list.actor_id AND gross_revenue BETWEEN 3000.00 AND 5999.00  ;

SELECT movie_list.title , movie_list.release_date ,gross_revenue
FROM movie_list
LEFT JOIN actor_list
ON movie_list.actor_id = actor_list.actor_id;



SELECT * FROM actor_list
WHERE gross_revenue BETWEEN 1000.00 AND 2000.00  ;

