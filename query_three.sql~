DELIMITER //

DROP PROCEDURE IF EXISTS query_two //

CREATE PROCEDURE query_two()
BEGIN
WITH 50_40_90_players as (
        Select PLAYER, SEASON 
        from Player_Season_Information
        where three_p_pct >= 0.4 and FG_pct >= 0.5 and FT_pct >= 0.90
),
numSeasons AS (
    SELECT PLAYER, COUNT(DISTINCT SEASON) as seasonsPlayed
    FROM Player_Season_Information
    GROUP BY PLAYER
)
Select distinct PLAYER, COUNT(PLAYER) as num_50_40_90_Seasons, seasonsPlayed
from 50_40_90_players JOIN numSeasons using(PLAYER)
group by PLAYER
HAVING COUNT(PLAYER) / seasonsPlayed >= .05;
END; //
DELIMITER ;
