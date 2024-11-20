-- Write your SQL code here
DELIMITER $$
CREATE PROCEDURE AddMilkTransaction (
    IN BatchNumber INT, 
    IN TypeOfMilk VARCHAR(50), 
    IN ProductionDate DATE, 
    IN ExpiryDate DATE, 
    IN Volume DECIMAL(10, 2), 
    IN DairyFarmerID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert milk batch
    INSERT INTO Milk (BatchNumber, TypeOfMilk, ProductionDate, ExpiryDate, Volume, DairyFarmerID)
    VALUES (BatchNumber, TypeOfMilk, ProductionDate, ExpiryDate, Volume, DairyFarmerID);

    -- Log the addition
    INSERT INTO MilkLog (BatchNumber, LogMessage)
    VALUES (BatchNumber, CONCAT('Milk batch ', BatchNumber, ' added successfully.'));

    COMMIT;
END$$
DELIMITER ;
