
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