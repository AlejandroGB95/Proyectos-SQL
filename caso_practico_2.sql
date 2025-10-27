SQL> select avg(salario) from emple where dept_no=10;

AVG(SALARIO)                                                                                                                                          
------------                                                                                                                                          
  2891,66667                                                                                                                                          

SQL> select count(*) from emple;

  COUNT(*)                                                                                                                                            
----------                                                                                                                                            
        14                                                                                                                                            

SQL> select count(comision) from emple;

COUNT(COMISION)                                                                                                                                       
---------------                                                                                                                                       
              4                                                                                                                                       

SQL> select max(salario)from emple;

MAX(SALARIO)                                                                                                                                          
------------                                                                                                                                          
        4100                                                                                                                                          

SQL> select max(apellido) from emple;

MAX(APELLI                                                                                                                                            
----------                                                                                                                                            
TOVAR                                                                                                                                                 

SQL> select apellido, salario from emple where salario=(select max(salario) from emple);

APELLIDO      SALARIO                                                                                                                                 
---------- ----------                                                                                                                                 
REY              4100                                                                                                                                 

SQL> select min(salario)from emple;

MIN(SALARIO)                                                                                                                                          
------------                                                                                                                                          
        1040                                                                                                                                          

SQL> select apellido, salario from emple where salario=(select min(salario) from emple);

APELLIDO      SALARIO                                                                                                                                 
---------- ----------                                                                                                                                 
SANCHEZ          1040                                                                                                                                 

SQL> selec sum(salario) from emple;
SP2-0734: unknown command beginning "selec sum(..." - rest of line ignored.
SQL> select sum(salario) from emple;

SUM(SALARIO)                                                                                                                                          
------------                                                                                                                                          
       30460                                                                                                                                          

SQL> select variance(salario) from emple;

VARIANCE(SALARIO)                                                                                                                                     
-----------------                                                                                                                                     
       872226,374                                                                                                                                     

SQL> spool off
