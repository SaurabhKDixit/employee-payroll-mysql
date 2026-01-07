# Employee & Payroll Management System (MySQL)

## 📌 Overview
This project is a MySQL-based Employee & Payroll Management System.  
All business logic is implemented using stored procedures to ensure data consistency, security, and reusability.

## 🛠️ Technologies
- MySQL 8
- SQL
- Stored Procedures
- Transactions
- Views

## 🗂️ Database Design
- Departments
- Employees
- Payroll

## ⚙️ Features
- Add departments and employees using stored procedures
- Process monthly payroll with transaction control and error handling
- Generate payroll reports using SQL views
- Enforce referential integrity using foreign keys

## ▶️ How to Run
1. Execute `schema.sql`
2. Execute `stored_procedures.sql`
3. Execute `views.sql`
4. Execute `sample_data.sql`
5. Run:
   ```sql
   SELECT * FROM vw_MonthlyPayroll;
