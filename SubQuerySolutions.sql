SELECT e.emp_name,
       d.dept_name
       FROM employeeinfo as e
       JOIN deptinfo as d
             on e.dept_no = d.dept_no
Where e.dept_no IN(SELECT dept_no
                  FROM deptinfo as d
                  WHERE dept_name LIKE '%S');
                  
SELECT e.emp_name,
       MAX(salary),
       e.dept_no,
       d.dept_name
       FROM employeeinfo as e
       JOIN deptinfo as d
             on e.dept_no = d.dept_no
Where e.dept_no = (SELECT dept_no
                  FROM deptinfo
                  WHERE dept_name = 'ACCOUNTING')
 GROUP BY   d.dept_name,e.emp_name,e.dept_no
 ORDER BY MAX(salary) DESC LIMIT 1;    

-- using joins
SELECT 
       d.dept_name,
       SUM(e.comm) as total_comm
       FROM employeeinfo as e
       JOIN deptinfo as d
             on e.dept_no = d.dept_no
GROUP BY d.dept_name   
ORDER BY total_comm DESC LIMIT 1 ; 
 
 
-- using subquery 
SELECT 
       d.dept_name,
       SUM(e.comm)
       FROM deptinfo as d
       JOIN employeeinfo as e
             on e.dept_no = d.dept_no
WHERE d.dept_no IN (SELECT e.dept_no
                   FROM employeeinfo 
                   WHERE e.comm = (SELECT MAX(e.comm)
                                    FROM employeeinfo))
 GROUP BY d.dept_name ;
                  
 -- 4Q (doesn't return value)
 SELECT 
       emp_name
       FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
                   FROM deptinfo 
                   WHERE dept_name LIKE '_O%');
                   
                   
 -- 5Q
 SELECT 
       emp_name
       FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
                   FROM employeeinfo 
                   WHERE emp_name = "SCOTT");
 
 
 
 -- 6Q
SELECT 
       emp_name
       FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
                   FROM deptinfo 
                   WHERE dept_name = 'ACCOUNTING' OR dept_name = 'OPERATION');   
                   
 -- 7Q
 SELECT 
       emp_name,
       salary
       FROM employeeinfo
WHERE salary > (SELECT 
                   salary
                   FROM employeeinfo
                   WHERE emp_name = 'MILLER')
  ORDER BY salary DESC;                 
  
-- 8Q

SELECT 
       dept_name
       FROM deptinfo
 WHERE dept_no IN (SELECT 
                     dept_no
			       FROM employeeinfo
                  WHERE job = "SALESMAN" 
					GROUP by dept_no
					HAVING COUNT(*)>=3); 
  
 -- 9Q
SELECT 
       dept_name
       FROM deptinfo
 WHERE dept_no IN (SELECT 
                     dept_no
			       FROM employeeinfo
                   WHERE manager_id is NULL);
                   
 -- 10 Q
 
 SELECT 
       emp_name
FROM employeeinfo
WHERE manager_id = (SELECT 
                     emp_no
			       FROM employeeinfo
                   WHERE emp_name = 'JONES');
                   
-- 11Q
 SELECT 
       emp_name,
       dept_no
FROM employeeinfo
WHERE dept_no IN (SELECT
           dept_no
        FROM deptinfo
        WHERE dept_name IN('RESEARCH', 'ACCOUNTING') 
            AND emp_no IN (SELECT manager_id 
                            FROM employeeinfo
                             GROUP BY manager_id
                             HAVING COUNT(*) >=2));
                   
                   
 -- 12Q 
 SELECT
	dept_name
FROM deptinfo
WHERE dept_no IN (SELECT 
                      dept_no
                    FROM employeeinfo
                    WHERE emp_name NOT LIKE 'S%' AND salary BETWEEN 1500 and 3000);
                    
-- 13Q
SELECT
	location
FROM deptinfo
WHERE dept_no IN (SELECT
	                 dept_no
                     FROM employeeinfo
                     WHERE salary = (SELECT 
                                       MIN(salary)
                                       FROM employeeinfo
                                        WHERE salary>2000));
                                        
-- 14Q
SELECT
	location
