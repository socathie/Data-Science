-- Queries of Assignment 2

-- 1. names of golfers who have a single-round score of less than 80 (subquery)
SELECT G.golfer_name
FROM golfer G
WHERE EXISTS 
(	SELECT *
	FROM rounds R
	WHERE R.score < 80 AND G.golfer_id = R.golfer_id)
ORDER BY G.golfer_name ASC;


-- 2. golfers have not played in 2015
SELECT count(*) AS GolfersNotPlayedIn2015
FROM golfer G
WHERE NOT EXISTS
(	SELECT *
	FROM rounds R
    WHERE R.round_date BETWEEN '2015-01-01' AND '2015-12-31');
-- ans: 22 (i.e. all of them)


-- 3. rounds each golfer played
SELECT G.golfer_id, G.golfer_name, count(*) AS RoundsPlayed
FROM golfer G NATURAL JOIN rounds R
GROUP BY G.golfer_id;


-- 4. rounds each golfer played in 2013
SELECT G.golfer_id, G.golfer_name, count(*) AS RoundsPlayed
FROM golfer G NATURAL JOIN rounds R
WHERE R.round_date BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY G.golfer_id;


-- 5. differential
CREATE VIEW differential(golfer_id, round_date, course_name, tee_name, score, differential) AS
	SELECT R.golfer_id, R.round_date, R.course_name, R.tee_name, R.score, ((R.score-T.course_rating)*113/T.slope_rating)
    FROM rounds R NATURAL JOIN tee T;
    
SELECT * FROM differential
ORDER BY round_date ASC;
-- DROP VIEW differential;


-- 6. 3 distinct golfers with best (lowest) differential
SELECT DISTINCT D.golfer_id, min(D.differential) AS BestDifferential
FROM differential D
GROUP BY D.golfer_id
ORDER BY BestDifferential ASC
LIMIT 3;


-- 7. golfer with lowest differential out of all members at 'Harding'
SELECT G.golfer_id, G.golfer_name, D.differential AS LowestDifferential
FROM differential D NATURAL JOIN golfer G
WHERE G.home_course = 'Harding'
ORDER BY D.differential ASC
LIMIT 1; 
