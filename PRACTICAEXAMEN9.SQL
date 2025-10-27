SQL> SELECT * FROM AULAS;

   CODAULA       ZONA    NUMAULA     CANTPC                                                                                                           
---------- ---------- ---------- ----------                                                                                                           
      1000          1          1         18                                                                                                           
      1010          1          2         18                                                                                                           
      1020          1          3         19                                                                                                           
      1030          1          4         18                                                                                                           
      1040          1          5         18                                                                                                           
      1050          2         16         20                                                                                                           
      1060          2         17         18                                                                                                           
      1070          2         18         18                                                                                                           
      1080          2         19         22                                                                                                           
      1090          2         23         15                                                                                                           
      2000          3         20         25                                                                                                           
      2010          3         23          5                                                                                                           

12 rows selected.

SQL> SELECT NUMAULA, SUM(CANTPC) FROM AULAS GROUP BY NUMAULA;

   NUMAULA SUM(CANTPC)                                                                                                                                
---------- -----------                                                                                                                                
         1          18                                                                                                                                
         2          18                                                                                                                                
        20          25                                                                                                                                
         4          18                                                                                                                                
         5          18                                                                                                                                
        17          18                                                                                                                                
        23          20                                                                                                                                
         3          19                                                                                                                                
        18          18                                                                                                                                
        16          20                                                                                                                                
        19          22                                                                                                                                

11 rows selected.

SQL> SELECT ZONA, SUM(CANTPC) FROM AULAS GROUP BY ZONA;

      ZONA SUM(CANTPC)                                                                                                                                
---------- -----------                                                                                                                                
         1          91                                                                                                                                
         2          93                                                                                                                                
         3          30                                                                                                                                

SQL> SELECT ZONA, SUM(CANTPC) FROM AULAS GROUP BY ZONA HAVING SUM(CANTPC) =
  2  SELECT MIN(SUM(CANTPC)) FROM AULAS GROUP BY ZONA);
SELECT MIN(SUM(CANTPC)) FROM AULAS GROUP BY ZONA)
*
ERROR at line 2:
ORA-00936: missing expression 


SQL> SELECT ZONA, SUM(CANTPC) FROM AULAS GROUP BY ZONA HAVING SUM(CANTPC) =
  2  (SELECT MIN(SUM(CANTPC)) FROM AULAS GROUP BY ZONA);

      ZONA SUM(CANTPC)                                                                                                                                
---------- -----------                                                                                                                                
         3          30                                                                                                                                

SQL> SPOOL OFF