FROM deptinfo
WHERE dept_no IN (SELECT
                       dept_no
		            FROM deptinfo
				     WHERE dept_name = 'ACCOUNTING');
                     
                     
-- 15Q                     
SELECT
	location
FROM deptinfo
WHERE dept_no IN ( SELECT
	                 dept_no
                       FROM employeeinfo
					GROUP BY dept_no
					HAVING COUNT(emp_name) > 4);
                                        
-- 16Q

SELECT
     emp_name,
     job,
     salary
FROM employeeinfo  
WHERE job != (SELECT 
                 job
              FROM employeeinfo
              WHERE emp_name = "ALLEN") AND (salary > (SELECT 
                                                       salary
                                                     FROM employeeinfo
                                                     WHERE emp_name = "MARTIN"));
                                                     
-- 17Q
                                                     
SELECT emp_name
FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
FROM deptinfo
WHERE location IN (SELECT location 
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE emp_no IN (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'ADAMS'))));

-- 18Q
SELECT  emp_name,job, manager_id
FROM employeeinfo
WHERE manager_id IN (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'JONES');

-- 19Q
SELECT emp_name,
       hire_date,
       comm
FROM employeeinfo
WHERE emp_no IN (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'FORD');

-- 20Q
SELECT 
    COUNT(emp_name)
FROM employeeinfo
WHERE salary < (SELECT salary
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'BLAKE'));

-- 21Q
SELECT emp_name
FROM employeeinfo
WHERE emp_no IN (SELECT emp_no
FROM employeeinfo
WHERE comm = 0 AND (SELECT dept_no
FROM deptinfo
WHERE location = 'CHICAGO'));

-- 22Q
SELECT emp_name,
       salary
FROM employeeinfo
WHERE dept_no = (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'SALES') AND (SELECT dept_no
FROM employeeinfo
GROUP BY dept_no
HAVING AVG(salary)< salary);

-- 23Q
SELECT emp_name
FROM employeeinfo
WHERE dept_no = (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'RESEARCH') AND  job = 'MANAGER';

-- 24Q
SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE comm is NOT NULL);

-- 25Q sol1
SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE manager_id is NULL and (SELECT MAX(salary)
FROM employeeinfo));

-- 25Q sol2
SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE manager_id is NULL
GROUP BY dept_no
HAVING MAX(salary));

-- 26Q sol1

SELECT *
FROM employeeinfo
WHERE manager_id = (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE') AND comm LIKE '%' ;

-- 26Q sol2

SELECT *
FROM employeeinfo
WHERE manager_id = (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE') AND comm >=0 ;

-- 27Q

SELECT dept_name,
       location
FROM deptinfo 
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE emp_no IN (SELECT manager_id
FROM employeeinfo 
WHERE emp_no IN (SELECT manager_id
FROM employeeinfo
WHERE job = "SALESMAN")));

-- 28Q should return no output
SELECT dept_name,
       location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE job = 'CLERK' AND manager_id IN (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE') AND salary < (SELECT salary
FROM employeeinfo
WHERE emp_name = 'MARTIN')); 

-- 29Q
SELECT emp_name
FROM employeeinfo
WHERE manager_id IN (SELECT emp_no
FROM employeeinfo
WHERE job != 'PRESIDENT') AND comm >= 0 AND salary > (SELECT MAX(salary)
FROM employeeinfo
WHERE job = 'CLERK');

-- 30Q 
SELECT emp_name, hire_date, salary
FROM employeeinfo
ORDER BY hire_date >  (SELECT
    DATE_ADD(MIN(hire_date), INTERVAL 2 YEAR) AS hire_date_plus_2_years
FROM employeeinfo) AND salary > (SELECT salary
FROM employeeinfo
WHERE emp_name = 'BLAKE');

