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
