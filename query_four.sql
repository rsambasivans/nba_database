DELIMITER //

DROP PROCEDURE IF EXISTS query_four //

CREATE PROCEDURE query_four(IN TEAM_INPUT VARCHAR(3))
BEGIN
    WITH greater45Teams AS (
        SELECT TEAM, W, END_SEASON AS SEASON
        FROM Team_Misc_Info
        WHERE TEAM = TEAM_INPUT AND W > 45 
    ),
    PlayersAbove23 AS (
    SELECT *
    FROM Player_Season_Information
    WHERE TEAM = TEAM_INPUT AND PTS > 23
    )
    SELECT DISTINCT TEAM, SEASON, W as GamesWon
    FROM greater45Teams LEFT JOIN PlayersAbove23 using (TEAM, SEASON)
    GROUP BY SEASON
    HAVING COUNT(PLAYER) = 0;
END; //
DELIMITER ;
