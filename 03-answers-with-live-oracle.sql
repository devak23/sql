-- 1. Display all the information of the HR.EMPLOYEES table
SELECT * FROM HR.EMPLOYEES;

-- 2. Display unique Jobs from HR.EMPLOYEES table
SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;

-- 3. List the HR.EMPLOYEESs in the asc order of their Salaries
SELECT * FROM HR.EMPLOYEES ORDER BY SALARY ASC;

-- 4. List the details of the HR.EMPLOYEESs in asc order of the Dptnos and desc of Jobs
SELECT * FROM HR.EMPLOYEES ORDER BY DEPARTMENT_ID ASC , JOB_ID DESC;

-- 5. Display all the unique job groups in the descending order
SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES ORDER BY JOB_ID ASC;

-- 6. Display all the details of all ‘Mgrs’
SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID IN (
  SELECT MGR FROM HR.EMPLOYEES
);

-- 7. List the HR.EMPLOYEESs who joined before 1981
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE < DATE '1981-01-01';
-- OR
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE < TO_DATE('1981-01-01','YYYY-MM-DD');


-- 8. List the HR.EMPLOYEESno, Last Name, SALARY, Daily SALARY of all HR.EMPLOYEESs in the asc order of Annual SALARY
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, SALARY / 30 AS DAILY_SAL, SALARY * 12 AS ANNUAL_SALARY
FROM HR.EMPLOYEES
ORDER BY ANNUAL_SALARY ASC;

-- 9. Display the HR.EMPLOYEESno, Last Name, job, Hiredate, Exp (Experience) of all Mgrs
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, HIRE_DATE, (SYSDATE - HIRE_DATE)/(12*30) AS EXP_YRS
FROM HR.EMPLOYEES
WHERE JOB_ID IN (
    SELECT JOB_ID FROM HR.EMPLOYEES WHERE JOB_ID = 'AC_MGR'
)
ORDER BY EXP_YRS ASC;

-- 10. List the HR.EMPLOYEESno, Last Name, SALARY, Exp of all HR.EMPLOYEESs working for EMPLOYEE_ID 205
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, (SYSDATE - HIRE_DATE)/(12*30) AS EXP_YRS
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 205;

-- 11. List the HR.EMPLOYEESs in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM HR.EMPLOYEES
  WHERE HIRE_DATE > DATE '1981-06-01'
ORDER BY JOB_ID ASC;

-- 12. List the HR.EMPLOYEESs along with their Exp and Daily SALARY is more than Rs.100
SELECT e.*, (SYSDATE - HIRE_DATE)/(12*30) AS EXP_YRS, SALARY/30 as DAILY_SAL
FROM HR.EMPLOYEES e
WHERE SALARY/30 > 100;

-- 13. List the HR.EMPLOYEESs who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT *
FROM HR.EMPLOYEES
WHERE JOB_ID IN ('CLERK', 'ANALYST')
ORDER BY JOB_ID;

-- 14. List various representatives in the company
SELECT *
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
ORDER BY JOB_ID;


-- 15. List the HR.EMPLOYEESs who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19')
ORDER BY HIRE_DATE ASC;

-- 16. List the HR.EMPLOYEES who are working for the Deptno 10 or20
SELECT * FROM HR.EMPLOYEES e
WHERE DEPARTMENT_ID = 10
OR DEPARTMENT_ID = 20;

-- 17. List the HR.EMPLOYEESs who are joined in the year 81
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN '1981-01-01' AND '1982-01-01';

-- 18. List the HR.EMPLOYEESs who are joined in the month of Feb 1981
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN '1981-02-01' AND '1981-03-01';


-- 19. List the HR.EMPLOYEESs Who Annual SALARY ranges from 22000 and 45000
SELECT * FROM HR.EMPLOYEES WHERE SALARY * 12 BETWEEN 22000 and 45000;

-- 20. List the Enames those are having five characters in their Names.
SELECT LAST_NAME FROM HR.EMPLOYEES WHERE length(LAST_NAME) > 5;

-- 21. List the Enames those are starting with ‘T’ and with five characters.
SELECT LAST_NAME FROM HR.EMPLOYEES WHERE length(LAST_NAME) > 5 AND LAST_NAME like 'T%';

-- 22. List the HR.EMPLOYEESs those are having four chars and third character must be ‘r’.
SELECT LAST_NAME FROM HR.EMPLOYEES WHERE length(LAST_NAME) = 4 AND LAST_NAME LIKE '__r%';

-- 23. List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT LAST_NAME FROM HR.EMPLOYEES WHERE length(LAST_NAME) = 5 AND LAST_NAME LIKE 'S%H';

-- 24. List the HR.EMPLOYEESs who joined in January.
SELECT * FROM HR.EMPLOYEES WHERE month(HIRE_DATE) = 01;

-- 25. List the HR.EMPLOYEESs who joined in the month of which second character is ‘a’.
SELECT * FROM HR.EMPLOYEES WHERE monthname(HIRE_DATE) like '_a%';

-- 26. List the HR.EMPLOYEESs whose SALARY is four digit number ending with Zero
SELECT * FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 1000 and 10000
AND CONVERT(SALARY, CHAR) LIKE '%0.00';

-- 27. List the HR.EMPLOYEESs whose names having a character set ‘ll’ together
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME like '%ll%';

-- 28. List the HR.EMPLOYEESs those who joined in 80’s
SELECT * FROM HR.EMPLOYEES WHERE year(HIRE_DATE) = 1980;

-- 29. List the HR.EMPLOYEESs who does not belong to Deptno 20.
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID <> 20;

-- 30. List all the HR.EMPLOYEESs except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID NOT IN ('PRESIDENT', 'MANAGER') ORDER BY SALARY ASC;

-- 31. List all the HR.EMPLOYEESs who joined before or after 1981
SELECT * FROM HR.EMPLOYEES WHERE year(HIRE_DATE) <> 1981;

-- 32. List the HR.EMPLOYEESs whose HR.EMPLOYEESno not starting with digit 78
SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID NOT LIKE '78%';

-- 33. List the HR.EMPLOYEESs who are working under ‘MGR’
SELECT concat(e.LAST_NAME,' works for ',m.LAST_NAME)
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.MGR = m.EMPLOYEE_ID;

-- 34. List the HR.EMPLOYEESs who joined in any year but not belongs to the month of March
SELECT * FROM HR.EMPLOYEES WHERE MONTH(HIRE_DATE) <> 3;

-- 35. List all the Clerks of Deptno 20.
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 20 AND JOB_ID = 'CLERK';

-- 36. List the HR.EMPLOYEESs of Deptno 30 or 10 joined in the year 1981.
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN (30, 10) AND EXTRACT (YEAR FROM HIRE_DATE) = 1981;

-- 37. Display the details of SMITH.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME = 'SMITH';

-- 38. Display the location of  SMITH. (HR.DEPARTMENTS table is being used)
SELECT LOC FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID = (
  SELECT DEPARTMENT_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'SMITH'
);

SELECT LOC
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.LAST_NAME = 'SMITH';

-- 39. List the total information of HR.EMPLOYEES table along with DNAME and Loc of all the HR.EMPLOYEESs Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.
SELECT d.DNAME, d.LOC, e.*
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DNAME IN ('ACCOUNTING', 'RESEARCH')
ORDER BY DEPARTMENT_ID ASC;

-- 40. List the HR.EMPLOYEESno, Last Name, SALARY, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the COMMISSION_PCT asc order of Loc
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, d.DEPARTMENT_ID -- ,  e.JOB_ID, DATEDIFF(NOW(), e.HIRE_DATE) / (12 * 30), d.LOC
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.JOB_ID IN ('MANAGER','ANALYST')
AND d.LOC IN ('New York', 'Dallas')
AND DATEDIFF(NOW(), e.HIRE_DATE) / (12 * 30) > 7
AND e.COMMISSION_PCT IS NULL
ORDER BY LOC ASC;

-- 41. Display the HR.EMPLOYEESno, Last Name, SALARY, Dname, Loc, Deptno, Job of all HR.EMPLOYEESs working at CHICAGO or working for ACCOUNTING HR.DEPARTMENTS with Ann SALARY>28000, but the SALARY should not be=3000 or 2800 and who doesn’t belong to "MANAGER" and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, d.DNAME, d.LOC, d.DEPARTMENT_ID
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d on d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE ( d.LOC = 'CHICAGO' OR d.DNAME = 'ACCOUNTING')
  AND e.SALARY * 12 > 28000
  AND e.SALARY NOT IN (3000, 2800)
  AND e.JOB_ID <> 'MANAGER'
  AND (e.EMPLOYEE_ID LIKE '__7%' OR e.EMPLOYEE_ID LIKE '__3%')
ORDER BY d.DEPARTMENT_ID ASC, e.JOB_ID DESC;

-- 42. Display the total information of the HR.EMPLOYEESs along with Grades in the asc order (salgrade table is now used)
SELECT  s.GRADE, e.LAST_NAME, e.SALARY
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL;

-- 43. List all the Grade2 and Grade 3 HR.EMPLOYEESs.
SELECT s.grade, e.*
FROM HR.EMPLOYEES e, SALGRADE s
WHERE s.GRADE IN (2,3)
AND e.SALARY BETWEEN s.LOSAL and s.HISAL;

-- 44. Display all Grade 4,5 Analyst and Mgr.
SELECT s.GRADE, e.*
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
  AND s.GRADE IN (4,5)
  AND e.JOB_ID IN ('MANAGER', 'ANALYST');

-- 45. List the HR.EMPLOYEESno, Last Name, SALARY, Dname, Grade, Exp, and Ann SALARY of HR.EMPLOYEESs working for HR.DEPARTMENTS 10 or 20
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, d.DNAME, s.GRADE, datediff(now(), e.HIRE_DATE)/(12*30) as EXP, e.SALARY * 12 AS ANNUAL_SALARY
FROM SALGRADE s, HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
AND d.DEPARTMENT_ID IN (10, 20);


