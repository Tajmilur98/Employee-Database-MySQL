--Insert into department table
INSERT INTO departments VALUES ( 10, 'Administration', 200, 1700);
INSERT INTO departments VALUES ( 20, 'Marketing', 201, 1800);                        
INSERT INTO departments VALUES ( 30, 'Purchasing', 114, 1700);            
INSERT INTO departments VALUES ( 40, 'Human Resources', 203, 2400);
INSERT INTO departments VALUES ( 50, 'Shipping', 121, 1500);        
INSERT INTO departments VALUES ( 60, 'IT', 103, 1400);        
INSERT INTO departments VALUES ( 70, 'Public Relations', 204, 2700);        
INSERT INTO departments VALUES ( 80, 'Sales' , 145, 2500);
INSERT INTO departments VALUES ( 90 , 'Executive', 100, 1700);
INSERT INTO departments VALUES ( 100, 'Finance', 108, 1700);        
INSERT INTO departments VALUES ( 110, 'Accounting' , 205 , 1700);
INSERT INTO departments VALUES ( 120, 'Management' , 211 , 1700);



--DELETE AND UPDATE ROWS
UPDATE DEPARTMENTS SET department_name='Construction' WHERE department_id=120;
DELETE FROM DEPARTMENTS WHERE department_id>110;



--Inserting data into JOBs table
INSERT INTO jobs VALUES ( 'AD_ASST','C', 'Administration Assistant', 3000, 6000);
INSERT INTO jobs VALUES ( 'FI_MGR', 'B','Finance Manager', 8200, 16000);
INSERT INTO jobs VALUES ( 'FI_ACCOUNT', 'C', 'Accountant', 4200, 9000);
INSERT INTO jobs VALUES ( 'AC_MGR', 'B', 'Accounting Manager', 8200, 16000);
INSERT INTO jobs VALUES ( 'AC_ACCOUNT', 'C', 'Public Accountant', 4200, 9000);
INSERT INTO jobs VALUES ( 'SA_MAN', 'B', 'Sales Manager', 10000, 20000);
INSERT INTO jobs VALUES ( 'SA_REP', 'D', 'Sales Representative', 6000, 12000);
INSERT INTO jobs VALUES ( 'PU_MAN', 'B','Purchasing Manager', 8000, 15000);
INSERT INTO jobs VALUES ( 'PU_CLERK','F', 'Purchasing Clerk', 2500, 5500);
INSERT INTO jobs VALUES ( 'ST_MAN','B', 'Stock Manager', 5500, 8500);
INSERT INTO jobs VALUES ( 'ST_CLERK','F', 'Stock Clerk', 2000, 5000);
INSERT INTO jobs VALUES ( 'SH_CLERK','F', 'Shipping Clerk', 2500, 5500);
INSERT INTO jobs VALUES ( 'IT_PROG','B', 'Programmer', 4000, 10000);
INSERT INTO jobs VALUES ( 'MK_MAN','B', 'Marketing Manager', 9000, 15000);
INSERT INTO jobs VALUES ( 'MK_REP','E', 'Marketing Representative', 4000, 9000);
INSERT INTO jobs VALUES ( 'HR_REP','E', 'Human Resources Representative', 4000, 9000);
INSERT INTO jobs VALUES ( 'PR_REP','E', 'Public Relations Representative', 4500, 10500);
INSERT INTO jobs VALUES ( 'AD_PRES','A', 'President', 20000, 40000);
INSERT INTO jobs VALUES ( 'AD_VP','A', 'Administration Vice President', 15000, 30000);


