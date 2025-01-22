-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;
-- Create Table for Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Publisher VARCHAR(255),
    YearPublished INT,
    CopiesAvailable INT DEFAULT 0
);
-- Create Table for Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);
-- Create Table for Book_Authors (Many-to-Many Relationship)
CREATE TABLE Book_Authors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);
-- Create Table for Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(255) UNIQUE
);
-- Create Table for Loans
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
);


INSERT INTO Books (Title, ISBN, Publisher, YearPublished, CopiesAvailable) VALUES 
('The Great Gatsby', '9780743273565', 'Scribner', 1925, 5), 
('1984', '9780451524935', 'Signet Classic', 1949, 3), 
('To Kill a Mockingbird', '9780060935467', 'Harper Perennial Modern Classics', 1960, 4); 
-- Insert Sample Data into Authors 
INSERT INTO Authors (Name) 
VALUES 
('F. Scott Fitzgerald'), 
('George Orwell'), 
('Harper Lee'); 
-- Link Books and Authors 
INSERT INTO Book_Authors (BookID, AuthorID) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3); 
-- Insert Sample Data into Members 
INSERT INTO Members (Name, Address, PhoneNumber, Email) 
VALUES 
('John Doe', '123 Main St', '1234567890', 'johndoe@example.com'), 
('Jane Smith', '456 Oak Ave', '0987654321', 'janesmith@example.com'); 
-- Insert Sample Data into Loans 
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate, ReturnDate) VALUES 
(1, 1, '2025-01-01', '2025-01-15', NULL), 
(2, 2, '2025-01-05', '2025-01-19', '2025-01-18');

-- Note: All outputs will be provided in readme file.
