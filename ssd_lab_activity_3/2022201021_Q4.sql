WITH
TABLE1 AS (
	SELECT Dname, Dnumber, Mgr_ssn FROM DEPARTMENT, DEPENDENT
	WHERE Essn = Mgr_ssn AND Sex = "F"
),
TABLE2 AS (
	SELECT Dname, Dnumber, Mgr_ssn, COUNT(Mgr_ssn) AS FD FROM TABLE1
	GROUP BY Dname, Dnumber, Mgr_ssn
	HAVING FD > 1
)

SELECT TABLE2.Dnumber AS "Dept. Id", Dname AS "Dept. Name", COUNT(Dlocation) AS "Number of Locations"
FROM TABLE2, DEPT_LOCATIONS
WHERE TABLE2.Dnumber = DEPT_LOCATIONS.Dnumber
GROUP BY TABLE2.Dnumber, Dname;
