-- 1. Add a new column called DOB in the Persons table with data type as Date
ALTER TABLE Persons ADD DOB DATE;

-- 2. Create a user-defined function to calculate age using DOB
DELIMITER //
CREATE FUNCTION CalculateAge(birthdate DATE) 
RETURNS INT 
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
END //
DELIMITER ;

-- 3. Fetch the Age of all persons using the CalculateAge function
SELECT Id, Fname, Lname, Country_name, DOB, CalculateAge(DOB) AS Age FROM Persons;

-- 4. Find the length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS NameLength FROM Country;

-- 5. Extract the first three characters of each country's name in the Country table
SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

-- 6. Convert all country names to uppercase and lowercase in the Country table
SELECT Country_name, 
       UPPER(Country_name) AS UppercaseName, 
       LOWER(Country_name) AS LowercaseName 
FROM Country;