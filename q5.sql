DELIMITER //

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;

    -- Cursor to select all SubscriberIDs
    DECLARE cur CURSOR FOR
        SELECT SubscriberID FROM Subscribers;

    -- Handler to detect end of result set
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Call the existing watch history procedure for this subscriber
        CALL GetWatchHistoryBySubscriber(sub_id);

    END LOOP;

    -- Close the cursor
    CLOSE cur;
END //

DELIMITER ;
