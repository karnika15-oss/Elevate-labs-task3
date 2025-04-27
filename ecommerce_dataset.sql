
-- Drop tables if they exist
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    city TEXT
);

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com', 'New York'),
(2, 'Bob', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', 'Chicago'),
(4, 'Diana', 'diana@example.com', 'Houston');

-- Products table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price REAL
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 1000),
(2, 'Phone', 'Electronics', 500),
(3, 'Desk', 'Furniture', 300),
(4, 'Chair', 'Furniture', 150);

-- Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    total_amount REAL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1, 1, '2024-01-10', 1500),
(2, 2, '2024-02-15', 800),
(3, 3, '2024-03-20', 450),
(4, 1, '2024-04-05', 300);

-- OrderDetails table
CREATE TABLE OrderDetails (
    order_detail_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderDetails VALUES
(1, 1, 1, 1, 1000),
(2, 1, 4, 2, 150),
(3, 2, 2, 1, 500),
(4, 2, 3, 1, 300),
(5, 3, 4, 3, 150),
(6, 4, 3, 1, 300);
