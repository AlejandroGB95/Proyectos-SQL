SQL> SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                       
-------------------- ---------- ---------------                                 
JUAN                         18 COSLADA                                         
PEDRO                        19 COSLADA                                         
ANA                          17 ALCAL?                                          
LUISA                        18 TORREJ?N                                        
MAR?A                        20 MADRID                                          
ERNESTO                      21 MADRID                                          
RAQUEL                       19 TOLEDO                                          

7 rows selected.

SQL> SELECT * FROM NUEVOS;

NOMBRE                     EDAD LOCALIDAD                                       
-------------------- ---------- ---------------                                 
JUAN                         18 COSLADA                                         
MAITE                        15 ALCAL?                                          
SOF?A                        14 ALCAL?                                          
ANA                          17 ALCALA                                          
ERNESTO                      21 MADRID                                          

SQL> SELECT * FROM NUEVOS MINUS SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                       
-------------------- ---------- ---------------                                 
ANA                          17 ALCALA                                          
MAITE                        15 ALCAL?                                          
SOF?A                        14 ALCAL?                                          

SQL> INSERT INTO ALUM (SELECT * FROM NUEVOS MINUS SELECT * FROM ALUM);

3 rows created.

SQL> SELECT * FROM ALUMN;
SELECT * FROM ALUMN
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                       
-------------------- ---------- ---------------                                 
JUAN                         18 COSLADA                                         
PEDRO                        19 COSLADA                                         
ANA                          17 ALCAL?                                          
LUISA                        18 TORREJ?N                                        
MAR?A                        20 MADRID                                          
ERNESTO                      21 MADRID                                          
RAQUEL                       19 TOLEDO                                          
ANA                          17 ALCALA                                          
MAITE                        15 ALCAL?                                          
SOF?A                        14 ALCAL?                                          

10 rows selected.

SQL> SELECT 2000,'SAAVEDRA',OFICIO,DIR,SYSDATE,SALARIO*1.2,COMISION,DEPT_NO
  2  FROM EMPLE WHERE APELLIDO='SALA';

      2000 'SAAVEDR OFICIO            DIR SYSDATE  SALARIO*1.2   COMISION
---------- -------- ---------- ---------- -------- ----------- ----------
   DEPT_NO
----------
      2000 SAAVEDRA VENDEDOR         7698 21/02/22        1950        650
        30


SQL> SELECT * FROM EMPLE WHERE APELLIDO='SALA';

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION
---------- ---------- ---------- ---------- -------- ---------- ----------
   DEPT_NO
----------
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650
        30


SQL> INSERT INTO EMPLE
  2  SELECT 2000,'SAAVEDRA',OFICIO,DIR,SYSDATE,SALARIO*1.2,COMISION,DEPT_NO
  3  FROM EMPLE WHERE APELLIDO='SALA';

1 row created.







SQL> SPOOL OFF
