DELIMITER //

DROP PROCEDURE IF EXISTS query_one //

CREATE PROCEDURE query_one()
BEGIN
WITH Above35Pct AS (
    SELECT PLAYER, SEASON, TEAM, GS, MP, three_p_pct
    FROM Player_Season_Information
    WHERE three_p_pct > .35
),
TeamStats AS (
    SELECT TEAM, END_SEASON AS SEASON, G
    FROM Team_Season_Info
),
PlayerTeamInfo AS (
    SELECT TEAM, SEASON, PLAYER, GS, MP, G, three_p_pct
    FROM TeamStats JOIN Above35Pct using(SEASON, TEAM)
)
SELECT DISTINCT PLAYER, TEAM, SEASON, MP, (GS / G) as gameStartingPercent, three_p_pct
FROM PlayerTeamInfo
WHERE (GS / G) < .25 AND MP = (SELECT MAX(MP) FROM PlayerTeamInfo WHERE (GS / G) < .25);
END; //
DELIMITER ;
