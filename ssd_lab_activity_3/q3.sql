WITH
TABLE1 AS(
	SELECT Dnum FROM PROJECT WHERE Pname = "ProductY"
),
TABLE2 AS(
	SELECT Mgr_ssn FROM TABLE1, DEPARTMENT WHERE Dnum = Dnumber
)

SELECT Mgr_ssn AS "Manager ssn", Count(Pno) AS "Number of projects" FROM TABLE2, WORKS_ON
WHERE Mgr_ssn = Essn;