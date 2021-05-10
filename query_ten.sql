DELIMITER //

DROP PROCEDURE IF EXISTS query_ten //

CREATE PROCEDURE query_ten(IN season_input VARCHAR(4))
BEGIN
        with best_team AS (
            SELECT FG_pct, TEAM, SEASON
            FROM Team_Season_Info
            WHERE END_SEASON = season_input and FG_pct = (Select Max(FG_pct) from Team_Season_Info WHERE END_SEASON = season_input)
        ),
        best_team_opp_fg AS (
            select TEAM, FG_pct, OPP_FG_pct
            from Team_Opponent_Info join best_team using(SEASON, TEAM)
        )
        
        select *
        from best_team_opp_fg;
END; //
DELIMITER ;
