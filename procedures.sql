DELIMITER //

DROP PROCEDURE IF EXISTS query_one //

CREATE PROCEDURE query_one()
BEGIN
WITH Above35Pct AS (
    SELECT PLAYER, SEASON, TEAM, GS, MP, three_p_pct
    FROM Player_Season_Information
    WHERE three_p_pct > .35 
),
TeamStats AS (
    SELECT TEAM, END_SEASON AS SEASON, G
    FROM Team_Season_Info
),
PlayerTeamInfo AS (
    SELECT TEAM, SEASON, PLAYER, GS, MP, G, three_p_pct
    FROM TeamStats JOIN Above35Pct using(SEASON, TEAM)
)
SELECT DISTINCT PLAYER, TEAM, SEASON, MP, (GS / G) as gameStartingPercent, three_p_pct
FROM PlayerTeamInfo
WHERE (GS / G) < .25 AND MP = (SELECT MAX(MP) FROM PlayerTeamInfo WHERE (GS / G) < .25);
END; //
DELIMITER ;

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

DELIMITER //

DROP PROCEDURE IF EXISTS query_three //

CREATE PROCEDURE query_three()
BEGIN
WITH Steal_Leaders_Teams AS (
SELECT TEAM, SEASON, MAX(STL) as STL 
FROM Player_Season_Information
GROUP BY TEAM, SEASON
HAVING SEASON = 2015
),
StealLeaders2015 AS (
SELECT *
FROM Player_Season_Information JOIN Steal_Leaders_Teams using(TEAM, SEASON, STL)
),
StealPercentiles AS (
    SELECT PLAYER, TEAM, SEASON, STL, BLK, percent_rank() over (order by BLK) AS pct_rank
    FROM StealLeaders2015
)
SELECT *
FROM StealPercentiles
WHERE pct_rank > .95 
ORDER BY pct_rank;
END; //
DELIMITER ;

DELIMITER //
 
DROP PROCEDURE IF EXISTS query_four //

CREATE PROCEDURE query_four(IN TEAM_INPUT VARCHAR(3))
BEGIN
    WITH greater45Teams AS (
        SELECT TEAM, W, END_SEASON AS SEASON
        FROM Team_Misc_Info
        WHERE TEAM = TEAM_INPUT AND W > 45  
    ),  
    PlayersAbove23 AS (
    SELECT *
    FROM Player_Season_Information
    WHERE TEAM = TEAM_INPUT AND PTS > 23
    )   
    SELECT DISTINCT TEAM, SEASON, W as GamesWon
    FROM greater45Teams LEFT JOIN PlayersAbove23 using (TEAM, SEASON)
    GROUP BY SEASON
    HAVING COUNT(PLAYER) = 0;
END; //
DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS query_five //

CREATE PROCEDURE query_five(IN COUNTRY_INPUT VARCHAR(20))
BEGIN
    WITH NationalPlayers AS (
    SELECT DISTINCT PLAYER, NATIONALITY
    FROM Player
    WHERE NATIONALITY = COUNTRY_INPUT
    ),  
    NationalPlayerInfo AS (
    SELECT *
    FROM Player_Season_Information JOIN NationalPlayers using(PLAYER)
    ),  
    LosingTeams AS (
    SELECT TEAM, END_SEASON AS SEASON
    FROM Team_Misc_Info
    WHERE L > W 
    )   
    SELECT NATIONALITY, PLAYER, COUNT(DISTINCT TEAM) AS LosingTeams
    FROM LosingTeams JOIN NationalPlayerInfo using(TEAM, SEASON)
    GROUP BY PLAYER
    HAVING COUNT(DISTINCT TEAM) >= 3;    
END; //
DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS query_six //

CREATE PROCEDURE query_six()
BEGIN
WITH Steal_Leaders_Teams AS (
SELECT TEAM, SEASON, MAX(STL) as STL 
FROM Player_Season_Information
GROUP BY TEAM, SEASON
),
StealLeaders AS (
SELECT PLAYER, SEASON, TEAM, STL, three_pa / FGA as three_p_ratio
FROM Player_Season_Information JOIN Steal_Leaders_Teams using(TEAM, SEASON, STL)
),
Shoot_25_From_3 AS (
    SELECT PLAYER, SEASON, TEAM, STL, three_pa / FGA as three_p_ratio
    FROM Player_Season_Information
    WHERE three_pa / FGA >= .25 
)
SELECT PLAYER, SEASON, TEAM, STL, three_p_ratio
FROM StealLeaders JOIN Shoot_25_From_3 using (PLAYER, SEASON, TEAM, STL, three_p_ratio);
END; //
DELIMITER ;

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

DELIMITER //

DROP PROCEDURE IF EXISTS query_nine //

CREATE PROCEDURE query_nine(IN season_input VARCHAR(4))
BEGIN
        with best_team AS (
                SELECT W / (W + L) as win_percentage, TEAM, END_SEASON as SEASON
                FROM Team_Misc_Info
                WHERE END_SEASON = season_input and W = (Select Max(W) from Team_Misc_Info WHERE END_SEASON = season_input)
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

DELIMITER //

DROP PROCEDURE IF EXISTS query_thirteen //

CREATE PROCEDURE query_thirteen(IN player_name VARCHAR(20))
BEGIN
        select TEAM, SEASON, PTS, FT
        from Player_Season_Information
        where player = player_name and PTS > 15 and FT > 0.25 * PTS;
END; //
DELIMITER ;

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

DELIMITER //
 
DROP PROCEDURE IF EXISTS insert_player//

CREATE PROCEDURE insert_player(IN player_name VARCHAR(100), 
                            IN player_number int(11), 
                            IN player_position VARCHAR(20), 
                            IN height VARCHAR(20),
                            IN weight VARCHAR(20),
                            IN birth_date VARCHAR(20),
                            IN nationality VARCHAR(20),
                            IN player_experience VARCHAR(20),
                            IN college VARCHAR(100))
BEGIN
        IF EXISTS (Select * from Player where PLAYER = player_name and NUMBER = player_number and POS = player_position and EXPERIENCE = player_experience) then
                SELECT CONCAT('ENTRY_EXISTS_ALREADY') as player_name;
        ELSE
        INSERT INTO Player
        VALUES (player_number, player_name, player_position, height, weight, birth_date, nationality, player_experience, college);

        SELECT *
        FROM Player
        where PLAYER = player_name and NUMBER = player_number and POS = player_position and EXPERIENCE = player_experience;

    END IF; 
END; //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS delete_player //
CREATE PROCEDURE delete_player(IN player_name VARCHAR(100), 
                            IN player_number int(11), 
                            IN player_position VARCHAR(20),
                            IN experience VARCHAR(20))
BEGIN
    IF NOT EXISTS (Select * from Player where PLAYER = player_name and NUMBER = player_number and POS = player_position and EXPERIENCE = experience) then
                SELECT CONCAT('ENTRY_DOESNT_EXIST_IN_DB') as player_name;
        ELSE
        DELETE FROM Player
        where PLAYER = player_name and NUMBER = player_number and POS = player_position and EXPERIENCE = experience;

        SELECT *
        FROM Player
        WHERE PLAYER = player_name;
    END IF; 
END; //
DELIMITER ;