-- 31Q
SELECT location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE manager_id IN (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE'));

-- 32Q
SELECT emp_name, job, salary
FROM employeeinfo
WHERE job = ( SELECT job 
FROM employeeinfo
WHERE emp_name = 'JONES') AND salary < ( SELECT salary 
FROM employeeinfo
WHERE emp_name = 'SCOTT');

-- 33Q
SELECT emp_name,
       salary*12 as annual_sal,
       dept_no
FROM employeeinfo
WHERE dept_no IN (30,20) AND dept_no IN (SELECT dept_no
FROM employeeinfo
GROUP BY dept_no
HAVING COUNT(dept_no) >=3);

-- 34Q 
SELECT emp_name
FROM employeeinfo
WHERE salary <  (SELECT salary
FROM employeeinfo
WHERE job = 'SALESMAN');

-- 35Q 
SELECT emp_name
FROM employeeinfo
WHERE hire_date < (SELECT MAX(hire_date)
FROM employeeinfo);

--  35Q 2nd question
SELECT MIN(salary)
FROM employeeinfo
WHERE salary > (SELECT MIN(salary)
FROM employeeinfo 
WHERE salary> (SELECT MIN(salary)
FROM employeeinfo));

-- 36Q
SELECT emp_name
FROM employeeinfo
WHERE salary > ANY (SELECT salary
FROM employeeinfo
WHERE job = 'MANAGER');

-- 37Q

SELECT emp_name, hire_date, salary
FROM employeeinfo
WHERE hire_date > (SELECT 
    DATE_ADD(MIN(hire_date), INTERVAL 4 YEAR) AS hire_date_plus_4_years
FROM employeeinfo) AND salary < ( SELECT salary 
FROM employeeinfo
WHERE emp_name = 'BLAKE');

-- 38Q Revisit

SELECT *
FROM deptinfo
WHERE location = 'NEW YORK';

-- 39Q
SELECT location
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE emp_name NOT LIKE 'A%' AND salary BETWEEN 1000 and 3000);

-- 40Q
 SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE manager_id = (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE'));

-- 41Q
SELECT dept_name, location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'MARTIN')));

-- 42Q
 
SELECT manager_id,job, dept_no
FROM employeeinfo
WHERE comm IS NULL AND dept_no IN (SELECT dept_no
FROM deptinfo
WHERE location IN ('CHICAGO','DALLAS'));

-- 43Q

SELECT *, salary*12 as annual_sal
FROM employeeinfo
WHERE comm = (SELECT MAX(comm)
FROM employeeinfo);

-- 44Q
SELECT emp_name
FROM employeeinfo
WHERE dept_no IN ( SELECT dept_no
FROM deptinfo
WHERE dept_name = 'SALES' ) AND comm is NOT NULL AND hire_date < (SELECT MAX(hire_date)
FROM employeeinfo);

-- 45Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'WARD')));

-- 46Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE salary > ( SELECT AVG(salary)
FROM employeeinfo
WHERE job = 'CLERK'));

-- 47Q

SELECT *, salary*1.25 as hike25perct
FROM employeeinfo
WHERE hire_date = (SELECT MAX(hire_date)
FROM employeeinfo);

-- 48Q

SELECT dept_no
FROM employeeinfo
WHERE job = 'MANAGER' AND dept_no IN (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'SALES');

-- 49Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE salary = ( SELECT MIN(salary)
FROM employeeinfo) and manager_id IS NOT NULL);

-- 50Q

SELECT hire_date, job 
FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'SALES');

-- 51Q
SELECT dept_name, location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE job = 'PRESIDENT');

-- 52Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE salary NOT BETWEEN 2999 AND (SELECT MAX(salary)
FROM employeeinfo));   


-- 53Q doesn.t return any value

SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE manager_id  = ( SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'ADAMS'));

-- 54Q

SELECT *
FROM employeeinfo
WHERE emp_no = (SELECT MAX(emp_no)
FROM employeeinfo);

-- 55Q

SELECT emp_name
FROM employeeinfo
WHERE salary > (SELECT AVG(salary)
FROM employeeinfo
WHERE dept_no = 30);

-- 56Q

SELECT COUNT(emp_no)
FROM employeeinfo
WHERE dept_no IN ( SELECT dept_no
FROM deptinfo
WHERE dept_name = 'RESEARCH') AND salary < ANY( SELECT salary
FROM employeeinfo
WHERE dept_no = 10);

-- 57Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE job = 'CLERK');

-- 58Q

SELECT dept_name
FROM deptinfo
WHERE dept_no in ( SELECT dept_no
FROM deptinfo
WHERE dept_name LIKE '%L%');

-- 59Q