-- 46. List all the information of HR.EMPLOYEES with Loc and the Grade of all the HR.EMPLOYEESs belong to the Grade range from 2 to 4 working at the HR.DEPARTMENTS those are not starting with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’ any where joined in the year 1981 but not in the month of Mar or Sep and SALARY not end with ‘00’ in the asc order of Grades
SELECT s.GRADE, d.LOC, d.DNAME, e.*
FROM SALGRADE s, HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
AND d.DNAME NOT LIKE 'OP%'
AND d.DNAME NOT LIKE '%S'
AND e.JOB_ID LIKE '%a%'
AND year(e.HIRE_DATE) = 1981
AND month(e.HIRE_DATE) NOT IN (03, 09)
AND e.SALARY NOT LIKE '%0.%'
ORDER BY s.GRADE ASC;

-- 47. List the details of the Depts along with HR.EMPLOYEESno, Last Name or without the HR.EMPLOYEESs
SELECT e.EMPLOYEE_ID, e.LAST_NAME, d.*
FROM HR.DEPARTMENTS d LEFT JOIN HR.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID;

-- 48. List the details of the HR.EMPLOYEESs whose Salaries more than the HR.EMPLOYEESloyee BLAKE.
SELECT e.* FROM HR.EMPLOYEES e
WHERE e.SALARY > (
  SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE'
);
  -- This is just to include BLAKE in the resultset if you wanted to compare
-- UNION
  -- SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE';

-- 49. List the HR.EMPLOYEESs whose Jobs are same as Jackson.
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID = (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'Jackson'
);

-- 50. List the HR.EMPLOYEESs who are senior to King.
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE < (
    SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'King' and first_name = 'Steven'
);

-- UNION
  -- SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING';

-- 51. List the HR.EMPLOYEESs who are senior to their own MGRS.
-- using a corelated subquery, we have the follows:
SELECT e1.EMPLOYEE_ID, e1.LAST_NAME, e1.HIRE_DATE
FROM HR.EMPLOYEES e1 WHERE e1.HIRE_DATE < (
  SELECT HIRE_DATE FROM HR.EMPLOYEES e2 WHERE e2.EMPLOYEE_ID = e1.MGR
)
ORDER BY e1.EMPLOYEE_ID ASC;

 -- using a join, we have the follows:
SELECT e1.EMPLOYEE_ID, e1.LAST_NAME, e1.HIRE_DATE, e1.MGR, e2.EMPLOYEE_ID, e2.LAST_NAME, e2.HIRE_DATE
FROM HR.EMPLOYEES e1, HR.EMPLOYEES e2
WHERE e1.MGR = e2.EMPLOYEE_ID
AND e1.HIRE_DATE < e2.HIRE_DATE
ORDER BY e1.EMPLOYEE_ID ASC;

-- 52. List the HR.EMPLOYEESs of Deptno 20 whose Jobs are same as Deptno 10.
 -- Using a subquery (not a co-related subquery), we have the following:
SELECT e20.JOB_ID, e20.LAST_NAME, e20.DEPARTMENT_ID
FROM HR.EMPLOYEES e20
WHERE e20.DEPARTMENT_ID = 20
  AND e20.JOB_ID IN (
  SELECT e10.JOB_ID FROM HR.EMPLOYEES e10 WHERE e10.DEPARTMENT_ID = 10
);

 -- using joins, we have the following:
SELECT e20.JOB_ID, e20.LAST_NAME, e20.DEPARTMENT_ID, e10.DEPARTMENT_ID, e10.LAST_NAME, e10.JOB_ID
FROM HR.EMPLOYEES e10, HR.EMPLOYEES e20
WHERE e20.DEPARTMENT_ID = 20
  AND e10.DEPARTMENT_ID = 10
  AND e10.JOB_ID = e20.JOB_ID
  AND e10.EMPLOYEE_ID <> e20.EMPLOYEE_ID;


-- 53. List the HR.EMPLOYEESs whose SALARY is same as FORD or SMITH in desc order of SALARY.
SELECT e1.LAST_NAME, e1.SALARY
FROM HR.EMPLOYEES e1 WHERE e1.SALARY IN (
  SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME IN ('FORD', 'SMITH')
)
AND e1.LAST_NAME NOT IN ('FORD', 'SMITH')
ORDER BY SALARY DESC;

-- 54. List the HR.EMPLOYEESs Whose Jobs are same as MILLER or SALARY is more than ALLEN.
SELECT LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE JOB_ID in (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'MILLER'
)
OR SALARY > (
  SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'ALLEN'
);

-- 55. List the HR.EMPLOYEESs whose SALARY is > the total remuneration of the SALESMAN.
SELECT LAST_NAME, SALARY
FROM HR.EMPLOYEES WHERE SALARY > (
  SELECT sum(SALARY + IFNULL(COMMISSION_PCT, 0)) FROM HR.EMPLOYEES WHERE JOB_ID = 'SALESMAN'
);
-- I'm not sure if the above query is correct

-- 56. List the HR.EMPLOYEESs who are senior to BLAKE working at CHICAGO & BOSTON.
SELECT d.LOC, e.LAST_NAME, e.HIRE_DATE FROM HR.EMPLOYEES e
INNER JOIN HR.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.LOC IN ('CHICAGO', 'BOSTON')
AND e.HIRE_DATE < (
  SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE'
);

-- 57. List the HR.EMPLOYEESs of Grade 3,4 belongs to the HR.DEPARTMENTS ACCOUNTING and RESEARCH whose SALARY is more than ALLEN and exp more than ADAMS in the asc order of EXP.
SELECT s.GRADE, e.LAST_NAME, e.HIRE_DATE, datediff(NOW(), e.HIRE_DATE)/(12*30) as EXP_YRS
FROM SALGRADE s, HR.EMPLOYEES e
INNER JOIN HR.DEPARTMENTS d on d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
AND d.DNAME IN ('ACCOUNTING', 'RESEARCH')
AND s.GRADE IN (3,4)
AND e.SALARY > (
  SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'ALLEN'
)
AND e.HIRE_DATE < (
  SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'ADAMS'
)
ORDER BY e.HIRE_DATE ASC;


-- 58. List the HR.EMPLOYEESs whose jobs same as SMITH or ALLEN.
SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID IN (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE LAST_NAME IN ('SMITH', 'ALLEN')
);

-- 59. Write a Query to display the details of HR.EMPLOYEESs whose SALARY is same as of
--    a)HR.EMPLOYEESloyee SALARY of HR.EMPLOYEES1 table.
--    b)¾ SALARY of any Mgr of HR.EMPLOYEES2 table.
--    c)The SALARY of any person with exp of 5 years belongs to the sales HR.DEPARTMENTS of HR.EMPLOYEES3 table.
--    d)Any grade 2 HR.EMPLOYEESloyee of HR.EMPLOYEES4 table.
--    e)Any grade 2 and 3 HR.EMPLOYEESloyee working fro sales HR.DEPARTMENTS or operations HR.DEPARTMENTS joined in 89.

-- This problem essentially needs subqueries in the WHERE Clause. It's simple... but
-- none of the rows really match the conditions so can't verify


-- 60. SELECT any jobs of deptno 10 those that are not found in deptno 20
SELECT DISTINCT JOB_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 10
AND JOB_ID NOT IN (
  SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 20
);

-- 61. List of HR.EMPLOYEESs of HR.EMPLOYEES1 who are not found in HR.EMPLOYEES2.
-- This question seems ridiculous as there wont be any HR.EMPLOYEESloyees at all
SELECT * from HR.EMPLOYEES e1 where e1.EMPLOYEE_ID NOT IN (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES
);

-- 62. Find the highest SALARY of HR.EMPLOYEES table.
SELECT MAX(SALARY) as HIGHEST_SAL FROM HR.EMPLOYEES;

-- 63. Find the details of highest paid HR.EMPLOYEESloyee
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES
);

-- 64. Find the highest paid HR.EMPLOYEESloyee of sales department.
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE DNAME = 'SALES'
  )
);

-- 65. List the most recently hired HR.EMPLOYEES of grade3 belongs to  location CHICAGO.
SELECT *
FROM HR.EMPLOYEES
WHERE HIRE_DATE = (
  SELECT MAX(HIRE_DATE)
  FROM HR.EMPLOYEES e, SALGRADE s, HR.DEPARTMENTS d
  WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
  AND d.LOC = 'CHICAGO'
  AND e.SALARY BETWEEN s.LOSAL AND s.HISAL
  AND s.GRADE = 3
);

-- 66. List the HR.EMPLOYEESloyees who are senior to most recently hired HR.EMPLOYEESloyee working under king.
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE < (
  SELECT MAX(HIRE_DATE)
  FROM HR.EMPLOYEES
  WHERE MGR = (
    SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
  )
);

-- 67. List the details of the HR.EMPLOYEESloyee belongs to newyork with grade 3 to 5 except ‘PRESIDENT’ whose SALARY> the highest paid HR.EMPLOYEESloyee of Chicago in a group where there is manager and salesman not working under king
-- This doesn't seem to be the right answer
# SELECT * FROM HR.EMPLOYEES e
#   WHERE e.DEPARTMENT_ID IN (
#     SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE LOC = 'NEW YORK'
#   )
#   AND e.EMPLOYEE_ID IN (
#     SELECT EMPLOYEE_ID
#     FROM HR.EMPLOYEES, SALGRADE
#     WHERE SALARY BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
#     AND SALGRADE.GRADE IN (3,4,5)
#     AND JOB_ID <> 'PRESIDENT'
#   )
#   AND e.SALARY > (
#     SELECT MAX(SALARY) FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN (
#       SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE LOC = 'CHICAGO'
#     )
#   );



-- 68. List the details of the senior HR.EMPLOYEESloyee belongs to 1981.
SELECT *
FROM HR.EMPLOYEES WHERE HIRE_DATE IN (
  SELECT MIN(HIRE_DATE) FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1981
);


-- 69. List the HR.EMPLOYEESloyees who joined in 1981 with the job same as the most senior person of the year 1981.
SELECT *
FROM HR.EMPLOYEES
WHERE JOB_ID IN (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE HIRE_DATE = (
    SELECT MIN(HIRE_DATE) FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1981
  )
)
AND EXTRACT (YEAR FROM HIRE_DATE) = 1981;


