CREATE TABLE T_211011700352 (
    Employee_ID    NUMBER PRIMARY KEY,   -- Employee ID
    First_Name     VARCHAR2(50),             -- First Name
    Last_Name      VARCHAR2(50),             -- Last Name
    Email          VARCHAR2(50),            -- Email
    Phone_Number   VARCHAR2(20),             -- Phone Number
    Hire_Date      DATE,                     -- Hire Date
    Job_Name       VARCHAR2(50),             -- Job Name
    Salary         FLOAT              -- Salary with 2 decimal places
);

-- Insert employee data
 INSERT INTO T_211011700352 (Employee_ID, First_NAME, Last_Name, Email, PHONE_NUMBER, hire_date, Job_Name, Salary)
VALUES (1002, 'Sri', 'Mulyati', 'Sri@gmail.com', '081277766601', TO_DATE('08/20/2019', 'MM/DD/YYYY'), 'Admin1', 3500000.90);
    

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1003, 'Ana', 'Rohimah', 'ana@gmail.com', '081277766602', TO_DATE('07/21/2020', 'MM/DD/YYYY'), 'Programer BE', 6500000.20);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1004, 'Dovel', 'Firmanto', 'dovel@gmail.com', '081277766603', TO_DATE('08/22/2019', 'MM/DD/YYYY'), 'Programer FE', 6500000.90);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1005, 'Rizky', 'Febian', 'Rizky@gmail.com', '081277766604', TO_DATE('08/23/2019', 'MM/DD/YYYY'), 'Satpam', 6500000.59);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1006, 'Anya', 'Geraldien', 'ANYA@gmail.com', '081277766605', TO_DATE('08/24/2019', 'MM/DD/YYYY'), 'Database Administrator', 10500000.60);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1007, 'Ahmad', 'Akbar', 'Ahmad@gmail.com', '081277766606', TO_DATE('08/25/2019', 'MM/DD/YYYY'), 'Business Analyst', 9500000.60);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1008, 'Barkah', 'Zidah', 'Barkah@gmail.com', '081277766607', TO_DATE('08/26/2019', 'MM/DD/YYYY'), 'SQA', 8500000.20);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1009, 'Nani', 'Yulia', 'nani@gmail.com', '081277766608', TO_DATE('08/27/2019', 'MM/DD/YYYY'), 'Office Boy', 8000000.60);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (1010, 'Yuni', 'Triani', 'yuni@gmail.com', '081277766609', TO_DATE('08/28/2019', 'MM/DD/YYYY'), 'Admin2', 4500000.60);

INSERT INTO T_211011700352 (Employee_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Name, Salary)
VALUES (211011700352, 'muhammad', 'Fikri', 'muhammad.fikri.200401@gmail.com', '08978223198', TO_DATE('10/07/2024', 'MM/DD/YYYY'), 'Mahasiswa', 4500000.60);


-----------------------NO1

SELECT * FROM T_211011700352;

UPDATE T_211011700352
SET Salary = Salary + 2000000
WHERE Employee_ID = (SELECT Employee_ID FROM T_211011700352 WHERE First_Name = 'muhammad');

SELECT 
    Employee_ID AS "No.", 
    INITCAP(First_Name) || ' ' || LOWER(Last_Name) || ' adalah seorang ' || UPPER(Job_Name) AS "IT TEAM"
FROM 
    T_211011700352;
    
    UPDATE T_211011700352
SET Job_Name = 'Database Administrator'
WHERE Employee_ID = 1006;

SELECT Employee_ID, 
       ROUND(MONTHS_BETWEEN(SYSDATE, Hire_Date)) AS "Sudah Bekerja Selama (Bulan)"
FROM T_211011700352

---------------------------------------------NO.2

SELECT Employee_ID, ------menghitung bonus
       First_Name,
       TO_CHAR(Salary, 'FM999G999G999D00') AS Salary,
       CASE 
           WHEN Salary > 5000000 THEN 
               CASE 
                   WHEN Salary BETWEEN 5000000 AND 6000000 THEN 200000
                   WHEN Salary BETWEEN 6000001 AND 7000000 THEN 100000
                   WHEN Salary BETWEEN 7000001 AND 8000000 THEN 300000
                   WHEN Salary BETWEEN 9000001 AND 10000000 THEN 200000
                   WHEN Salary > 10000000 THEN 400000
                   ELSE 0 
               END
           ELSE 0 
       END AS Bonus
FROM T_211011700352

SELECT Employee_ID, First_Name, ------------------ menampilkan data sesuai 
       'Rp' || TO_CHAR(Salary, '9G999G999D999') AS Salary, 
       TO_CHAR(Bonus, '9G999G999D999') AS Bonus
FROM T_211011700352
WHERE Employee_ID BETWEEN 1002 AND 1010;

SELECT First_Name,  ------output nama nim salry
       Job_Name, 
       TO_CHAR(Bonus, '9G999G999D999') AS Bonus
FROM T_211011700352
WHERE Employee_ID BETWEEN 1002 AND 1010;


SELECT Employee_ID,   ---- tampilkan salry dari id
       TO_CHAR(Salary, 'FM999G999G999D00') AS Salary
FROM T_211011700352;


SELECT Employee_ID,   --------berikan bonus kepada karyawan yang gajinya di ats 5 juta
       ROUND(MONTHS_BETWEEN(SYSDATE, Hire_Date)) AS "Sudah Bekerja Selama (Bulan)", 
       TO_CHAR(Salary, 'FM999G999G999D00') AS Salary,
       CASE 
           WHEN Salary > 5000000 THEN Salary * 0.1 
           ELSE 0 
       END AS Bonus
FROM T_211011700352;