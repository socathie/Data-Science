CREATE DATABASE GolfWebsite;

USE GolfWebsite;

-- This creates the database for Assignment 2

-- 1.1.1 Courses
CREATE TABLE course(
	course_name char(15),
    green_fee numeric(5,2),
    PRIMARY KEY (course_name)
);

-- 1.1.2 Tees
CREATE TABLE tee(
	course_name char(15),
    tee_name char(15),
    course_rating numeric(3,1), -- 2 digits plus 1 after decimal point
    slope_rating integer,
    yardage integer,
    PRIMARY KEY (course_name, tee_name),
    -- each tee has a distinct name among those associated with that course
    CONSTRAINT fk_course_exists FOREIGN KEY (course_name)
		REFERENCES course(course_name)
	-- make sure each tee is associated with a course in 1.1.1
);

-- 1.1.3 Golfers
CREATE TABLE golfer(
	golfer_id integer,
    golfer_name char(15),
    home_course char(15),
    PRIMARY KEY (golfer_id),
    CONSTRAINT fk_home_course_exists FOREIGN KEY (home_course)
		REFERENCES course(course_name)
	-- make sure home course is a course in 1.1.1
);

-- 1.1.4 Rounds
CREATE TABLE rounds(
	golfer_id integer,
    round_date date,
    course_name char(15),
    tee_name char(15),
    score integer,
    PRIMARY KEY (golfer_id, round_date),
    CONSTRAINT fk_course_and_tee_exist FOREIGN KEY (course_name, tee_name)
		REFERENCES tee(course_name, tee_name),
	-- make sure the round is played at existing course and tee
    CONSTRAINT fk_golfer_id_exists FOREIGN KEY (golfer_id)
		REFERENCES golfer(golfer_id)
	-- make sure golfer exists
);

-- populate all data (I first changed the xlsx file to csv)

INSERT INTO course
VALUES
('Rancho',43),
('Wilson',43),
('Harding',37),
('Encino',37);
-- Check if properly imported
-- SELECT * FROM course;

INSERT INTO tee
VALUES
('Rancho','Black',72.5,129,6839),
('Rancho','Blue',70.7,124,6419),
('Rancho','White',68.8,120,6036),
('Rancho','Yellow',66.7,114,5644),
('Wilson','Black',73.0,125,6947),
('Wilson','Blue',71.8,122,6685),
('Wilson','White',70.6,119,6442),
('Wilson','Yellow',66.2,110,5525),
('Harding','Black',71.3,121,6679),
('Harding','Blue',70.2,118,6450),
('Harding','White',69.2,116,6256),
('Harding','Yellow',66.2,111,5658),
('Encino','Black',71.9,118,6933),
('Encino','Blue',70.1,114,6554),
('Encino','White',68.5,110,6208),
('Encino','Yellow',65.7,103,5642);
-- Check if properly imported
-- SELECT * FROM tee;

INSERT INTO golfer
VALUES
(4891,'Jackson','Rancho'),
(2101,'Liam','Wilson'),
(9672,'Lucas','Harding'),
(1588,'Noah','Wilson'),
(4649,'Mason','Wilson'),
(8909,'Ethan','Encino'),
(5201,'Jacob','Wilson'),
(4622,'Logan','Wilson'),
(9466,'Jack','Rancho'),
(6503,'Luke','Encino'),
(8994,'Michael','Harding'),
(1317,'Benjamin','Rancho'),
(6418,'Alexander','Harding'),
(9352,'James','Rancho'),
(2454,'Caleb','Rancho'),
(2174,'Connor','Rancho'),
(4108,'William','Rancho'),
(3161,'Carter','Wilson'),
(4185,'Ryan','Rancho'),
(5008,'Oliver','Wilson'),
(4122,'Matthew','Rancho'),
(7451,'Daniel','Rancho');
-- Check if properly imported
-- SELECT * FROM golfer;

