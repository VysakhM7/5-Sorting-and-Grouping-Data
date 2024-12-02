-- Ensure you're using the correct database
USE MyDatabase; -- Change to your database name if needed

-- 1. Find the number of persons in each country
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA (using Subqueries)
SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create the Product database and Customer table
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(20),
    Country VARCHAR(50)
);

-- 6. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address, then perform the SELECT operation for the customer_info view
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

SELECT * FROM customer_info;

-- 7. Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'USA';

-- 8. Create another view named Customer_details with columns full name (Combine first_name and last_name), email, phone_no, and state
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

-- 9. Update phone numbers of customers who live in California for Customer_details view
UPDATE Customer
SET Phone_no = 'NEW_PHONE_NUMBER' -- Replace with the actual phone number
WHERE State = 'California';

-- 10. Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 11. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

-- 12. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order
SELECT * 
FROM Customer_details
ORDER BY State ASC;