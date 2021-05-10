DELIMITER //

DROP PROCEDURE IF EXISTS query_nine //

CREATE PROCEDURE query_nine()
BEGIN
        with best_team AS (
                SELECT W / (W + L) as win_percentage, TEAM, END_SEASON as SEASON
                FROM Team_Misc_Info
                WHERE END_SEASON = 2018 and W = (Select Max(W) from Team_Misc_Info WHERE END_SEASON = 2018)
        ),
        best_team_roster AS (
                select *
                from Player_Season_Information join best_team using(SEASON, TEAM)
        )
        
        SELECT PLAYER, TRB 
        FROM best_team_roster
        where TRB = (Select Max(TRB) from best_team_roster);
END; //
DELIMITER ;
