-- 1. Display all the information of the EMP table
SELECT * FROM EMP;

-- 2. Display unique Jobs from EMP table
SELECT DISTINCT JOB FROM EMP;

-- 3. List the EMPs in the asc order of their Salaries
SELECT * FROM EMP ORDER BY SAL ASC;

-- 4. List the details of the EMPs in asc order of the Dptnos and desc of Jobs
SELECT * FROM EMP ORDER BY DEPTNO ASC , JOB DESC;

-- 5. Display all the unique job groups in the descending order
SELECT DISTINCT JOB FROM EMP ORDER BY JOB ASC;

-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM EMP WHERE EMPNO IN (
  SELECT MGR FROM EMP
);

-- 7. List the EMPs who joined before 1981
SELECT * FROM EMP WHERE HIREDATE < '1981-01-01';

-- 8. List the Empno, Ename, Sal, Daily sal of all EMPs in the asc order of Annual sal
SELECT EMPNO, ENAME, SAL, SAL / 30 AS DAILY_SAL, SAL * 12 AS ANN_SAL
FROM EMP ORDER BY ANN_SAL ASC;

-- 9. Display the Empno, Ename, job, Hiredate, Exp (Experience) of all Mgrs
SELECT EMPNO, ENAME, JOB, HIREDATE, DATEDIFF(NOW(), HIREDATE)/(12*30) AS EXP_YRS
FROM EMP
WHERE EMPNO IN (
  SELECT MGR FROM EMP
)
ORDER BY EXP_YRS ASC;

-- 10. List the Empno, Ename, Sal, Exp of all EMPs working for Mgr 7698
SELECT EMPNO, ENAME, SAL, datediff(now(), hiredate)/(12 * 30) as EXP_YRS
FROM EMP
WHERE MGR = 7698;

-- 11. Display all the details of the EMPs whose Comm. Is more than their Sal.
SELECT * from EMP WHERE COMM > SAL;

-- 12. List the EMPs in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM EMP
  WHERE HIREDATE > '1981-06-01'
ORDER BY JOB ASC;

-- 13. List the EMPs along with their Exp and Daily Sal is more than Rs.100
SELECT e.*, datediff(NOW(), HIREDATE)/(12 * 30) as EXP_YRS, SAL/30 as DAILY_SAL
FROM EMP e
WHERE SAL/30 > 100;

-- 14. List the EMPs who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'ANALYST')
ORDER BY JOB;

-- 15. List the EMPs who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT * FROM EMP
WHERE HIREDATE IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19')
ORDER BY HIREDATE ASC;

-- 16. List the EMP who are working for the Deptno 10 or20
SELECT * FROM EMP e
WHERE DEPTNO = 10
OR DEPTNO = 20;

-- 17. List the EMPs who are joined in the year 81
SELECT * FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1982-01-01';

-- 18. List the EMPs who are joined in the month of Feb 1981
SELECT * FROM EMP
WHERE HIREDATE BETWEEN '1981-02-01' AND '1981-03-01';


-- 19. List the EMPs Who Annual sal ranges from 22000 and 45000
SELECT * FROM EMP WHERE SAL * 12 BETWEEN 22000 and 45000;

-- 20. List the Enames those are having five characters in their Names.
SELECT ENAME FROM EMP WHERE length(ENAME) > 5;

-- 21. List the Enames those are starting with ‘T’ and with five characters.
SELECT ENAME FROM EMP WHERE length(ENAME) > 5 AND ENAME like 'T%';

-- 22. List the EMPs those are having four chars and third character must be ‘r’.
SELECT ENAME FROM EMP WHERE length(ENAME) = 4 AND ENAME LIKE '__r%';

-- 23. List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT ENAME FROM EMP WHERE length(ENAME) = 5 AND ENAME LIKE 'S%H';

-- 24. List the EMPs who joined in January.
SELECT * FROM EMP WHERE month(HIREDATE) = 01;

-- 25. List the EMPs who joined in the month of which second character is ‘a’.
SELECT * FROM EMP WHERE monthname(HIREDATE) like '_a%';

-- 26. List the EMPs whose Sal is four digit number ending with Zero
SELECT * FROM EMP
WHERE SAL BETWEEN 1000 and 10000
AND CONVERT(SAL, CHAR) LIKE '%0.00';

-- 27. List the EMPs whose names having a character set ‘ll’ together
SELECT * FROM EMP WHERE ENAME like '%ll%';

-- 28. List the EMPs those who joined in 80’s
SELECT * FROM EMP WHERE year(HIREDATE) = 1980;

-- 29. List the EMPs who does not belong to Deptno 20.
SELECT * FROM EMP WHERE DEPTNO <> 20;

-- 30. List all the EMPs except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT', 'MANAGER') ORDER BY SAL ASC;

-- 31. List all the EMPs who joined before or after 1981
SELECT * FROM EMP WHERE year(HIREDATE) <> 1981;

-- 32. List the EMPs whose Empno not starting with digit 78
SELECT * FROM EMP WHERE EMPNO NOT LIKE '78%';

-- 33. List the EMPs who are working under ‘MGR’
SELECT concat(e.ENAME,' works for ',m.ENAME)
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO;

-- 34. List the EMPs who joined in any year but not belongs to the month of March
SELECT * FROM EMP WHERE MONTH(HIREDATE) <> 3;

-- 35. List all the Clerks of Deptno 20.
SELECT * FROM EMP WHERE DEPTNO = 20 AND JOB = 'CLERK';

-- 36. List the EMPs of Deptno 30 or 10 joined in the year 1981.
SELECT * FROM EMP WHERE DEPTNO IN (30, 10) AND YEAR(HIREDATE) = 1981;

-- 37. Display the details of SMITH.
SELECT * FROM EMP WHERE ENAME = 'SMITH';

-- 38. Display the location of  SMITH. (dept table is being used)
SELECT LOC FROM DEPT WHERE DEPTNO = (
  SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH'
);

SELECT LOC
FROM EMP e
  INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
AND e.ENAME = 'SMITH';

-- 39. List the total information of EMP table along with DNAME and Loc of all the EMPs Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.
SELECT d.DNAME, d.LOC, e.*
FROM EMP e
  INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE d.DNAME IN ('ACCOUNTING', 'RESEARCH')
ORDER BY DEPTNO ASC;

-- 40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc
SELECT e.EMPNO, e.ENAME, e.SAL, d.DEPTNO -- ,  e.JOB, DATEDIFF(NOW(), e.HIREDATE) / (12 * 30), d.LOC
FROM EMP e
  INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.JOB IN ('MANAGER','ANALYST')
AND d.LOC IN ('New York', 'Dallas')
AND DATEDIFF(NOW(), e.HIREDATE) / (12 * 30) > 7
AND e.COMM IS NULL
ORDER BY LOC ASC;

-- 41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all EMPs working at CHICAGO or working for ACCOUNTING dept with Ann Sal>28000, but the Sal should not be=3000 or 2800 and who doesn’t belong to "MANAGER" and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.
SELECT e.EMPNO, e.ENAME, e.SAL, d.DNAME, d.LOC, d.DEPTNO
FROM EMP e
  INNER JOIN DEPT d on d.DEPTNO = e.DEPTNO
WHERE ( d.LOC = 'CHICAGO' OR d.DNAME = 'ACCOUNTING')
  AND e.SAL * 12 > 28000
  AND e.SAL NOT IN (3000, 2800)
  AND e.JOB <> 'MANAGER'
  AND (e.EMPNO LIKE '__7%' OR e.EMPNO LIKE '__3%')
ORDER BY d.DEPTNO ASC, e.JOB DESC;

-- 42. Display the total information of the EMPs along with Grades in the asc order (salgrade table is now used)
SELECT  s.GRADE, e.ENAME, e.SAL
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL;

-- 43. List all the Grade2 and Grade 3 EMPs.
SELECT s.grade, e.*
FROM EMP e, SALGRADE s
WHERE s.GRADE IN (2,3)
AND e.SAL BETWEEN s.LOSAL and s.HISAL;

-- 44. Display all Grade 4,5 Analyst and Mgr.
SELECT s.GRADE, e.*
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
  AND s.GRADE IN (4,5)
  AND e.JOB IN ('MANAGER', 'ANALYST');

-- 45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of EMPs working for Dept 10 or 20
SELECT e.EMPNO, e.ENAME, e.SAL, d.DNAME, s.GRADE, datediff(now(), e.HIREDATE)/(12*30) as EXP, e.SAL * 12 AS ANN_SAL
FROM SALGRADE s, EMP e INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
AND d.DEPTNO IN (10, 20);


