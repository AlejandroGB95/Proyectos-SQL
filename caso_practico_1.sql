SQL> select apellido, salario , abs(salario-10000) from emple;

APELLIDO      SALARIO ABS(SALARIO-10000)                                        
---------- ---------- ------------------                                        
SANCHEZ          1040               8960                                        
ARROYO           1500               8500                                        
SALA             1625               8375                                        
JIMENEZ          2900               7100                                        
MARTIN           1600               8400                                        
NEGRO            3005               6995                                        
CEREZO           2885               7115                                        
GIL              3000               7000                                        
REY              4100               5900                                        
TOVAR            1350               8650                                        
ALONSO           1430               8570                                        

APELLIDO      SALARIO ABS(SALARIO-10000)                                        
---------- ---------- ------------------                                        
JIMENO           1335               8665                                        
FERNANDEZ        3000               7000                                        
MU¥OZ            1690               8310                                        

14 rows selected.

SQL> CREATE TABLE DUAL (
  2   DUMMY VARCHAR2(1)
  3  );

Table created.

SQL> COMMIT
  2  ;

Commit complete.

SQL> SELECT CEIL(20.3), CEIL(16), CELL (-20.3), CEIL (-16) FROM DUAL;
SELECT CEIL(20.3), CEIL(16), CELL (-20.3), CEIL (-16) FROM DUAL
                             *
ERROR at line 1:
ORA-00904: "CELL": invalid identifier 


SQL> SELECT CEIL(20.3), CEIL(16), CEIL (-20.3), CEIL (-16) FROM DUAL;

no rows selected

SQL> desc dual;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DUMMY                                              VARCHAR2(1)

SQL> INSERT INTO DUAL VALUES('X');

1 row created.

SQL> SELECT CEIL(20.3), CEIL(16), CEIL (-20.3), CEIL (-16) FROM DUAL;

CEIL(20.3)   CEIL(16) CEIL(-20.3)  CEIL(-16)                                    
---------- ---------- ----------- ----------                                    
        21         16         -20        -16                                    

SQL> SELECT FLOOR(20.3), FLOOR(16), FLOOR (-20.3), FLOOR (-16) FROM DUAL;

FLOOR(20.3)  FLOOR(16) FLOOR(-20.3) FLOOR(-16)                                  
----------- ---------- ------------ ----------                                  
         20         16          -21        -16                                  

SQL> SELECT MOD (11,4), MOD(10-15), (-10,-3), MOD (10.4,4.5) FROM DUAL;
SELECT MOD (11,4), MOD(10-15), (-10,-3), MOD (10.4,4.5) FROM DUAL
                   *
ERROR at line 1:
ORA-00909: invalid number of arguments 


SQL> SELECT MOD (11,4), MOD(10,-15), (-10,-3), MOD (10.4,4.5) FROM DUAL;
SELECT MOD (11,4), MOD(10,-15), (-10,-3), MOD (10.4,4.5) FROM DUAL
                                    *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> SELECT MOD (11,4), MOD(10,-15), MOD(-10,-3), MOD (10.4,4.5) FROM DUAL;

 MOD(11,4) MOD(10,-15) MOD(-10,-3) MOD(10.4,4.5)                                
---------- ----------- ----------- -------------                                
         3          10          -1           1,4                                

SQL> SELECT SALARIO, COMISION, SALARIO+COMISION FROM EMPLE;

   SALARIO   COMISION SALARIO+COMISION                                          
---------- ---------- ----------------                                          
      1040                                                                      
      1500        390             1890                                          
      1625        650             2275                                          
      2900                                                                      
      1600       1020             2620                                          
      3005                                                                      
      2885                                                                      
      3000                                                                      
      4100                                                                      
      1350          0             1350                                          
      1430                                                                      

   SALARIO   COMISION SALARIO+COMISION                                          
---------- ---------- ----------------                                          
      1335                                                                      
      3000                                                                      
      1690                                                                      

14 rows selected.

SQL> SELECT SALARIO, COMISION, SALARIO+NVL(COMISION,0)FROM EMPLE;

   SALARIO   COMISION SALARIO+NVL(COMISION,0)                                   
---------- ---------- -----------------------                                   
      1040                               1040                                   
      1500        390                    1890                                   
      1625        650                    2275                                   
      2900                               2900                                   
      1600       1020                    2620                                   
      3005                               3005                                   
      2885                               2885                                   
      3000                               3000                                   
      4100                               4100                                   
      1350          0                    1350                                   
      1430                               1430                                   

   SALARIO   COMISION SALARIO+NVL(COMISION,0)                                   
