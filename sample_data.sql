CALL usp_AddDepartment('IT');
CALL usp_AddDepartment('HR');

CALL usp_AddEmployee('John Doe', 1, 5000, '2023-01-10');
CALL usp_AddEmployee('Jane Smith', 2, 4500, '2023-03-15');

CALL usp_ProcessPayroll(1, 'March 2024');
CALL usp_ProcessPayroll(2, 'March 2024');