-- 46. List all the information of EMP with Loc and the Grade of all the EMPs belong to the Grade range from 2 to 4 working at the Dept those are not starting with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’ any where joined in the year 1981 but not in the month of Mar or Sep and Sal not end with ‘00’ in the asc order of Grades
SELECT s.GRADE, d.LOC, d.DNAME, e.*
FROM SALGRADE s, EMP e INNER JOIN DEPT d ON d.DEPTNO = e.DEPTNO
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
AND d.DNAME NOT LIKE 'OP%'
AND d.DNAME NOT LIKE '%S'
AND e.JOB LIKE '%a%'
AND year(e.HIREDATE) = 1981
AND month(e.HIREDATE) NOT IN (03, 09)
AND e.SAL NOT LIKE '%0.%'
ORDER BY s.GRADE ASC;

-- 47. List the details of the Depts along with Empno, Ename or without the EMPs
SELECT e.EMPNO, e.ENAME, d.*
FROM DEPT d LEFT JOIN EMP e ON d.DEPTNO = e.DEPTNO;

-- 48. List the details of the EMPs whose Salaries more than the EMPloyee BLAKE.
SELECT e.* FROM EMP e
WHERE e.SAL > (
  SELECT SAL FROM EMP WHERE ENAME = 'BLAKE'
);
  -- This is just to include BLAKE in the resultset if you wanted to compare
-- UNION
  -- SELECT * FROM EMP WHERE ENAME = 'BLAKE';

-- 49. List the EMPs whose Jobs are same as ALLEN.
SELECT * FROM EMP
WHERE JOB = (
  SELECT JOB FROM EMP WHERE ENAME = 'ALLEN'
);

-- 50. List the EMPs who are senior to King.
SELECT * FROM EMP WHERE HIREDATE < (
  SELECT HIREDATE FROM EMP WHERE ENAME = 'KING'
);
-- UNION
  -- SELECT * FROM EMP WHERE ENAME = 'KING';

-- 51. List the Emps who are senior to their own MGRS.
-- using a corelated subquery, we have the follows:
SELECT e1.EMPNO, e1.ENAME, e1.HIREDATE
FROM EMP e1 WHERE e1.HIREDATE < (
  SELECT HIREDATE FROM EMP e2 WHERE e2.EMPNO = e1.MGR
)
ORDER BY e1.EMPNO ASC;

 -- using a join, we have the follows:
SELECT e1.EMPNO, e1.ENAME, e1.HIREDATE, e1.MGR, e2.EMPNO, e2.ENAME, e2.HIREDATE
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO
AND e1.HIREDATE < e2.HIREDATE
ORDER BY e1.EMPNO ASC;

-- 52. List the Emps of Deptno 20 whose Jobs are same as Deptno 10.
 -- Using a subquery (not a co-related subquery), we have the following:
SELECT e20.JOB, e20.ENAME, e20.DEPTNO
FROM EMP e20
WHERE e20.DEPTNO = 20
  AND e20.JOB IN (
  SELECT e10.JOB FROM EMP e10 WHERE e10.DEPTNO = 10
);

 -- using joins, we have the following:
SELECT e20.JOB, e20.ENAME, e20.DEPTNO, e10.DEPTNO, e10.ENAME, e10.JOB
FROM EMP e10, EMP e20
WHERE e20.DEPTNO = 20
  AND e10.DEPTNO = 10
  AND e10.JOB = e20.JOB
  AND e10.EMPNO <> e20.EMPNO;


-- 53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
SELECT e1.ENAME, e1.SAL
FROM EMP e1 WHERE e1.SAL IN (
  SELECT SAL FROM EMP WHERE ENAME IN ('FORD', 'SMITH')
)
AND e1.ENAME NOT IN ('FORD', 'SMITH')
ORDER BY SAL DESC;

-- 54. List the EMPs Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT ENAME, SAL
FROM EMP
WHERE JOB in (
  SELECT JOB FROM EMP WHERE ENAME = 'MILLER'
)
OR SAL > (
  SELECT SAL FROM EMP WHERE ENAME = 'ALLEN'
);

-- 55. List the Emps whose Sal is > the total remuneration of the SALESMAN.
SELECT ENAME, SAL
FROM EMP WHERE SAL > (
  SELECT sum(SAL + IFNULL(COMM, 0)) FROM EMP WHERE JOB = 'SALESMAN'
);
-- I'm not sure if the above query is correct

-- 56. List the EMPs who are senior to BLAKE working at CHICAGO & BOSTON.
SELECT d.LOC, e.ENAME, e.HIREDATE FROM EMP e
INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE d.LOC IN ('CHICAGO', 'BOSTON')
AND e.HIREDATE < (
  SELECT HIREDATE FROM EMP WHERE ENAME = 'BLAKE'
);

-- 57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and RESEARCH whose Sal is more than ALLEN and exp more than ADAMS in the asc order of EXP.
SELECT s.GRADE, e.ENAME, e.HIREDATE, datediff(NOW(), e.HIREDATE)/(12*30) as EXP_YRS
FROM SALGRADE s, EMP e
INNER JOIN DEPT d on d.DEPTNO = e.DEPTNO
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
AND d.DNAME IN ('ACCOUNTING', 'RESEARCH')
AND s.GRADE IN (3,4)
AND e.SAL > (
  SELECT SAL FROM EMP WHERE ENAME = 'ALLEN'
)
AND e.HIREDATE < (
  SELECT HIREDATE FROM EMP WHERE ENAME = 'ADAMS'
)
ORDER BY e.HIREDATE ASC;


-- 58. List the EMPs whose jobs same as SMITH or ALLEN.
SELECT * FROM EMP
WHERE JOB IN (
  SELECT JOB FROM EMP WHERE ENAME IN ('SMITH', 'ALLEN')
);

-- 59. Write a Query to display the details of EMPs whose Sal is same as of
--    a)Employee Sal of EMP1 table.
--    b)¾ Sal of any Mgr of EMP2 table.
--    c)The sal of any person with exp of 5 years belongs to the sales dept of EMP3 table.
--    d)Any grade 2 EMPloyee of EMP4 table.
--    e)Any grade 2 and 3 EMPloyee working fro sales dept or operations dept joined in 89.

-- This problem essentially needs subqueries in the WHERE Clause. It's simple... but
-- none of the rows really match the conditions so can't verify


-- 60. SELECT any jobs of deptno 10 those that are not found in deptno 20
SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN (
  SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 20
);

-- 61. List of EMPs of EMP1 who are not found in EMP2.
-- This question seems ridiculous as there wont be any EMPloyees at all
SELECT * from EMP e1 where e1.EMPNO NOT IN (
  SELECT EMPNO FROM EMP
);

-- 62. Find the highest sal of EMP table.
SELECT MAX(SAL) as HIGHEST_SAL FROM EMP;

-- 63. Find the details of highest paid EMPloyee
SELECT * FROM EMP WHERE SAL IN (
  SELECT MAX(SAL) FROM EMP
);

-- 64. Find the highest paid EMPloyee of sales department.
SELECT * FROM EMP WHERE SAL IN (
  SELECT MAX(SAL) FROM EMP WHERE DEPTNO = (
    SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'
  )
);

-- 65. List the most recently hired EMP of grade3 belongs to  location CHICAGO.
SELECT *
FROM EMP
WHERE HIREDATE = (
  SELECT MAX(HIREDATE)
  FROM EMP e, SALGRADE s, DEPT d
  WHERE e.DEPTNO = d.DEPTNO
  AND d.LOC = 'CHICAGO'
  AND e.SAL BETWEEN s.LOSAL AND s.HISAL
  AND s.GRADE = 3
);

-- 66. List the EMPloyees who are senior to most recently hired EMPloyee working under king.
SELECT * FROM EMP WHERE HIREDATE < (
  SELECT MAX(HIREDATE)
  FROM EMP
  WHERE MGR = (
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
  )
);

-- 67. List the details of the EMPloyee belongs to newyork with grade 3 to 5 except ‘PRESIDENT’ whose sal> the highest paid EMPloyee of Chicago in a group where there is manager and salesman not working under king
-- This doesn't seem to be the right answer
# SELECT * FROM EMP e
#   WHERE e.DEPTNO IN (
#     SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK'
#   )
#   AND e.EMPNO IN (
#     SELECT EMPNO
#     FROM EMP, SALGRADE
#     WHERE SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
#     AND SALGRADE.GRADE IN (3,4,5)
#     AND JOB <> 'PRESIDENT'
#   )
#   AND e.SAL > (
#     SELECT MAX(SAL) FROM EMP WHERE DEPTNO IN (
#       SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'
#     )
#   );



