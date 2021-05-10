DELIMITER //

DROP PROCEDURE IF EXISTS query_fourteen //

CREATE PROCEDURE query_fourteen()
BEGIN
        with good_teams as (
                select TEAM, SEASON, ORtg, DRtg, percent_rank() over (order by ORtg) as ORtg_pct_rank, percent_rank() over (order by DRtg) as DRtg_pct_rank
                from Team_Misc_Info
                where W > (0.6 * (W + L))
        )
        
        select *
        from good_teams
        where ORtg_pct_rank > 0.7 and DRtg_pct_rank > 0.7;
END; //
DELIMITER ;
