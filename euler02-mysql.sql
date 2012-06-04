DELIMITER $$

CREATE PROCEDURE euler2()
BEGIN

        SET @fibn = 1;
        SET @fibn_prev = 0;
        SET @res = 0;
        SET @tmp = 0;

        WHILE @fibn <= 4000000 DO

                IF @fibn % 2 = 0 THEN
                        SET @res = @res + @fibn;
                END IF;

                SET @tmp = @fibn;
                SET @fibn = @fibn_prev + @fibn;
                SET @fibn_prev = @tmp;

        END WHILE;

        SELECT @res, @fibn;

END $$

CALL euler2;

DROP PROCEDURE euler2;
