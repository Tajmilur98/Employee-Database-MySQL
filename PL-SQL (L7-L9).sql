--25. Find Maximum salay of employees in pl/sql
--    Basic Syntax 

SET SERVEROUTPUT ON

DECLARE
Employee_name employees.first_name%type;
max_salary employees.salary%type;

BEGIN
SELECT Max(salary) into max_salary FROM EMPLOYEES;
SELECT first_name into Employee_name  FROM   EMPLOYEES WHERE salary = max_salary;
DBMS_OUTPUT.PUT_LINE(Employee_name|| ' earns to maximum salary ' || max_salary);

END;
/

--26. Assignment and Conditions
--    Find the employee name and his department name who has the maximum salary in grade B employees 
SET SERVEROUTPUT ON

DECLARE
Employee_name employees.first_name%type;
Rank          jobs.job_grade%type;
Dept          departments.department_name%type;
Max_sal       employees.salary%type;
Bonus         employees.salary%type;

BEGIN
Rank:= 'B';

select max(salary) into Max_sal
from employees 
where salary in(
    select salary from 
    employees e, jobs j
    where e.job_id = j.job_id and job_grade = Rank
);
--DBMS_OUTPUT.PUT_LINE(Max_sal);


select first_name into Employee_name
from employees 
where salary = Max_sal;
--DBMS_OUTPUT.PUT_LINE(Employee_name);

select d.department_name into Dept
from departments d, employees e
where e.department_id = d.department_id and e.first_name = Employee_name;

--DBMS_OUTPUT.PUT_LINE(Dept);

IF Max_sal < 10000  THEN Bonus:= Max_sal*0.04;
ELSIF Max_sal >= 10000 AND Max_sal<1200 THEN Bonus:= Max_sal*0.05;
ELSE Bonus:= Max_sal*0.06;
END IF;

DBMS_OUTPUT.PUT_LINE(Employee_name || ' of ' ||Dept|| ' Department gets Maximum Bonus of grade B '|| Bonus );

EXCEPTION
 WHEN others THEN
 DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW errors



--30. LOOP
SET SERVEROUTPUT ON
DECLARE
    counter   NUMBER(4) := 100;
    name employees.first_name%type;
    salary employees.salary%type;
BEGIN
    
    LOOP
         select first_name into name from employees where employee_id = counter;
         select employees.salary into salary from employees where employee_id = counter;
         counter:= counter + 1;

        DBMS_OUTPUT.PUT_LINE(NAME || '  GETS SALARY ' || SALARY);

         EXIT WHEN counter > 108;

    END LOOP;
END;
/

--31. FOR LOOP
SET SERVEROUTPUT ON
DECLARE
    counter   NUMBER(4) := 100;
    name employees.first_name%type;
    salary employees.salary%type;
BEGIN
    
    FOR COUNTER IN 100..107
    LOOP
        select first_name into name from employees where employee_id = counter;
        select employees.salary into salary from employees where employee_id = counter;
        DBMS_OUTPUT.PUT_LINE(NAME || '  GETS SALARY ' || SALARY);

    END LOOP;
END;
/

--32. WHILE LOOP
SET SERVEROUTPUT ON
DECLARE
    counter   NUMBER(4) := 100;
    name employees.first_name%type;
    salary employees.salary%type;
BEGIN
    
    WHILE COUNTER < 108
    LOOP
        select first_name into name from employees where employee_id = counter;
        select employees.salary into salary from employees where employee_id = counter;
        DBMS_OUTPUT.PUT_LINE(NAME || '  GETS SALARY ' || SALARY);
        counter := counter+1;

    END LOOP;
END;
/

--33. CURSOR
SET SERVEROUTPUT ON

DECLARE
CURSOR emp_cursor IS SELECT employee_id,first_name,last_name
FROM EMPLOYEES;
emp_record emp_cursor%ROWTYPE;

BEGIN
OPEN emp_cursor;
LOOP
    FETCH emp_cursor INTO emp_record;
    EXIT WHEN emp_cursor%ROWCOUNT >5;
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id  || '   ' || emp_record.first_name||' ' || emp_record.last_name);
END LOOP;
CLOSE emp_cursor;

END;
/

--34. Procedure without parameters
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE getemp IS 
 emp_id employees.employee_id%type;
 fname employees.first_name%type;

BEGIN
 emp_id := 107;
 SELECT first_name INTO fname
 FROM EMPLOYEES
 WHERE employee_id = emp_id;
 DBMS_OUTPUT.PUT_LINE('First name: '||fname);
END;
/
SHOW ERRORS;

BEGIN
 getemp;
END;
/

--35. Procedures with parameters 

CREATE OR REPLACE PROCEDURE add_job (
 jobid jobs.job_id%TYPE,
 jobtitle jobs.job_title%TYPE) IS
BEGIN
 INSERT INTO jobs (job_id,job_grade, job_title,min_salary,max_salary)
 VALUES (jobid,'A', jobtitle,12000,24000);
 COMMIT;
END add_job;
/
SHOW ERRORS

BEGIN
 add_job('M_D','Managing_Director');
END;
/

--36. Functions 
CREATE OR REPLACE FUNCTION get_annual_comp(
 sal IN employees.salary%TYPE,
 comm IN employees.commission_pct%TYPE)
RETURN NUMBER IS
BEGIN
 RETURN (NVL(sal,0) * 12 + (NVL(comm,0) * nvl(sal,0) * 12));
END get_annual_comp;
/

SELECT employee_id, first_name,
get_annual_comp(salary,commission_pct) "Annual Compensation"
FROM employees
WHERE department_id=90;



--------------------------<<< LAB-9  >>>---------------------------------------------
--_________________________________________________________________________________--

--- Trigger is in the Table creation file after creating the EMPLOYEES table--------




-------- DATE --------
SELECT SYSDATE FROM DUAL;
SELECT CURRENT_DATE FROM DUAL;
SELECT systimestamp FROM DUAL;

-----ADD MONTH------
SELECT employee_id, job_id, ADD_MONTHS (end_date,6) AS Six_months_Extension
FROM job_history;

----- Greatest----
SET SERVEROUTPUT ON
DECLARE
date1 job_history.start_date%type;
date2 job_history.start_date%type;
date3 job_history.start_date%type;
emp_id job_history.employee_id%type;

BEGIN
    select start_date into date1 from job_history where employee_id=102;
    select start_date into date2 from job_history where employee_id=114;
    
    select Greatest(date2,date1) into date3 from dual;
    select employee_id into emp_id from job_history where start_date = date3;
    DBMS_OUTPUT.PUT_LINE('Employee with id '||emp_id||' is junior. He started his job on '||date3);

    select LEAST(date2,date1) into date3 from dual;
    select employee_id into emp_id from job_history where start_date = date3;
    DBMS_OUTPUT.PUT_LINE('Employee with id '||emp_id||' senior. He started his job on '||date3);

end;
/

------LAST DAY------
--SELECT LAST_DAY (end_date) as last_left
--FROM job_history;

----- Extract year ----

SET SERVEROUTPUT ON
DECLARE
    year1 number(10,5);
    year2 number(10,5);
    

BEGIN
    SELECT EXTRACT(Year FROM start_date) INTO year1 FROM job_history where employee_id = 102;
    SELECT EXTRACT(Year FROM end_date) INTO year2 From job_history where employee_id = 102;

    DBMS_OUTPUT.PUT_LINE('Employee with id number 102 worked '||(year2-year1)||' years.');

END;
/

---extract2
SELECT employee_id, EXTRACT(Month FROM start_date) AS JOIN_MONTH
FROM job_history;
