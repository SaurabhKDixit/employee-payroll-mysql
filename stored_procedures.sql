DELIMITER $$

CREATE PROCEDURE usp_AddDepartment (
    IN p_DeptName VARCHAR(50)
)
BEGIN
    INSERT INTO Departments (DeptName)
    VALUES (p_DeptName);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE usp_AddEmployee (
    IN p_EmpName VARCHAR(50),
    IN p_DeptID INT,
    IN p_Salary DECIMAL(10,2),
    IN p_HireDate DATE
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Departments WHERE DeptID = p_DeptID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist';
    ELSE
        INSERT INTO Employees (EmpName, DeptID, Salary, HireDate)
        VALUES (p_EmpName, p_DeptID, p_Salary, p_HireDate);
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE usp_ProcessPayroll (
    IN p_EmpID INT,
    IN p_PayMonth VARCHAR(20)
)
BEGIN
    DECLARE v_Salary DECIMAL(10,2);
    DECLARE v_Tax DECIMAL(10,2);
    DECLARE v_NetPay DECIMAL(10,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payroll processing failed';
    END;

    START TRANSACTION;

    SELECT Salary INTO v_Salary
    FROM Employees
    WHERE EmpID = p_EmpID;

    IF v_Salary IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee not found';
    END IF;

    SET v_Tax = v_Salary * 0.10;
    SET v_NetPay = v_Salary - v_Tax;

    INSERT INTO Payroll
        (EmpID, PayMonth, GrossPay, Tax, NetPay, ProcessedDate)
    VALUES
        (p_EmpID, p_PayMonth, v_Salary, v_Tax, v_NetPay, CURDATE());

    COMMIT;
END$$

DELIMITER ;
