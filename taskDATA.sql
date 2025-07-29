create table employeeinfo 
              ( emp_no int Primary key,
               emp_name varchar(50) ,
               job varchar(50),
               manager_id int,
               hire_date date,
               salary int,
               comm int,
               dept_no int,
               FOREIGN KEY (dept_no) REFERENCES deptinfo(dept_no) ON UPDATE CASCADE ON DELETE SET NULL);

-- describe employeeinfo;
drop table employeeinfo;
truncate table employeeinfo;
               
 Insert into employeeinfo (emp_no, emp_name, job, manager_id, hire_date, salary, comm, dept_no)
              values ( 7369,'SMITH', 'CLERK', 7902, '1980-12-17', 800,NULL,20),
					 ( 7499,'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600,300,30),
                     ( 7521,'WARD', 'SALESMAN', 7698, '1981-02-22', 1250,500, 30),
                     ( 7566,'JONES', 'MANAGER', 7839, '1981-04-02', 2975,NULL,20),
                     ( 7654,'MARTIN', 'SALESMAN', 7698, '1981-09-28',1250,1400,30),
					 ( 7698,'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850,NULL,NULL),
                     ( 7782,'CLARK', 'MANAGER', 7839, '1981-06-09', 2450,NULL, 10),
                     ( 7788,'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000,NULL,20),
                     ( 7839,'KING', 'PRESIDENT', NULL, '1981-11-17', 5000,NULL, 10),
                     ( 7844,'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
                     ( 7876,'ADAMS', 'CLERK', 7788, '1987-05-23', 1100,NULL,20),
					 ( 7900,'JAMES', 'CLERK', 7698, '1981-12-03', 950,NULL,NULL),
                     ( 7902,'FORD', 'ANALYST', 7566, '1981-12-03', 3000,NULL, 20),
                     ( 7934,'MILLER', 'CLERK', 7782, '1982-01-23', 1300,NULL,10);
commit;
select *from employeeinfo;
select *from deptinfo;
Insert into employeeinfo (emp_no, emp_name, job, manager_id, hire_date, salary, comm, dept_no)
              values ( 7309,'SMITHA', 'CLERK', 7902, '1980-12-17', 800,NULL,20);
DELETE FROM employeeinfo WHERE emp_no = 7309;
CREATE TABLE deptinfo
                   ( dept_no int PRIMARY KEY,
                     dept_name varchar(50),
                     location varchar(50));
                     
 INSERT INTO deptinfo (dept_no, dept_name, location)
              VALUES (10, 'ACCOUNTING','NEW YORK'),
					 (20, 'RESEARCH','DALLAS'),
                     (30, 'SALES','CHICAGO'),
                     (40, 'OPERATIONS','BOSTON');
                     
				