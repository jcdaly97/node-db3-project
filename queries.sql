-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    SELECT p.ProductName, c.CategoryName
    FROM Products as p
    JOIN Categories as c
	ON p.CategoryID = c.CategoryID
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    SELECT o.OrderID, s.ShipperName
    FROM Orders as o
    JOIN Shippers as s
	ON o.ShipperID = s.ShipperID
    WHERE o.OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    SELECT p.ProductName, o.Quantity
    FROM OrderDetails as o
    JOIN Products as p
    ON o.ProductID = p.ProductID
    WHERE o.OrderID = 10251
    ORDER BY p.ProductName desc
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    SELECT o.OrderID, c.CustomerName, e.LastName
    FROM Orders as o
    JOIN Customers as c
    JOIN Employees as e