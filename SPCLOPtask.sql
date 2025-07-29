SELECT 
     emp_name
FROM employeeinfo
WHERE comm is NULL;

SELECT 
emp_name
FROM employeeinfo
WHERE manager_id is NULL;

SELECT 
     emp_name
 FROM employeeinfo
 WHERE job = 'salesman' AND dept_no = 30 ;
 
 SELECT *
 FROM employeeinfo
 WHERE emp_name LIKE 'S%' or emp_name LIKE 'A%';
 
 SELECT *
 FROM employeeinfo
 WHERE dept_no <> 10 and dept_no <>20;
 
  SELECT *
 FROM employeeinfo
 WHERE emp_name NOT LIKE 'S%'; 
 
 SELECT *
 FROM employeeinfo
 WHERE dept_no = 10 and manager_id is NOT NULL;
 
SELECT *
 FROM employeeinfo
 WHERE job = 'CLERK' and comm is NULL;  
 
  SELECT *
 FROM employeeinfo
 WHERE (dept_no = 10 or dept_no =30) and manager_id is NULL;

SELECT *
 FROM employeeinfo
 WHERE salary > 2450 and dept_no = 30 and job = 'salesman';
 
 SELECT *
 FROM employeeinfo
 WHERE salary > 2500 and dept_no = 30 and job = 'ANALYST';
 
  SELECT *
 FROM employeeinfo
 WHERE emp_name LIKE 'M%' OR emp_name LIKE 'J%';
 
 SELECT *, salary*12 as annual_sal
 FROM employeeinfo
 WHERE dept_no = 30;
 
 SELECT *
 FROM employeeinfo
 WHERE emp_name NOT LIKE '%ES' AND emp_name NOT LIKE '%R';
 
  SELECT *, salary*0.1 as bonus
 FROM employeeinfo
 WHERE dept_no = 10 and manager_id is NOT NULL;
 
SELECT *
FROM employeeinfo
WHERE job = 'SALESMAN' and emp_name LIKE '%E_' and salary LIKE '____';

SELECT *
FROM employeeinfo
WHERE hire_date >= '1981-01-01';

SELECT *
FROM employeeinfo
WHERE hire_date LIKE '%-02-%';



SELECT *
FROM employeeinfo
WHERE (job != 'MANAGER' AND job !='CLERKS' )
 AND (dept_no = 10 AND dept_no = 20)
 AND salary BETWEEN 1000 and 3000;
 
SELECT *
FROM employeeinfo
WHERE (salary NOT BETWEEN 1000 and 2000) 
  AND (job <> 'SALESMAN')
  AND (dept_no = 10 or dept_no = 20 or dept_no = 30);
  
SELECT *
FROM deptinfo
WHERE dept_name LIKE '%O%' AND location LIKE '%o%';

SELECT *
FROM employeeinfo
WHERE job LIKE '%MAN%';

SELECT *
FROM employeeinfo
WHERE hire_date BETWEEN '1982-01-01' and '1986-12-31';

SELECT *
FROM employeeinfo
WHERE hire_date LIKE '%-12-%' OR hire_date LIKE '%-11-%';

SELECT 
    emp_name,
    comm
FROM employeeinfo
WHERE comm > salary;

SELECT 
     emp_name,
     job
FROM employeeinfo
WHERE emp_name LIKE 'S%' AND manager_id is NOT NULL;

SELECT 
     emp_name,
     salary
FROM employeeinfo
WHERE salary*12 LIKE '%0';

SELECT 
     emp_name
FROM employeeinfo
WHERE emp_name LIKE '%L%L%';

SELECT 
     emp_name
FROM employeeinfo
WHERE (emp_name LIKE 'A%') or (emp_name LIKE 'E%') OR (emp_name LIKE 'I%') OR (emp_name LIKE 'O%')
 OR (emp_name LIKE 'U%');






 
 
 


 
 