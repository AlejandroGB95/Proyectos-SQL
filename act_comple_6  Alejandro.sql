SQL> select apellido, salario from emple where salario > (select max(salario) from emple where dept_no=20);

APELLIDO      SALARIO                                                                                                                                 
---------- ----------                                                                                                                                 
NEGRO            3005                                                                                                                                 
REY              4100                                                                                                                                 

SQL> spool off
