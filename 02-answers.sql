-- 1. Display all the information of the EMP table
SELECT * FROM EMP;

-- 2. Display unique Jobs from EMP table
SELECT DISTINCT JOB FROM EMP;

-- 3. List the emps in the asc order of their Salaries
SELECT * FROM EMP ORDER BY SAL ASC;

-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs
SELECT * FROM EMP ORDER BY DEPTNO ASC , JOB DESC;

-- 5. Display all the unique job groups in the descending order
SELECT DISTINCT JOB FROM EMP ORDER BY JOB ASC;

-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM EMP WHERE EMPNO IN (
  SELECT MGR FROM EMP
);

-- 7. List the emps who joined before 1981
SELECT * FROM EMP WHERE HIREDATE < '1981-01-01';

-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annual sal
SELECT EMPNO, ENAME, SAL, SAL / 30 AS DAILY_SAL, SAL * 12 AS ANN_SAL
FROM EMP ORDER BY ANN_SAL ASC;

-- 9. Display the Empno, Ename, job, Hiredate, Exp (Experience) of all Mgrs
SELECT EMPNO, ENAME, JOB, HIREDATE, DATEDIFF(NOW(), HIREDATE)/(12*30) AS EXP_YRS
FROM EMP
WHERE EMPNO IN (
  SELECT MGR FROM EMP
)
ORDER BY EXP_YRS ASC;

-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698
SELECT EMPNO, ENAME, SAL, datediff(now(), hiredate)/(12 * 30) as EXP_YRS
FROM EMP
WHERE MGR = 7698;

-- 11. Display all the details of the emps whose Comm. Is more than their Sal.
SELECT * from EMP WHERE COMM > SAL;

-- 12. List the emps in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM EMP
  WHERE HIREDATE > '1981-06-01'
ORDER BY JOB ASC;

-- 13. List the emps along with their Exp and Daily Sal is more than Rs.100
SELECT e.*, datediff(NOW(), HIREDATE)/(12 * 30) as EXP_YRS, SAL/30 as DAILY_SAL
FROM EMP e
WHERE SAL/30 > 100;

-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'ANALYST')
ORDER BY JOB;

-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT * FROM EMP
WHERE HIREDATE IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19')
ORDER BY HIREDATE ASC;

-- 16. List the emp who are working for the Deptno 10 or20
SELECT * FROM EMP e
WHERE DEPTNO = 10
OR DEPTNO = 20;

-- 17. List the emps who are joined in the year 81
SELECT * FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1982-01-01';

-- 18. List the emps who are joined in the month of Feb 1981
SELECT * FROM EMP
WHERE HIREDATE BETWEEN '1981-02-01' AND '1981-03-01';


-- 19. List the emps Who Annual sal ranges from 22000 and 45000
SELECT * FROM EMP WHERE SAL * 12 BETWEEN 22000 and 45000;

-- 20. List the Enames those are having five characters in their Names.
SELECT ENAME FROM EMP WHERE length(ENAME) > 5;

-- 21. List the Enames those are starting with ‘T’ and with five characters.
SELECT ENAME FROM EMP WHERE length(ENAME) > 5 AND ENAME like 'T%';

-- 22. List the emps those are having four chars and third character must be ‘r’.
SELECT ENAME FROM EMP WHERE length(ENAME) = 4 AND ENAME LIKE '__r%';

-- 23. List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT ENAME FROM EMP WHERE length(ENAME) = 5 AND ENAME LIKE 'S%H';

-- 24. List the emps who joined in January.
SELECT * FROM EMP WHERE month(HIREDATE) = 01;

-- 25. List the emps who joined in the month of which second character is ‘a’.
SELECT * FROM EMP WHERE monthname(HIREDATE) like '_a%';

-- 26. List the emps whose Sal is four digit number ending with Zero
SELECT * FROM EMP
WHERE SAL BETWEEN 1000 and 10000
AND CONVERT(SAL, CHAR) LIKE '%0.00';

-- 27. List the emps whose names having a character set ‘ll’ together
SELECT * FROM EMP WHERE ENAME like '%ll%';

-- 28. List the emps those who joined in 80’s
SELECT * FROM EMP WHERE year(HIREDATE) = 1980;

-- 29. List the emps who does not belong to Deptno 20.
SELECT * FROM EMP WHERE DEPTNO <> 20;

-- 30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT', 'MANAGER') ORDER BY SAL ASC;

-- 31. List all the emps who joined before or after 1981
SELECT * FROM EMP WHERE year(HIREDATE) <> 1981;

-- 32. List the emps whose Empno not starting with digit 78
SELECT * FROM EMP WHERE EMPNO NOT LIKE '78%';

-- 33. List the emps who are working under ‘MGR’
SELECT concat(e.ENAME,' works for ',m.ENAME)
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO;

-- 34. List the emps who joined in any year but not belongs to the month of March
SELECT * FROM EMP WHERE MONTH(HIREDATE) <> 3;

-- 35. List all the Clerks of Deptno 20.
SELECT * FROM EMP WHERE DEPTNO = 20 AND JOB = 'CLERK';

-- 36. List the emps of Deptno 30 or 10 joined in the year 1981.
SELECT * FROM EMP WHERE DEPTNO IN (30, 10) AND YEAR(HIREDATE) = 1981;

-- 37. Display the details of SMITH.
SELECT * FROM EMP WHERE ENAME = 'SMITH';

-- 38. Display the location of  SMITH.
SELECT LOC FROM DEPT WHERE DEPTNO = (
  SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH'
);

SELECT LOC
FROM EMP e
  INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
AND e.ENAME = 'SMITH';

-- 39. List the total information of EMP table along with DNAME and Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.
SELECT d.DNAME, d.LOC, e.*
FROM EMP e
  INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE d.DNAME IN ('ACCOUNTING', 'RESEARCH')
ORDER BY DEPTNO ASC;

-- 40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc
