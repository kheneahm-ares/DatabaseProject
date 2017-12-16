DROP PROCEDURE IF EXISTS proc_update_days_left;

DELIMITER //
CREATE PROCEDURE proc_update_days_left()
BEGIN
    DECLARE cur_id INT;
    DECLARE cur_date DATE;
    DECLARE done INT DEFAULT 0;

    DECLARE cur CURSOR FOR
    SELECT id, dateDue FROM rentals WHERE isReturned = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    
    read_loop: LOOP

        FETCH cur INTO cur_id, cur_date;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE rentals
        SET daysLeft = (SELECT DATEDIFF(cur_date, CURDATE()))
        WHERE id = cur_id;

    END LOOP;
    
    CLOSE cur;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS proc_update_fee;

DELIMITER //
CREATE PROCEDURE proc_update_fee()
BEGIN
    DECLARE cur_id INT;
    DECLARE cur_days INT;
    DECLARE done INT DEFAULT 0;

    DECLARE cur CURSOR FOR
    SELECT id, daysLeft FROM rentals WHERE isReturned = 0 
    AND daysLeft < 0 AND fee < 10;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    
    read_loop: LOOP

        FETCH cur INTO cur_id, cur_days;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE rentals
        SET fee = (SELECT ABS(cur_days) * .25)
        WHERE id = cur_id;

    END LOOP;
    
    CLOSE cur;
END //
DELIMITER ;

DROP EVENT IF EXISTS update_event;

DELIMITER //
CREATE EVENT update_event
    ON SCHEDULE
        EVERY 1 DAY
        STARTS (CURRENT_DATE + INTERVAL 1 DAY)
    DO
      CALL proc_update_days_left();
      CALL proc_update_fee();
//
DELIMITER ;

DROP TRIGGER IF EXISTS ins_notification;

DELIMITER //
CREATE TRIGGER ins_notification AFTER UPDATE ON rentals
FOR EACH ROW
BEGIN
    IF (!NEW.isReturned && NEW.daysLeft < 0) THEN
        INSERT INTO notifications (message, rentalId, userId, created_at, updated_at)
        VALUES ('Your rental is overdue!', NEW.id, NEW.userId, NOW(), NOW());
    ELSEIF (!NEW.isReturned && NEW.daysLeft < 4) THEN
        INSERT INTO notifications (message, rentalId, userId, created_at, updated_at)
        VALUES (CONCAT('Your rental is due in ', NEW.daysLeft, ' day(s).'), NEW.id, NEW.userId, NOW(), NOW());
    END IF;
END
//
DELIMITER ;