INSERT INTO rounds
VALUES
(3161,'2013-02-14','Wilson','Black',89),
(2174,'2013-03-26','Encino','Blue',93),
(2101,'2013-07-08','Rancho','Blue',86),
(8994,'2014-11-04','Wilson','White',84),
(8994,'2013-01-04','Harding','White',84),
(4649,'2014-10-31','Harding','Yellow',75),
(5201,'2013-02-11','Harding','Black',92),
(9672,'2013-04-28','Encino','Yellow',82),
(6418,'2012-03-29','Encino','Black',87),
(9466,'2013-02-24','Encino','Blue',90),
(6503,'2013-12-09','Harding','Blue',91),
(6503,'2014-04-16','Encino','Black',98),
(8909,'2012-01-06','Harding','Yellow',81),
(4622,'2014-12-21','Rancho','Blue',85),
(9352,'2012-12-16','Wilson','Yellow',92),
(2454,'2012-06-30','Harding','Yellow',79),
(9466,'2013-09-17','Harding','Yellow',90),
(4622,'2014-10-08','Harding','Black',90),
(4185,'2013-07-15','Rancho','Yellow',74),
(4891,'2012-11-16','Rancho','White',92),
(4122,'2012-02-25','Rancho','Blue',85),
(4649,'2012-02-09','Harding','Blue',85),
(9352,'2014-09-14','Harding','White',89),
(9352,'2012-04-28','Rancho','Black',97),
(3161,'2012-10-02','Encino','White',85),
(6418,'2012-04-27','Harding','White',91),
(2174,'2012-09-20','Wilson','White',92),
(5008,'2013-05-01','Harding','Black',86),
(8994,'2014-01-14','Harding','Black',87),
(3161,'2014-06-09','Harding','Blue',81),
(8909,'2014-06-24','Harding','Blue',82),
(2101,'2012-04-14','Encino','Yellow',80),
(2101,'2012-03-07','Harding','Blue',89),
(4649,'2013-12-16','Wilson','Black',84),
(4185,'2014-04-18','Wilson','White',80),
(4108,'2014-09-14','Encino','Yellow',81),
(4891,'2012-02-02','Harding','Black',92),
(5201,'2013-12-04','Harding','White',87),
(6503,'2012-12-24','Encino','Black',94),
(6418,'2012-05-16','Encino','Blue',88),
(9672,'2013-02-16','Encino','Black',86),
(7451,'2012-09-24','Encino','Black',89),
(9466,'2012-03-16','Wilson','Black',101),
(4649,'2013-03-30','Harding','White',85),
(6418,'2013-01-26','Harding','White',91),
(2101,'2013-08-05','Encino','Yellow',80),
(9672,'2013-07-07','Rancho','White',83),
(1317,'2013-10-11','Rancho','White',95),
(9672,'2012-05-08','Rancho','White',87),
(7451,'2013-08-29','Harding','White',90),
(4649,'2012-12-20','Harding','White',81),
(4108,'2013-09-21','Encino','White',86),
(5201,'2012-10-14','Rancho','Yellow',81),
(6418,'2014-02-06','Wilson','Black',92),
(5008,'2012-01-04','Encino','Black',88),
(5008,'2012-04-29','Wilson','White',86),
(3161,'2012-04-28','Encino','White',81),
(1317,'2013-06-22','Encino','Blue',96),
(1588,'2014-10-20','Rancho','Yellow',85),
(8909,'2014-05-23','Wilson','Yellow',82),
(2174,'2012-06-15','Wilson','Black',98),
(4891,'2012-04-12','Rancho','Blue',92),
(4185,'2013-02-23','Rancho','White',75),
(1588,'2014-01-19','Harding','Blue',87),
(7451,'2013-11-19','Wilson','White',87),
(7451,'2012-07-11','Rancho','Blue',90),
(5008,'2012-12-16','Encino','White',85),
(4185,'2013-06-25','Rancho','Black',83),
(6418,'2012-02-08','Wilson','White',86),
(1588,'2014-11-17','Harding','Blue',88),
(6503,'2012-03-20','Harding','Yellow',85),
(2101,'2013-06-18','Harding','Blue',87),
(3161,'2014-07-11','Encino','White',83),
(5008,'2014-05-05','Rancho','Yellow',82),
(4185,'2014-05-30','Wilson','White',77),
(2101,'2014-01-03','Wilson','Yellow',83),
(4185,'2014-10-20','Harding','Black',77),
(2454,'2014-01-17','Harding','Black',86),
(6418,'2014-11-24','Harding','Blue',90),
(9352,'2014-05-12','Encino','White',91),
(9466,'2014-11-25','Wilson','White',95),
(1317,'2014-11-02','Wilson','White',92),
(6418,'2012-01-22','Wilson','Blue',89),
(9352,'2013-01-23','Harding','Blue',94),
(6418,'2014-08-15','Harding','White',87),
(7451,'2013-07-13','Wilson','Blue',95),
(4649,'2013-03-31','Encino','White',82),
(2101,'2013-02-16','Encino','Blue',87),
(2454,'2014-12-17','Wilson','Black',91),
(5201,'2012-06-26','Encino','Blue',85),
(4122,'2012-09-22','Wilson','Black',89),
(9466,'2012-11-01','Wilson','Yellow',85),
(1317,'2014-12-18','Harding','Black',92),
(2101,'2012-11-03','Encino','Blue',84),
(4122,'2013-03-08','Harding','Black',80),
(4108,'2012-09-03','Wilson','White',87),
(7451,'2012-09-21','Rancho','Blue',94),
(8909,'2013-05-31','Harding','Yellow',84),
(6418,'2013-06-12','Rancho','Blue',93),
(1588,'2013-12-02','Encino','Black',91),
(1317,'2013-02-13','Encino','White',93),
(4649,'2014-10-12','Wilson','Yellow',77),
(9672,'2013-01-02','Harding','Yellow',79),
(4122,'2012-02-06','Wilson','Black',89),
(4122,'2014-01-05','Encino','Yellow',74),
(9466,'2013-10-12','Rancho','Yellow',92),
(1317,'2012-06-11','Encino','White',89),
(4122,'2014-04-25','Rancho','Black',87),
(2174,'2012-06-14','Encino','White',88),
(1317,'2012-06-15','Wilson','White',92),
(1588,'2012-08-15','Rancho','Black',89),
(7451,'2014-12-02','Harding','Black',88),
(2101,'2014-12-24','Harding','Blue',84),
(4108,'2012-05-20','Wilson','Yellow',80),
(9672,'2013-04-04','Encino','White',81),
(2174,'2014-07-01','Rancho','Black',100),
(8994,'2014-08-14','Rancho','White',83),
(8994,'2014-06-15','Rancho','Yellow',78),
(9352,'2012-01-06','Encino','Black',95),
(4122,'2014-09-24','Wilson','Yellow',76),
(1588,'2012-07-06','Encino','Black',88),
(5008,'2012-08-30','Rancho','Blue',86),
(9672,'2014-04-23','Wilson','Black',90),
(1317,'2012-07-07','Wilson','White',90),
(4891,'2014-12-18','Wilson','Blue',96),
(9352,'2014-06-09','Rancho','Black',101),
(4891,'2012-01-04','Wilson','Yellow',83),
(9466,'2014-03-12','Wilson','Black',100),
(9352,'2013-03-02','Rancho','Black',101),
(4649,'2014-01-23','Harding','Yellow',80),
(4622,'2013-03-19','Rancho','Black',89),
(9672,'2012-07-20','Rancho','Black',89),
(1588,'2012-08-22','Harding','Black',87),
(6418,'2014-10-09','Rancho','Black',93),
(2101,'2014-05-23','Rancho','Black',95),
(1317,'2013-06-11','Rancho','Black',95),
(6418,'2013-03-25','Encino','White',90),
(4108,'2012-08-10','Wilson','Blue',89),
(4122,'2014-01-18','Harding','White',78),
(3161,'2013-05-07','Harding','Yellow',81),
(8909,'2014-10-12','Encino','Yellow',80),
(8909,'2012-11-19','Wilson','Black',93),
(9672,'2013-11-30','Wilson','Black',89),
(1317,'2012-10-21','Rancho','White',96),
(2174,'2014-11-10','Rancho','Yellow',86),
(5008,'2014-11-14','Rancho','Black',87),
(1588,'2014-02-08','Wilson','Yellow',82),
(4622,'2013-07-04','Encino','Black',87),
(7451,'2014-06-05','Encino','Blue',90),
(6503,'2014-05-06','Encino','Black',98);
-- Check if properly imported
-- SELECT * FROM rounds;