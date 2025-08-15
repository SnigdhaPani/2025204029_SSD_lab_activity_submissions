DELIMITER //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE watch_count INT;

    -- Cursor to loop through all Subscriber IDs
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if this subscriber has watch history
        SELECT COUNT(*) INTO watch_count
        FROM WatchHistory
        WHERE SubscriberID = sub_id;

        -- Only call the procedure if they have watched something
        IF watch_count > 0 THEN
            -- Call your existing procedure for this subscriber
            CALL GetWatchHistoryBySubscriber(sub_id);
        END IF;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;