CREATE DATABASE Library;


USE Library;


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT
);

 CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublishedYear INT,
    CopiesAvailable INT,
    BookCategory VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

 INSERT INTO Authors VALUES 
(1, 'George', 'Orwell', 1903),
(2, 'Jane', 'Austen', 1775),
(3, 'Mark', 'Twain', 1835),
(4, 'J.K.', 'Rowling', 1965),
(5, 'F. Scott', 'Fitzgerald', 1896);

 INSERT INTO Books  VALUES 
(1, '1984', 1, 1949, 12, 'Dystopian'),
(2, 'Pride and Prejudice', 2, 1813, 5, 'Romance'),
(3, 'Adventures of Huckleberry Finn', 3, 1884, 8, 'Adventure'),
(4, 'Harry Potter and the Sorcerers Stone', 4, 1997, 15, 'Fantasy'),
(5, 'The Great Gatsby', 5, 1925, 7, 'Classic');


--Q1 : 

SELECT * FROM Books;
SELECT * FROM Authors;

--Q2 : 

 SELECT TOP 1 Title, CopiesAvailable FROM Books ORDER BY CopiesAvailable DESC;



SELECT TOP 1 Title, CopiesAvailable FROM Books ORDER BY CopiesAvailable ASC;


--Q3 : 
SELECT AVG(PublishedYear) AS AveragePublicationYear  FROM Books;

--Q4 : 

SELECT COUNT(*) AS TotalBooksCount FROM Books;

--Q5 : 

TRUNCATE TABLE Books;


--Q6: 

DROP TABLE Authors;