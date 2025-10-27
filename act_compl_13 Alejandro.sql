SQL> select apenom from alumnos where dni in (select dni from notas where nota=
  2  (select nota from notas where cod=(select cod from asignaturas where nombre='FOL') and
  3  (select dni from alumnos where apenom = 'D¡az Fern ndez, Mar¡a'));
(select dni from alumnos where apenom = 'D¡az Fern ndez, Mar¡a'))
                                                                *
ERROR at line 3:
ORA-00936: missing expression 


SQL> select dni from alumnos where apenom = 'D¡az Fern ndez, Mar¡a';

DNI                                                                                                                                                   
----------                                                                                                                                            
56882942                                                                                                                                              

SQL> select cod from asignaturas where nombre='FOL';

       COD                                                                                                                                            
----------                                                                                                                                            
         4                                                                                                                                            

SQL> select nota from notas where cod = (select cod from asignaturas where nombre='FOL');

      NOTA                                                                                                                                            
----------                                                                                                                                            
         6                                                                                                                                            
         8                                                                                                                                            



SQL> select nota from notas where cod = (select cod from asignaturas where nombre='FOL') and dni = (select dni from alumnos where apenom = 'D¡az Fern ndez, Mar¡a');

      NOTA                                                                                                                                            
----------                                                                                                                                            
         8                                                                                                                                                                                                                                                                                  

SQL> select apenom from alumnos where dni in (select dni from notas where nota=
  2    2  (select nota from notas where cod=(select cod from asignaturas where nombre='FOL') and
  3  ;
  2  (select nota from notas where cod=(select cod from asignaturas where nombre='FOL') and
     *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> select apenom from alumnos where dni in (select dni from notas where nota=(select nota from notas where cod=(select cod from asignaturas where nombre='FOL') and
  2  dni = (select dni from alumnos where apenom='D¡az Fern ndez, Mar¡a'));
dni = (select dni from alumnos where apenom='D¡az Fern ndez, Mar¡a'))
                                                                    *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> select apenom from alumnos where dni in (select dni from notas where nota=(select nota from notas where cod=(select cod from asignaturas where nombre='FOL') and
  2  dni = (select dni from alumnos where apenom='D¡az Fern ndez, Mar¡a')));

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Cerrato Vela, Luis                                                                                                                                    
D¡az Fern ndez, Mar¡a                                                                                                                                 

SQL> spool off