--inserting into employee table
INSERT INTO employees VALUES ( 100, 'Taj', 'milur', 'TAJMILUR', '515.123.4567', TO_DATE('17-JUN-1987', 'dd-MON-yyyy'), 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO employees VALUES ( 101, 'Shejuti', 'Shaha', 'SSHAHA', '515.123.4568', TO_DATE('21-SEP-1989', 'dd-MON-yyyy'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES ( 102, 'Mazhar', 'Islam', 'MISLAM', '515.123.4569', TO_DATE('13-JAN-1993', 'dd-MON-yyyy'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES ( 103, 'Rifat', 'Babu', 'RBABU', '590.423.4567', TO_DATE('03-JAN-1990', 'dd-MON-yyyy'), 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO employees VALUES ( 104, 'Shihab', 'Babu', 'SBABU', '590.423.4568', TO_DATE('21-MAY-1991', 'dd-MON-yyyy'), 'IT_PROG', 6000, NULL, 103, 60);
INSERT INTO employees VALUES ( 105, 'Kowshik', 'Khan', 'KKHAN', '590.423.4569', TO_DATE('25-JUN-1997', 'dd-MON-yyyy'), 'IT_PROG', 4800, NULL, 103, 60);
INSERT INTO employees VALUES ( 106, 'Uday', 'Roy', 'UROY', '590.423.4560', TO_DATE('05-FEB-1998', 'dd-MON-yyyy'), 'IT_PROG', 4800, NULL, 103, 60);
INSERT INTO employees VALUES ( 107, 'Amdad', 'BRO', 'ABRO', '590.423.5567', TO_DATE('07-FEB-1999', 'dd-MON-yyyy'), 'IT_PROG', 4200, NULL, 103, 60);
INSERT INTO employees VALUES ( 108, 'Anu', 'Oishe', 'AOISHE', '515.124.4569', TO_DATE('17-AUG-1994', 'dd-MON-yyyy'), 'FI_MGR', 12000, NULL, 101, 100);
INSERT INTO employees VALUES ( 113 , 'Mobarak' , 'Mamun' , 'MMAMUN' , '515.124.4567' , TO_DATE('07-DEC-1999', 'dd-MON-yyyy') , 'FI_ACCOUNT' , 690 , NULL , 108 , 100 );
INSERT INTO employees VALUES ( 114, 'Mishu', 'Boddo', 'MBODDO', '515.127.4561', TO_DATE('07-DEC-1994', 'dd-MON-yyyy'), 'PU_MAN', 11000, NULL, 100, 30);
INSERT INTO employees VALUES ( 115, 'Borsha', 'Balika', 'BBALIKA', '515.127.4562', TO_DATE('18-MAY-1995', 'dd-MON-yyyy'), 'PU_CLERK', 3100, NULL, 114, 30);
INSERT INTO employees VALUES ( 116, 'Tuna', 'Fairuz', 'TBALIKA', '515.127.4563', TO_DATE('24-DEC-1997', 'dd-MON-yyyy'), 'PU_CLERK', 2900, NULL, 114, 30);
INSERT INTO employees VALUES ( 117, 'Mahim', 'CG4', 'MCG4', '515.127.4564', TO_DATE('24-JUL-1997', 'dd-MON-yyyy'), 'PU_CLERK', 2800, NULL, 114, 30);
INSERT INTO employees VALUES ( 118, 'Mou', 'Sanjida', 'MOUSAN', '515.127.4565', TO_DATE('15-NOV-1998', 'dd-MON-yyyy'), 'PU_CLERK', 2600, NULL, 114, 30);
INSERT INTO employees VALUES ( 119, 'Rafi', 'Mahmud', 'RMAHMUD', '515.127.4566', TO_DATE('10-AUG-1999', 'dd-MON-yyyy'), 'PU_CLERK', 2500, NULL, 114, 30);
INSERT INTO employees VALUES ( 120, 'Minu', 'Valomeye', 'MVALOMEYE', '650.123.1234', TO_DATE('18-JUL-1996', 'dd-MON-yyyy'), 'ST_MAN', 8000, NULL, 100, 50);


--insertion into JOB HISTORY table
INSERT INTO job_history VALUES (102, TO_DATE('13-JAN-1993', 'dd-MON-yyyy') ,TO_DATE('24-JUL-1998', 'dd-MON-yyyy'), 'IT_PROG', 60);
INSERT INTO job_history VALUES (101, TO_DATE('21-SEP-1989', 'dd-MON-yyyy'), TO_DATE('27-OCT-1993', 'dd-MON-yyyy'), 'AC_ACCOUNT', 110);
INSERT INTO job_history VALUES (101, TO_DATE('28-OCT-1993', 'dd-MON-yyyy'), TO_DATE('15-MAR-1997', 'dd-MON-yyyy'), 'AC_MGR', 110);
INSERT INTO job_history VALUES (114, TO_DATE('24-MAR-1998', 'dd-MON-yyyy'), TO_DATE('31-DEC-1999', 'dd-MON-yyyy'), 'ST_CLERK', 50);



--inserting into dependent table
INSERT INTO DEPENDENT VALUES (101,'ALICE','F','05-APR-1976','DAUGHTER') ;
INSERT INTO DEPENDENT VALUES (102,'THEODORE','M','25-OCT-1973','SON')  ;
INSERT INTO DEPENDENT VALUES (102,'JOY','F','03-MAY-1948','SPOUSE');
INSERT INTO DEPENDENT VALUES (102,'MICHAEL','M','01-JAN-1978','SON');
INSERT INTO DEPENDENT VALUES (103,'ALICE','F','31-DEC-1978','DAUGHTER');
INSERT INTO DEPENDENT VALUES (106,'ELIZABETH','F','05-MAY-1957','SPOUSE');
INSERT INTO DEPENDENT VALUES (107,'ABNER','M','26-FEB-1932','SPOUSE');
Commit;
DELETE FROM DEPENDENT;
ROLLBACK;
INSERT INTO DEPENDENT VALUES (104,'RICHARD','M','25-OCT-1979','SON')  ;
SAVEPOINT  cont_8;
INSERT INTO DEPENDENT VALUES (104,'MONICA','F','21-OCT-1977','DAUGHTER')  ;
SAVEPOINT cont_9;

ROLLBACK to cont_8;


---Creating view
CREATE OR REPLACE VIEW High_Salary_Employee
AS SELECT first_name,last_name,salary
FROM employees
Where salary>10000;

SELECT * FROM High_Salary_Employee;