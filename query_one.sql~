DELIMITER //

DROP PROCEDURE IF EXISTS query_eight //

CREATE PROCEDURE query_eight()
BEGIN
        with offense_leaders as (
                select MAX(ORtg) as ORtg, END_SEASON
                from Team_Misc_Info
                group by END_SEASON
        ),
        offense_leader_teams as (
                select *
                from Team_Misc_Info join offense_leaders using(END_SEASON, ORtg)
        ),
        offense_leader_teams_w_3p as (
                select TEAM, SEASON, ORtg, three_p_pct, percent_rank() over (order by three_p_pct) as pct_rank
                from Team_Season_Info join offense_leader_teams using(END_SEASON, TEAM, SEASON)
        )
        
        select *
        from offense_leader_teams_w_3p
        where pct_rank > 0.6
        order by pct_rank;
END; //
DELIMITER ;
