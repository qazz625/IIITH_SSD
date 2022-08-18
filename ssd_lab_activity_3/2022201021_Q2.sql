WITH
TABLE1 AS (
	SELECT Super_ssn, COUNT(ssn) AS Emp_count
	FROM EMPLOYEE
	GROUP BY Super_ssn
)

SELECT CONCAT(Fname, " ", Minit, " ", Lname) AS "Full Name", TABLE1.Super_ssn AS ssn, Dnumber AS "Dept. Id", Emp_count AS "Number of Employees"
FROM TABLE1, DEPARTMENT, EMPLOYEE 
WHERE TABLE1.Super_ssn = Ssn AND Mgr_ssn = TABLE1.Super_ssn;

