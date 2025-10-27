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

SQL> SELECT * FROM ALUM MINUS SELECT * FROM ANTIGUOS;

NOMBRE                     EDAD LOCALIDAD                                                                                                             
-------------------- ---------- ---------------                                                                                                       
ANA                          17 ALCAL?                                                                                                                
JUAN                         18 COSLADA                                                                                                               
LUISA                        18 TORREJ?N                                                                                                              
PEDRO                        19 COSLADA                                                                                                               
RAQUEL                       19 TOLEDO                                                                                                                

SQL> SELECT * FROM ANTIGUOS;

NOMBRE                     EDAD LOCALIDAD                                                                                                             
-------------------- ---------- ---------------                                                                                                       
MAR?A                        20 MADRID                                                                                                                
ERNESTO                      21 MADRID                                                                                                                
ANDR?S                       26 LAS ROZAS                                                                                                             
IRENE                        24 LAS ROZAS                                                                                                             

SQL> SELECT * FROM ANTIGUOS MINUS SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                                                                                             
-------------------- ---------- ---------------                                                                                                       
ANDR?S                       26 LAS ROZAS                                                                                                             
IRENE                        24 LAS ROZAS                                                                                                             

SQL> SELECT * FROM ANTIGUOS INTERSECT SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                                                                                             
-------------------- ---------- ---------------                                                                                                       
ERNESTO                      21 MADRID                                                                                                                
MAR?A                        20 MADRID                                                                                                                

SQL> DELETE FROM ALUM WHERE NOMBRE = (SELECT NOMBRE FROM ANTIGUOS INTERSECT SELECT NOMBRE FROM ALUM);
DELETE FROM ALUM WHERE NOMBRE = (SELECT NOMBRE FROM ANTIGUOS INTERSECT SELECT NOMBRE FROM ALUM)
                                 *
ERROR at line 1:
ORA-01427: single-row subquery returns more than one row 


SQL> DELETE FROM ALUM WHERE NOMBRE IN (SELECT NOMBRE FROM ANTIGUOS INTERSECT SELECT NOMBRE FROM ALUM);

2 rows deleted.

SQL> SELECT * FROM ALUM;

NOMBRE                     EDAD LOCALIDAD                                                                                                             
-------------------- ---------- ---------------                                                                                                       
JUAN                         18 COSLADA                                                                                                               
PEDRO                        19 COSLADA                                                                                                               
ANA                          17 ALCAL?                                                                                                                
LUISA                        18 TORREJ?N                                                                                                              
RAQUEL                       19 TOLEDO                                                                                     
SQL> SELECT DEPT_NO FROM DEPART WHERE NOT EXISTS (SELECT DEPT_NO FROM EMPLE WHERE DEPART.DEPT_NO= EMPLE.DEPT_NO);

   DEPT_NO
----------
        40

SQL> DELETE FROM DEPART WHERE DEPT_NO NOT IN
  2  (SELECT DEPT_NO FROM EMPLE WHERE DEPART.DEPT_NO= EMPLE.DEPT_NO);

1 row deleted.

SQL> SELECT * FROM DEPART;

   DEPT_NO DNOMBRE        LOC
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA
        20 INVESTIGACION  MADRID
        30 VENTAS         BARCELONA








SQL> SPOOL OFF
