DELIMITER //

DROP PROCEDURE IF EXISTS query_eleven //

CREATE PROCEDURE query_eleven()
BEGIN
        with good_teams as (
                select TEAM, W, L, SEASON
                from Team_Misc_Info
                where W > L
        ), 
        good_teams_w_ppg as (
                select TEAM, W, L, SEASON, PTS
                from good_teams join Team_Season_Info using(TEAM, SEASON)
        )
        
        select SEASON, AVG(PTS) as avg_pts
        from good_teams_w_ppg
        group by SEASON;
END; //
DELIMITER ;
