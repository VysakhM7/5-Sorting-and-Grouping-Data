-- 1. Perform INNER JOIN on Country and Persons tables
SELECT Persons.Id, Fname, Lname, Persons.Country_name, Population, Rating
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- Perform LEFT JOIN on Country and Persons tables
SELECT Country.Id, Country_name, Population, Area, Fname, Lname, Rating
FROM Country
LEFT JOIN Persons ON Country.Id = Persons.Country_Id;

-- Perform RIGHT JOIN on Country and Persons tables
SELECT Persons.Id, Fname, Lname, Rating, Country_name, Population, Area
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- 2. List all distinct country names from both Country and Persons tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

-- 3. List all country names from both Country and Persons tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- 4. Round the ratings of all persons to the nearest integer in the Persons table
SELECT Id, Fname, Lname, Country_name, Population, ROUND(Rating) AS RoundedRating
FROM Persons;
