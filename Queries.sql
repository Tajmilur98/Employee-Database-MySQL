--Show table elements
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPENDENT;
SELECT * FROM JOB_HISTORY;


-- 1. distinct : distinct job grades
SELECT DISTINCT(JOB_GRADE) AS DJ FROM JOBS;


-- 2. like : whole manages posts
SELECT job_title AS MANAGERS FROM JOBS 
WHERE job_title LIKE '%Manager%';


--3. Order by desc
SELECT job_id,job_title,max_salary from jobs 
ORDER BY max_salary DESC;


--4. Order by asc
SELECT job_grade,job_title from jobs Order by job_grade;
SELECT employee_id,first_name,salary from employees 
ORDER BY salary,employee_id;


--5. between
SELECT employee_id,first_name, salary from employees 
where salary between 9000 and 20000;

SELECT employee_id,first_name, salary from employees 
where salary not between 9000 and 20000;


--6. in
SELECT first_name, last_name FROM employees 
WHERE salary IN (2800, 4800, 6000);

SELECT first_name, last_name FROM employees 
WHERE salary NOT IN (2800, 4800, 6000);


--7. cond
SELECT department_name,manager_id from departments 
where manager_id>=100 and manager_id<=120;


--8. calc
SELECT first_name,(salary*.05) as comission from employees 
where salary>9999;


--9. average
Select count(*) as total_employee, MIN(salary),MAX(salary),AVG(salary),SUM(salary) from employees;


--10. group by
select job_grade,count(job_id) from jobs group by job_grade;


--11. Having
select job_grade,count(job_id) from jobs group by job_grade having job_grade in('A','B','C','D');



----------------- << LAB-5 NESTED QUERY AND SET OPERATIONS >>-------------


--12. nested query and set operation IN
-- employees' first name whose salary>=6000
select employee_id,first_name from employees
where first_name in(
    select first_name from employees
    where salary >=6000
);


--13. Employee name who works at IT department
select e.employee_id, e.first_name,e.last_name from employees e
where e.employee_id in(
    select e.employee_id 
    from employees e, departments d 
    where e.department_id = d.department_id 
    and   department_name = 'IT'
);


--14. union all
select employee_id,first_name
from employees
where department_id in(60,90)
union all
select e.employee_id, e.first_name
from employees e 
where e.employee_id in(
    select e.employee_id
    from employees e, departments d 
    where e.department_id = d.department_id
    and d.department_id = 90
);


--15. union 
select employee_id,first_name
from employees
where department_id in(60,90)
union 
select e.employee_id, e.first_name
from employees e 
where e.employee_id in(
    select e.employee_id
    from employees e, departments d 
    where e.department_id = d.department_id
    and d.department_id = 90
);


--16. intersect
select employee_id,first_name
from employees
where department_id in(60,90)
intersect 
select e.employee_id, e.first_name
from employees e 
where e.employee_id in(
    select e.employee_id
    from employees e, departments d 
    where e.department_id = d.department_id
    and d.department_id = 90
);


--17. minus
select employee_id,first_name
from employees
where department_id in(60,90)
minus 
select e.employee_id, e.first_name
from employees e 
where e.employee_id in(
    select e.employee_id
    from employees e, departments d 
    where e.department_id = d.department_id
    and d.department_id = 90
);


---------------<< LAB 6 JOIN OPERATIONS >>---------------

--18. Inner join operations
select e.first_name,d.department_name,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;



--19. Join (using join key word)
select dependent_name, first_name,salary
from dependent join employees
using (employee_id);



--20. Natural join
select dependent_name, first_name,salary
from dependent natural join employees;



--21. Left outer join
select dependent_name, first_name,salary
from dependent left outer join employees
using(employee_id);



--22. Right outer join
select  first_name,dependent_name,salary
from dependent right outer join employees
using(employee_id);



--23. Self Join
select e.first_name employee , m.first_name Manager
from employees e join employees m
on e.manager_id = m.employee_id ;



--24. Self Join with left outer
select e.first_name employee , m.first_name Manager
from employees e left outer join employees m
on e.manager_id = m.employee_id ;

------------------- << END OF LAB 2 TO LAB 6 >>---------------------------
--------------------------------------------------------------------------