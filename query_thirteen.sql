DELIMITER //

DROP PROCEDURE IF EXISTS query_thirteen //

CREATE PROCEDURE query_thirteen(IN player_name VARCHAR(20))
BEGIN
        select TEAM, SEASON, PTS, FT
        from Player_Season_Information
        where player = player_name and PTS > 15 and FT > 0.25 * PTS;
END; //
DELIMITER ;
