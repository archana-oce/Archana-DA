create database MarketCo;
use MarketCo;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeIDs)
);

select * from Employee;

select * from ContactEmployee;

select * from Contact;

select * from Company;

-- Insert data into the Company table
INSERT INTO Company (CompanyName, Street, City, State, Zip)
VALUES 
('Urban Outfitters, Inc.', '5000 Broad Street', 'Philadelphia', 'PA', '19112'),
('Toll Brothers', '1140 Virginia Drive', 'Fort Washington', 'PA', '19034'),
('Apple Inc.', '1 Infinite Loop', 'Cupertino', 'CA', '95014');

-- Insert data into the Employee table
INSERT INTO Employee (FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
('Lesley', 'Bland', 75000.00, '2015-06-01', 'Manager', 'lesley.bland@marketco.com', '123-456-7890'),
('Jack', 'Lee', 60000.00, '2018-09-15', 'Developer', 'jack.lee@marketco.com', '123-555-9876'),
('Dianne', 'Connor', 55000.00, '2019-03-25', 'Sales Associate', 'dianne.connor@marketco.com', '123-222-4567');

-- Insert data into the Contact table
INSERT INTO Contact (CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 'Rachel', 'Adams', '6000 Walnut Street', 'Philadelphia', 'PA', '19139', TRUE, 'rachel.adams@urban.com', '215-333-4444'),
(2, 'Michael', 'Smith', '123 Main Street', 'Fort Washington', 'PA', '19034', TRUE, 'michael.smith@tollbrothers.com', '215-111-2222'),
(3, 'Sarah', 'Johnson', '200 Apple Way', 'Cupertino', 'CA', '95014', TRUE, 'sarah.johnson@apple.com', '408-555-1212');

-- Insert data into the ContactEmployee table
INSERT INTO ContactEmployee (ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, '2024-01-10', 'Met with Urban Outfitters team to discuss marketing.'),
(2, 2, '2024-01-15', 'Discussed project collaboration with Toll Brothers.'),
(2, 3, '2024-01-20', 'Followed up with Toll Brothers on sales opportunities.');

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');

SELECT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';

-- 8) What is the significance of % and _ operators in the LIKE statement?
-- The % and _ are wildcard characters used in the LIKE statement for pattern matching in SQL. 

-- % (Percent): Represents zero, one, or multiple characters. It is used when you want to match any sequence of characters.

-- 9) Explain normalization in the context of databases.
-- Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves breaking down tables into smaller, more manageable parts and establishing relationships between them.

-- Goals of Normalization:

-- Minimize data redundancy.
-- Avoid anomalies in data insertion, deletion, and updates.
-- Ensure data dependencies are logical.
-- Forms of Normalization:

-- 1NF (First Normal Form): Eliminate duplicate columns and ensure that each column contains atomic values.
-- 2NF (Second Normal Form): Meet 1NF criteria and ensure that all non-primary attributes are fully dependent on the primary key.
-- 3NF (Third Normal Form): Meet 2NF criteria and ensure no transitive dependencies (non-key attributes depending on other non-key attributes).
-- Higher forms like BCNF and 4NF exist for more complex scenarios.

-- 10) What does a JOIN in MySQL mean?
-- A JOIN in MySQL is used to combine rows from two or more tables based on a related column between them. It enables querying data spread across multiple tables.


-- 11) What do you understand about DDL, DCL, and DML in MySQL?
-- DDL (Data Definition Language): Used to define or alter the structure of a database or its objects (tables, indexes, etc.).
-- Examples: CREATE, ALTER, DROP, TRUNCATE.

-- DML (Data Manipulation Language): Used to manipulate data stored in the database.
-- Examples: INSERT, UPDATE, DELETE, SELECT.

-- DCL (Data Control Language): Used to manage access permissions and control user access to the database.
-- Examples: GRANT, REVOKE.


-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-- The JOIN clause allows combining rows from two or more tables based on a related column. It’s crucial for querying related data stored across multiple tables.

-- Common Types of Joins:
-- INNER JOIN: Returns records where there is a match in both tables.

-- LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table and matching records from the right table. If there’s no match, NULL values are shown.


-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table and matching records from the left table. If there’s no match, NULL values are shown.

-- FULL JOIN (or FULL OUTER JOIN): Returns all records from both tables, with NULLs where there’s no match. (Not directly supported in MySQL but can be simulated with UNION.)

-- CROSS JOIN: Returns the Cartesian product of two tables.
