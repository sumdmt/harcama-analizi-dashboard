CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email NVARCHAR(100)
);

CREATE TABLE Budget (
    budget_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    monthly_budget DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    category NVARCHAR(50),
    amount DECIMAL(10,2),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (name, email)
VALUES 
('Ahmet Yılmaz', 'ahmet@gmail.com'),
('Ayşe Demir', 'ayse@gmail.com');

INSERT INTO Budget (user_id, monthly_budget)
VALUES 
(1, 10000),
(2, 8000);

INSERT INTO Expenses (user_id, category, amount, expense_date)
VALUES 
(1, 'Yemek', 200, '2026-05-01'),
(1, 'Ulaşım', 150, '2026-05-02'),
(1, 'Eğlence', 500, '2026-05-03'),
(2, 'Yemek', 300, '2026-05-01'),
(2, 'Fatura', 400, '2026-05-02');

SELECT category, SUM(amount) AS total_spent
FROM Expenses
GROUP BY category;

SELECT u.name, SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
GROUP BY u.name;
