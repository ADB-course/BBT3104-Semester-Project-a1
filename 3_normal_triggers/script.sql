-- Write your SQL code here
CREATE TABLE MilkLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    BatchNumber INT,
    LogMessage VARCHAR(255),
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

DELIMITER $$
CREATE TRIGGER AfterMilkInsert 
AFTER INSERT ON Milk 
FOR EACH ROW
BEGIN
    INSERT INTO MilkLog (BatchNumber, LogMessage)
    VALUES (NEW.BatchNumber, CONCAT('New Milk batch added: ', NEW.TypeOfMilk));
END$$
DELIMITER ;
