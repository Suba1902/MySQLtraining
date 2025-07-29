SELECT 
     sum(salary) AS total_sal,
     job
FROM employeeinfo
GROUP BY job;  

SELECT
     COUNT(emp_no) AS numb_emp,
     hire_date
FROM employeeinfo
GROUP BY hire_date
HAVING  numb_emp >=3;

SELECT
     dept_no,
     COUNT(emp_no) AS numb_emp,
     SUM(salary) as totaldept_sal
FROM employeeinfo
GROUP BY dept_no
HAVING totaldept_sal >9000 and numb_emp >2;


SELECT 
     dept_no, 
     COUNT(emp_name) as numb_emp,
     avg(salary) as avgdpt_sal
FROM employeeinfo
WHERE comm > salary
GROUP BY dept_no;


SELECT COUNT(emp_no), salary
FROM employeeinfo
GROUP BY salary
HAVING COUNT(emp_no)>1;

SELECT 
     emp_name, 
     COUNT(emp_name) as numb_emp
FROM employeeinfo
GROUP BY emp_name
HAVING COUNT(emp_name)>1;

SELECT 
     dept_no,
     avg(salary) as deptavg_sal
FROM employeeinfo
GROUP BY dept_no
HAVING avg(salary) BETWEEN 2500 and 3000;

SELECT 
     COUNT(emp_no),
     job
FROM employeeinfo
WHERE SALARY*12 LIKE '%0' AND (job = 'MANAGER' OR job = 'ANALYST')
GROUP BY job;

SELECT 
	 dept_no,
     COUNT(*),
     job    
FROM employeeinfo
WHERE  job ="CLERK"
GROUP BY job, dept_no;

 SELECT 
	  dept_no,
      emp_name,
     MAX(salary)
FROM employeeinfo
WHERE  job ="MANAGER"
GROUP BY dept_no, emp_name;

SELECT 
      salary,
      COUNT(*) as repeatitions
FROM employeeinfo
GROUP BY salary
HAVING repeatitions > 1;

SELECT 
      dept_no,
      COUNT(emp_no)
FROM employeeinfo
WHERE dept_no != 10
GROUP BY dept_no;

SELECT 
       dept_no,
	   COUNT(emp_no)
FROM employeeinfo
WHERE comm is NOT NULL
GROUP BY dept_no;

SELECT 
      dept_no,
      COUNT(emp_no)
FROM employeeinfo
WHERE job != 'MANAGER' AND salary > 1600
GROUP BY dept_no;

 SELECT 
      emp_name,
      avg(salary) avgsal
FROM employeeinfo
WHERE manager_id is NOT NULL
GROUP BY emp_name;

 SELECT 
      dept_no,
      COUNT(emp_no) numb_emp,
      hire_date
FROM employeeinfo
GROUP BY hire_date, dept_no
HAVING numb_emp >1;

SELECT 
        dept_no,
      salary,
      COUNT(emp_no) numb_emp
FROM employeeinfo
GROUP BY dept_no,salary;

SELECT 
        job,
      MAX(salary)      
FROM employeeinfo
WHERE emp_name NOT LIKE "K%"
GROUP BY job;

SELECT 
     COUNT(emp_no) as numb_emp,
     manager_id,
     dept_no
FROM employeeinfo
WHERE manager_id = 7839
GROUP BY manager_id, dept_no;

SELECT 
      emp_name,
      COUNT(emp_no) as numb_emp,
      dept_no
FROM employeeinfo
WHERE emp_name LIKE "A%" 
     or emp_name LIKE 'E%'
     or emp_name LIKE  'I%'
     or emp_name LIKE  'O%' 
     or emp_name LIKE 'U%'
GROUP BY dept_no, emp_name;








