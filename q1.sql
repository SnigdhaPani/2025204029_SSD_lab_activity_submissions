DELIMITER //

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE subName VARCHAR(100);

    -- Declare cursor
    DECLARE cur CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    -- Declare handler to detect end of data
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;

    -- Loop through each row
    read_loop: LOOP
        FETCH cur INTO subName;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Print subscriber name (via SELECT)
        SELECT subName AS SubscriberName;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
END //

DELIMITER ;
