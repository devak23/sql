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
