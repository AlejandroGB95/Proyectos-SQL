SQL> select autor , substr(autor,instr(autor,',')+1) "APELLIDO" from libros;

AUTOR                  APELLIDO                                                                                                                       
---------------------- ----------------------------------------------------------------------------------------                                       
CELA, CAMILO JOS?       CAMILO JOS?                                                                                                                   
GORDIMER, NADINE        NADINE                                                                                                                        
G.DELGADO, FERNANDO     FERNANDO                                                                                                                      
MARSE, JUAN             JUAN                                                                                                                          
TORRENTE B., GONZALO    GONZALO                                                                                                                       

SQL> spool off