-- 68. List the details of the senior EMPloyee belongs to 1981.
SELECT *
FROM EMP WHERE HIREDATE IN (
  SELECT MIN(HIREDATE) FROM EMP WHERE YEAR(HIREDATE) = 1981
);


-- 69. List the EMPloyees who joined in 1981 with the job same as the most senior person of the year 1981.
SELECT *
FROM EMP
WHERE JOB IN (
  SELECT JOB FROM EMP WHERE HIREDATE = (
    SELECT MIN(HIREDATE) FROM EMP WHERE YEAR(HIREDATE) = 1981
  )
)
AND YEAR(HIREDATE) = 1981;


-- 70. List the most senior EMPl working under the king and grade is more  than 3.
-- I dont know if this is better or the next one. Somebody needs to explain me the query plan
SELECT * FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE > 3
AND e.HIREDATE IN (
  SELECT MIN(HIREDATE)
  FROM EMP WHERE MGR = (
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
  )
)
AND e.MGR = (
  SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
);


-- Using co-related subquery
SELECT * FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE > 3
AND e.MGR = (
  SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
)
AND e.HIREDATE IN (
  SELECT MIN(HIREDATE)
  FROM EMP WHERE MGR = e.MGR
);

-- 71. Find the total sal given to the MGR.
SELECT SUM(SAL) FROM EMP WHERE JOB = 'MANAGER';


-- 72. Find the total annual sal to distribute job wise in the year 81.
SELECT SUM(SAL * 12) AS ANNUAL_SALARY, JOB
FROM EMP
WHERE YEAR(HIREDATE) = 1981
GROUP BY JOB;

-- 73. Display total sal of the EMPloyees belonging to grade 3.
SELECT SUM(e.SAL), s.GRADE
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE = 3
GROUP BY s.GRADE;

-- ALTERNATE ANSWER
SELECT sum(SAL)
FROM EMP
WHERE EMPNO IN (
  SELECT EMPNO
  FROM EMP e, SALGRADE s
  WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
        AND s.GRADE = 3
);

-- 74. Display the average salaries of all the clerks.
SELECT AVG(SAL) FROM EMP WHERE JOB = 'CLERK';

-- 75. List the EMPloyees in dept 20 whose sal is > than the average sal 0f dept 10 EMPs.
SELECT * FROM EMP
WHERE DEPTNO = 20
AND SAL > (
  SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10
);

-- 76. Display the number of EMPloyee  for each job group deptno wise.
SELECT COUNT(EMPNO) as NO_OF_EMP, JOB, DEPTNO
FROM EMP
GROUP BY JOB, DEPTNO;

-- 77. List the manager no and the number of EMPloyees working for those mgrs in the ascending Mgrno.
-- First we need to figure out who works for whom. So we need 2 EMP tables where MGR of one
-- table matches the EMPNO of the other table. That gives us the relationship.
SELECT
E1.ENAME as EMPLOYEE, E2.ENAME as MANAGER, E2.EMPNO
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;
-- now it's a question of getting count of E1.ENAME group by E2.ENAME. Thus the following
-- query hopefully gives the answer to the question
SELECT count(EMPloyee.EMPNO) as COUNT, manager.EMPNO as MGR
FROM EMP EMPloyee, EMP manager
WHERE EMPloyee.MGR = manager.EMPNO
GROUP BY manager.EMPNO
ORDER BY manager.EMPNO;

-- 78. List the department,details where at least two EMPs are working
SELECT DEPTNO, COUNT(DEPTNO), EMP.*
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) > 2;

-- 79. Display the Grade, Number of EMPs, and max sal of each grade.
SELECT s.GRADE, count(EMPNO) AS COUNT, max(SAL) as MAX_SAL
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
GROUP BY s.GRADE;

-- 80. Display dname, grade, No. of EMPs where at least two EMPs are clerks.
SELECT d.DNAME, s.GRADE, COUNT(e.EMPNO)
FROM EMP e, SALGRADE s, DEPT d
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
AND e.DEPTNO = d.DEPTNO
AND e.JOB = 'CLERK'
GROUP BY d.DNAME, s.GRADE
HAVING count(e.EMPNO) >= 2;

-- 81. List the details of the department where maximum number of EMPs are working.
SELECT * FROM DEPT                -- Get the details of the dept depends on deptno
WHERE deptno IN (
  SELECT deptno
  FROM EMP GROUP BY deptno
  HAVING count(EMPNO) = (                 -- Get the deptno where count matches the max
    SELECT max(A.EMP_count)                   -- Get the max among them
    FROM (                                       -- Get the count of EMP per dept
      SELECT count(EMPNO) AS EMP_count
      FROM EMP
      GROUP BY deptno
    ) A
  )
);

-- 82. Display the EMPs whose manager name is jones.
SELECT * FROM EMP
WHERE MGR IN (
    SELECT EMPNO FROM EMP WHERE ENAME = 'JONES'
);

-- 83. List the EMPloyees whose salary is more than 3000 after giving 20% increment.
SELECT * FROM EMP
WHERE SAL * 1.2 > 3000;


-- 84. List the EMPs with dept names.
SELECT e.ENAME, d.DNAME
FROM EMP e INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO;

-- 85. List the EMPs who are not working in sales dept.
SELECT e.ENAME, d.DNAME
FROM EMP e INNER JOIN DEPT d ON d.DEPTNO = e.DEPTNO
WHERE d.DNAME <> 'SALES';
-- OR
SELECT ENAME FROM EMP WHERE DEPTNO NOT IN (
  SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'
);

-- 86. List the EMPs name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago.
SELECT e.ENAME, d.DNAME, e.SAL, e.COMM
FROM EMP e INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.SAL BETWEEN 2000 AND 5000
AND d.LOC = 'CHICAGO';
-- OR
SELECT ENAME, SAL, COMM
FROM EMP WHERE DEPTNO IN (
  SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'
)
AND SAL BETWEEN 2000 AND 5000;


-- 87. List the EMPs whose sal is greater than his managers salary
SELECT
  e.ENAME AS EMPloyee,
  e.SAL   AS EMP_sal,
  m.ENAME AS manager,
  m.SAL   AS manager_sal
FROM EMP e
  INNER JOIN EMP m ON e.MGR = m.EMPNO
WHERE e.SAL >= m.SAL;

-- 88. List the grade, EMP name for the deptno 10 or deptno 30 but sal grade is not 4 while they joined the company before ’31-dec-82’.
SELECT s.GRADE, e.ENAME, e.DEPTNO, e.HIREDATE
FROM EMP e, SALGRADE s
WHERE e.DEPTNO IN (10, 30)
AND e.SAL BETWEEN s.LOSAL and s.HISAL
AND s.GRADE <> 4
and e.HIREDATE < '1982-12-31';

-- 89. List the name ,job, dname, location for those who are working as MGRS.
SELECT e.ENAME, e.JOB, d.DNAME, d.LOC
FROM EMP e
  INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.EMPNO IN (
  SELECT DISTINCT MGR FROM EMP
);

-- 90. List the EMPs whose mgr name is jones and also list their manager name.
SELECT e.ENAME as "EMPLOYEE", m.ENAME as "MANAGER"
FROM EMP e
  INNER JOIN EMP m on e.MGR = m.EMPNO
WHERE m.ENAME = 'JONES';

-- 91. List the name and salary of FORD if his salary is equal to hisal of his grade.
SELECT e.ENAME, e.SAL, s.HISAL
FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
AND e.SAL = s.HISAL
-- AND e.ENAME = 'FORD ' -- I think this condition is not required, as there is another EMPloyee
-- who matches the condition

-- 92. List the name, job, dname ,sal, grade order dept wise
SELECT e.ENAME, e.JOB, d.DNAME, e.SAL, s.GRADE
FROM EMP e, SALGRADE s, DEPT d
WHERE e.DEPTNO = d.DEPTNO
AND e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY e.DEPTNO DESC;

-- 93. List the EMP name, job, sal, grade and dname except clerks and sort on the basis of highest sal.
SELECT e.ENAME, e.JOB, e.SAL, s.GRADE, d.DNAME
FROM SALGRADE s, EMP e INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY e.SAL DESC;

