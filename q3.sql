DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE cnt INT;
    DECLARE new_id INT;

    -- Check if the subscriber name already exists
    SELECT COUNT(*) INTO cnt
    FROM Subscribers
    WHERE SubscriberName = subName;

    IF cnt = 0 THEN
        -- Generate new SubscriberID manually
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO new_id
        FROM Subscribers;

        -- Insert new subscriber with generated SubscriberID
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (new_id, subName, CURDATE());

        -- Optional: confirmation message
        SELECT CONCAT('Subscriber "', subName, '" is added') AS Message;
    ELSE
        -- Optional: show already exists message
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END //

DELIMITER ;