-- 70. List the most senior HR.EMPLOYEESl working under the king and grade is more  than 3.
-- I dont know if this is better or the next one. Somebody needs to explain me the query plan
SELECT * FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE > 3
AND e.HIRE_DATE IN (
  SELECT MIN(HIRE_DATE)
  FROM HR.EMPLOYEES WHERE MGR = (
    SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
  )
)
AND e.MGR = (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
);


-- Using co-related subquery
SELECT * FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE > 3
AND e.MGR = (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
)
AND e.HIRE_DATE IN (
  SELECT MIN(HIRE_DATE)
  FROM HR.EMPLOYEES WHERE MGR = e.MGR
);

-- 71. Find the total SALARY given to the MGR.
SELECT SUM(SALARY) FROM HR.EMPLOYEES WHERE JOB_ID = 'MANAGER';


-- 72. Find the total annual SALARY to distribute job wise in the year 81.
SELECT SUM(SALARY * 12) AS ANNUAL_SALARY, JOB_ID
FROM HR.EMPLOYEES
WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1981
GROUP BY JOB_ID;

-- 73. Display total SALARY of the HR.EMPLOYEESloyees belonging to grade 3.
SELECT SUM(e.SALARY), s.GRADE
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND s.GRADE = 3
GROUP BY s.GRADE;

-- ALTERNATE ANSWER
SELECT sum(SALARY)
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN (
  SELECT EMPLOYEE_ID
  FROM HR.EMPLOYEES e, SALGRADE s
  WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
        AND s.GRADE = 3
);

-- 74. Display the average salaries of all the clerks.
SELECT AVG(SALARY) FROM HR.EMPLOYEES WHERE JOB_ID = 'CLERK';

-- 75. List the HR.EMPLOYEESloyees in HR.DEPARTMENTS 20 whose SALARY is > than the average SALARY 0f HR.DEPARTMENTS 10 HR.EMPLOYEESs.
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 20
AND SALARY > (
  SELECT AVG(SALARY) FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 10
);

-- 76. Display the number of HR.EMPLOYEESloyee  for each job group deptno wise.
SELECT COUNT(EMPLOYEE_ID) as NO_OF_HR.EMPLOYEES, JOB_ID, DEPARTMENT_ID
FROM HR.EMPLOYEES
GROUP BY JOB_ID, DEPARTMENT_ID;

-- 77. List the manager no and the number of HR.EMPLOYEESloyees working for those mgrs in the ascending Mgrno.
-- First we need to figure out who works for whom. So we need 2 HR.EMPLOYEES tables where MGR of one
-- table matches the EMPLOYEE_ID of the other table. That gives us the relationship.
SELECT
E1.LAST_NAME as HR.EMPLOYEESLOYEE, E2.LAST_NAME as MANAGER, E2.EMPLOYEE_ID
FROM HR.EMPLOYEES E1, HR.EMPLOYEES E2
WHERE E1.MGR = E2.EMPLOYEE_ID;
-- now it's a question of getting count of E1.LAST_NAME group by E2.LAST_NAME. Thus the following
-- query hopefully gives the answer to the question
SELECT count(HR.EMPLOYEESloyee.EMPLOYEE_ID) as COUNT, manager.EMPLOYEE_ID as MGR
FROM HR.EMPLOYEES HR.EMPLOYEESloyee, HR.EMPLOYEES manager
WHERE HR.EMPLOYEESloyee.MGR = manager.EMPLOYEE_ID
GROUP BY manager.EMPLOYEE_ID
ORDER BY manager.EMPLOYEE_ID;

-- 78. List the department,details where at least two HR.EMPLOYEESs are working
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID), HR.EMPLOYEES.*
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID) > 2;

-- 79. Display the Grade, Number of HR.EMPLOYEESs, and max SALARY of each grade.
SELECT s.GRADE, count(EMPLOYEE_ID) AS COUNT, max(SALARY) as MAX_SAL
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
GROUP BY s.GRADE;

-- 80. Display dname, grade, No. of HR.EMPLOYEESs where at least two HR.EMPLOYEESs are clerks.
SELECT d.DNAME, s.GRADE, COUNT(e.EMPLOYEE_ID)
FROM HR.EMPLOYEES e, SALGRADE s, HR.DEPARTMENTS d
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.JOB_ID = 'CLERK'
GROUP BY d.DNAME, s.GRADE
HAVING count(e.EMPLOYEE_ID) >= 2;

-- 81. List the details of the department where maximum number of HR.EMPLOYEESs are working.
SELECT * FROM HR.DEPARTMENTS                -- Get the details of the HR.DEPARTMENTS depends on deptno
WHERE deptno IN (
  SELECT deptno
  FROM HR.EMPLOYEES GROUP BY deptno
  HAVING count(EMPLOYEE_ID) = (                 -- Get the deptno where count matches the max
    SELECT max(A.HR.EMPLOYEES_count)                   -- Get the max among them
    FROM (                                       -- Get the count of HR.EMPLOYEES per HR.DEPARTMENTS
      SELECT count(EMPLOYEE_ID) AS HR.EMPLOYEES_count
      FROM HR.EMPLOYEES
      GROUP BY deptno
    ) A
  )
);

-- 82. Display the HR.EMPLOYEESs whose manager name is jones.
SELECT * FROM HR.EMPLOYEES
WHERE MGR IN (
    SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'JONES'
);

-- 83. List the HR.EMPLOYEESloyees whose salary is more than 3000 after giving 20% increment.
SELECT * FROM HR.EMPLOYEES
WHERE SALARY * 1.2 > 3000;


-- 84. List the HR.EMPLOYEESs with HR.DEPARTMENTS names.
SELECT e.LAST_NAME, d.DNAME
FROM HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- 85. List the HR.EMPLOYEESs who are not working in sales HR.DEPARTMENTS.
SELECT e.LAST_NAME, d.DNAME
FROM HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.DNAME <> 'SALES';
-- OR
SELECT LAST_NAME FROM HR.EMPLOYEES WHERE DEPARTMENT_ID NOT IN (
  SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE DNAME = 'SALES'
);

-- 86. List the HR.EMPLOYEESs name ,HR.DEPARTMENTS, SALARY and COMMISSION_PCT. For those whose salary is between 2000 and 5000 while loc is Chicago.
SELECT e.LAST_NAME, d.DNAME, e.SALARY, e.COMMISSION_PCT
FROM HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY BETWEEN 2000 AND 5000
AND d.LOC = 'CHICAGO';
-- OR
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN (
  SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE LOC = 'CHICAGO'
)
AND SALARY BETWEEN 2000 AND 5000;


-- 87. List the HR.EMPLOYEESs whose SALARY is greater than his managers salary
SELECT
  e.LAST_NAME AS HR.EMPLOYEESloyee,
  e.SALARY   AS HR.EMPLOYEES_sal,
  m.LAST_NAME AS manager,
  m.SALARY   AS manager_sal
FROM HR.EMPLOYEES e
  INNER JOIN HR.EMPLOYEES m ON e.MGR = m.EMPLOYEE_ID
WHERE e.SALARY >= m.SALARY;

-- 88. List the grade, HR.EMPLOYEES name for the deptno 10 or deptno 30 but SALARY grade is not 4 while they joined the company before ’31-dec-82’.
SELECT s.GRADE, e.LAST_NAME, e.DEPARTMENT_ID, e.HIRE_DATE
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.DEPARTMENT_ID IN (10, 30)
AND e.SALARY BETWEEN s.LOSAL and s.HISAL
AND s.GRADE <> 4
and e.HIRE_DATE < '1982-12-31';

-- 89. List the name ,job, dname, location for those who are working as MGRS.
SELECT e.LAST_NAME, e.JOB_ID, d.DNAME, d.LOC
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.EMPLOYEE_ID IN (
  SELECT DISTINCT MGR FROM HR.EMPLOYEES
);

-- 90. List the HR.EMPLOYEESs whose mgr name is jones and also list their manager name.
SELECT e.LAST_NAME as "HR.EMPLOYEESLOYEE", m.LAST_NAME as "MANAGER"
FROM HR.EMPLOYEES e
  INNER JOIN HR.EMPLOYEES m on e.MGR = m.EMPLOYEE_ID
WHERE m.LAST_NAME = 'JONES';

-- 91. List the name and salary of FORD if his salary is equal to hisal of his grade.
SELECT e.LAST_NAME, e.SALARY, s.HISAL
FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
AND e.SALARY = s.HISAL
-- AND e.LAST_NAME = 'FORD ' -- I think this condition is not required, as there is another HR.EMPLOYEESloyee
-- who matches the condition

-- 92. List the name, job, dname ,SALARY, grade order HR.DEPARTMENTS wise
SELECT e.LAST_NAME, e.JOB_ID, d.DNAME, e.SALARY, s.GRADE
FROM HR.EMPLOYEES e, SALGRADE s, HR.DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.SALARY BETWEEN s.LOSAL AND s.HISAL
ORDER BY e.DEPARTMENT_ID DESC;

-- 93. List the HR.EMPLOYEES name, job, SALARY, grade and dname except clerks and sort on the basis of highest SALARY.
SELECT e.LAST_NAME, e.JOB_ID, e.SALARY, s.GRADE, d.DNAME
FROM SALGRADE s, HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
ORDER BY e.SALARY DESC;

-- 94. List the HR.EMPLOYEESs name, job  who are with out manager.
SELECT LAST_NAME FROM HR.EMPLOYEES where MGR is null;

-- 94.2 List the manager who does not have any HR.EMPLOYEESloyees below him
SELECT m.LAST_NAME, m.EMPLOYEE_ID
FROM HR.EMPLOYEES m LEFT JOIN HR.EMPLOYEES e on m.EMPLOYEE_ID = e.MGR
WHERE e.EMPLOYEE_ID is null;


-- 95. List the names of the HR.EMPLOYEESs who are getting the highest SALARY HR.DEPARTMENTS wise.
SELECT e.LAST_NAME, d.DNAME, e.SALARY
FROM HR.EMPLOYEES e
  INNER JOIN HR.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY IN (
  SELECT MAX(SALARY)
  FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
);

-- 96. List the HR.EMPLOYEESs whose SALARY is equal to the average of max and minimum SALARY
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT (MAX(SALARY) + MIN(SALARY))/2 FROM HR.EMPLOYEES
);


