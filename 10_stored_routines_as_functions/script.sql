-- Write your SQL code here
DELIMITER $$
CREATE FUNCTION TotalProduction(FarmerID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Volume) INTO total FROM Milk WHERE DairyFarmerID = FarmerID;
    RETURN total;
END$$
DELIMITER ;
