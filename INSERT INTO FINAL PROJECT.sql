# This is modeled to follow the business-side of Valparaiso University

# BENEFITS
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Bronze", 2.5, 1000, 40);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Bronze", 5.0, 1000, 50);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Silver", 5.0, 1000, 60);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Silver", 10.0, 2000, 70);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Gold", 5.0, 2000, 80);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Gold", 10.0, 4000, 80);
INSERT INTO Benefits (HealthInsuranceTier, 401K, HSA, PaidTimeOff) VALUES ("Platinum", 10.0, 4000, 100);

# DEPARTMENT
INSERT INTO Department (DeptID, Name, Budget) VALUES ("IT", "Information Technology", 500000);
INSERT INTO Department (DeptID, Name, Budget) VALUES ("HR", "Human Resouces", 200000);
INSERT INTO Department (DeptID, Name, Budget) VALUES ("SL", "Student Life", 2500000);
INSERT INTO Department (DeptID, Name, Budget) VALUES ("FM", "Facilities Management", 1000000);
INSERT INTO Department (DeptID, Name, Budget) VALUES ("TF", "Teaching Faculty", 1000000);
INSERT INTO Department (DeptID, Name, Budget) VALUES ("PO", "Presidents Office", 500000);

# JOB
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("PROF", "Professor", "TF", 30, 3);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("PRES", "President", "PO", 100, 7);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("DSL", "Director of Student Life", "SL", 60, 5);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("NA", "Network Analyst", "IT", 40, 3);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("DEAN", "Dean", "TF", 75, 6);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("LAND", "Landscaping", "FM", 20, 1);
INSERT INTO Job (JobID, Title, DeptID, HourlyRate, BenefitsID) VALUES ("JAN", "Janitor", "FM", 25, 2);

# EMPLOYEE
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Nicholas", "Rosasco", "2305 Chicago Street", "Valparaiso", "IN", 46383, "PROF");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Timothy", "Malchow", "", "Valparaiso", "IN", 46383, "PROF");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Jose", "Padilla", "", "Valparaiso", "IN", 46383, "PRES");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Carrie", "Whittier", "", "Valparaiso", "IN", 46383, "DSL");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Gregg", "Johnson", "", "Valparaiso", "IN", 46383, "DEAN");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Nicholas", "Koeppen", "306 Lafayette Street", "Valparaiso", "IN", 46383, "NA");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Benjamin", "Koeppen", "306 Lafayette Street", "Valparaiso", "IN", 46383, "JAN");
INSERT INTO Employee (FirstName, LastName, StreetAddress, City, State, ZipCode, JobID) VALUES ("Spencer", "Gannon", "", "Valparaiso", "IN", 46383, "LAND");


# DIRECT DEPOSIT
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (1, 123456, 654321, "Chase Manhattan Bank");
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (2, 654321, 123456, "Fifth Third Bank");
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (3, 098765, 567890, "Home State Bank");
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (4, 567890, 098765, "First Source Bank");
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (5, 587392, 829040, "Centier Bank");
INSERT INTO DirectDeposit (EmployeeID, RoutingNumber, AccountNumber, BankName) VALUES (6, 374850, 383905, "Boeing Employees Credit Union");

# PAYMENT
INSERT INTO Payment (DirectDepositID, PaymentAmount, PaymentDate) VALUES (1, 1225.50, CURDATE()); #ERROR, TRUNCATES DECIMAL
INSERT INTO Payment (DirectDepositID, PaymentAmount, PaymentDate) VALUES (2, 1325.50, CURDATE());
INSERT INTO Payment (DirectDepositID, PaymentAmount, PaymentDate) VALUES (3, 2550.75, CURDATE());
INSERT INTO Payment (DirectDepositID, PaymentAmount, PaymentDate) VALUES (4, 1430.60, CURDATE());
INSERT INTO Payment (DirectDepositID, PaymentAmount, PaymentDate) VALUES (5, 1650.80, CURDATE());

# PAYPERIODS
INSERT INTO PayPeriods (StartDate, EndDate) VALUES ("2023-09-01", "2023-09-15");
INSERT INTO PayPeriods (StartDate, EndDate) VALUES ("2023-09-15", "2023-09-29");
INSERT INTO PayPeriods (StartDate, EndDate) VALUES ("2023-09-29", "2023-10-13");
INSERT INTO PayPeriods (StartDate, EndDate) VALUES ("2023-10-13", "2023-10-27");
INSERT INTO PayPeriods (StartDate, EndDate) VALUES ("2023-10-27", "2023-11-10");


# TIMEWORKED
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (1, 1, 80);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (2, 1, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (3, 1, 60);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (4, 1, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (5, 1, 40);

INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (1, 2, 80);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (2, 2, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (3, 2, 60);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (4, 2, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (5, 2, 40);

INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (1, 3, 80);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (2, 3, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (3, 3, 60);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (4, 3, 40);
INSERT INTO TimeWorked (EmployeeID, PayPeriodID, Hours) VALUES (5, 3, 40);