-- 96.2 List the HR.EMPLOYEESs whose SALARY is equal to the average SALARY or minimum SALARY
SELECT * FROM HR.EMPLOYEES
WHERE SALARY IN (
  SELECT AVG(SALARY) FROM HR.EMPLOYEES
)
OR SALARY IN (
  SELECT MIN(SALARY) FROM HR.EMPLOYEES
);

-- 97. List the no. of HR.EMPLOYEESs in each department where the no. is more than 3
SELECT DEPARTMENT_ID, count(EMPLOYEE_ID) as NUM_OF_HR.EMPLOYEES
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING count(EMPLOYEE_ID) > 3;

-- 98. List the names of depts. Where at least 3 HR.EMPLOYEESs are working in that department.
SELECT d.DNAME
FROM HR.DEPARTMENTS d WHERE d.DEPARTMENT_ID IN (
  SELECT DEPARTMENT_ID
  FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
  HAVING COUNT(EMPLOYEE_ID) >= 3
);

-- OR
SELECT d.DNAME, count(d.DNAME)
FROM HR.DEPARTMENTS d
  INNER JOIN HR.EMPLOYEES e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID
HAVING COUNT(e.EMPLOYEE_ID) >= 3;


-- 99. List the managers whose SALARY is more than his HR.EMPLOYEESloyees avg salary.
SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN (
  SELECT DISTINCT MGR
  FROM HR.EMPLOYEES
)
AND SALARY > (
  SELECT AVG(e.SALARY)
  FROM HR.EMPLOYEES e, HR.EMPLOYEES m
    WHERE e.MGR = m.EMPLOYEE_ID
);

-- OR
-- Why is this query not giving the correct result??
SELECT *
FROM HR.EMPLOYEES e INNER JOIN HR.EMPLOYEES m ON m.EMPLOYEE_ID = e.EMPLOYEE_ID -- this gets all managers
WHERE m.SALARY > (
  SELECT AVG(SALARY) FROM HR.EMPLOYEES WHERE MGR = m.MGR
);


-- OR
SELECT (avg(e.SALARY)), m.Last Name
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.mgr = m.HR.EMPLOYEESno
GROUP BY e.mgr, m.Last Name;

-- 100. List the name,salary,COMMISSION_PCT. for those HR.EMPLOYEESloyees whose net pay is greater than or equal to any other HR.EMPLOYEESloyee salary of the company.
-- Didn't know how to solve this... so google helped. ANY() means any of "these values".
SELECT e.LAST_NAME, e.SALARY, e.COMMISSION_PCT
FROM HR.EMPLOYEES e
WHERE (e.SALARY + e.COMMISSION_PCT) >= ANY (
  SELECT SALARY FROM HR.EMPLOYEES
);

-- 101. List the HR.EMPLOYEES whose SALARY is less than his manager but more than any other manager.
SELECT e.LAST_NAME as HR.EMPLOYEES_NAME, e.SALARY, m.LAST_NAME as MANAGER, m.SALARY
FROM HR.EMPLOYEES e
  INNER JOIN HR.EMPLOYEES m on e.MGR = m.EMPLOYEE_ID
WHERE e.SALARY < m.SALARY
and e.SALARY > ANY (
  SELECT SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID IN (
    SELECT DISTINCT MGR FROM HR.EMPLOYEES
  )
);

-- 102. List the HR.EMPLOYEESloyee names and his average salary department wise.
-- I dont understand this query or the question
SELECT e.LAST_NAME, e.DEPARTMENT_ID, AVG_SAL
FROM HR.EMPLOYEES e, (
  SELECT AVG(SALARY)as AVG_SAL, DEPARTMENT_ID
  FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
) A, HR.DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND A.DEPARTMENT_ID = e.DEPARTMENT_ID;


-- 103. Find out least 5 earners of the company.
-- Couldn't get this as well
SELECT * FROM HR.EMPLOYEES e WHERE 5 > (
  SELECT count(1)
  FROM HR.EMPLOYEES
  WHERE e.SALARY > SALARY
);

-- 104. Find out HR.EMPLOYEESs whose salaries are greater than salaries of their managers.
SELECT e.LAST_NAME as HR.EMPLOYEES_NAME, e.SALARY as HR.EMPLOYEES_SAL, m.LAST_NAME as MGR_NAME, m.SALARY as MGR_SAL
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.MGR = m.EMPLOYEE_ID
AND e.SALARY > m.SALARY;

-- 105. List the managers who are not working under the president.
SELECT e.LAST_NAME, m.LAST_NAME, m.JOB_ID
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.MGR = m.EMPLOYEE_ID
AND e.EMPLOYEE_ID IN (
  SELECT DISTINCT MGR FROM HR.EMPLOYEES
)
AND m.JOB_ID <> 'PRESIDENT';

-- OR
SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN (
  SELECT MGR
  FROM HR.EMPLOYEES
)
AND MGR NOT IN (
  SELECT EMPLOYEE_ID
  FROM HR.EMPLOYEES
  WHERE JOB_ID = 'PRESIDENT'
);

-- 106. List the records from HR.EMPLOYEES whose deptno is not in HR.DEPARTMENTS table.
-- had to run this insert statement for the data to appear:
-- INSERT INTO HR.EMPLOYEES VALUES ('7728', 'STEVE', 'SALESMAN', '7839', '1981-05-01', '2770.00', NULL, '60');
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID NOT IN (
  SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS
);

-- There is a HR.DEPARTMENTS which is not present in the HR.EMPLOYEES table but not vice-versa. HEnce the insert needed
SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_ID NOT IN (
  SELECT DISTINCT DEPARTMENT_ID FROM HR.EMPLOYEES
);


-- 107. List the Name , Salary, COMMISSION_PCT and Net Pay of an HR.EMPLOYEESloyee which is more than any other HR.EMPLOYEESloyee.
-- Quite frankly i dont understand the intent/question. So this answer could be wrong or the question could be meaningless
SELECT e.LAST_NAME, e.SALARY, e.COMMISSION_PCT, e.SALARY + e.COMMISSION_PCT as NET_PAY
FROM HR.EMPLOYEES e WHERE SALARY > ANY (
  SELECT SALARY FROM HR.EMPLOYEES
);

-- 108. List the Enames who are retiring after 31-Dec-89 (the max Job period is 20Y).
-- Need to verify the answer.
SELECT LAST_NAME, HIRE_DATE, DATEDIFF('1989-12-31',HIRE_DATE)/(12 * 30) EXP_AT_1989
FROM HR.EMPLOYEES
-- WHERE DATEDIFF('1989-12-31',HIRE_DATE)/(12 * 30) > 20;
WHERE date_add(HIRE_DATE, INTERVAL 20 YEAR) > '1989';


-- 109. List those HR.EMPLOYEESs whose Salary is odd value.
SELECT * FROM HR.EMPLOYEES WHERE SALARY % 2 = 1;

-- 110. List the HR.EMPLOYEES’s whose Salary contain 3 digits.
SELECT * FROM HR.EMPLOYEES WHERE SALARY >= 100 AND SALARY < 1000;

-- 111. List the HR.EMPLOYEESs who joined in the month of DEC.
SELECT * FROM HR.EMPLOYEES WHERE MONTH(HIRE_DATE) = 12;

-- 112. List the HR.EMPLOYEESs whose names contains ‘A’.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%A%';

-- 113. List the HR.EMPLOYEESs whose Deptno is available in his Salary.
SELECT CONVERT(SALARY, CHAR),CONCAT('%',DEPARTMENT_ID,'%')
FROM HR.EMPLOYEES
WHERE CONVERT(SALARY, CHAR) LIKE CONCAT('%',DEPARTMENT_ID,'%');

-- 114. List the HR.EMPLOYEESs whose first 2 chars from Hiredate = last 2 characters of Salary.
SELECT LAST_NAME, HIRE_DATE, SALARY
--  , SUBSTR(HIRE_DATE, 1, 2)
--  , SUBSTR(CONVERT(SALARY,INT), LENGTH(SALARY)-4 , LENGTH(SALARY) - 2)
FROM HR.EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 1, 2) = SUBSTR(CONVERT(SALARY,INT), LENGTH(SALARY)-4 , LENGTH(SALARY) - 2);

-- 115. List the HR.EMPLOYEESs Whose 10% of Salary is equal to year of joining.
SELECT LAST_NAME, SALARY, CONVERT(SALARY * 0.1,INT), EXTRACT (YEAR FROM HIRE_DATE)
FROM HR.EMPLOYEES
WHERE CONVERT(SALARY*0.1,INT) = EXTRACT (YEAR FROM HIRE_DATE)
OR CONVERT(SALARY * 0.1, INT) = SUBSTR(EXTRACT (YEAR FROM HIRE_DATE),3,4);

-- 116. List first 50% of chars of Last Name in Lower Case and remaining are upper Case.
SELECT CONCAT(LOWER(SUBSTR(LAST_NAME, 1, LENGTH(LAST_NAME)/2)), UPPER(SUBSTR(LAST_NAME, LENGTH(LAST_NAME)/2+1, LENGTH(LAST_NAME)))) as HR.EMPLOYEES_NAME
FROM HR.EMPLOYEES;

-- 117. List the Dname whose No. of HR.EMPLOYEESs is = to number of chars in the Dname.
SELECT DNAME, LENGTH(DNAME)
FROM HR.DEPARTMENTS
WHERE LENGTH(DNAME) IN (
  SELECT COUNT(LAST_NAME)
  FROM HR.EMPLOYEES
  GROUP BY HR.EMPLOYEES.DEPARTMENT_ID
);

-- 118. List the HR.EMPLOYEESs those who joined in company before 15th of the month.
SELECT LAST_NAME, HIRE_DATE, DAY(HIRE_DATE)
FROM HR.EMPLOYEES
WHERE DAY(HIRE_DATE) < 15;

-- 119. List the Dname, no of chars of the HR.DEPARTMENTS which is = no. of HR.EMPLOYEES’s in any other HR.DEPARTMENTS.
SELECT d.DNAME, LENGTH(d.DNAME), e.LAST_NAME, e.DEPARTMENT_ID, d.LOC
FROM HR.DEPARTMENTS d INNER JOIN HR.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE LENGTH(d.DNAME) IN (
  SELECT LENGTH(LAST_NAME) FROM HR.EMPLOYEES
);