SELECT emp_name
FROM employeeinfo
WHERE hire_date > (SELECT hire_date
FROM employeeinfo
WHERE emp_name = 'BLAKE');

-- 60Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
GROUP BY dept_no
HAVING COUNT(dept_no) >=3 and COUNT(dept_no) <5);

-- 61Q

SELECT location
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE emp_no = ANY (SELECT manager_id
FROM employeeinfo
WHERE salary > 2000 ));


-- 62Q

SELECT emp_name
FROM employeeinfo
WHERE dept_no IN ( SELECT dept_no
FROM deptinfo
WHERE dept_name LIKE '%E%E%');

-- 63Q

SELECT emp_name, salary
FROM employeeinfo
WHERE salary > ANY (SELECT salary
FROM employeeinfo
WHERE job = 'ANALYST');

--  64Q

SELECT emp_name
FROM employeeinfo
WHERE dept_no IN (  SELECT dept_no
FROM deptinfo
WHERE location  = 'CHICAGO');

-- 65Q

SELECT emp_name, salary, dept_no
FROM employeeinfo
WHERE dept_no in ( SELECT dept_no
FROM deptinfo
WHERE dept_name = 'RESEARCH')
ORDER BY salary LIMIT 1;

-- 66Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN  ( SELECT dept_no
FROM employeeinfo
WHERE job = 'SALESMAN');

-- 67Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
GROUP BY dept_no
HAVING COUNT(dept_no) >=3);

-- 68Q

SELECT  emp_name, dept_no 
FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'RESEARCH' OR dept_name = 'ACCOUNTING') 
AND  dept_no IN ( SELECT dept_no
FROM employeeinfo
GROUP BY dept_no
HAVING COUNT(dept_no) >=2);

-- 69Q

SELECT emp_name, job
FROM employeeinfo
WHERE dept_no ;

-- 70Q

SELECT emp_name
FROM employeeinfo
WHERE salary <(SELECT MAX(salary)
FROM employeeinfo
WHERE salary < (SELECT MAX(salary)
FROM employeeinfo) 
AND dept_no = (SELECT dept_no
FROM  deptinfo
WHERE location = 'DALLAS'))
ORDER BY salary DESC LIMIT 1;

-- 71Q

SELECT *
FROM employeeinfo
WHERE comm is NULL and hire_date > '1983-07-31';

-- 72Q

SELECT emp_name
FROM employeeinfo
WHERE dept_no  IN ( SELECT dept_no
FROM deptinfo
WHERE dept_name = 'SALES' OR  dept_name = 'RESEARCH')
AND emp_no IN (  SELECT manager_id
FROM employeeinfo
GROUP BY manager_id
HAVING COUNT(manager_id) >=2);

-- 73Q

SELECT emp_name, salary
FROM employeeinfo
WHERE comm > (SELECT MAX(salary)
FROM employeeinfo)
AND job ='SALESMAN' AND manager_id != ( SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'KING'); 

-- 74Q

SELECT location
FROM  deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE hire_date BETWEEN '1981-01-01' and '1981-12-31');

-- 75Q

SELECT MIN(salary),dept_no
FROM employeeinfo
WHERE salary < (SELECT AVG(salary)
FROM employeeinfo)
GROUP BY dept_no;

-- 76Q
SELECT emp_name
FROM employeeinfo
WHERE manager_id = (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'JONES');

-- 77Q

SELECT *
FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
FROM deptinfo
WHERE location LIKE '%O%O%');

-- 78Q

SELECT emp_name
FROM employeeinfo
WHERE dept_no = 10 AND salary > (SELECT MAX(salary) 
FROM employeeinfo
WHERE dept_no IN (20,30));

-- 79Q

SELECT emp_name, job, salary
FROM employeeinfo
WHERE salary IN ( SELECT MAX(salary)
FROM employeeinfo
GROUP BY job)
ORDER BY salary DESC;

-- 80Q

SELECT emp_no,emp_name, salary
FROM employeeinfo
WHERE salary = (SELECT salary
FROM employeeinfo
WHERE job = 'CLERK'
GROUP BY salary
ORDER BY MAX(salary) DESC LIMIT 1);

-- 81Q

