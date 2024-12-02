-- Create a new database named MyDatabase
CREATE DATABASE MyDatabase;

-- Use the newly created database
USE MyDatabase;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'India', 1380000000, 3287263),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 212000000, 8515767),
(5, 'Russia', 146000000, 17098242),
(6, 'Japan', 126000000, 377975),
(7, 'Germany', 83000000, 357022),
(8, 'France', 67000000, 551695),
(9, 'UK', 67000000, 243610),
(10, 'Canada', 38000000, 9984670);

-- Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 10000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 20000, 4.7, 2, 'India'),
(3, 'Wei', 'Li', 15000, 4.8, 3, 'China'),
(4, 'Carlos', 'Silva', 12000, 4.2, 4, 'Brazil'),
(5, 'Olga', 'Ivanova', 11000, 4.6, 5, 'Russia'),
(6, 'Yuki', 'Tanaka', 13000, 4.9, 6, 'Japan'),
(7, 'Hans', 'Muller', 14000, 4.3, 7, 'Germany'),
(8, 'Marie', 'Dubois', 16000, 4.4, 8, 'France'),
(9, 'James', 'Brown', 17000, 4.5, 9, 'UK'),
(10, 'Alice', 'White', 18000, 4.1, 10, 'Canada');

-- 1. Print the first three characters of Country_name
SELECT LEFT(Country_name, 3) AS ShortName FROM Country;

-- 2. Concatenate first name and last name from Persons table
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

-- 3. Count unique Country_name in Persons table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons;

-- 4. Print the maximum population from Country table
SELECT MAX(Population) AS MaxPopulation FROM Country;

-- 5. Print the minimum population from Persons table
SELECT MIN(Population) AS MinPopulation FROM Persons;

-- 6. Insert 2 new rows with Lname as NULL and count Lname
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11, 'Nina', NULL, 9000, 3.9, 1, 'USA'), (12, 'Raj', NULL, 8000, 4.0, 2, 'India');

SELECT COUNT(Lname) AS LnameCount FROM Persons;

-- 7. Find the number of rows in the Persons table
SELECT COUNT(*) AS RowCount FROM Persons;

-- 8. Show the population of the first 3 rows in Country
SELECT Population FROM Country LIMIT 3;

-- 9. Print 3 random rows of countries
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their Rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

-- 11. Find the total population for each country in Persons table
SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name;

-- 12. Find countries in Persons table with total population > 50,000
SELECT Country_name FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;

-- 13. List total persons and average rating for each country with >2 persons
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AvgRating ASC;
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