-- 120. List the HR.EMPLOYEESs who are working as Managers.
SELECT LAST_NAME, JOB_ID
FROM HR.EMPLOYEES WHERE EMPLOYEE_ID IN (
  SELECT DISTINCT MGR FROM HR.EMPLOYEES
);

-- 121. List THE Name of HR.DEPARTMENTS where highest no.of HR.EMPLOYEESs are working.
SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_ID = (
  SELECT DEPARTMENT_ID
  FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
  HAVING COUNT(EMPLOYEE_ID) = (
    SELECT MAX(HR.EMPLOYEESLOYEES) FROM (
      SELECT COUNT(EMPLOYEE_ID) as HR.EMPLOYEESLOYEES
      FROM HR.EMPLOYEES
      GROUP BY DEPARTMENT_ID
    ) A
  )
);

-- 122.Count the No.of HR.EMPLOYEESs who are working as ‘Managers’
SELECT COUNT(DISTINCT MGR) FROM HR.EMPLOYEES;

-- 123. List the HR.EMPLOYEESs who joined in the company on the same date.
SELECT * FROM HR.EMPLOYEES e1
WHERE e1.HIRE_DATE IN (
  SELECT HIRE_DATE FROM HR.EMPLOYEES e2
  WHERE e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID
);

-- 124. List the details of the HR.EMPLOYEESs whose Grade is equal to one tenth of Sales HR.DEPARTMENTS.
SELECT * FROM HR.EMPLOYEES e, SALGRADE s
WHERE e.SALARY BETWEEN s.LOSAL and s.HISAL
AND s.GRADE = 0.1 * (
  SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE DNAME = 'SALES'
);

-- 125. List the name of the HR.DEPARTMENTS where more than average no. of HR.EMPLOYEESs are working.
SELECT * FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID IN (
  SELECT DEPARTMENT_ID -- , COUNT(EMPLOYEE_ID)
  FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
  HAVING COUNT(EMPLOYEE_ID) > (
    SELECT AVG(HR.EMPLOYEESLOYEE_COUNT) AS AVG_HR.EMPLOYEES_COUNT
    FROM (
      SELECT COUNT(EMPLOYEE_ID) AS HR.EMPLOYEESLOYEE_COUNT
      FROM HR.EMPLOYEES
      GROUP BY DEPARTMENT_ID
    ) A
  )
);

-- 126. List the Managers name who is having max no.of HR.EMPLOYEESs working under him.
SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = (
  SELECT MGR
  FROM HR.EMPLOYEES
  GROUP BY MGR
  HAVING COUNT(EMPLOYEE_ID) = (
    SELECT MAX(HR.EMPLOYEES_COUNT)
    FROM (
      SELECT COUNT(EMPLOYEE_ID)AS HR.EMPLOYEES_COUNT
      FROM HR.EMPLOYEES
      GROUP BY MGR
    ) A
  )
);

-- 127. List the Last Name and SALARY is increased by 15% and expressed as no.of Dollars.
SELECT LAST_NAME, SALARY, CONCAT('$',SALARY * 1.15) AS RAISE_BY_15PCT FROM HR.EMPLOYEES;


-- 128. Produce the output of HR.EMPLOYEES table ‘HR.EMPLOYEES_AND_JOB_ID’ for Last Name and Job.
SELECT CONCAT(LAST_NAME, ' ', JOB_ID) AS HR.EMPLOYEES_AND_JOB_ID FROM HR.EMPLOYEES;

-- 129.Produce the following output from HR.EMPLOYEES.
--        HR.EMPLOYEESLOYEE
--			SMITH (clerk)
--			ALLEN (Salesman)
SELECT CONCAT(LAST_NAME, ' (', LOWER(JOB_ID) , ')') AS HR.EMPLOYEESLOYEE FROM HR.EMPLOYEES;

-- 130. List the HR.EMPLOYEESs with Hire date in format June 4, 1988.
SELECT LAST_NAME, DATE_FORMAT(HIRE_DATE, '%M %d, %Y') FROM HR.EMPLOYEES;

-- 131. Print a list of HR.EMPLOYEES’s Listing ‘just salary’ if Salary is more than 1500, on target if
-- Salary is 1500 and ‘Below 1500’ if Salary is less than 1500.
SELECT EMPLOYEE_ID, 'JUST SALARY' FROM HR.EMPLOYEES WHERE SALARY > 1500
UNION
SELECT EMPLOYEE_ID, 'ON TARGET' FROM HR.EMPLOYEES WHERE SALARY = 1500
UNION
SELECT EMPLOYEE_ID, 'BELOW 1500' FROM HR.EMPLOYEES WHERE SALARY < 1500;

-- OR by using a case statement
SELECT EMPLOYEE_ID, (
  CASE
    WHEN (SALARY < 1500) THEN 'BELOW 1500'
    WHEN (SALARY = 1500) THEN 'ON TARGET'
    WHEN (SALARY > 1500) THEN 'JUST SALARY'
  END
)
FROM HR.EMPLOYEES
ORDER BY SALARY DESC;

-- 132. Write a query which return the day of the week for any date entered in format ‘DD-MM-YY’.
-- SELECT LAST_NAME, DATE_FORMAT(HIRE_DATE, '%d-%m-%y') FROM HR.EMPLOYEES;
SELECT HIRE_DATE, DAYOFWEEK(HIRE_DATE) AS DAY_WEEK, DAYOFMONTH(HIRE_DATE) AS DAY_MTH
FROM HR.EMPLOYEES WHERE DATE_FORMAT(HIRE_DATE, '%d-%m-%y') = '12-01-83';

-- 133. Write a query to calculate the length of service of any HR.EMPLOYEESloyee with the company, use
-- DEFINE to avoid repetitive typing of functions.
-- Dont know how to solve this in MySQL
SELECT EMPLOYEE_ID, DATEDIFF(NOW(), HIRE_DATE)/(12 * 30) AS SVC_LEN_YRS FROM HR.EMPLOYEES;

-- 134. Give a string of format ‘NN/NN’, verify that the first and last two characters are numbers
-- and that the middle character is’/’. Print the expression ‘YES’ if valid, ‘NO’ if not valid.
-- Use the following values to test your solution. ‘12/34’,’01/1a’, ‘99/98’.
SELECT '12/34' REGEXP '^(dd\/dd)$';

-- 135. HR.EMPLOYEESs hired on or before 15th of any month are paid on the last Friday of that month
-- those hired after 15th are paid on the first Friday of the following month. Print a list of HR.EMPLOYEESs
-- their hire date and the first pay date. Sort on hire date.

-- Googled for last day of the month. Got it here: https://stackoverflow.com/questions/5268030/last-friday-of-the-month-in-mysql?rq=1
-- SELECT DATE_FORMAT(LAST_DAY(NOW()) - ((7 + WEEKDAY(LAST_DAY(NOW())) - 4) % 7), '%Y-%m-%d') AS Last_Friday

SELECT LAST_NAME, HIRE_DATE, DATE_FORMAT(LAST_DAY(HIRE_DATE) - ((7 + WEEKDAY(LAST_DAY(HIRE_DATE)) - 4) % 7), '%Y-%m-%d') AS PAYDAY
FROM HR.EMPLOYEES
WHERE DAYOFMONTH(HIRE_DATE) <= 15;
-- can't solve this one.

-- 136. Count the no. of characters with out considering spaces for each name.
SELECT LENGTH(REPLACE(LAST_NAME,' ', null)) FROM HR.EMPLOYEES;

-- 137. Find out the HR.EMPLOYEESs who are getting decimal value in their SALARY without using like operator.
SELECT * FROM HR.EMPLOYEES WHERE INSTR(SALARY,'.') > 0;

-- 138. List those HR.EMPLOYEESs whose Salary contains first four digit of their Deptno.
-- Need to verify! The question seems to be wrong.
SELECT * FROM HR.EMPLOYEES e1 WHERE SALARY = (
  SELECT CONCAT(DEPARTMENT_ID, DEPARTMENT_ID) FROM HR.EMPLOYEES e2 WHERE e1.EMPLOYEE_ID = e2.EMPLOYEE_ID
);

-- 139. List those Managers who are getting less than his HR.EMPLOYEESs Salary.
SELECT e.LAST_NAME subordinate, e.SALARY sub_sal, m.LAST_NAME manager, m.SALARY man_sal
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.MGR = m.EMPLOYEE_ID
AND e.SALARY > m.SALARY;

-- 140. Print the details of all the HR.EMPLOYEESs who are sub-ordinates to Blake.
SELECT * FROM HR.EMPLOYEES
WHERE mgr = (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE'
)

-- 141. List the HR.EMPLOYEESs who are working as Managers using co-related sub-query.
SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID in (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE JOB_ID = 'MANAGER'
);

SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID IN ( SELECT MGR FROM HR.EMPLOYEES);

-- 142. List the HR.EMPLOYEESs whose Mgr name is ‘Jones’ and also with his Manager name.
SELECT LAST_NAME as HR.EMPLOYEESLOYEE, 'JONES' as MANAGER
FROM HR.EMPLOYEES WHERE MGR = (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'JONES'
)
UNION
SELECT 'JONES' as HR.EMPLOYEESloyee, LAST_NAME
FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = (
  SELECT MGR FROM HR.EMPLOYEES WHERE LAST_NAME = 'JONES'
);


SELECT e.Last Name,w.Last Name,m.Last Name 
FROM HR.EMPLOYEES e,HR.EMPLOYEES w,HR.EMPLOYEES m 
WHERE e.mgr = w.HR.EMPLOYEESno 
AND w.Last Name = 'JONES'
AND w.mgr = m.HR.EMPLOYEESno;


-- 143. Define a variable representing the expression used to calculate on HR.EMPLOYEESs total annual remuneration use the variable 
-- in a statement, which finds all HR.EMPLOYEESs who can earn 30000 a year or more.
-- Dont know how to do this.
SELECT SALARY * 12 + IFNULL(COMMISSION_PCT, 0) INTO @TOTAL_REMUNERATION FROM HR.EMPLOYEES WHERE SALARY * 12 > 30000

SELECT @TOTAL_REMUNERATION



