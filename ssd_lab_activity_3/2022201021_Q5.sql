WITH
TABLE1 AS (
	SELECT Mgr_ssn, COUNT(Dlocation) AS NoLocations, DEPARTMENT.Dnumber FROM DEPARTMENT, DEPT_LOCATIONS
	WHERE DEPARTMENT.Dnumber = DEPT_LOCATIONS.Dnumber
	GROUP BY DEPARTMENT.Dnumber
	HAVING NoLocations > 1
),
TABLE2 AS(
	SELECT Mgr_ssn, Dnumber, Dependent_name FROM TABLE1, DEPENDENT
	WHERE Mgr_ssn = Essn
)

SELECT Mgr_ssn AS "Manager ssn", Dnumber AS "Dept. Id", COUNT(Dependent_name) AS "Number of Dependents" FROM TABLE2
GROUP BY Mgr_ssn, Dnumber;

