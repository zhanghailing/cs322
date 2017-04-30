SELECT MAX(count) FROM (SELECT COUNT(ENROLLED.SNUM) AS count ,SNUM AS snum
FROM ENROLLED
GROUP BY ENROLLED.SNUM) table1;

SELECT COUNT(ENROLLED.SNUM) AS count ,SNUM AS snum
FROM ENROLLED
GROUP BY ENROLLED.SNUM;

SELECT snum FROM(SELECT COUNT(ENROLLED.SNUM) AS count ,SNUM AS snum
FROM ENROLLED
GROUP BY ENROLLED.SNUM)
WHERE count=(SELECT MAX(count) FROM (SELECT COUNT(ENROLLED.SNUM) AS count ,SNUM AS snum
FROM ENROLLED
GROUP BY ENROLLED.SNUM) table1);

SELECT SNUM FROM ENROLLED;
SELECT SNUM FROM STUDENT;

SELECT  STUDENT.SNUM AS SNUM1, ENROLLED.SNUM AS SNUM2, STUDENT.SNAME AS NAME
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM;
                             
SELECT * FROM (SELECT  STUDENT.SNUM AS SNUM1,STUDENT.SNAME AS NAME, ENROLLED.SNUM AS SNUM2
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM)
                      WHERE SNUM2 IS NULL;
                      
                      
SELECT * FROM (SELECT  STUDENT.SNUM AS SNUM1, STUDENT.SNAME AS NAME, ENROLLED.SNUM AS SNUM2
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM)
                      WHERE SNUM2 IS NOT NULL;        


                      
SELECT SNUM3 FROM (SELECT  STUDENT.SNUM AS SNUM3, ENROLLED.SNUM AS SNUM4
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM)
                      WHERE SNUM4 IS NOT NULL;
                      
SELECT *
FROM (SELECT * FROM (SELECT  STUDENT.SNUM AS SNUM1, STUDENT.SNAME AS NAME, ENROLLED.SNUM AS SNUM2
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM)
                      WHERE SNUM2 IS NULL)
WHERE SNUM1 NOT IN (SELECT SNUM3 FROM (SELECT  STUDENT.SNUM AS SNUM3, ENROLLED.SNUM AS SNUM4
                             FROM STUDENT
                             LEFT JOIN ENROLLED
                             ON STUDENT.SNUM = ENROLLED.SNUM)
                      WHERE SNUM4 IS NOT NULL);
                      
                      