-- 94. List the EMPs name, job  who are with out manager.
SELECT ENAME FROM EMP where MGR is null;

-- 94.2 List the manager who does not have any EMPloyees below him
SELECT m.ENAME, m.EMPNO
FROM EMP m LEFT JOIN EMP e on m.EMPNO = e.MGR
WHERE e.EMPNO is null;


-- 95. List the names of the EMPs who are getting the highest sal dept wise.
SELECT e.ENAME, d.DNAME, e.SAL
FROM EMP e
  INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE e.SAL IN (
  SELECT MAX(SAL)
  FROM EMP
  GROUP BY DEPTNO
);

-- 96. List the EMPs whose sal is equal to the average of max and minimum SAL
SELECT * FROM EMP WHERE SAL IN (
  SELECT (MAX(SAL) + MIN(SAL))/2 FROM EMP
);


-- 96.2 List the EMPs whose sal is equal to the average SAL or minimum SAL
SELECT * FROM EMP
WHERE SAL IN (
  SELECT AVG(SAL) FROM EMP
)
OR SAL IN (
  SELECT MIN(SAL) FROM EMP
);

-- 97. List the no. of EMPs in each department where the no. is more than 3
SELECT DEPTNO, count(EMPNO) as NUM_OF_EMP
FROM EMP
GROUP BY DEPTNO
HAVING count(EMPNO) > 3;

-- 98. List the names of depts. Where at least 3 EMPs are working in that department.
SELECT d.DNAME
FROM DEPT d WHERE d.DEPTNO IN (
  SELECT DEPTNO
  FROM EMP
  GROUP BY DEPTNO
  HAVING COUNT(EMPNO) >= 3
);

-- OR
SELECT d.DNAME, count(d.DNAME)
FROM DEPT d
  INNER JOIN EMP e on e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO
HAVING COUNT(e.EMPNO) >= 3;


-- 99. List the managers whose sal is more than his EMPloyees avg salary.
SELECT *
FROM EMP
WHERE EMPNO IN (
  SELECT DISTINCT MGR
  FROM EMP
)
AND SAL > (
  SELECT AVG(e.SAL)
  FROM EMP e, EMP m
    WHERE e.MGR = m.EMPNO
);

-- OR
-- Why is this query not giving the correct result??
SELECT *
FROM EMP e INNER JOIN EMP m ON m.EMPNO = e.EMPNO -- this gets all managers
WHERE m.SAL > (
  SELECT AVG(SAL) FROM EMP WHERE MGR = m.MGR
);


-- OR
SELECT (avg(e.sal)), m.ename
FROM EMP e, EMP m
WHERE e.mgr = m.EMPno
GROUP BY e.mgr, m.ename;

-- 100. List the name,salary,comm. for those EMPloyees whose net pay is greater than or equal to any other EMPloyee salary of the company.
-- Didn't know how to solve this... so google helped. ANY() means any of "these values".
SELECT e.ENAME, e.SAL, e.COMM
FROM EMP e
WHERE (e.SAL + e.COMM) >= ANY (
  SELECT SAL FROM EMP
);

-- 101. List the EMP whose sal is less than his manager but more than any other manager.
SELECT e.ENAME as EMP_NAME, e.SAL, m.ENAME as MANAGER, m.SAL
FROM EMP e
  INNER JOIN EMP m on e.MGR = m.EMPNO
WHERE e.SAL < m.SAL
and e.SAL > ANY (
  SELECT SAL FROM EMP WHERE EMPNO IN (
    SELECT DISTINCT MGR FROM EMP
  )
);

-- 102. List the EMPloyee names and his average salary department wise.
-- I dont understand this query or the question
SELECT e.ENAME, e.DEPTNO, AVG_SAL
FROM EMP e, (
  SELECT AVG(SAL)as AVG_SAL, DEPTNO
  FROM EMP
  GROUP BY DEPTNO
) A, DEPT d
WHERE e.DEPTNO = d.DEPTNO
AND A.DEPTNO = e.DEPTNO;


-- 103. Find out least 5 earners of the company.
-- Couldn't get this as well
SELECT * FROM EMP e WHERE 5 > (
  SELECT count(1)
  FROM EMP
  WHERE e.SAL > SAL
);

-- 104. Find out EMPs whose salaries are greater than salaries of their managers.
SELECT e.ENAME as EMP_NAME, e.SAL as EMP_SAL, m.ENAME as MGR_NAME, m.SAL as MGR_SAL
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO
AND e.SAL > m.SAL;

-- 105. List the managers who are not working under the president.
SELECT e.ENAME, m.ENAME, m.JOB
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO
AND e.EMPNO IN (
  SELECT DISTINCT MGR FROM EMP
)
AND m.JOB <> 'PRESIDENT';

-- OR
SELECT *
FROM EMP
WHERE EMPNO IN (
  SELECT MGR
  FROM EMP
)
AND MGR NOT IN (
  SELECT EMPNO
  FROM EMP
  WHERE JOB = 'PRESIDENT'
);

-- 106. List the records from emp whose deptno is not in DEPT table.
-- had to run this insert statement for the data to appear:
-- INSERT INTO EMP VALUES ('7728', 'STEVE', 'SALESMAN', '7839', '1981-05-01', '2770.00', NULL, '60');
SELECT * FROM EMP WHERE DEPTNO NOT IN (
  SELECT DEPTNO FROM DEPT
);

-- There is a dept which is not present in the EMP table but not vice-versa. HEnce the insert needed
SELECT * FROM DEPT
WHERE DEPTNO NOT IN (
  SELECT DISTINCT DEPTNO FROM EMP
);


-- 107. List the Name , Salary, Comm and Net Pay of an employee which is more than any other employee.
-- Quite frankly i dont understand the intent/question. So this answer could be wrong or the question could be meaningless
SELECT e.ENAME, e.SAL, e.COMM, e.SAL + e.COMM as NET_PAY
FROM EMP e WHERE SAL > ANY (
  SELECT SAL FROM EMP
);

-- 108. List the Enames who are retiring after 31-Dec-89 (the max Job period is 20Y).
-- Need to verify the answer.
SELECT ENAME, HIREDATE, DATEDIFF('1989-12-31',HIREDATE)/(12 * 30) EXP_AT_1989
FROM EMP
-- WHERE DATEDIFF('1989-12-31',HIREDATE)/(12 * 30) > 20;
WHERE date_add(HIREDATE, INTERVAL 20 YEAR) > '1989';


-- 109. List those Emps whose Salary is odd value.
SELECT * FROM EMP WHERE SAL % 2 = 1;

-- 110. List the emp’s whose Salary contain 3 digits.
SELECT * FROM EMP WHERE SAL >= 100 AND SAL < 1000;

-- 111. List the emps who joined in the month of DEC.
SELECT * FROM EMP WHERE MONTH(HIREDATE) = 12;

-- 112. List the emps whose names contains ‘A’.
SELECT * FROM EMP WHERE ENAME LIKE '%A%';

-- 113. List the emps whose Deptno is available in his Salary.
SELECT CONVERT(SAL, CHAR),CONCAT('%',DEPTNO,'%')
FROM EMP
WHERE CONVERT(SAL, CHAR) LIKE CONCAT('%',DEPTNO,'%');

-- 114. List the emps whose first 2 chars from Hiredate = last 2 characters of Salary.
SELECT ENAME, HIREDATE, SAL
--  , SUBSTR(HIREDATE, 1, 2)
--  , SUBSTR(CONVERT(SAL,INT), LENGTH(SAL)-4 , LENGTH(SAL) - 2)
FROM EMP
WHERE SUBSTR(HIREDATE, 1, 2) = SUBSTR(CONVERT(SAL,INT), LENGTH(SAL)-4 , LENGTH(SAL) - 2);

-- 115. List the emps Whose 10% of Salary is equal to year of joining.
SELECT ENAME, SAL, CONVERT(SAL * 0.1,INT), YEAR(HIREDATE)
FROM EMP
WHERE CONVERT(SAL*0.1,INT) = YEAR(HIREDATE)
OR CONVERT(SAL * 0.1, INT) = SUBSTR(YEAR(HIREDATE),3,4);

-- 116. List first 50% of chars of Ename in Lower Case and remaining are upper Case.
SELECT CONCAT(LOWER(SUBSTR(ENAME, 1, LENGTH(ENAME)/2)), UPPER(SUBSTR(ENAME, LENGTH(ENAME)/2+1, LENGTH(ENAME)))) as EMP_NAME
FROM EMP;

