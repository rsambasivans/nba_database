DELIMITER //

DROP PROCEDURE IF EXISTS query_five //

CREATE PROCEDURE query_five(IN COUNTRY_INPUT VARCHAR(20))
BEGIN
    WITH NationalPlayers AS (
    SELECT DISTINCT PLAYER, NATIONALITY
    FROM Player
    WHERE NATIONALITY = COUNTRY_INPUT
    ),
    NationalPlayerInfo AS (
    SELECT *
    FROM Player_Season_Information JOIN NationalPlayers using(PLAYER)
    ),
    LosingTeams AS (
    SELECT TEAM, END_SEASON AS SEASON
    FROM Team_Misc_Info
    WHERE L > W
    )
    SELECT NATIONALITY, PLAYER, COUNT(DISTINCT TEAM) AS LosingTeams
    FROM LosingTeams JOIN NationalPlayerInfo using(TEAM, SEASON)
    GROUP BY PLAYER
    HAVING COUNT(DISTINCT TEAM) >= 3;    
END; //
DELIMITER ;
