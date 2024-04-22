-- Database Project on Employee Management System by Tajmilur Rahman (Roll-1807100)

-- Delete the following table if they exist in the 
-- database priviously
DROP TABLE dependent CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE Job_history CASCADE CONSTRAINTS;
DROP TABLE Jobs CASCADE CONSTRAINTS;


--Creation of the table department
CREATE TABLE departments(
     department_id    NUMBER(4)      not null,
     department_name  VARCHAR2(30)   not null,
	 manager_id       NUMBER(6),
     location_id      NUMBER(4),
     primary key (department_id)
    ) ;
    ALTER TABLE departments RENAME COLUMN location_id to loc_id;
    ALTER TABLE departments DROP COLUMN loc_id;
    ALTER TABLE departments ADD location_id VARCHAR2(10);
    ALTER TABLE departments MODIFY location_id NUMBER(4);


--Creation of the table jobs
CREATE TABLE jobs(
     job_id         VARCHAR2(10)   not null,
     job_grade      VARCHAR2(2),
     job_title      VARCHAR2(35)   not null,
     min_salary     NUMBER(6),
     max_salary     NUMBER(6)
    ) ;
ALTER TABLE jobs
ADD ( CONSTRAINT job_id_pK	 PRIMARY KEY(job_id)
    ) ;


--Creation of the table employee
CREATE TABLE employees( 
    employee_id    NUMBER(6),
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25) CONSTRAINT     emp_last_name_nn  NOT NULL, 
    email          VARCHAR2(25) CONSTRAINT     emp_email_nn      NOT NULL,
    phone_number   VARCHAR2(20),
    hire_date      DATE         CONSTRAINT     emp_hire_date_nn  NOT NULL,
    job_id         VARCHAR2(10) CONSTRAINT     emp_job_nn        NOT NULL,
    salary         NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id     NUMBER(6),
    department_id  NUMBER(4),
    CONSTRAINT     emp_salary_min              CHECK (salary > 0),
    CONSTRAINT     emp_email_uk                UNIQUE (email)
    ) ;

ALTER TABLE employees
ADD ( 
    CONSTRAINT     emp_emp_id_pk   PRIMARY KEY (employee_id),
    CONSTRAINT     emp_dept_fk     FOREIGN KEY (department_id) REFERENCES departments,
    CONSTRAINT     emp_job_fk      FOREIGN KEY (job_id)        REFERENCES jobs (job_id),
    CONSTRAINT     emp_manager_fk  FOREIGN KEY (manager_id)    REFERENCES employees
    ) ;

    ------Trigger for table Employees----------------
    
CREATE OR REPLACE TRIGGER check_salary BEFORE INSERT OR UPDATE ON 
employees
FOR EACH ROW
DECLARE
 c_min constant number(8,2) := 1000.0;
 c_max constant number(8,2) := 500000.0;
BEGIN
 IF :new.salary > c_max OR :new.salary < c_min THEN
 RAISE_APPLICATION_ERROR(-20000,'New salary is too small or large');
END IF;
END;
/
  


--Adding some modification to Department table
--ALTER TABLE departments
--ADD ( 
    --CONSTRAINT dept_mgr_fk	 FOREIGN KEY (manager_id)	  REFERENCES employees (employee_id)
    --) ;


--CREATION OF TABLE DEPENDENT
CREATE TABLE DEPENDENT 
(employee_id            NUMBER(6) ,
 DEPENDENT_NAME         VARCHAR2(15),
 SEX                    VARCHAR2(1),
 BDATE                  DATE,
 RELATIONSHIP           VARCHAR2(12),
 PRIMARY KEY (employee_id, dependent_name),
 FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

--Creation of the table JOB_HISTORY
CREATE TABLE job_history( 
    employee_id   NUMBER(6)     CONSTRAINT    jhist_employee_nn     NOT NULL,
    start_date    DATE          CONSTRAINT    jhist_start_date_nn   NOT NULL, 
    end_date      DATE          CONSTRAINT    jhist_end_date_nn     NOT NULL, 
    job_id        VARCHAR2(10)  CONSTRAINT    jhist_job_nn          NOT NULL, 
    department_id NUMBER(4),    CONSTRAINT    jhist_date_interval  CHECK (end_date > start_date)
    ) ;

ALTER TABLE job_history
ADD (
    CONSTRAINT jhist_emp_id_st_date_pk PRIMARY KEY (employee_id, start_date), 
    CONSTRAINT     jhist_job_fk        FOREIGN KEY (job_id)         REFERENCES jobs,
    CONSTRAINT     jhist_emp_fk        FOREIGN KEY (employee_id)    REFERENCES employees,
    CONSTRAINT     jhist_dept_fk       FOREIGN KEY (department_id)  REFERENCES departments
    ) ;



--Describe the tables
DESCRIBE DEPARTMENTS;
DESCRIBE JOBS;
DESCRIBE EMPLOYEES;
DESCRIBE DEPENDENT;
DESCRIBE JOB_HISTORY;