-- 117. List the Dname whose No. of Emps is = to number of chars in the Dname.
SELECT DNAME, LENGTH(DNAME)
FROM DEPT
WHERE LENGTH(DNAME) IN (
  SELECT COUNT(ENAME)
  FROM EMP
  GROUP BY EMP.DEPTNO
);

-- 118. List the emps those who joined in company before 15th of the month.
SELECT ENAME, HIREDATE, DAY(HIREDATE)
FROM EMP
WHERE DAY(HIREDATE) < 15;

-- 119. List the Dname, no of chars of the DEPT which is = no. of emp’s in any other Dept.
SELECT d.DNAME, LENGTH(d.DNAME), e.ENAME, e.DEPTNO, d.LOC
FROM DEPT d INNER JOIN EMP e ON d.DEPTNO = e.DEPTNO
WHERE LENGTH(d.DNAME) IN (
  SELECT LENGTH(ENAME) FROM EMP
);

-- 120. List the emps who are working as Managers.
SELECT ENAME, JOB
FROM EMP WHERE EMPNO IN (
  SELECT DISTINCT MGR FROM EMP
);

-- 121. List THE Name of dept where highest no.of emps are working.
SELECT * FROM DEPT
WHERE DEPTNO = (
  SELECT DEPTNO
  FROM EMP
  GROUP BY DEPTNO
  HAVING COUNT(EMPNO) = (
    SELECT MAX(EMPLOYEES) FROM (
      SELECT COUNT(EMPNO) as EMPLOYEES
      FROM EMP
      GROUP BY DEPTNO
    ) A
  )
);

-- 122.Count the No.of emps who are working as ‘Managers’
SELECT COUNT(DISTINCT MGR) FROM EMP;

-- 123. List the emps who joined in the company on the same date.
SELECT * FROM EMP e1
WHERE e1.HIREDATE IN (
  SELECT HIREDATE FROM EMP e2
  WHERE e1.EMPNO <> e2.EMPNO
);

-- 124. List the details of the emps whose Grade is equal to one tenth of Sales Dept.
SELECT * FROM EMP e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL and s.HISAL
AND s.GRADE = 0.1 * (
  SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'
);

-- 125. List the name of the dept where more than average no. of emps are working.
SELECT * FROM DEPT WHERE DEPTNO IN (
  SELECT DEPTNO -- , COUNT(EMPNO)
  FROM EMP
  GROUP BY DEPTNO
  HAVING COUNT(EMPNO) > (
    SELECT AVG(EMPLOYEE_COUNT) AS AVG_EMP_COUNT
    FROM (
      SELECT COUNT(EMPNO) AS EMPLOYEE_COUNT
      FROM EMP
      GROUP BY DEPTNO
    ) A
  )
);

-- 126. List the Managers name who is having max no.of emps working under him.
SELECT * FROM EMP WHERE EMPNO = (
  SELECT MGR
  FROM EMP
  GROUP BY MGR
  HAVING COUNT(EMPNO) = (
    SELECT MAX(EMP_COUNT)
    FROM (
      SELECT COUNT(EMPNO)AS EMP_COUNT
      FROM EMP
      GROUP BY MGR
    ) A
  )
);

-- 127. List the Ename and Sal is increased by 15% and expressed as no.of Dollars.
SELECT ENAME, SAL, CONCAT('$',SAL * 1.15) AS RAISE_BY_15PCT FROM EMP;


-- 128. Produce the output of EMP table ‘EMP_AND_JOB’ for Ename and Job.
SELECT CONCAT(ENAME, ' ', JOB) AS EMP_AND_JOB FROM EMP;

-- 129.Produce the following output from EMP.
--        EMPLOYEE
--			SMITH (clerk)
--			ALLEN (Salesman)
SELECT CONCAT(ENAME, ' (', LOWER(JOB) , ')') AS EMPLOYEE FROM EMP;

-- 130. List the emps with Hire date in format June 4, 1988.
SELECT ENAME, DATE_FORMAT(HIREDATE, '%M %d, %Y') FROM EMP;

-- 131. Print a list of emp’s Listing ‘just salary’ if Salary is more than 1500, on target if
-- Salary is 1500 and ‘Below 1500’ if Salary is less than 1500.
SELECT EMPNO, 'JUST SALARY' FROM EMP WHERE SAL > 1500
UNION
SELECT EMPNO, 'ON TARGET' FROM EMP WHERE SAL = 1500
UNION
SELECT EMPNO, 'BELOW 1500' FROM EMP WHERE SAL < 1500;

-- OR by using a case statement
SELECT EMPNO, (
  CASE
    WHEN (SAL < 1500) THEN 'BELOW 1500'
    WHEN (SAL = 1500) THEN 'ON TARGET'
    WHEN (SAL > 1500) THEN 'JUST SALARY'
  END
)
FROM EMP
ORDER BY SAL DESC;

-- 132. Write a query which return the day of the week for any date entered in format ‘DD-MM-YY’.
-- SELECT ENAME, DATE_FORMAT(HIREDATE, '%d-%m-%y') FROM EMP;
SELECT HIREDATE, DAYOFWEEK(HIREDATE) AS DAY_WEEK, DAYOFMONTH(HIREDATE) AS DAY_MTH
FROM EMP WHERE DATE_FORMAT(HIREDATE, '%d-%m-%y') = '12-01-83';

-- 133. Write a query to calculate the length of service of any employee with the company, use
-- DEFINE to avoid repetitive typing of functions.
-- Dont know how to solve this in MySQL
SELECT EMPNO, DATEDIFF(NOW(), HIREDATE)/(12 * 30) AS SVC_LEN_YRS FROM EMP;

-- 134. Give a string of format ‘NN/NN’, verify that the first and last two characters are numbers
-- and that the middle character is’/’. Print the expression ‘YES’ if valid, ‘NO’ if not valid.
-- Use the following values to test your solution. ‘12/34’,’01/1a’, ‘99/98’.
SELECT '12/34' REGEXP '^(dd\/dd)$';

-- 135. Emps hired on or before 15th of any month are paid on the last Friday of that month
-- those hired after 15th are paid on the first Friday of the following month. Print a list of emps
-- their hire date and the first pay date. Sort on hire date.

-- Googled for last day of the month. Got it here: https://stackoverflow.com/questions/5268030/last-friday-of-the-month-in-mysql?rq=1
-- SELECT DATE_FORMAT(LAST_DAY(NOW()) - ((7 + WEEKDAY(LAST_DAY(NOW())) - 4) % 7), '%Y-%m-%d') AS Last_Friday

SELECT ENAME, HIREDATE, DATE_FORMAT(LAST_DAY(HIREDATE) - ((7 + WEEKDAY(LAST_DAY(HIREDATE)) - 4) % 7), '%Y-%m-%d') AS PAYDAY
FROM EMP
WHERE DAYOFMONTH(HIREDATE) <= 15;
-- can't solve this one.

-- 136. Count the no. of characters with out considering spaces for each name.
SELECT LENGTH(REPLACE(ENAME,' ', null)) FROM EMP;

-- 137. Find out the emps who are getting decimal value in their Sal without using like operator.
SELECT * FROM EMP WHERE INSTR(SAL,'.') > 0;

-- 138. List those emps whose Salary contains first four digit of their Deptno.
-- Need to verify! The question seems to be wrong.
SELECT * FROM EMP e1 WHERE SAL = (
  SELECT CONCAT(DEPTNO, DEPTNO) FROM EMP e2 WHERE e1.EMPNO = e2.EMPNO
);

-- 139. List those Managers who are getting less than his emps Salary.
SELECT e.ENAME subordinate, e.SAL sub_sal, m.ENAME manager, m.SAL man_sal
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO
AND e.SAL > m.SAL;

-- 140. Print the details of all the emps who are sub-ordinates to Blake.
SELECT * FROM EMP
WHERE mgr = (
  SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE'
)

-- 141. List the emps who are working as Managers using co-related sub-query.
SELECT * FROM EMP WHERE EMPNO in (
  SELECT EMPNO FROM EMP WHERE JOB = 'MANAGER'
);

SELECT * FROM EMP WHERE EMPNO IN ( SELECT MGR FROM EMP);

-- 142. List the emps whose Mgr name is ‘Jones’ and also with his Manager name.
SELECT ENAME as EMPLOYEE, 'JONES' as MANAGER 
FROM EMP WHERE MGR = (
  SELECT EMPNO FROM EMP WHERE ENAME = 'JONES'
)
UNION
SELECT 'JONES' as employee, ENAME
FROM EMP WHERE EMPNO = (
  SELECT MGR FROM EMP WHERE ENAME = 'JONES'
);


