-- Some queries:

-- 	List All Books with Available Copies
SELECT Title, ISBN, CopiesAvailable
FROM Books
WHERE CopiesAvailable > 0;


-- 	List Books Borrowed by a Specific Member
SELECT B.Title, L.LoanDate, L.DueDate
FROM Loans L
JOIN Books B ON L.BookID = B.BookID
JOIN Members M ON L.MemberID = M.MemberID
WHERE M.Name = 'John Doe';

-- 	Add a New Book Loan
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

SELECT * FROM Loans

-- 	Return a Book
UPDATE Loans
SET ReturnDate = CURDATE()
WHERE LoanID = 1;

SELECT * FROM Loans

-- 	Query to List All Books with Their Authors
SELECT 
    B.Title AS BookTitle,
    A.Name AS AuthorName
FROM 
    Books B
JOIN 
    Book_Authors BA ON B.BookID = BA.BookID
JOIN 
    Authors A ON BA.AuthorID = A.AuthorID;

-- 	Query to List Members and the Titles of Books They Borrowed
SELECT 
    M.MemberID,
    M.Name AS MemberName,
    B.Title AS BookTitle,
    L.LoanDate,
    L.DueDate,
    L.ReturnDate
FROM 
    Members M
JOIN 
    Loans L ON M.MemberID = L.MemberID
JOIN 
    Books B ON L.BookID = B.BookID;

-- 	Query to Count the Number of Books Borrowed by Each Member
SELECT 
    M.MemberID,
    M.Name AS MemberName,
    COUNT(L.LoanID) AS TotalBooksBorrowed
FROM 
    Members M
LEFT JOIN 
    Loans L ON M.MemberID = L.MemberID
GROUP BY 
    M.MemberID, M.Name;

-- 	Query to Find Overdue Books
SELECT 
    B.Title AS BookTitle,
    M.Name AS MemberName,
    L.LoanDate,
    L.DueDate
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
JOIN 
    Members M ON L.MemberID = M.MemberID
WHERE 
    L.DueDate < CURDATE() AND L.ReturnDate IS NULL;

-- 	Query to List All Members Who Have Not Borrowed Any Books
SELECT 
    M.MemberID,
    M.Name AS MemberName
FROM 
    Members M
LEFT JOIN 
    Loans L ON M.MemberID = L.MemberID
WHERE 
    L.LoanID IS NULL;

-- 	Query to Get the Total Number of Books by Each Author
SELECT 
    A.AuthorID,
    A.Name AS AuthorName,
    COUNT(BA.BookID) AS TotalBooks
FROM 
    Authors A
JOIN 
    Book_Authors BA ON A.AuthorID = BA.AuthorID
GROUP BY 
    A.AuthorID, A.Name;

-- Note : All outputs will be provided in readme file.
