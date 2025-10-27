SQL> select apenom from alumnos where pobla='Madrid';

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Alcalde Garc¡a, Elena                                                                                                                                 
Cerrato Vela, Luis                                                                                                                                    

SQL> select * from nota where nota<5;
select * from nota where nota<5
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from notas where nota<5;

DNI               COD       NOTA                                                                                                                      
---------- ---------- ----------                                                                                                                      
4448242             6          4                                                                                                                      

SQL> select apenom from alumnos where pobla='Madrid' and dni in (select dni from notas where nota<5);

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Cerrato Vela, Luis                                                                                                                                    

SQL> spool off
