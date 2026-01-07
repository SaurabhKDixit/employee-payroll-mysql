CREATE DATABASE payroll_db;
USE payroll_db;

CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Payroll (
    PayrollID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT,
    PayMonth VARCHAR(20),
    GrossPay DECIMAL(10,2),
    Tax DECIMAL(10,2),
    NetPay DECIMAL(10,2),
    ProcessedDate DATE,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