-- 144. Find out how may Managers are their in the company.
SELECT COUNT(1) FROM HR.EMPLOYEES WHERE JOB_ID = 'MANAGER';

-- 145. Find Average salary and Average total remuneration for each Job type. Remember Salesman earn commission.secommm
SELECT AVG(SALARY), AVG(SALARY + IFNULL(COMMISSION_PCT,0)), JOB_ID
FROM HR.EMPLOYEES
GROUP BY JOB_ID;

-- 146. Check whether all the HR.EMPLOYEESs numbers are indeed unique.
SELECT COUNT(EMPLOYEE_ID) FROM HR.EMPLOYEES GROUP BY EMPLOYEE_ID HAVING COUNT(EMPLOYEE_ID) > 1;

-- 147. List the HR.EMPLOYEESs who are drawing less than 1000 Sort the output by Salary.
SELECT * FROM HR.EMPLOYEES WHERE SALARY < 1000 order by SALARY DESC;

-- 148. List the HR.EMPLOYEESloyee Name, Job, Annual Salary, deptno, HR.DEPARTMENTS name and grade who earn 36000 a year or who are not CLERKS.
SELECT e.LAST_NAME, e.JOB_ID, e.SALARY * 12, e.DEPARTMENT_ID, d.DNAME
FROM HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY * 12  = 36000
OR e.JOB_ID = 'CLERK';

-- 149. Find out the Job that was filled in the first half of 1983 and same job that was filled during the same period of 1984.
-- I changed the HIRE_DATE of ADAMS to 1984-01-03 to get result for the query
SELECT e.JOB_ID, e.HIRE_DATE
FROM HR.EMPLOYEES e
WHERE e.HIRE_DATE BETWEEN '1984-01-01' AND '1984-07-01'
AND JOB_ID IN (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE HIRE_DATE BETWEEN '1984-01-01' AND '1984-07-01'
)
ORDER BY e.HIRE_DATE ASC;

SELECT e.JOB_ID, e.HIRE_DATE
FROM HR.EMPLOYEES e
WHERE MONTH(e.HIRE_DATE) <= 06
AND YEAR(e.HIRE_DATE) = 1984
AND e.JOB_ID IN (
  SELECT JOB_ID FROM HR.EMPLOYEES
  WHERE MONTH(HIRE_DATE) <= 06
  AND EXTRACT (YEAR FROM HIRE_DATE) <= 1983
);

-- 150. Find out the HR.EMPLOYEESs who joined in the company before their Managers.
SELECT e.LAST_NAME, e.HIRE_DATE, e.JOB_ID as HR.EMPLOYEESLOYEE, m.JOB_ID as MANAGER, m.LAST_NAME, m.HIRE_DATE
FROM HR.EMPLOYEES e, HR.EMPLOYEES m
WHERE e.MGR = m.EMPLOYEE_ID
--  AND m.JOB_ID = 'MANAGER'
AND e.HIRE_DATE < m.HIRE_DATE;


-- 151. List all the HR.EMPLOYEESs by name and number along with their Manager’s name and number. Also List KING who has no ‘Manager’.
SELECT e.EMPLOYEE_ID as HR.EMPLOYEESLOYEE_NUMBER
  , e.LAST_NAME as HR.EMPLOYEESLOYEE_NAME
  , m.LAST_NAME as MANAGER_NAME
  , m.EMPLOYEE_ID as MANAGER_NUMBER
FROM HR.EMPLOYEES e
  LEFT JOIN HR.EMPLOYEES m ON e.MGR = m.EMPLOYEE_ID;

-- 152. Find all the HR.EMPLOYEESs who earn the minimum Salary for each job wise in ascending order
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT MIN(SALARY) FROM HR.EMPLOYEES GROUP BY JOB_ID
);

-- 153. Find out all the HR.EMPLOYEESs who earn highest salary in each job type. Sort in descending salary order.
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES GROUP BY JOB_ID
)
ORDER BY SALARY DESC;

-- 154. Find out the most recently hired HR.EMPLOYEESs in each HR.DEPARTMENTS order by Hiredate.
SELECT * FROM HR.EMPLOYEES e WHERE HIRE_DATE IN (
  SELECT MAX(HIRE_DATE) FROM HR.EMPLOYEES e1 where e1.DEPARTMENT_ID = e.DEPARTMENT_ID
)
ORDER BY HIRE_DATE ASC;

-- 155. List the HR.EMPLOYEESloyee name,Salary and Deptno for each HR.EMPLOYEESloyee who earns a salary greater than the average for their department order by Deptno.
SELECT e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID
FROM HR.EMPLOYEES e, (SELECT AVG(SALARY) as AVG_SAL, DEPARTMENT_ID FROM HR.EMPLOYEES GROUP BY DEPARTMENT_ID) A
WHERE e.DEPARTMENT_ID = A.DEPARTMENT_ID
  AND e.SALARY > A.AVG_SAL
ORDER BY e.SALARY ASC;

SELECT e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID
FROM HR.EMPLOYEES e WHERE e.SALARY > (
  SELECT AVG(SALARY) FROM HR.EMPLOYEES WHERE e.DEPARTMENT_ID = DEPARTMENT_ID
)
ORDER BY e.SALARY ASC;

-- 156. List the Deptno where there are no HR.EMPLOYEESs.
SELECT * FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID NOT IN (
  SELECT DISTINCT DEPARTMENT_ID FROM HR.EMPLOYEES
);

SELECT * FROM HR.DEPARTMENTS d LEFT JOIN HR.EMPLOYEES e on d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE e.DEPARTMENT_ID is NULL;

SELECT * FROM HR.EMPLOYEES e RIGHT JOIN HR.DEPARTMENTS d on d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE e.DEPARTMENT_ID is NULL;


-- 157. List the No.of HR.EMPLOYEES’s and Avg salary within each department for each job.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(EMPLOYEE_ID), AVG(SALARY) FROM HR.EMPLOYEES GROUP BY DEPARTMENT_ID, JOB_ID;

-- 158. Find the maximum average salary drawn for each job except for ‘President’.
SELECT MAX(AVG_SAL), JOB_ID FROM (
  SELECT AVG(SALARY) AS AVG_SAL, JOB_ID FROM HR.EMPLOYEES WHERE JOB_ID <> 'PRESIDENT' GROUP BY JOB_ID
) A;

-- 159. Find the name and Job of the HR.EMPLOYEESs who earn Max salary and Commission.
-- Need to verify this
SELECT e.LAST_NAME, e.JOB_ID FROM HR.EMPLOYEES e WHERE SALARY + IFNULL(COMMISSION_PCT, 0) IN (
  SELECT MAX(SALARY + IFNULL(COMMISSION_PCT, 0)) FROM HR.EMPLOYEES
);

-- 160. List the Name, Job and Salary of the HR.EMPLOYEESs who are not belonging to the department 10 but who have the same job and Salary as the HR.EMPLOYEESs of HR.DEPARTMENTS 10.
-- The query produced zero rows because i didn't have the matching data. so I added the record of 'DAVID'
-- to get at least a single match
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, SALARY
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID <> 10
AND JOB_ID IN (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 10
)
AND SALARY IN (
  SELECT SALARY FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 10
);


-- 161. List the Deptno, Name, Job, Salary and SALARY+COMMISSION_PCT of the SALESMAN who are earning maximum salary and commission in descending order.
SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.JOB_ID, e.SALARY + IFNULL(e.COMMISSION_PCT, 0)
FROM HR.EMPLOYEES e
WHERE JOB_ID = 'SALESMAN'
AND e.SALARY = (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES
  WHERE COMMISSION_PCT is not null
  GROUP BY JOB_ID
);

-- 162. List the Deptno, Name, Job, Salary and SALARY+COMMISSION_PCT of the HR.EMPLOYEESs who earn the second highest earnings (SALARY + COMMISSION_PCT.).
SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.JOB_ID, e.SALARY + IFNULL(e.COMMISSION_PCT ,0)
FROM HR.EMPLOYEES e
WHERE 2 = (
  SELECT COUNT(DISTINCT (SALARY + IFNULL(COMMISSION_PCT, 0))) FROM HR.EMPLOYEES WHERE e.SALARY + IFNULL(e.COMMISSION_PCT, 0) < SALARY + IFNULL(COMMISSION_PCT, 0)
);

-- 163. List the Deptno and their average salaries for HR.DEPARTMENTS with the average salary less than the averages for all department
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < (
  SELECT AVG(SALARY)
  FROM HR.EMPLOYEES
);

-- 164. List out the Names and Salaries of the HR.EMPLOYEESs along with their manager names and salaries for those HR.EMPLOYEESs who earn more salary than their Manager.
SELECT e.LAST_NAME, e.SALARY, m.LAST_NAME, m.SALARY
FROM HR.EMPLOYEES e INNER JOIN HR.EMPLOYEES m ON e.MGR = m.EMPLOYEE_ID
WHERE e.SALARY > m.SALARY;

-- 165. List out the Name, Job, Salary of the HR.EMPLOYEESs in the department with the highest average salary.
SELECT LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = (
  SELECT DEPARTMENT_ID FROM (
    SELECT DEPARTMENT_ID, MAX(AVG_SAL)
    FROM (
     SELECT AVG(SALARY) as AVG_SAL, DEPARTMENT_ID
     FROM HR.EMPLOYEES
     GROUP BY DEPARTMENT_ID
   ) A
  ) B
);

-- 166. List the HR.EMPLOYEESno,SALARY,COMMISSION_PCT. Of HR.EMPLOYEESs.
SELECT EMPLOYEE_ID, SALARY, COMMISSION_PCT FROM HR.EMPLOYEES;

-- 167. List the details of the HR.EMPLOYEESs in the ascending order of the SALARY.
SELECT * FROM HR.EMPLOYEES ORDER BY SALARY ASC;

-- 168. List the HR.DEPARTMENTS in the ascending order of the job and the desc order of the HR.EMPLOYEESs print HR.EMPLOYEESno, Last Name.
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID FROM HR.EMPLOYEES ORDER BY JOB_ID ASC, EMPLOYEE_ID DESC;

-- 169. Display the unique HR.DEPARTMENTS of the HR.EMPLOYEESs.
SELECT DISTINCT DEPARTMENT_ID FROM HR.EMPLOYEES;

