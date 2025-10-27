SQL> DESC AULAS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CODAULA                                   NOT NULL NUMBER(4)
 ZONA                                               NUMBER(1)
 NUMAULA                                            NUMBER(2)
 CANTPC                                             NUMBER(2)

SQL> DESC RESERVAS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DIA                                       NOT NULL NUMBER(2)
 MES                                       NOT NULL NUMBER(2)
 HORA                                      NOT NULL NUMBER(1)
 CODAULA                                   NOT NULL NUMBER(4)
 CODGRUPO                                           VARCHAR2(15)
 DNIPROF                                            VARCHAR2(10)

SQL> SELECT * FROM AULAS WHERE CODAULA NOT IN (SELECT CODAULA FROM RESERVAS)
  2  ;

   CODAULA       ZONA    NUMAULA     CANTPC                                     
---------- ---------- ---------- ----------                                     
      2000          3         20         25                                     
      1090          2         23         15                                     
      1060          2         17         18                                     
      1080          2         19         22                                     
      1050          2         16         20                                     
      1070          2         18         18                                     
      1000          1          1         18                                     
      1040          1          5         18                                     

8 rows selected.

SQL> SELECT * FROM AULAS WHERE CODAULA NOT IN (SELECT CODAULA FROM RESERVAS) ORDER BY CODAULA ASC;

   CODAULA       ZONA    NUMAULA     CANTPC                                     
---------- ---------- ---------- ----------                                     
      1000          1          1         18                                     
      1040          1          5         18                                     
      1050          2         16         20                                     
      1060          2         17         18                                     
      1070          2         18         18                                     
      1080          2         19         22                                     
      1090          2         23         15                                     
      2000          3         20         25                                     

8 rows selected.

SQL> SPOOL OFF