SELECT e.ename,w.ename,m.ename 
FROM EMP e,EMP w,EMP m 
WHERE e.mgr = w.empno 
AND w.ename = 'JONES'
AND w.mgr = m.empno;


-- 143. Define a variable representing the expression used to calculate on emps total annual remuneration use the variable 
-- in a statement, which finds all emps who can earn 30000 a year or more.
-- Dont know how to do this.
SELECT SAL * 12 + IFNULL(COMM, 0) INTO @TOTAL_REMUNERATION FROM EMP WHERE SAL * 12 > 30000

SELECT @TOTAL_REMUNERATION



-- 144. Find out how may Managers are their in the company.
SELECT COUNT(1) FROM EMP WHERE JOB = 'MANAGER';

-- 145. Find Average salary and Average total remuneration for each Job type. Remember Salesman earn commission.secommm
SELECT AVG(SAL), AVG(SAL + IFNULL(COMM,0)), JOB
FROM EMP
GROUP BY JOB;

-- 146. Check whether all the emps numbers are indeed unique.
SELECT COUNT(EMPNO) FROM EMP GROUP BY EMPNO HAVING COUNT(EMPNO) > 1;

-- 147. List the emps who are drawing less than 1000 Sort the output by Salary.
SELECT * FROM EMP WHERE SAL < 1000 order by SAL DESC;

-- 148. List the employee Name, Job, Annual Salary, deptno, Dept name and grade who earn 36000 a year or who are not CLERKS.
SELECT e.ENAME, e.JOB, e.SAL * 12, e.DEPTNO, d.DNAME
FROM EMP e INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE e.SAL * 12  = 36000
OR e.JOB = 'CLERK';

-- 149. Find out the Job that was filled in the first half of 1983 and same job that was filled during the same period of 1984.
-- I changed the HIREDATE of ADAMS to 1984-01-03 to get result for the query
SELECT e.JOB, e.HIREDATE
FROM EMP e
WHERE e.HIREDATE BETWEEN '1984-01-01' AND '1984-07-01'
AND JOB IN (
  SELECT JOB FROM EMP WHERE HIREDATE BETWEEN '1984-01-01' AND '1984-07-01'
)
ORDER BY e.HIREDATE ASC;

SELECT e.JOB, e.HIREDATE
FROM EMP e
WHERE MONTH(e.HIREDATE) <= 06
AND YEAR(e.HIREDATE) = 1984
AND e.JOB IN (
  SELECT JOB FROM EMP
  WHERE MONTH(HIREDATE) <= 06
  AND YEAR(HIREDATE) <= 1983
);

-- 150. Find out the emps who joined in the company before their Managers.
SELECT e.ENAME, e.HIREDATE, e.JOB as EMPLOYEE, m.JOB as MANAGER, m.ENAME, m.HIREDATE
FROM EMP e, EMP m
WHERE e.MGR = m.EMPNO
--  AND m.JOB = 'MANAGER'
AND e.HIREDATE < m.HIREDATE;


-- 151. List all the emps by name and number along with their Manager’s name and number. Also List KING who has no ‘Manager’.
SELECT e.EMPNO as EMPLOYEE_NUMBER
  , e.ENAME as EMPLOYEE_NAME
  , m.ENAME as MANAGER_NAME
  , m.EMPNO as MANAGER_NUMBER
FROM EMP e
  LEFT JOIN EMP m ON e.MGR = m.EMPNO;

-- 152. Find all the emps who earn the minimum Salary for each job wise in ascending order
SELECT * FROM EMP WHERE SAL IN (
  SELECT MIN(SAL) FROM EMP GROUP BY JOB
);

-- 153. Find out all the emps who earn highest salary in each job type. Sort in descending salary order.
SELECT * FROM EMP WHERE SAL IN (
  SELECT MAX(SAL) FROM EMP GROUP BY JOB
)
ORDER BY SAL DESC;

-- 154. Find out the most recently hired emps in each Dept order by Hiredate.
SELECT * FROM EMP e WHERE HIREDATE IN (
  SELECT MAX(HIREDATE) FROM EMP e1 where e1.DEPTNO = e.DEPTNO
)
ORDER BY HIREDATE ASC;

-- 155. List the employee name,Salary and Deptno for each employee who earns a salary greater than the average for their department order by Deptno.
SELECT e.ENAME, e.SAL, e.DEPTNO
FROM EMP e, (SELECT AVG(SAL) as AVG_SAL, DEPTNO FROM EMP GROUP BY DEPTNO) A
WHERE e.DEPTNO = A.DEPTNO
  AND e.SAL > A.AVG_SAL
ORDER BY e.SAL ASC;

SELECT e.ENAME, e.SAL, e.DEPTNO
FROM EMP e WHERE e.SAL > (
  SELECT AVG(SAL) FROM EMP WHERE e.DEPTNO = DEPTNO
)
ORDER BY e.SAL ASC;

-- 156. List the Deptno where there are no emps.
SELECT * FROM DEPT WHERE DEPTNO NOT IN (
  SELECT DISTINCT DEPTNO FROM EMP
);

SELECT * FROM DEPT d LEFT JOIN EMP e on d.DEPTNO = e.DEPTNO
WHERE e.DEPTNO is NULL;

SELECT * FROM EMP e RIGHT JOIN DEPT d on d.DEPTNO = e.DEPTNO
WHERE e.DEPTNO is NULL;


-- 157. List the No.of emp’s and Avg salary within each department for each job.
SELECT DEPTNO, JOB, COUNT(EMPNO), AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB;

-- 158. Find the maximum average salary drawn for each job except for ‘President’.
SELECT MAX(AVG_SAL), JOB FROM (
  SELECT AVG(SAL) AS AVG_SAL, JOB FROM EMP WHERE JOB <> 'PRESIDENT' GROUP BY JOB
) A;

-- 159. Find the name and Job of the emps who earn Max salary and Commission.
-- Need to verify this
SELECT e.ENAME, e.JOB FROM EMP e WHERE SAL + IFNULL(COMM, 0) IN (
  SELECT MAX(SAL + IFNULL(COMM, 0)) FROM EMP
);

-- 160. List the Name, Job and Salary of the emps who are not belonging to the department 10 but who have the same job and Salary as the emps of dept 10.
-- The query produced zero rows because i didn't have the matching data. so I added the record of 'DAVID'
-- to get at least a single match
SELECT ENAME, JOB, DEPTNO, SAL
FROM EMP
WHERE DEPTNO <> 10
AND JOB IN (
  SELECT JOB FROM EMP WHERE DEPTNO = 10
)
AND SAL IN (
  SELECT SAL FROM EMP WHERE DEPTNO = 10
);


-- 161. List the Deptno, Name, Job, Salary and Sal+Comm of the SALESMAN who are earning maximum salary and commission in descending order.
SELECT e.DEPTNO, e.ENAME, e.JOB, e.SAL + IFNULL(e.COMM, 0)
FROM EMP e
WHERE JOB = 'SALESMAN'
AND e.SAL = (
  SELECT MAX(SAL) FROM EMP
  WHERE COMM is not null
  GROUP BY JOB
);

-- 162. List the Deptno, Name, Job, Salary and Sal+Comm of the emps who earn the second highest earnings (sal + comm.).
SELECT e.DEPTNO, e.ENAME, e.JOB, e.SAL + IFNULL(e.COMM ,0)
FROM EMP e
WHERE 2 = (
  SELECT COUNT(DISTINCT (SAL + IFNULL(COMM, 0))) FROM EMP WHERE e.SAL + IFNULL(e.COMM, 0) < SAL + IFNULL(COMM, 0)
);

-- 163. List the Deptno and their average salaries for dept with the average salary less than the averages for all department
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < (
  SELECT AVG(SAL)
  FROM EMP
);

-- 164. List out the Names and Salaries of the emps along with their manager names and salaries for those emps who earn more salary than their Manager.
SELECT e.ENAME, e.SAL, m.ENAME, m.SAL
FROM EMP e INNER JOIN EMP m ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;

-- 165. List out the Name, Job, Salary of the emps in the department with the highest average salary.
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = (
  SELECT DEPTNO FROM (
    SELECT DEPTNO, MAX(AVG_SAL)
    FROM (
     SELECT AVG(SAL) as AVG_SAL, DEPTNO
     FROM EMP
     GROUP BY DEPTNO
   ) A
  ) B
);