-- 170. Display the unique HR.DEPARTMENTS with jobs.
-- Need to verify this. The oracle keyword is unique. the query is: SELECT UNIQUE DEPARTMENT_ID, JOB_ID FROM HR.EMPLOYEES
SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM HR.EMPLOYEES GROUP BY JOB_ID, EMPLOYEE_ID ORDER BY JOB_ID ASC

-- 171. Display the details of the blake.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE';

-- 172. List all the clerks.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID = 'CLERK';

-- 173. List all the HR.EMPLOYEESloyees joined on 1st may 81.
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE = '1981-05-01';

-- 174. List the HR.EMPLOYEESno,Last Name,SALARY,deptno of the HR.DEPARTMENTS 10 HR.EMPLOYEESs in the ascending order of salary.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 10 ORDER BY SALARY ASC;

-- 175. List the HR.EMPLOYEESs whose salaries are less than 3500.
SELECT * FROM HR.EMPLOYEES WHERE SALARY < 3500;

-- 176. List the HR.EMPLOYEESno,Last Name,SALARY of all the HR.EMPLOYEES joined before 1 apr 81.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM HR.EMPLOYEES WHERE HIRE_DATE < '1981-04-01';

-- 177. List the HR.EMPLOYEES whose annual SALARY is <25000 in the asc order of the salaries.
SELECT * FROM HR.EMPLOYEES WHERE SALARY * 12 < 25000;

-- 178. List the HR.EMPLOYEESno,Last Name,annsal,dailysal  of all the salesmen in the asc ann SALARY
SELECT EMPLOYEE_ID, LAST_NAME, SALARY * 12 AS ANNUAL_SAL, SALARY AS DAILY_SAL
FROM HR.EMPLOYEES WHERE JOB_ID = 'SALESMAN';

-- 179. List the HR.EMPLOYEESno,Last Name,hiredate,current date & exp in the ascending order of the exp.
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, CURRENT_DATE(), DATEDIFF(NOW(), HIRE_DATE)/(12*30) AS EXP
FROM HR.EMPLOYEES ORDER BY HIRE_DATE ASC;

-- 180. List the HR.EMPLOYEESs whose exp is more than 10 years.
SELECT * FROM HR.EMPLOYEES WHERE DATEDIFF(NOW(), HIRE_DATE)/(12 * 30) > 10;

-- 181. List the HR.EMPLOYEESno,Last Name,SALARY,Basic 35%, TA 30%,DA 40%,HRA 50%,GROSS,10% LIC,20% PF, 8% PT, net,deduction,net allow and net SALARY in the ascending order of the net salary.
SELECT EMPLOYEE_ID, LAST_NAME,
  SALARY
  , @gross := SALARY * 12 AS GROSS
  , ROUND(@basic := SALARY * 0.35,2) as BASIC
  , ROUND(@ta := @basic * 0.3,2) AS TA
  , ROUND(@da := @basic * 0.4,2) AS DA
  , ROUND(@hra := @basic * 0.5,2) AS HRA
  , ROUND(@lic := @basic * 0.1,2) AS LIC
  , ROUND(@pf := @basic * 0.2,2) AS PF
  , ROUND(@pt := @basic * 0.08,2) AS PT
  , ROUND(@ded := (@lic + @pt + @pf),2) AS DEDUCTIONS
  , ROUND(@net := (@gross - @ded),2) AS NET_SAL
FROM HR.EMPLOYEES
ORDER BY @net ASC;

-- 182. List the HR.EMPLOYEESs who are working as managers.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID = 'MANAGER';

-- 183. List the HR.EMPLOYEESs who are either clerks or managers.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID IN ('CLERK', 'MANAGER');

-- 184. List the HR.EMPLOYEESs who have joined on the following dates 1 may 81,17 nov 81,30 dec 81
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE IN ('1981-05-01', '1981-11-17', '1981-12-30');

-- 185. List the HR.EMPLOYEESs who have joined in the year 1981.
SELECT * FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1981;

-- 186. List the HR.EMPLOYEESs whose annual SALARY ranging from 23000 to 40000.
SELECT * FROM HR.EMPLOYEES WHERE SALARY*12 BETWEEN 23000 AND 40000;

-- 187. List the HR.EMPLOYEESs working under the mgrs 7369,7890,7654,7900.
SELECT * FROM HR.EMPLOYEES WHERE EMPLOYEE_ID IN (7369, 7890, 7654, 7900);

-- 188. List the HR.EMPLOYEESs who joined in the second half of 82.
SELECT * FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1982 AND MONTH(HIRE_DATE) > 06;

-- 189. List all the 4char HR.EMPLOYEESs.
SELECT * FROM HR.EMPLOYEES WHERE LENGTH(LAST_NAME) = 4;

-- 190. List the HR.EMPLOYEES names starting with ‘M’ with 5 chars.
SELECT * FROM HR.EMPLOYEES WHERE LENGTH(LAST_NAME) = 5 AND LAST_NAME LIKE 'M%';

-- 191. List the HR.EMPLOYEESs end with ‘H’ all together 5 chars.
SELECT * FROM HR.EMPLOYEES WHERE LENGTH(LAST_NAME) AND LAST_NAME LIKE '%H'

-- 192. List names start with ‘M’.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE 'M%';

-- 193. List the HR.EMPLOYEESs who joined in the year 81.
SELECT * FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1981;

-- 194. List the HR.EMPLOYEESs whose SALARY is ending with 00.
SELECT * FROM HR.EMPLOYEES WHERE SALARY LIKE '%00.%';

-- 195. List the HR.EMPLOYEES who joined in the month of JAN.
SELECT * FROM HR.EMPLOYEES WHERE MONTH(HIRE_DATE) = 1;

-- 196. Who joined in the month having char ‘a’.
SELECT * FROM HR.EMPLOYEES WHERE MONTHNAME(HIRE_DATE) LIKE '%A%';

-- 197. Who joined in the month having second char ‘a’
SELECT * FROM HR.EMPLOYEES WHERE MONTHNAME(HIRE_DATE) LIKE '_A%';

-- 198. List the HR.EMPLOYEESs whose salary is 4 digit number.
SELECT * FROM HR.EMPLOYEES WHERE SALARY LIKE '____.%';
-- OR
SELECT * FROM HR.EMPLOYEES WHERE LENGTH(SALARY) = 7;

-- 199. List the HR.EMPLOYEES who joined in 80’s.
SELECT * FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) = 1980;

-- 200. List the HR.EMPLOYEES who are clerks who have exp more than 8ys.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME = 'CLERK' AND DATEDIFF(NOW(), HIRE_DATE)/(12 * 30) > 8;

-- 201. List the mgrs of HR.DEPARTMENTS 10 or 20.
SELECT MGR FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN (10, 20);

-- 202. List the HR.EMPLOYEESs joined in jan with salary ranging from 1500 to 4000.
SELECT * FROM HR.EMPLOYEES WHERE MONTHNAME(HIRE_DATE) = 'JAN' AND SALARY BETWEEN 1500 AND 4000;

-- 203. List the unique jobs of HR.DEPARTMENTS 20 and 30 in desc order.
SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN (20, 30);

-- 204. List the HR.EMPLOYEESs along with exp of those working under the mgr whose number is starting with 7 but should not have a 9, joined before 1983.
SELECT LAST_NAME, @exp := ROUND(DATEDIFF(NOW(), HIRE_DATE)/(12 * 30), 1) as EXP, MGR, HIRE_DATE
FROM HR.EMPLOYEES WHERE MGR LIKE '7%'
AND MGR <> '%9%'
AND EXTRACT (YEAR FROM HIRE_DATE) < 1983
ORDER BY @exp DESC;

-- 205. List the HR.EMPLOYEESs who are working as either mgr or analyst with the salary ranging from 2000 to 5000 and with out COMMISSION_PCT.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID IN ('MANAGER', 'ANALYST') AND SALARY BETWEEN 2000 AND 5000 AND COMMISSION_PCT IS NULL;

-- 206. List the HR.EMPLOYEESno,Last Name,SALARY,job of the HR.EMPLOYEESs with /ann SALARY <34000 but receiving some COMMISSION_PCT. Which should not be>SALARY and desg should be sales man working for HR.DEPARTMENTS 30.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID, (@annual_salary := SALARY * 12 + IFNULL(COMMISSION_PCT, 0)) as ANNUAL_SALARY
FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 30
AND JOB_ID = 'SALESMAN'
AND @annual_salary < 34000
AND IFNULL(COMMISSION_PCT, 0) < SALARY;

-- 207. List the HR.EMPLOYEESs who are working for HR.DEPARTMENTS 10 or 20 with desgs as clerk or analyst
-- with a SALARY is either 3 or 4 digits with an exp>8ys but does not belong to months of mar,apr,sep
-- and working for mgrs  & no is not ending with 88 and 56.

-- the question is not formulated the correctly. The last clause could make you believe that you need
-- to find HR.EMPLOYEESs who are working for manager and their HR.EMPLOYEESno's should not end with 88 and 56. However
-- what it means find HR.EMPLOYEESs whose manager's number should not end with 88 or 56

SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20)
AND JOB_ID IN ('CLERK', 'ANALYST')
AND LENGTH(SALARY) IN (6,7)
AND DATEDIFF(NOW(), HIRE_DATE)/(12 * 30) > 8
AND MONTHNAME(HIRE_DATE) NOT IN ('MAR', 'APR', 'SEP')
AND (MGR NOT LIKE '%88' OR MGR NOT LIKE '%56');


