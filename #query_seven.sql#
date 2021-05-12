DELIMITER //

DROP PROCEDURE IF EXISTS query_seven //

CREATE PROCEDURE query_seven()
BEGIN
WITH DefensiveLeaders AS (
    SELECT MAX(DRtg) as DRtg, END_SEASON
    FROM Team_Misc_Info
    GROUP BY END_SEASON
),
DefensiveTeamLeaders AS (
    SELECT *
    FROM Team_Misc_Info JOIN DefensiveLeaders USING(END_SEASON, DRtg)
),
DefensiveTeamLeadersStats AS (
    SELECT *
    FROM Team_Season_Info JOIN DefensiveTeamLeaders USING(END_SEASON, TEAM, SEASON)
)
SELECT TEAM, END_SEASON, three_pa / FGA AS ThreeAttemptRatio
FROM DefensiveTeamLeadersStats
ORDER BY ThreeAttemptRatio ASC;
END; //
DELIMITER ;
