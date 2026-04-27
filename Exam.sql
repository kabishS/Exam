CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE EmployeePersonal (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Salary (
    EmpID INT,
    BasicSalary DECIMAL(10,2),
    Incentive DECIMAL(10,2),
    TotalSalary DECIMAL(10,2),
    FOREIGN KEY (EmpID) REFERENCES EmployeePersonal(EmpID)
);
INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO EmployeePersonal VALUES
(101, 'Arun', 25, 2),
(102, 'Priya', 28, 1),
(103, 'Kumar', 30, 3);

INSERT INTO Salary VALUES
(101, 30000, 2000, 32000),
(102, 25000, 1500, 26500),
(103, 40000, 3000, 43000);
SELECT 
    MIN(TotalSalary) AS Minimum_Salary,
    MAX(TotalSalary) AS Maximum_Salary,
    SUM(TotalSalary) AS Total_Salary,
    AVG(TotalSalary) AS Average_Salary
FROM Salary;
..........
-- Create Table
CREATE TABLE Salary (
    EmpID INT PRIMARY KEY,
    BasicSalary DECIMAL(10,2),
    Incentive DECIMAL(10,2),
    TotalSalary DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO Salary VALUES
(101, 20000, 2000, 22000),
(102, 25000, 3000, 28000);

-- Create Stored Procedure
DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN emp_id INT,
    IN incentive_amt DECIMAL(10,2),
    OUT new_salary DECIMAL(10,2)
)
BEGIN
    -- Update salary
    UPDATE Salary
    SET 
        Incentive = Incentive + incentive_amt,
        TotalSalary = BasicSalary + Incentive + incentive_amt
    WHERE EmpID = emp_id;

    -- Get updated salary
    SELECT TotalSalary INTO new_salary
    FROM Salary
    WHERE EmpID = emp_id;
END //

DELIMITER ;

-- Call Procedure
CALL UpdateSalary(101, 1000, @new_salary);

-- Show Result
SELECT @new_salary;
