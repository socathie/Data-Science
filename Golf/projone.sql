-- 1. number of distinct golfers in database
SELECT count(distinct golfer_id) AS number_of_distinct_golfers -- 'distinct' is not necessary since golfer_id is primary key
FROM golfer;
-- ans: 22


-- 2. list all courses that have 1 or more tees that play more than 6680 yards
SELECT DISTINCT course_name
FROM tee
WHERE yardage > 6680
ORDER BY course_name ASC;


-- 3. golfers who are members at Wilson
SELECT golfer_id, golfer_name
FROM golfer
WHERE home_course = 'Wilson'
ORDER BY golfer_id ASC;


-- 4. how much Logan spend on golf in 2013 (total Green Fee paid)
SELECT sum(green_fee) AS Logan_spent_in_2013
FROM course, golfer, rounds
WHERE golfer.golfer_id = rounds.golfer_id 
	AND course.course_name = rounds.course_name
	AND golfer_name = 'Logan'
	AND round_date BETWEEN '2013-01-01' AND '2013-12-31';
-- ans: 80


-- 5. list of every course that Michael has played
SELECT DISTINCT course_name
FROM golfer, rounds
WHERE golfer.golfer_id = rounds.golfer_id
	AND golfer_name = 'Michael'
ORDER BY course_name ASC;


-- 6. number of distinct golfers who played 'Harding' from the Blue tees
SELECT count(distinct golfer_id) AS no_of_golfers_who_played_Harding_Blue
FROM rounds
WHERE course_name = 'Harding'
	AND tee_name = 'Blue';
-- ans: 8


-- 7. 10 lowest scores and the correponding golfers during 2014
SELECT golfer_id, score
FROM rounds
WHERE round_date BETWEEN '2014-01-01' AND '2014-12-31'
ORDER BY score ASC
LIMIT 10;


-- 8. worst (highest) score recorded from the Yellow tees at Rancho
SELECT max(score) AS worst_score_at_Rancho_Yellow
FROM rounds
WHERE course_name = 'Rancho'
	AND tee_name = 'Yellow';
-- ans: 92


-- 9. average score at Rancho between 2013-06-01 and 2013-08-31
SELECT avg(score) AS avg_score_at_Rancho_2013_0601_0831
FROM rounds
WHERE course_name = 'Rancho'
	AND round_date BETWEEN '2013-06-01' AND '2013-08-31';
-- ans: 85.6667


-- 10. average scores of members at Wilson
SELECT avg(score) AS avg_score_of_members_at_Wilson
FROM golfer, rounds
WHERE golfer.golfer_id = rounds.golfer_id
	AND home_course = 'Wilson';
-- ans: 85.0426