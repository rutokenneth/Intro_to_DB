-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- Drop tables in reverse order of dependency to avoid foreign key constraint issues
-- This is useful for re-running the script during development
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;

--
-- Table structure for table `Authors`
--
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

--
-- Table structure for table `Books`
--
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- Using DECIMAL for currency for precision
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

--
-- Table structure for table `Customers`
--
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Email should likely be unique
    address TEXT
);

--
-- Table structure for table `Orders`
--
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--
-- Table structure for table `Order_Details`
--
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL, -- Quantity should be an integer
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Optional: Add indexes for foreign keys to improve performance on joins
CREATE INDEX idx_books_author_id ON Books (author_id);
CREATE INDEX idx_orders_customer_id ON Orders (customer_id);
CREATE INDEX idx_order_details_order_id ON Order_Details (order_id);
CREATE INDEX idx_order_details_book_id ON Order_Details (book_id);
