
-- 1) Show all tables and explain how they are related to one another (keys, triggers, etc.)
SHOW TABLES;


-- 2) A basic retrieval query
-- Retrieve all performers
SELECT * FROM Performers;


-- 3) A retrieval query with ordered results
-- Retrieve all shows ordered by performance year
SELECT * FROM Shows ORDER BY Performance_Year DESC;


-- 4) A nested retrieval query
-- Retrieve venues that have hosted shows after 2020
SELECT * FROM Venues WHERE Venue_ID IN (SELECT Venue_ID FROM Held_At WHERE Show_Year > 2020);


-- 5) A retrieval query using joined tables
-- Retrieve all performers and their respective shows
SELECT Performers.First_Name, Performers.Last_Name, Shows.Show_Name
FROM Performers
JOIN Shows ON Performers.Show_Name = Shows.Show_Name AND Performers.Show_Year = Shows.Performance_Year;


-- 6) An update operation with any necessary triggers
-- Update capacity for a specific venue
UPDATE Venues SET Capacity = 2500 WHERE Venue_ID = 1;

-- Triggers
DELIMITER //
CREATE TRIGGER UpdateVenueCapacity
AFTER UPDATE ON Venues
FOR EACH ROW
BEGIN
   INSERT INTO Audit_Log (change_description) VALUES (CONCAT('Updated capacity for venue ID ', NEW.Venue_ID));
END; //
DELIMITER ;


-- 7) A deletion operation with any necessary triggers
-- Delete a performer
DELETE FROM Performers WHERE Performer_ID = 3;

DELIMITER //
CREATE TRIGGER DeletePerformer
BEFORE DELETE ON Performers
FOR EACH ROW
BEGIN
   INSERT INTO Audit_Log (change_description) VALUES (CONCAT('Deleted performer ID ', OLD.Performer_ID));
END; //
DELIMITER ;
