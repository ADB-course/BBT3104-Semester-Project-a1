-- Write your SQL code here
CREATE TABLE ExpiredMilk (
    BatchNumber INT PRIMARY KEY,
    TypeOfMilk VARCHAR(50),
    ExpiryDate DATE,
    ArchivedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

DELIMITER $$
CREATE TRIGGER ArchiveExpiredMilk
AFTER UPDATE ON Milk
FOR EACH ROW
BEGIN
    IF NEW.ExpiryDate < CURDATE() THEN
        INSERT INTO ExpiredMilk (BatchNumber, TypeOfMilk, ExpiryDate)
        VALUES (NEW.BatchNumber, NEW.TypeOfMilk, NEW.ExpiryDate);
    END IF;
END$$
DELIMITER ;
