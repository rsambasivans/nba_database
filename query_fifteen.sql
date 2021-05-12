DELIMITER //

DROP PROCEDURE IF EXISTS query_fifteen//

CREATE PROCEDURE query_fifteen(IN player_name VARCHAR(20))
BEGIN
        with player_seasons as (
                select *, percent_rank() over (order by PTS) as pk
                from Player_Season_Information
                where PLAYER = player_name
                order by SEASON asc
        ),
        top_player_seasons as (
                select SEASON, AGE, TEAM, PTS, FG_pct
                from player_seasons
                where pk > 0.7
        )
        
        select * 
        from top_player_seasons;
END; //
DELIMITER ;
