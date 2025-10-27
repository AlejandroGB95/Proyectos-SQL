SQL> SELECT AVG(SALARIO),COUNT (COMISION), MAX(SALARIO), MIN (SALARIO) FROM EMPLE WHERE DEPT_NO=30;

AVG(SALARIO) COUNT(COMISION) MAX(SALARIO) MIN(SALARIO)                                                                                                
------------ --------------- ------------ ------------                                                                                                
  1735,83333               4         3005         1335                                                                                                

SQL> SELECT ROUND(AVG(SALARIO),2)"SUELDO MEDIO",COUNT (COMISION)"COMISIONES", MAX(SALARIO)"SALARIO MAXIMO", MIN (SALARIO)"SALARIO MINIMO" FROM EMPLE WHERE DEPT_NO=30;

SUELDO MEDIO COMISIONES SALARIO MAXIMO SALARIO MINIMO                                                                                                 
------------ ---------- -------------- --------------                                                                                                 
     1735,83          4           3005           1335                                                                                                 

SQL> SPOOL OFF