---------- ---------- -----------------------                                   
      1335                               1335                                   
      3000                               3000                                   
      1690                               1690                                   

14 rows selected.

SQL> SELECT SALARIO, COMISION, SALARIO+NVL(COMISION,0)"SALARIO BRUTO" FROM EMPLE;

   SALARIO   COMISION SALARIO BRUTO                                             
---------- ---------- -------------                                             
      1040                     1040                                             
      1500        390          1890                                             
      1625        650          2275                                             
      2900                     2900                                             
      1600       1020          2620                                             
      3005                     3005                                             
      2885                     2885                                             
      3000                     3000                                             
      4100                     4100                                             
      1350          0          1350                                             
      1430                     1430                                             

   SALARIO   COMISION SALARIO BRUTO                                             
---------- ---------- -------------                                             
      1335                     1335                                             
      3000                     3000                                             
      1690                     1690                                             

14 rows selected.

SQL> SELECT POWER (2,4), POWER(2,-4), POWER(3.5,2.4), POWER(4.5,2)FROM DUAL;

POWER(2,4) POWER(2,-4) POWER(3.5,2.4) POWER(4.5,2)                              
---------- ----------- -------------- ------------                              
        16       ,0625     20,2191692        20,25                              

SQL> SELECT POWER (2,4), POWER(2,-4), POWER(3.5,2.4), POWER(-4.5,-2)FROM DUAL;

POWER(2,4) POWER(2,-4) POWER(3.5,2.4) POWER(-4.5,-2)                            
---------- ----------- -------------- --------------                            
        16       ,0625     20,2191692     ,049382716                            

SQL> SELECT POWER (2,4), POWER(2,-4), POWER(-3.5,-2.4), POWER(-4.5,2)FROM DUAL;
SELECT POWER (2,4), POWER(2,-4), POWER(-3.5,-2.4), POWER(-4.5,2)FROM DUAL
                                       *
ERROR at line 1:
ORA-01428: argument '-3.5' is out of range 


SQL> SELECT POWER (2,4), POWER(2,-4), POWER(3.5,-2.4), POWER(-4.5,-2)FROM DUAL;

POWER(2,4) POWER(2,-4) POWER(3.5,-2.4) POWER(-4.5,-2)                           
---------- ----------- --------------- --------------                           
        16       ,0625      ,049458016     ,049382716                           

SQL> SELECT ROUND (1.56,1), ROUND (1.56), ROUND (1.2234,2), ROUND (1.2676,3) FROM DUAL;

ROUND(1.56,1) ROUND(1.56) ROUND(1.2234,2) ROUND(1.2676,3)                       
------------- ----------- --------------- ---------------                       
          1,6           2            1,22           1,268                       

SQL> SELECT ROUND (145.5,-1), ROUND(145.5,-2), ROUND (145.5,-3), ROUND (141,-1), ROUND (145,-1) FROM DUAL;

ROUND(145.5,-1) ROUND(145.5,-2) ROUND(145.5,-3) ROUND(141,-1) ROUND(145,-1)     
--------------- --------------- --------------- ------------- -------------     
            150             100               0           140           150     

SQL> SELECT SIGN (-10), SIGN(10) FROM DUAL;

 SIGN(-10)   SIGN(10)                                                           
---------- ----------                                                           
        -1          1                                                           

SQL> SELECT SQRT(25), SQRT(25.6) FROM DUAL;

  SQRT(25) SQRT(25.6)                                                           
---------- ----------                                                           
         5 5,05964426                                                           

SQL> SELECT TRUNC(1.5634,1), TRUNC(1.1684,2), TRUNC (1.662) FROM DUAL;

TRUNC(1.5634,1) TRUNC(1.1684,2) TRUNC(1.662)                                    
--------------- --------------- ------------                                    
            1,5            1,16            1                                    

SQL> SELECT TRUNC (187.98,-1) TRUNC (187.98,-2), TRUNC (187.98,-3) FROM DUAL;
SELECT TRUNC (187.98,-1) TRUNC (187.98,-2), TRUNC (187.98,-3) FROM DUAL
                               *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT TRUNC (187.98,-1), TRUNC (187.98,-2), TRUNC (187.98,-3) FROM DUAL;

TRUNC(187.98,-1) TRUNC(187.98,-2) TRUNC(187.98,-3)                              
---------------- ---------------- ----------------                              
             180              100                0                              

SQL> SPOOL OFF
