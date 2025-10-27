SQL> select * from alumnos where pobla = 'Madrid';

DNI        APENOM                         DIREC                          POBLA           TELEF                                                        
---------- ------------------------------ ------------------------------ --------------- ----------                                                   
12344345   Alcalde Garc¡a, Elena          C/Las Matas, 24                Madrid          917766545                                                    
4448242    Cerrato Vela, Luis             C/Mina 28 - 3A                 Madrid          916566545                                                    

SQL> select * from asignaturas where nombre like '%o%o%o%';

       COD NOMBRE                                                                                                                                     
---------- -------------------------                                                                                                                  
         6 Entornos Gr ficos                                                                                                                          

SQL> select * from asignaturas where nombre like '%o%o%o%' and cod in (select cod from notas where dni in
  2  (select dni from alumnos where pobla = 'Madrid');
(select dni from alumnos where pobla = 'Madrid')
                                               *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> select * from asignaturas where nombre like '%o%o%o%' and cod in (select cod from notas where dni in
  2  (select dni from alumnos where pobla = 'Madrid'));

       COD NOMBRE                                                                                                                                     
---------- -------------------------                                                                                                                  
         6 Entornos Gr ficos                                                                                                                          

SQL> spool off