-- 166. List the empno,sal,comm. Of emps.
SELECT EMPNO, SAL, COMM FROM EMP;

-- 167. List the details of the emps in the ascending order of the sal.
SELECT * FROM EMP ORDER BY SAL ASC;

-- 168. List the dept in the ascending order of the job and the desc order of the emps print empno, ename.
SELECT EMPNO, ENAME, JOB FROM EMP ORDER BY JOB ASC, EMPNO DESC;

-- 169. Display the unique dept of the emps.
SELECT DISTINCT DEPTNO FROM EMP;

-- 170. Display the unique dept with jobs.
-- Need to verify this. The oracle keyword is unique. the query is: SELECT UNIQUE DEPTNO, JOB FROM EMP
SELECT DISTINCT DEPTNO, JOB FROM EMP GROUP BY JOB, EMPNO ORDER BY JOB ASC

-- 171. Display the details of the blake.
SELECT * FROM EMP WHERE ENAME = 'BLAKE';

-- 172. List all the clerks.
SELECT * FROM EMP WHERE JOB = 'CLERK';

-- 173. List all the employees joined on 1st may 81.
SELECT * FROM EMP WHERE HIREDATE = '1981-05-01';

-- 174. List the empno,ename,sal,deptno of the dept 10 emps in the ascending order of salary.
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10 ORDER BY SAL ASC;

-- 175. List the emps whose salaries are less than 3500.
SELECT * FROM EMP WHERE SAL < 3500;

-- 176. List the empno,ename,sal of all the emp joined before 1 apr 81.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE HIREDATE < '1981-04-01';

-- 177. List the emp whose annual sal is <25000 in the asc order of the salaries.
SELECT * FROM EMP WHERE SAL * 12 < 25000;

-- 178. List the empno,ename,annsal,dailysal  of all the salesmen in the asc ann sal
SELECT EMPNO, ENAME, SAL * 12 AS ANNUAL_SAL, SAL AS DAILY_SAL
FROM EMP WHERE JOB = 'SALESMAN';

-- 179. List the empno,ename,hiredate,current date & exp in the ascending order of the exp.
SELECT EMPNO, ENAME, HIREDATE, CURRENT_DATE(), DATEDIFF(NOW(), HIREDATE)/(12*30) AS EXP
FROM EMP ORDER BY HIREDATE ASC;

-- 180. List the emps whose exp is more than 10 years.
SELECT * FROM EMP WHERE DATEDIFF(NOW(), HIREDATE)/(12 * 30) > 10;

-- 181. List the empno,ename,sal,Basic 35%, TA 30%,DA 40%,HRA 50%,GROSS,10% LIC,20% PF, 8% PT, net,deduction,net allow and net sal in the ascending order of the net salary.
SELECT EMPNO, ENAME,
  SAL
  , @gross := SAL * 12 AS GROSS
  , ROUND(@basic := SAL * 0.35,2) as BASIC
  , ROUND(@ta := @basic * 0.3,2) AS TA
  , ROUND(@da := @basic * 0.4,2) AS DA
  , ROUND(@hra := @basic * 0.5,2) AS HRA
  , ROUND(@lic := @basic * 0.1,2) AS LIC
  , ROUND(@pf := @basic * 0.2,2) AS PF
  , ROUND(@pt := @basic * 0.08,2) AS PT
  , ROUND(@ded := (@lic + @pt + @pf),2) AS DEDUCTIONS
  , ROUND(@net := (@gross - @ded),2) AS NET_SAL
FROM EMP
ORDER BY @net ASC;

-- 182. List the emps who are working as managers.
SELECT * FROM EMP WHERE JOB = 'MANAGER';

-- 183. List the emps who are either clerks or managers.
SELECT * FROM EMP WHERE JOB IN ('CLERK', 'MANAGER');

-- 184. List the emps who have joined on the following dates 1 may 81,17 nov 81,30 dec 81
SELECT * FROM EMP WHERE HIREDATE IN ('1981-05-01', '1981-11-17', '1981-12-30');

-- 185. List the emps who have joined in the year 1981.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981;

-- 186. List the emps whose annual sal ranging from 23000 to 40000.
SELECT * FROM EMP WHERE SAL*12 BETWEEN 23000 AND 40000;

-- 187. List the emps working under the mgrs 7369,7890,7654,7900.
SELECT * FROM EMP WHERE EMPNO IN (7369, 7890, 7654, 7900);

-- 188. List the emps who joined in the second half of 82.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1982 AND MONTH(HIREDATE) > 06;

-- 189. List all the 4char emps.
SELECT * FROM EMP WHERE LENGTH(ENAME) = 4;

-- 190. List the emp names starting with ‘M’ with 5 chars.
SELECT * FROM EMP WHERE LENGTH(ENAME) = 5 AND ENAME LIKE 'M%';

-- 191. List the emps end with ‘H’ all together 5 chars.
SELECT * FROM EMP WHERE LENGTH(ENAME) AND ENAME LIKE '%H'

-- 192. List names start with ‘M’.
SELECT * FROM EMP WHERE ENAME LIKE 'M%';

-- 193. List the emps who joined in the year 81.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981;

-- 194. List the emps whose sal is ending with 00.
SELECT * FROM EMP WHERE SAL LIKE '%00.%';

-- 195. List the emp who joined in the month of JAN.
SELECT * FROM EMP WHERE MONTH(HIREDATE) = 1;

-- 196. Who joined in the month having char ‘a’.
SELECT * FROM EMP WHERE MONTHNAME(HIREDATE) LIKE '%A%';

-- 197. Who joined in the month having second char ‘a’
SELECT * FROM EMP WHERE MONTHNAME(HIREDATE) LIKE '_A%';

-- 198. List the emps whose salary is 4 digit number.
SELECT * FROM EMP WHERE SAL LIKE '____.%';
-- OR
SELECT * FROM EMP WHERE LENGTH(SAL) = 7;

-- 199. List the emp who joined in 80’s.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1980;

-- 200. List the emp who are clerks who have exp more than 8ys.
SELECT * FROM EMP WHERE ENAME = 'CLERK' AND DATEDIFF(NOW(), HIREDATE)/(12 * 30) > 8;

-- 201. List the mgrs of dept 10 or 20.
SELECT MGR FROM EMP WHERE DEPTNO IN (10, 20);

-- 202. List the emps joined in jan with salary ranging from 1500 to 4000.
SELECT * FROM EMP WHERE MONTHNAME(HIREDATE) = 'JAN' AND SAL BETWEEN 1500 AND 4000;

-- 203. List the unique jobs of dept 20 and 30 in desc order.
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO IN (20, 30);

-- 204. List the emps along with exp of those working under the mgr whose number is starting with 7 but should not have a 9, joined before 1983.
SELECT ENAME, @exp := ROUND(DATEDIFF(NOW(), HIREDATE)/(12 * 30), 1) as EXP, MGR, HIREDATE
FROM EMP WHERE MGR LIKE '7%'
AND MGR <> '%9%'
AND YEAR(HIREDATE) < 1983
ORDER BY @exp DESC;

-- 205. List the emps who are working as either mgr or analyst with the salary ranging from 2000 to 5000 and with out comm.
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'ANALYST') AND SAL BETWEEN 2000 AND 5000 AND COMM IS NULL;

-- 206. List the empno,ename,sal,job of the emps with /ann sal <34000 but receiving some comm. Which should not be>sal and desg should be sales man working for dept 30.
SELECT EMPNO, ENAME, SAL, JOB, (@annual_salary := SAL * 12 + IFNULL(COMM, 0)) as ANN_SAL
FROM EMP WHERE DEPTNO = 30
AND JOB = 'SALESMAN'
AND @annual_salary < 34000
AND IFNULL(COMM, 0) < SAL;

-- 207. List the emps who are working for dept 10 or 20 with desgs as clerk or analyst
-- with a sal is either 3 or 4 digits with an exp>8ys but does not belong to months of mar,apr,sep
-- and working for mgrs  & no is not ending with 88 and 56.

-- the question is not formulated the correctly. The last clause could make you believe that you need
-- to find emps who are working for manager and their empno's should not end with 88 and 56. However
-- what it means find emps whose manager's number should not end with 88 or 56

SELECT * FROM EMP
WHERE DEPTNO IN (10, 20)
AND JOB IN ('CLERK', 'ANALYST')
AND LENGTH(SAL) IN (6,7)
AND DATEDIFF(NOW(), HIREDATE)/(12 * 30) > 8
AND MONTHNAME(HIREDATE) NOT IN ('MAR', 'APR', 'SEP')
AND (MGR NOT LIKE '%88' OR MGR NOT LIKE '%56');


