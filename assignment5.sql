/*ASSIGNMENT 5*/
use test_db ;
select * from assignment5;
/*1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as
<WORKER_NAME>.*/
SELECT 
    first_name AS worker_name
FROM
    assignment5;
/*2. Write an SQL query to fetch “FIRST_NAME” from Worker table in uppercase.*/

SELECT 
    UPPER(first_name)
FROM
    assignment5;

/*3. Write an SQL query to fetch unique values of DEPARTMENT from Workertable.*/
SELECT DISTINCT
    (department)
FROM
    assignment5;

/*4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.*/
SELECT 
    SUBSTRING(first_name, 1, 3)
FROM
    assignment5;

/*5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column
‘Amitabh’ from Worker table.*/
SELECT 
    POSITION('a' IN first_name)
FROM
    assignment5
WHERE
    first_name = 'Amitabh';

/*6. Write an SQL query to print the FIRST_NAME from Worker table after removing white
spaces from the right side.*/
SELECT 
    RTRIM(first_name)
FROM
    assignment5; 

/*7. Write an SQL query to print the DEPARTMENT from Worker table after removing white
spaces from the left side.*/
SELECT 
    LTRIM(department)
FROM
    assignment5;

/*8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table 
and prints its length.*/
SELECT 
    LENGTH(department)
FROM
    assignment5
GROUP BY LENGTH(department);

/*9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with
‘A’.*/

UPDATE assignment5 
SET 
    first_name = REPLACE(first_name, 'a', 'A');
SELECT 
    first_name
FROM
    assignment5;

/*10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a 
single column COMPLETE_NAME. A space char should separatethem.*/
SELECT 
    CONCAT(first_name, ' ', last_name) AS complete_name
FROM
    assignment5;

/*11. Write an SQL query to print all Worker details from the Worker table order by 
FIRST_NAME Ascending.*/
SELECT 
    *
FROM
    assignment5
ORDER BY first_name ASC;

/*12. Write an SQL query to print all Worker details from the Worker table order by 
FIRST_NAME Ascending and DEPARTMENT Descending.*/
SELECT 
    *
FROM
    assignment5
ORDER BY first_name ASC , department DESC;

/*13. Write an SQL query to print details for Workers with the first name as “Vipul” and 
“Satish” from Worker table.*/
SELECT 
    *
FROM
    assignment5
WHERE
    first_name = 'vipul'
        OR first_name = 'satish';

/*14. Write an SQL query to print details of workers excluding first names, “Vipul” and 
“Satish” from Worker table.*/
SELECT 
    *
FROM
    assignment5
WHERE
    first_name <> 'vipul'
        AND first_name <> 'satish';

/*15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.*/
SELECT 
    *
FROM
    assignment5
WHERE
    department = 'admin';

/*16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/
SELECT 
    *
FROM
    assignment5
WHERE
    first_name LIKE '%a%';

/*17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’*/
SELECT 
    *
FROM
    assignment5
WHERE
    first_name LIKE '%a';

/*18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets.*/
SELECT 
    *
FROM
    assignment5
WHERE
    first_name LIKE '%h'
        AND LENGTH(first_name) = 6;

/*19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 
and 500000.*/
SELECT 
    *
FROM
    assignment5
WHERE
    salary BETWEEN 100000 AND 500000;

/*20. Write an SQL query to print details of the Workers who have joined inFeb’2014.*/
SELECT 
    *
FROM
    assignment5
WHERE
    YEAR(joining_date) = 2014
        AND MONTH(joining_date) = 02;

/*21. Write an SQL query to fetch the count of employees working in the department 
‘Admin’.*/
SELECT 
    COUNT(*)
FROM
    assignment5
WHERE
    department = 'admin';

/*22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/
SELECT 
    *
FROM
    assignment5
WHERE
    salary BETWEEN 50000 AND 100000;

/*23. Write an SQL query to fetch the no. of workers for each department in the 
descending order.*/
SELECT 
    COUNT(department), department
FROM
    assignment5
GROUP BY department
ORDER BY COUNT(department) DESC;

/*24. Write an SQL query to show only odd rows from the table.*/

SELECT *
FROM (
      SELECT *, @rowNumber := @rowNumber+ 1 rn
      FROM assignment5
      JOIN (SELECT @rowNumber:= 0) r
     ) t 
WHERE rn % 2 = 1;

/*25. Write an SQL query to show the top 10 records of the table in terms ofsalary.*/
SELECT 
    *
FROM
    assignment5
ORDER BY salary DESC
LIMIT 10;

/*26. Write an SQL query to fetch the list of employees with the samesalary.*/
SELECT * From
 (
 SELECT *, Count(*) Over (Partition by salary) as SalaryCnt
 FROM assignment5
 ) S1
WHERE SalaryCnt>1
ORDER By salary Desc;

/*27. Write an SQL query to show the second highest salary from a table.*/
SELECT 
    *
FROM
    assignment5
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            assignment5)
ORDER BY salary DESC
LIMIT 1;

/*28. Write an SQL query to fetch the departments that have less than five people in it.*/
SELECT 
    department, COUNT(department)
FROM
    assignment5
WHERE
    (SELECT COUNT(department)) < 5
GROUP BY department;

/*29. Write an SQL query to show all departments along with the number of people in 
there.*/
SELECT 
    department, COUNT(department)
FROM
    assignment5
GROUP BY department;

/*30. Write an SQL query to show the last record from a table.*/
SELECT *
FROM (
      SELECT *, (@rowNumber := @rowNumber+ 1)as rn
      FROM assignment5
      JOIN (SELECT @rowNumber:= 0) r
     ) derived_table
order by RN desc
limit 1;
