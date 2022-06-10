-- drop table drinks;
-- CREATE TABLE drinks (
-- 	Rest_id int,
-- 	D_id int,
-- 	D_type varchar,
-- 	volume float,
-- 	Maker varchar,
-- 	D_name varchar,
-- 	Price float,
-- 	PRIMARY KEY (Rest_id, D_id)
-- );



drop table Drinks;
CREATE TABLE Drinks (
	rest_id int,
	d_id int,
	d_type varchar,
	volume float,
	maker varchar,
	d_Name varchar,
	price float,
	PRIMARY KEY (rest_id, d_id)
);

drop table Bars;
CREATE TABLE Bars (
	rest_id int,
	bar_name varchar,
	bar_type varchar,
	age int,
	website varchar,
	addr varchar,
	postal int,
	PRIMARY KEY (rest_id)
);


COPY Drinks FROM '/Users/marcusthomsen/Desktop/School/2_yr/DIS/CBS/CBSapp/drinks.csv' DELIMITER ',' CSV Header;
COPY Bars FROM '/Users/marcusthomsen/Desktop/School/2_yr/DIS/CBS/CBSapp/bars.csv' DELIMITER ',' CSV Header;

ALTER TABLE Drinks
ADD Column halfliter_price float;


UPDATE Drinks
set halfliter_price = (price::float / volume::float)/2.0
WHERE  (rest_id, d_id) = (rest_id, d_id);