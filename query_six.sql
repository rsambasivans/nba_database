DELIMITER //

DROP PROCEDURE IF EXISTS query_six //

CREATE PROCEDURE query_six()
BEGIN
WITH Steal_Leaders_Teams AS (
   SELECT TEAM, SEASON, MAX(STL) as STL
   FROM Player_Season_Information
   GROUP BY TEAM, SEASON
),
StealLeaders AS (
   SELECT PLAYER, SEASON, TEAM, STL, three_pa / FGA as three_p_ratio
   FROM Player_Season_Information JOIN Steal_Leaders_Teams using(TEAM, SEASON, STL)
),
Shoot_25_From_3 AS (
    SELECT PLAYER, SEASON, TEAM, STL, three_pa / FGA as three_p_ratio
    FROM Player_Season_Information
    WHERE three_pa / FGA >= .25
)
SELECT PLAYER, SEASON, TEAM, STL, three_p_ratio
FROM StealLeaders JOIN Shoot_25_From_3 using (PLAYER, SEASON, TEAM, STL, three_p_ratio);
END; //
DELIMITER ;