-- 208. List the empno,ename,sal,job,deptno&exp of all the emps belongs to dept 10 or 20
-- with an exp 36 to 40 y working under the same mgr without comm
-- With a job not ending irrespective of the position with comm.>200
-- with exp>=7y and sal<2500 but not belongs to the month sep or nov
-- working under the mgr whose no is not having digits either 9 or 0
-- in the asc dept& desc dept
-- (trouble in paradise... I didn't understand the second clause here)

-- 208.1 List the empno,ename,sal,job,deptno&exp of all the emps belongs to dept 10 or 20 with an exp 36 to 40 y working under the same mgr without comm
SELECT e.ENAME as EMPLOYEE , m.ENAME AS MANAGER , e.SAL, e.COMM, e.JOB, e.DEPTNO , A.EXP
FROM EMP e, EMP m, (
  SELECT ROUND(DATEDIFF(NOW(), HIREDATE)/(12 * 30),1) AS EXP, EMPNO FROM EMP
) A
WHERE e.DEPTNO in (10, 20)
AND e.EMPNO = A.EMPNO
AND (e.COMM IS NULL or e.COMM = 0)
AND A.EXP between 35.0 AND 36.0;


-- 209. List the details of the emps working at Chicago.
SELECT e.EMPNO, e.ENAME, e.JOB, d.LOC, d.DNAME
FROM EMP e INNER JOIN DEPT d on e.DEPTNO = d.DEPTNO
WHERE d.LOC = 'CHICAGO';

-- 210. List the empno,ename,deptno,loc of all the emps.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- 211. List the empno,ename,loc,dname of all the depts.,10 and 20.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO WHERE D.DEPTNO IN (10, 20);

-- 212. List the empno, ename, sal, loc of the emps working at Chicago dallas with an exp>6ys.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, E.SAL, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'CHICAGO' AND ROUND(DATEDIFF(NOW(), HIREDATE)/(12 * 30),1) > 6.0;

-- 213. List the emps along with loc of those who belongs to dallas ,newyork with sal ranging from 2000 to 5000 joined in 81.
SELECT D.LOC, E.* FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC IN ('DALLAS', 'NEWYORK')
AND SAL BETWEEN 2000 AND 5000
AND YEAR(HIREDATE) = 1981;

-- 214. List the empno,ename,sal,grade of all emps.
SELECT EMPNO, ENAME, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;

-- 215. List the grade 2 and 3 emp of Chicago.
SELECT * FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE IN (2,3);

-- 216. List the emps with loc and grade of accounting dept or the locs dallas or Chicago with the grades 3 to 5 &exp >6y
SELECT d.LOC, e.*
FROM EMP e, DEPT d, SALGRADE s
WHERE e.DEPTNO = d.DEPTNO
AND e.SAL BETWEEN s.LOSAL AND s.HISAL
AND d.DNAME = 'ACCOUNTING' OR d.LOC IN ('DALLAS', 'CHICAGO')
AND s.GRADE BETWEEN 3 AND 5
AND DATEDIFF(NOW(), HIREDATE)/(12*30) > 6;

-- 217. List the grades 3 emps of research and operations depts.. joined after 1987 and whose names should not be either miller or allen.
SELECT E.*, D.DNAME
FROM EMP E, SALGRADE S, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND D.DNAME IN ('RESEARCH', 'OPERATIONS')
AND YEAR(E.HIREDATE) > 1987
AND E.ENAME NOT IN ('MILLER', 'ALLEN');

-- 218. List the emps whose job is same as smith.
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SMITH');

-- 219. List the emps who are senior to miller.
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');

-- 220. List the emps whose job is same as either allen or sal > allen.
SELECT * FROM EMP WHERE JOB = (
  SELECT JOB FROM EMP WHERE ENAME = 'ALLEN'
)
OR SAL > ( SELECT SAL FROM EMP WHERE ENAME = 'ALLEN')
ORDER BY SAL;

-- 221. List the emps who are senior to their own manager.
SELECT E.ENAME AS EMP_NAME, M.ENAME AS MANAGER, E.HIREDATE, M.HIREDATE
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO
AND E.HIREDATE < M.HIREDATE;

-- 222. List the emps whose sal greater than blakes sal.
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');

-- 223. List the dept 10 emps whose sal>allen sal.
SELECT * FROM EMP WHERE DEPTNO = 10 AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');

-- 224. List the mgrs who are senior to king and who are junior to smith.
SELECT * FROM EMP
WHERE EMPNO IN (SELECT DISTINCT MGR FROM EMP)
AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING')
AND HIREDATE > (SELECT HIREDATE DATE FROM EMP WHERE ENAME = 'SMITH');

-- 225. List the empno,ename,loc,sal,dname of the all the emps belonging to king dept.
SELECT E.EMPNO, E.ENAME, D.LOC, E.SAL, D.DNAME
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
AND E.DEPTNO = ( SELECT DEPTNO FROM EMP WHERE ENAME = 'KING');

-- 226. List the emps whose salgrade are greater than the grade of miller.
SELECT * FROM EMP, SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
AND SALGRADE.GRADE = (
  SELECT S.GRADE
  FROM EMP E, SALGRADE S
  WHERE E.SAL BETWEEN  S.LOSAL AND S.HISAL
  AND E.ENAME = 'MILLER'
);



-- 227. List the emps who are belonging dallas or Chicago with the grade same as adams or exp more than smith.
SELECT * FROM EMP e, SALGRADE s, DEPT d
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
AND e.DEPTNO = d.DEPTNO
AND d.LOC IN ('DALLAS', 'CHICAGO')
AND s.GRADE = (
  SELECT s1.GRADE FROM EMP e1, SALGRADE s1 WHERE e1.SAL BETWEEN s1.LOSAL AND s1.HISAL AND e1.ENAME = 'SMITH'
);

-- 228. List the emps whose sal is same as ford or blake.
SELECT * FROM EMP WHERE SAL IN (
  SELECT SAL FROM EMP WHERE ENAME IN ('FORD', 'BLAKE')
);

-- 229. List the emps whose sal is same as any other employee in the company.
SELECT * FROM EMP e1 WHERE e1.SAL IN (
  SELECT e2.SAL FROM EMP e2 WHERE e1.EMPNO <> e2.EMPNO
);

-- 230. List the emps whose sal is same as Sal of any clerk of emp1 table.
SELECT SAL FROM EMP WHERE JOB = 'CLERK';

-- 231. List the emps whose sal is same as any emp joined before 82.
SELECT * FROM EMP WHERE YEAR(HIREDATE) < 1982;

-- 232. List the emps whose sal is same as the total remuneration (sal+comm.) of all sales person of Sales dept belonging to emp table.
-- i feel that the join with DEPT is irrelevant
SELECT E.SAL + IFNULL(E.COMM, 0) FROM EMP E, DEPT D
WHERE E.JOB = 'SALESMAN'
AND E.DEPTNO = D.DEPTNO
AND D.DNAME = 'SALES';

-- 233. List the emps whose sal is same as any other Grade 4 emps of emp table.
SELECT * FROM EMP WHERE SAL IN (
  SELECT E.SAL FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 4
);

-- 234. List the emps whose sal is same as Any emp Sal of emp table
-- duplicate of #229

-- 235. List the highest paid emp.
SELECT * FROM EMP WHERE SAL = (
  SELECT MAX(SAL) FROM EMP
);

-- 236. List the details of most recently hired emp of dept 30.
SELECT * FROM EMP WHERE HIREDATE = (
  SELECT MAX(HIREDATE) FROM EMP
);

-- 237. List the highest paid emp of Chicago joined before the most recently hired emp of grade 2.
SELECT * FROM EMP
WHERE SAL = (
  SELECT MAX(SAL) FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
  WHERE DEPT.LOC = 'CHICAGO'
)
AND HIREDATE < (
  SELECT DISTINCT HIREDATE
  FROM EMP
  WHERE HIREDATE = (
    SELECT MAX(e.HIREDATE) FROM EMP e, SALGRADE s WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL AND s.GRADE = 2
  )
);


-- 238. List the highest paid emp working under king.
SELECT * FROM EMP WHERE MGR = (
  SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
)
AND SAL = (
  SELECT MAX(SAL) FROM EMP WHERE MGR = (
    SELECT EMPNO FROM EMP WHERE ENAME = 'KING'
  )
);

