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
    CONSTRAINT FK_Authors_Books FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


INSERT INTO Authors (AuthorID, FirsName, LastName, BirthYear) VALUES (1, 'George', 'Orwell', 1903), (2, 'J.K.', 'Rowling', 1965), (3, 'J.R.R.', 'Tolkien', 1892), (4, 'Agatha', 'Christie', 1890), (5, 'Stephen', 'King', 1947);


INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES (1, '1984', 1, 1949, 10, 'Dystopian'), (2, 'Harry Potter and the Philosopher''s Stone', 2, 1997, 5, 'Fantasy'), (3, 'The Hobbit', 3, 1937, 7, 'Fantasy'), (4, 'Murder on the Orient Express', 4, 1934, 3, 'Mystery'), (5, 'The Shining', 5, 1977, 2, 'Horror');



SELECT B.BookID, B.Title, A.FirsName +  A.LastName AS AuthorName, B.PublishedYear, B.CopiesAvailable, B.BookCategory
FROM Books B JOIN Authors A ON B.AuthorID = A.AuthorID;



SELECT TOP 1 Title, CopiesAvailable FROM Books ORDER BY CopiesAvailable DESC;



SELECT TOP 1 Title, CopiesAvailable FROM Books ORDER BY CopiesAvailable ASC;


SELECT AVG(PublishedYear) AS AveragePublicationYear FROM Books;



SELECT COUNT(*) AS TotalBooksCount FROM Books;



TRUNCATE TABLE Books;



ALTER TABLE Books DROP CONSTRAINT FK_Authors_Books;



DROP TABLE Authors;

