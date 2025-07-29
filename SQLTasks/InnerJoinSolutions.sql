
-- 1Q
SELECT e.emp_name, d.dept_name
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no);

-- 2Q
SELECT d.dept_name, SUM(e.salary*12) as annualdept_sal
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE d.dept_name = "ACCOUNTING"
GROUP by d.dept_name;

-- 3Q
SELECT e.emp_name,d.dept_name, (e.salary*12) as annual_sal
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE salary > 2340;

-- 4Q
SELECT e.emp_name,d.dept_name
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE d.dept_name LIKE "%A%";

-- 5Q
SELECT e.emp_name,d.dept_name
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE job = "SALESMAN";

-- 6Q
SELECT e.emp_name,d.dept_name, e.job
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE d.dept_name LIKE "S%";

-- 7Q
SELECT d.dept_name, e.manager_id
FROM deptinfo d 
JOIN employeeinfo as e USING (dept_no)
WHERE e.manager_id = 7839; 

-- 8 Q      

SELECT d.dept_name, e.hire_date
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE YEAR(e.hire_date) > '1983' 
AND (d.dept_name = "ACCOUNTING" OR d.dept_name = "RESEARCH");

-- 9Q

SELECT e.emp_name,d.dept_name
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE e.comm IS NOT NULL AND (e.dept_no = 10 OR e.dept_no = 30);

-- 10Q
SELECT d.dept_name, e.emp_no
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE (e.emp_no = 7839 OR e.emp_no = 7902) AND d.location = "NEW YORK";


-- 11 Q
SELECT d.location, AVG(e.salary)
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE e.emp_name NOT LIKE "_A%"
GROUP BY d.location;

-- 12 Q

SELECT e.emp_name,d.location
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE e.emp_no IN  (SELECT emp_no
FROM employeeinfo
WHERE manager_id = 7839 AND job = "MANAGER");

-- 13 Q
SELECT d.dept_name,e.emp_no
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE e.job = "CLERK" AND e.manager_id IS NOT NULL;

-- 14 Q
SELECT d.dept_name,SUM(e.salary) as total_sal
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
GROUP BY d.dept_name
HAVING COUNT(emp_no) >= 4;

-- 15 Q
SELECT d.dept_name, COUNT(e.emp_no) as numb_emp
FROM employeeinfo as e
JOIN deptinfo d USING (dept_no)
WHERE e.job = "MANAGER" OR e.job = "CLERK"
GROUP BY d.dept_name;



