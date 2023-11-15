# 1) determines the average payment made to employees.
SELECT AVG(payment.PaymentAmount) AS 'AveragePayment' FROM payroll.payment;

# 2) Determines the number of employees on payroll.
SELECT COUNT(employee.EmployeeID) AS 'NumberOfEmployees' FROM payroll.employee;

# 3) Determines the number of employees in the student life department.
SELECT COUNT(employee.EmployeeID) AS 'StudentLifeEmployees' 
FROM employee JOIN job ON employee.JobID = job.JobID JOIN department ON department.DeptID = job.DeptID
WHERE department.DeptID = 'SL';

# 4) Determines the number of expenses that the Teaching Faculty group incures.
SELECT SUM(payment.PaymentAmount) AS 'TFExpenses'
FROM payment JOIN directdeposit ON payment.DirectDepositID = directdeposit.DirectDepositID
JOIN employee ON employee.EmployeeID = directdeposit.EmployeeID
JOIN job ON employee.JobID = job.JobID
JOIN department ON job.DeptID = department.DeptID
WHERE department.DeptID = 'TF';

# 5) Determines all of the teaching faculty with a Health Insurance teir of Silver
SELECT employee.FirstName, employee.LastName
FROM employee JOIN job ON employee.JobID = job.JobID
JOIN benefits ON benefits.BenefitsID = Job.BenefitsID
JOIN department ON job.DeptID = department.DeptID
WHERE benefits.HealthInsuranceTier = 'Silver' AND department.Name = 'Teaching Faculty';

# 6) Determines the total number of hours that employee "Nicholas Rosasco" worked before the month of October.
SELECT SUM(timeworked.Hours) AS 'TotalHours'
FROM employee JOIN timeworked ON employee.EmployeeID = timeworked.EmployeeID
JOIN payperiods ON timeworked.PayPeriodID = payperiods.PayPeriodID
WHERE employee.EmployeeID = 1 AND payperiods.EndDate < '2023-10-1';

# 7) Returns the number of employees in each department with an employee on payroll.
SELECT COUNT(employee.EmployeeID) AS 'NumEmployees', department.Name
FROM employee JOIN job ON employee.JobID = job.JobID
JOIN benefits ON benefits.BenefitsID = Job.BenefitsID
JOIN department ON job.DeptID = department.DeptID
GROUP BY department.DeptID
HAVING COUNT(employee.EmployeeID) > 0
ORDER BY COUNT(employee.EmployeeID);

# 8) Returns the employee's name, job title, and benefits information where their HSA benefit is greater than 1000, ordered by HSA amount.
#SET PERSIST sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
#SELECT @@sql_mode;
SELECT employee.FirstName, employee.LastName, job.Title, benefits.HSA, benefits.HealthInsuranceTier
FROM employee JOIN job ON employee.JobID = job.JobID
JOIN benefits ON benefits.BenefitsID = Job.BenefitsID
WHERE HSA > 1000
ORDER BY benefits.HSA;

# 9) Determines the number of expenses that the President's Office incured before December.
SELECT SUM(payment.PaymentAmount) AS 'POExpenses'
FROM payment JOIN directdeposit ON payment.DirectDepositID = directdeposit.DirectDepositID
JOIN employee ON employee.EmployeeID = directdeposit.EmployeeID
JOIN job ON employee.JobID = job.JobID
JOIN department ON job.DeptID = department.DeptID
WHERE department.DeptID = 'PO' AND payment.PaymentDate < '2023-12-1';

# 10) The amount paid to employee "Carrie Whittier" in the month of september
SELECT (@time * job.HourlyRate) AS 'Amount Paid'
FROM( SELECT @time := SUM(timeworked.Hours) AS 'TotalHours'
FROM employee JOIN timeworked ON employee.EmployeeID = timeworked.EmployeeID
JOIN payperiods ON timeworked.PayPeriodID = payperiods.PayPeriodID
JOIN job ON employee.JobID = job.JobID
WHERE employee.EmployeeID = 4 AND payperiods.EndDate < '2023-10-1' AND payperiods.StartDate >= '2023-9-1') timeAmount
JOIN job JOIN Employee ON employee.JobID = job.JobID
WHERE employee.EmployeeID = 4;

# 11) Count number of employees from each state
SELECT COUNT(Employee.EmployeeID) AS "NumEmployees", Employee.State FROM payroll.Employee
GROUP BY Employee.State
ORDER BY COUNT(employee.EmployeeID);

# 12) Trigger after Updating: After Updating the Job Table, if the hourly rate of an employee was reduced, also reduce their benefits package.
delimiter //
create trigger jobToBenefits after update
on payroll.job
FOR EACH ROW
       BEGIN
           IF NEW.HourlyRate < OLD.HourlyRate AND NEW.BenefitsID > 1 THEN
			   UPDATE job
               SET job.BenefitsID = OLD.BenefitsID - 1
               WHERE NEW.JobID = job.JobID;
		    END IF;
       END;//
//

# 13) Trigger before Deleting: Before Deleting a row in the payperiods table, all associated rows in the timeworked table are deleted.
delimiter //
create trigger SafePayPeriods before delete
ON payroll.payperiods
FOR EACH ROW
       BEGIN
           DELETE FROM timeworked
           WHERE timeworked.PayPeriodID = OLD.PayPeriodID;
       END;//
//

# 14) Stored Procedure to get sum of all expenses for a given department (param is DeptID) for the current calendar year
delimiter //
create procedure GetSpendingForDepartment(IN pDept VARCHAR(4))
begin
	SELECT SUM(payment.PaymentAmount) AS 'Expenses'
	FROM payment JOIN directdeposit ON payment.DirectDepositID = directdeposit.DirectDepositID
	JOIN employee ON employee.EmployeeID = directdeposit.EmployeeID
	JOIN job ON employee.JobID = job.JobID
	JOIN department ON job.DeptID = department.DeptID
	WHERE department.DeptID = pDept AND YEAR(payment.PaymentDate) = YEAR(CURDATE());
end //
delimiter ;
call GetSpendingForDepartment("PO");

# 15) Create New Users w/ GRANT and REVOKE
CREATE USER IF NOT EXISTS nkoeppen@localhost
IDENTIFIED BY "Koeppen1";
CREATE USER IF NOT EXISTS mdembny@localhost
IDENTIFIED BY "Dembny1";

GRANT ALL ON bits TO nkoeppen@localhost;
GRANT ALL ON bits TO mdembny@localhost;
SHOW GRANTS FOR nkoeppen@localhost;
SHOW GRANTS FOR mdembny@localhost;

REVOKE UPDATE,DELETE ON bits FROM nkoeppen@localhost;
SHOW GRANTS FOR nkoeppen@localhost;
REVOKE UPDATE,DELETE ON bits FROM mdembny@localhost;
SHOW GRANTS FOR mdembny@localhost;