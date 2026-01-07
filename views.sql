CREATE VIEW vw_MonthlyPayroll AS
SELECT
    e.EmpName,
    d.DeptName,
    p.PayMonth,
    p.GrossPay,
    p.Tax,
    p.NetPay,
    p.ProcessedDate
FROM Payroll p
JOIN Employees e ON p.EmpID = e.EmpID
JOIN Departments d ON e.DeptID = d.DeptID;
