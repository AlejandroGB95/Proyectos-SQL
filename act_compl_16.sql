SQL> select apenom from alumnos where not exists (select dni from notas where notas.dni=alumnos.dni and cod=1);

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Cerrato Vela, Luis                                                                                                                                    
D¡az Fern ndez, Mar¡a                                                                                                                                 

SQL> select apenom from alumnos where dni not in (select dni from notas where cod=1);

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Cerrato Vela, Luis                                                                                                                                    
D¡az Fern ndez, Mar¡a                                                                                                                                 

SQL> spool off
