SELECT e.emp_name,
       e.job,
       e.salary*12 as annual_sal,
       d.dept_name 
FROM employeeinfo AS e   
JOIN deptinfo AS d USING(dept_no)
WHERE e.job != "CLERK"  AND e.salary*12 = 30000 ; 

-- 2Q
SELECT e.emp_name,
       e.emp_no,
	   m.emp_name as Manager,
       m.emp_no as Manager_no
FROM employeeinfo as e
JOIN employeeinfo as m 
ON e.manager_id = m.emp_no;

-- 4Q

SELECT e.emp_name,
       e.job,
       e.salary*12 as annual_sal,
       d.dept_name 
FROM employeeinfo AS e   
JOIN deptinfo AS d USING(dept_no)
WHERE e.job != "CLERK"  AND e.salary*12 = 30000 ; 

-- 3Q

SELECT 
       d.dept_name,
       SUM(e.salary) as total_sal
FROM deptinfo AS d   
LEFT JOIN employeeinfo AS e USING(dept_no)
GROUP BY d.dept_name
; 

-- 5Q

SELECT e.emp_name,
       d.dept_name 
FROM employeeinfo AS e   
LEFT JOIN deptinfo AS d USING(dept_no);

-- 6Q

SELECT e.emp_name,
       d.location
FROM employeeinfo AS e   
LEFT JOIN deptinfo AS d USING(dept_no)
WHERE e.comm IS NOT NULL;

-- 7Q
SELECT 
       d.dept_name,
       e.emp_name
FROM employeeinfo AS e   
JOIN deptinfo AS d USING(dept_no)
WHERE e.manager_id is NULL 
AND e.salary IN (SELECT MIN(salary) 
FROM employeeinfo);

-- 8Q
SELECT e.emp_name,
       d.dept_name,
       d.location
FROM employeeinfo AS e   
JOIN deptinfo AS d USING(dept_no)
WHERE e.manager_id IN ( SELECT emp_no
FROM employeeinfo
WHERE emp_name = "SMITH");

-- 9Q
SELECT DISTINCT d.dept_name, d.location
FROM employeeinfo e1
JOIN employeeinfo e2 ON e1.manager_id = e2.emp_no         -- e2 = SALESMAN's manager
JOIN employeeinfo e3 ON e2.manager_id = e3.emp_no         -- e3 = manager of SALESMAN's manager
JOIN deptinfo d ON e3.dept_no = d.dept_no
WHERE e1.job = 'SALESMAN';

-- 10q
SELECT e.emp_name,
       d.dept_name
FROM employeeinfo AS e   
JOIN deptinfo AS d USING(dept_no)
WHERE d.dept_name = "RESEARCH" AND e.job= "MANAGER";

-- 11Q
SELECT COUNT(*) as numb_emp
FROM employeeinfo AS e 
JOIN employeeinfo AS b ON b.emp_name = "BLAKE"  
JOIN employeeinfo AS m ON m.emp_no = b.manager_id
WHERE e.salary < m.salary;

-- 12Q
SELECT e.emp_name,
       d.dept_name,
       d.location
FROM employeeinfo AS e   
JOIN deptinfo AS d ON e.dept_no = d.dept_no
WHERE e.manager_id IN (SELECT emp_no
FROM employeeinfo
WHERE emp_name = "BLAKE") AND e.job = "ANALYST";

-- 13Q

SELECT e.emp_name, e.hire_date, e.comm
FROM employeeinfo as e
JOIN employeeinfo as ef 
ON e.emp_no = ef.manager_id
WHERE ef.emp_name = "FORD";

-- 14Q

SELECT e.emp_name, d.dept_name
FROM employeeinfo AS e 
LEFT JOIN deptinfo AS d ON e.dept_no = d.dept_no
WHERE e.salary < (SELECT AVG(salary)
FROM employeeinfo
WHERE dept_no = 30);

-- 15Q
SELECT e.emp_name, d.dept_name, d.location
FROM employeeinfo AS e 
JOIN employeeinfo AS ej ON e.manager_id = ej.emp_no
LEFT JOIN deptinfo AS d ON e.dept_no = d.dept_no
WHERE ej.emp_name = "JONES";

-- 16Q
SELECT e.emp_name, d.dept_name
FROM employeeinfo AS e 
LEFT JOIN deptinfo AS d ON e.dept_no = d.dept_no
WHERE e.emp_name LIKE "S%" ; 

-- 	17Q
SELECT d.dept_name
FROM deptinfo AS d
LEFT JOIN employeeinfo AS e ON d.dept_no = e.dept_no
WHERE e.emp_no IS NULL;

-- 18Q

SELECT e.emp_name, e.comm
FROM employeeinfo e
JOIN employeeinfo ec ON e.comm = ec.comm
WHERE e.emp_no != ec.emp_no AND e.comm IS NOT NULL;

-- 19Q
 SELECT d.dept_name, e.emp_name
FROM deptinfo AS d
LEFT JOIN employeeinfo AS e ON d.dept_no = e.dept_no
WHERE emp_no IS NULL 
UNION
SELECT d.dept_name, e.emp_name
FROM deptinfo AS d
RIGHT JOIN employeeinfo AS e ON d.dept_no = e.dept_no
WHERE e.dept_no IS NULL or e.dept_no IS NOT NULL ;

-- 20Q
SELECT e.emp_name,
       job,
       d.dept_name,
       d.location
FROM employeeinfo AS e
RIGHT JOIN deptinfo AS d ON d.dept_no = e.dept_no
WHERE e.job= "MANAGER" AND d.location = "CHICAGO";


-- 21Q
  
SELECT 
       d.dept_name
FROM employeeinfo AS e
JOIN deptinfo AS d ON d.dept_no = e.dept_no
WHERE(e.hire_date BETWEEN "1981-01-01" AND "1982-12-31")  
AND e.salary>1800;

-- 22Q

SELECT MIN(a.salary)
FROM employeeinfo as a
JOIN employeeinfo AS e ON a.salary > e.salary;

-- 23		Q
SELECT emp_name
FROM employeeinfo
WHERE salary*12 >1500 AND hire_date < "1982-01-01";

-- 24Q

SELECT DISTINCT d.dept_name,
       d.location,
       d.dept_no
FROM deptinfo AS d
JOIN employeeinfo as e ON  e.dept_no = d.dept_no
JOIN employeeinfo as m ON  e.manager_id = m.manager_id
					AND e.emp_no !=  m.emp_no
WHERE e.manager_id IS NOT NULL;

-- 25Q
SELECT e.emp_name,
       m.emp_name as manager
FROM employeeinfo AS e
JOIN employeeinfo AS m 
ON e.manager_id = m.emp_no;

-- 26Q

SELECT e.emp_name,
       d.dept_name
FROM employeeinfo AS e
JOIN deptinfo AS d
ON e.dept_no = d.dept_no
WHERE e.emp_name LIKE "S%";

--  27Q

SELECT e.emp_name, e.salary
FROM employeeinfo as e
JOIN employeeinfo as es
ON e.emp_no  <> es.emp_no
WHERE e.salary = es.salary;













