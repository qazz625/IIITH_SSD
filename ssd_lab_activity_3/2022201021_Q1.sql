

WITH EMP AS(
	SELECT Essn, Sum(Hours) AS SH, Dnum FROM WORKS_ON, PROJECT
	WHERE Pno = Pnumber
	GROUP BY Essn, Dnum
	HAVING SH < 40
),
MGSSN AS (
	SELECT DISTINCT Mgr_ssn, Dname FROM DEPARTMENT, EMP WHERE Dnumber = Dnum
)

SELECT CONCAT(Fname, " ", Minit, " ", Lname) AS "Full Name", Ssn, Dno AS "Dept. Id", Dname AS "Dept. Name"
FROM MGSSN, EMPLOYEE WHERE Mgr_ssn = Ssn;


-- WITH 
-- EMP AS(
-- 	SELECT Essn, SUM(Hours) AS SH FROM WORKS_ON, PROJECT
-- 	WHERE Pno = Pnumber
-- 	GROUP BY Essn
-- 	HAVING SH < 40
-- ), 
-- TABLE2 AS (
-- 	SELECT DISTINCT Pno FROM WORKS_ON, EMP
-- 	WHERE EMP.Essn = WORKS_ON.Essn
-- ),
-- DEPTS AS (
-- 	SELECT Dnum FROM TABLE2, PROJECT WHERE Pno = Pnumber
-- ),
-- MGSSN AS (
-- 	SELECT Mgs_ssn FROM DEPARTMENT, DEPTS WHERE Dnumber = Dnum
-- ),

-- SELECT * FROM EMPLOYEE WHERE Mgr_ssn = 