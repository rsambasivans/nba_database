DELIMITER //

DROP PROCEDURE IF EXISTS query_three //

CREATE PROCEDURE query_three()
BEGIN
WITH Steal_Leaders_Teams AS (
   SELECT TEAM, SEASON, MAX(STL) as STL
   FROM Player_Season_Information
   GROUP BY TEAM, SEASON
   HAVING SEASON = 2015
),
StealLeaders2015 AS (
   SELECT *
   FROM Player_Season_Information JOIN Steal_Leaders_Teams using(TEAM, SEASON, STL)
),
StealPercentiles AS (
    SELECT PLAYER, TEAM, SEASON, STL, BLK, percent_rank() over (order by BLK) AS pct_rank
    FROM StealLeaders2015
)
SELECT *
FROM StealPercentiles
WHERE pct_rank > .95
ORDER BY pct_rank;
END; //
DELIMITER ;
