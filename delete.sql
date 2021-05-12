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
