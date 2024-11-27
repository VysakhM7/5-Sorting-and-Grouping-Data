-- 1. Create the database
CREATE DATABASE IF NOT EXISTS MyDatabase;

-- 2. Use the database
USE MyDatabase;

-- 3. Create the 'Country' table
CREATE TABLE Country (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Country_name VARCHAR(255),
    Population INT,
    Area INT
);

-- 4. Create the 'Persons' table
CREATE TABLE Persons (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating DECIMAL(3,2),
    Country_Id INT,
    Country_name VARCHAR(255),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- 5. Insert data into the 'Country' table (10 rows)
INSERT INTO Country (Country_name, Population, Area) 
VALUES 
('Country1', 1000000, 10000),
('Country2', 2500000, 20000),
('Country3', 1500000, 15000),
('Country4', 500000, 5000),
('Country5', 2000000, 25000),
('Country6', 800000, 7000),
('Country7', 1200000, 18000),
('Country8', 900000, 13000),
('Country9', 1100000, 14000),
('Country10', 950000, 16000);

-- 6. Insert data into the 'Persons' table (10 rows)
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
('John', 'Doe', 30000, 4.5, 1, 'Country1'),
('Jane', 'Smith', 25000, 4.8, 2, 'Country2'),
('Alice', 'Johnson', 35000, 4.2, 3, 'Country3'),
('Bob', 'Brown', 22000, 3.9, 4, 'Country4'),
('Charlie', 'Davis', 40000, 4.7, 5, 'Country5'),
('David', 'Wilson', 27000, 4.0, 6, 'Country6'),
('Emma', 'Moore', 38000, 4.3, 7, 'Country7'),
('Frank', 'Taylor', 21000, 4.1, 8, 'Country8'),
('Grace', 'Anderson', 24000, 4.6, 9, 'Country9'),
('Hannah', 'Thomas', 29000, 3.8, 10, 'Country10');

-- 7. Query to print the first three characters of Country_name from the Country table
SELECT SUBSTRING(Country_name, 1, 3) AS Country_Prefix
FROM Country;

-- 8. Query to concatenate first name and last name from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- 9. Query to count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries
FROM Persons;

-- 10. Query to print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population
FROM Country;

-- 11. Query to print the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

-- 12. Insert 2 new rows into the Persons table making Lname NULL. Then count Lname values
-- Insert two new rows with NULL Lname
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES ('John', NULL, 30000, 4.5, 1, 'Country1'),
       ('Jane', NULL, 25000, 4.8, 2, 'Country2');

-- Count Lname values
SELECT COUNT(Lname) AS Lname_Count
FROM Persons
WHERE Lname IS NOT NULL;

-- 13. Query to find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- 14. Query to show the population of the Country table for the first 3 rows
SELECT Population
FROM Country
LIMIT 3;

-- 15. Query to print 3 random rows from the Country table
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;

-- 16. List all persons ordered by their rating in descending order
SELECT Fname, Lname, Rating
FROM Persons
ORDER BY Rating DESC;

-- 17. Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- 18. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 19. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;
-- 1. Perform INNER JOIN, LEFT JOIN, and RIGHT JOIN on the tables

-- INNER JOIN: Returns only matching records from both tables
SELECT p.Fname, p.Lname, c.Country_name, p.Rating
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;

-- LEFT JOIN: Returns all records from Persons table, with matching records from Country table
-- If no match, NULL is returned for columns from Country table
SELECT p.Fname, p.Lname, c.Country_name, p.Rating
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

-- RIGHT JOIN: Returns all records from Country table, with matching records from Persons table
-- If no match, NULL is returned for columns from Persons table
SELECT p.Fname, p.Lname, c.Country_name, p.Rating
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;

-- 2. List all distinct country names from both the Country and Persons tables
SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS DistinctCountries;

-- 3. List all country names from both the Country and Persons tables, including duplicates
SELECT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION ALL
    SELECT Country_name FROM Persons
) AS AllCountries;

-- 4. Round the ratings of all persons to the nearest integer in the Persons table
SELECT Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;