-- 208. List the HR.EMPLOYEESno,Last Name,SALARY,job,deptno&exp of all the HR.EMPLOYEESs belongs to HR.DEPARTMENTS 10 or 20
-- with an exp 36 to 40 y working under the same mgr without COMMISSION_PCT
-- With a job not ending irrespective of the position with COMMISSION_PCT.>200
-- with exp>=7y and SALARY<2500 but not belongs to the month sep or nov
-- working under the mgr whose no is not having digits either 9 or 0
-- in the asc HR.DEPARTMENTS& desc HR.DEPARTMENTS
-- (trouble in paradise... I didn't understand the second clause here)

-- 208.1 List the HR.EMPLOYEESno,Last Name,SALARY,job,deptno&exp of all the HR.EMPLOYEESs belongs to HR.DEPARTMENTS 10 or 20 with an exp 36 to 40 y working under the same mgr without COMMISSION_PCT
SELECT e.LAST_NAME as HR.EMPLOYEESLOYEE , m.LAST_NAME AS MANAGER , e.SALARY, e.COMMISSION_PCT, e.JOB_ID, e.DEPARTMENT_ID , A.EXP
FROM HR.EMPLOYEES e, HR.EMPLOYEES m, (
  SELECT ROUND(DATEDIFF(NOW(), HIRE_DATE)/(12 * 30),1) AS EXP, EMPLOYEE_ID FROM HR.EMPLOYEES
) A
WHERE e.DEPARTMENT_ID in (10, 20)
AND e.EMPLOYEE_ID = A.EMPLOYEE_ID
AND (e.COMMISSION_PCT IS NULL or e.COMMISSION_PCT = 0)
AND A.EXP between 35.0 AND 36.0;


-- 209. List the details of the HR.EMPLOYEESs working at Chicago.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.JOB_ID, d.LOC, d.DNAME
FROM HR.EMPLOYEES e INNER JOIN HR.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.LOC = 'CHICAGO';

-- 210. List the HR.EMPLOYEESno,Last Name,deptno,loc of all the HR.EMPLOYEESs.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.LOC FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 211. List the HR.EMPLOYEESno,Last Name,loc,dname of all the depts.,10 and 20.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.LOC FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE D.DEPARTMENT_ID IN (10, 20);

-- 212. List the HR.EMPLOYEESno, Last Name, SALARY, loc of the HR.EMPLOYEESs working at Chicago dallas with an exp>6ys.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY, D.LOC FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.LOC = 'CHICAGO' AND ROUND(DATEDIFF(NOW(), HIRE_DATE)/(12 * 30),1) > 6.0;

-- 213. List the HR.EMPLOYEESs along with loc of those who belongs to dallas ,newyork with SALARY ranging from 2000 to 5000 joined in 81.
SELECT D.LOC, E.* FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOC IN ('DALLAS', 'NEWYORK')
AND SALARY BETWEEN 2000 AND 5000
AND EXTRACT (YEAR FROM HIRE_DATE) = 1981;

-- 214. List the HR.EMPLOYEESno,Last Name,SALARY,grade of all HR.EMPLOYEESs.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, GRADE FROM HR.EMPLOYEES, SALGRADE WHERE SALARY BETWEEN LOSAL AND HISAL;

-- 215. List the grade 2 and 3 HR.EMPLOYEES of Chicago.
SELECT * FROM HR.EMPLOYEES, SALGRADE WHERE SALARY BETWEEN LOSAL AND HISAL AND GRADE IN (2,3);

-- 216. List the HR.EMPLOYEESs with loc and grade of accounting HR.DEPARTMENTS or the locs dallas or Chicago with the grades 3 to 5 &exp >6y
SELECT d.LOC, e.*
FROM HR.EMPLOYEES e, HR.DEPARTMENTS d, SALGRADE s
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND d.DNAME = 'ACCOUNTING' OR d.LOC IN ('DALLAS', 'CHICAGO')
AND s.GRADE BETWEEN 3 AND 5
AND DATEDIFF(NOW(), HIRE_DATE)/(12*30) > 6;

-- 217. List the grades 3 HR.EMPLOYEESs of research and operations depts.. joined after 1987 and whose names should not be either miller or allen.
SELECT E.*, D.DNAME
FROM HR.EMPLOYEES E, SALGRADE S, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY BETWEEN S.LOSAL AND S.HISAL
AND D.DNAME IN ('RESEARCH', 'OPERATIONS')
AND YEAR(E.HIRE_DATE) > 1987
AND E.LAST_NAME NOT IN ('MILLER', 'ALLEN');

-- 218. List the HR.EMPLOYEESs whose job is same as smith.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID = (SELECT JOB_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'SMITH');

-- 219. List the HR.EMPLOYEESs who are senior to miller.
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE < (SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'MILLER');

-- 220. List the HR.EMPLOYEESs whose job is same as either allen or SALARY > allen.
SELECT * FROM HR.EMPLOYEES WHERE JOB_ID = (
  SELECT JOB_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'ALLEN'
)
OR SALARY > ( SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'ALLEN')
ORDER BY SALARY;

-- 221. List the HR.EMPLOYEESs who are senior to their own manager.
SELECT E.LAST_NAME AS HR.EMPLOYEES_NAME, M.LAST_NAME AS MANAGER, E.HIRE_DATE, M.HIRE_DATE
FROM HR.EMPLOYEES E, HR.EMPLOYEES M
WHERE E.MGR = M.EMPLOYEE_ID
AND E.HIRE_DATE < M.HIRE_DATE;

-- 222. List the HR.EMPLOYEESs whose SALARY greater than blakes SALARY.
SELECT * FROM HR.EMPLOYEES WHERE SALARY > (SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'BLAKE');

-- 223. List the HR.DEPARTMENTS 10 HR.EMPLOYEESs whose SALARY>allen SALARY.
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 10 AND SALARY > (SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME = 'ALLEN');

-- 224. List the mgrs who are senior to king and who are junior to smith.
SELECT * FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT DISTINCT MGR FROM HR.EMPLOYEES)
AND HIRE_DATE < (SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING')
AND HIRE_DATE > (SELECT HIRE_DATE DATE FROM HR.EMPLOYEES WHERE LAST_NAME = 'SMITH');

-- 225. List the HR.EMPLOYEESno,Last Name,loc,SALARY,dname of the all the HR.EMPLOYEESs belonging to king HR.DEPARTMENTS.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.LOC, E.SALARY, D.DNAME
FROM HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.DEPARTMENT_ID = ( SELECT DEPARTMENT_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING');

-- 226. List the HR.EMPLOYEESs whose salgrade are greater than the grade of miller.
SELECT * FROM HR.EMPLOYEES, SALGRADE
WHERE HR.EMPLOYEES.SALARY BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
AND SALGRADE.GRADE = (
  SELECT S.GRADE
  FROM HR.EMPLOYEES E, SALGRADE S
  WHERE E.SALARY BETWEEN  S.LOSAL AND S.HISAL
  AND E.LAST_NAME = 'MILLER'
);



-- 227. List the HR.EMPLOYEESs who are belonging dallas or Chicago with the grade same as adams or exp more than smith.
SELECT * FROM HR.EMPLOYEES e, SALGRADE s, HR.DEPARTMENTS d
WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOC IN ('DALLAS', 'CHICAGO')
AND s.GRADE = (
  SELECT s1.GRADE FROM HR.EMPLOYEES e1, SALGRADE s1 WHERE e1.SALARY BETWEEN s1.LOSAL AND s1.HISAL AND e1.LAST_NAME = 'SMITH'
);

-- 228. List the HR.EMPLOYEESs whose SALARY is same as ford or blake.
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT SALARY FROM HR.EMPLOYEES WHERE LAST_NAME IN ('FORD', 'BLAKE')
);

-- 229. List the HR.EMPLOYEESs whose SALARY is same as any other HR.EMPLOYEESloyee in the company.
SELECT * FROM HR.EMPLOYEES e1 WHERE e1.SALARY IN (
  SELECT e2.SALARY FROM HR.EMPLOYEES e2 WHERE e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID
);

-- 230. List the HR.EMPLOYEESs whose SALARY is same as SALARY of any clerk of HR.EMPLOYEES1 table.
SELECT SALARY FROM HR.EMPLOYEES WHERE JOB_ID = 'CLERK';

-- 231. List the HR.EMPLOYEESs whose SALARY is same as any HR.EMPLOYEES joined before 82.
SELECT * FROM HR.EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) < 1982;

-- 232. List the HR.EMPLOYEESs whose SALARY is same as the total remuneration (SALARY+COMMISSION_PCT.) of all sales person of Sales HR.DEPARTMENTS belonging to HR.EMPLOYEES table.
-- i feel that the join with HR.DEPARTMENTS is irrelevant
SELECT E.SALARY + IFNULL(E.COMMISSION_PCT, 0) FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.JOB_ID = 'SALESMAN'
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.DNAME = 'SALES';

-- 233. List the HR.EMPLOYEESs whose SALARY is same as any other Grade 4 HR.EMPLOYEESs of HR.EMPLOYEES table.
SELECT * FROM HR.EMPLOYEES WHERE SALARY IN (
  SELECT E.SALARY FROM HR.EMPLOYEES E, SALGRADE S WHERE E.SALARY BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 4
);

-- 234. List the HR.EMPLOYEESs whose SALARY is same as Any HR.EMPLOYEES SALARY of HR.EMPLOYEES table
-- duplicate of #229

-- 235. List the highest paid HR.EMPLOYEES.
SELECT * FROM HR.EMPLOYEES WHERE SALARY = (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES
);

-- 236. List the details of most recently hired HR.EMPLOYEES of HR.DEPARTMENTS 30.
SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE = (
  SELECT MAX(HIRE_DATE) FROM HR.EMPLOYEES
);

-- 237. List the highest paid HR.EMPLOYEES of Chicago joined before the most recently hired HR.EMPLOYEES of grade 2.
SELECT * FROM HR.EMPLOYEES
WHERE SALARY = (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES INNER JOIN HR.DEPARTMENTS ON HR.EMPLOYEES.DEPARTMENT_ID = HR.DEPARTMENTS.DEPARTMENT_ID
  WHERE HR.DEPARTMENTS.LOC = 'CHICAGO'
)
AND HIRE_DATE < (
  SELECT DISTINCT HIRE_DATE
  FROM HR.EMPLOYEES
  WHERE HIRE_DATE = (
    SELECT MAX(e.HIRE_DATE) FROM HR.EMPLOYEES e, SALGRADE s WHERE e.SALARY BETWEEN s.LOSAL AND s.HISAL AND s.GRADE = 2
  )
);


-- 238. List the highest paid HR.EMPLOYEES working under king.
SELECT * FROM HR.EMPLOYEES WHERE MGR = (
  SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
)
AND SALARY = (
  SELECT MAX(SALARY) FROM HR.EMPLOYEES WHERE MGR = (
    SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'KING'
  )
);