SELECT hire_date
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_no = (SELECT manager_id
FROM employeeinfo
WHERE emp_name = 'SMITH'));


-- 82Q
SELECT COUNT(emp_no)
FROM employeeinfo
WHERE job = 'SALESMAN' AND dept_no IN (SELECT dept_no
FROM deptinfo
WHERE location = 'NEW YORK' OR location = 'CHICAGO');

-- 83Q

SELECT dept_name
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE (hire_date BETWEEN '1981-01-01' AND '1982-12-31') AND salary > 1800);

-- 84Q

SELECT location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE salary = ( SELECT MAX(salary)
FROM employeeinfo) AND manager_id is NULL);

-- 85Q

SELECT emp_name
FROM employeeinfo
WHERE dept_no IN (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'ACCOUNTING')AND salary > (SELECT AVG(salary) 
FROM employeeinfo
WHERE dept_no  = (SELECT dept_no
FROM deptinfo
WHERE dept_name = 'ACCOUNTING'));

-- 86Q
SELECT location
FROM deptinfo
WHERE dept_no IN ( SELECT dept_no
FROM employeeinfo
WHERE comm IS NOT NULL);

-- 87Q
SELECT emp_name
FROM employeeinfo
WHERE manager_id != (SELECT emp_no
FROM employeeinfo
WHERE job = 'PRESIDENT') AND comm >=0 AND salary > (SELECT salary
FROM employeeinfo
WHERE job = 'CLERK'
GROUP BY salary
ORDER BY MAX(salary) DESC LIMIT 1);


-- 88Q

SELECT emp_name, salary, 2175
FROM employeeinfo
WHERE salary > ( SELECT AVG(salary) 
FROM employeeinfo
WHERE dept_no  = 20);

-- 89Q

SELECT dept_name,location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE job = 'CLERK'AND manager_id = (SELECT emp_no
FROM employeeinfo
WHERE emp_name = 'BLAKE') AND salary < ANY (SELECT salary
FROM employeeinfo
WHERE emp_name = 'MARTIN'));

-- 90Q

SELECT dept_name,location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE job = 'MANAGER' AND salary < ANY (SELECT salary
FROM employeeinfo
WHERE job = 'CLERK'));

-- 91Q

SELECT location
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE comm IS NOT NULL);

-- 92Q
SELECT emp_no, emp_name, job
FROM employeeinfo
WHERE job LIKE '%E%'
ORDER BY emp_no DESC;

-- 93Q

SELECT dept_name,location, dept_no
FROM deptinfo
WHERE dept_no IN (SELECT dept_no
FROM employeeinfo
WHERE emp_no IN (SELECT emp_no
FROM employeeinfo
WHERE manager_id IN (SELECT manager_id
FROM  employeeinfo
GROUP BY manager_id
HAVING COUNT(emp_no) >=2)));

-- 94Q

SELECT AVG(salary)
FROM employeeinfo
WHERE dept_no IN ( SELECT dept_no
FROM deptinfo
WHERE dept_name = 'ACCOUNTING');

-- 95Q
SELECT *
FROM employeeinfo
WHERE hire_date LIKE '1981-%-%';

-- 96Q
SELECT *, salary*1.35 as hike_sal
FROM employeeinfo
WHERE emp_name = 'SMITH' OR job = 'PRESIDENT';

-- 97Q
SELECT COUNT(emp_no)
FROM employeeinfo
WHERE comm > salary;

-- 97Q subquery method
SELECT COUNT(*)
FROM employeeinfo
WHERE comm > ANY ( SELECT salary
FROM employeeinfo);


-- 98Q 

-- 99Q same as 97Q

-- 100Q same 98Q

-- 101Q

SELECT emp_name
FROM employeeinfo
WHERE job = (SELECT job
FROM employeeinfo
WHERE emp_name = 'SMITH') AND dept_no = (SELECT dept_no
FROM employeeinfo
WHERE emp_name = 'JONES') AND salary > (SELECT salary
FROM employeeinfo
WHERE emp_name = 'TURNER');

-- 102Q

SELECT dept_name FROM deptinfo WHERE dept_no IN (SELECT dept_no FROM employeeinfo
WHERE employeeinfo.dept_no = dept_name.dept_no);


