DELIMITER //

DROP PROCEDURE IF EXISTS query_twelve//

CREATE PROCEDURE query_twelve(IN season_input VARCHAR(4))
BEGIN
        with team_3p as (
                select TEAM, SEASON, three_p_pct, percent_rank() over (order by three_p_pct) as pk
                from Team_Season_Info
                where END_SEASON = season_input
        ),
        leaders_in_3p as (
                select *
                from team_3p
                where pk > 0.5
        ),
        ratings_of_3p_leaders as (
                select TEAM, SEASON, W/(W+L) as win_pct, ORtg, DRtg, three_p_pct
                from Team_Misc_Info join leaders_in_3p using(TEAM, SEASON)
        )
        
        select *
        from ratings_of_3p_leaders;
END; //
DELIMITER ;

