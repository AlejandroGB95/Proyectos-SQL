SQL> select ascii('A') from dual;

ASCII('A')                                                                                                                                            
----------                                                                                                                                            
        65                                                                                                                                            

SQL> select ascii('a') from dual;

ASCII('A')                                                                                                                                            
----------                                                                                                                                            
        97                                                                                                                                            

SQL> select instr('II VUELTA CICLISTA A TALAVERA','A',-1)"EJEMPLO" FROM DUAL;

   EJEMPLO                                                                                                                                            
----------                                                                                                                                            
        29                                                                                                                                            

SQL> SELECT AUTOR, INSTR(AUTOR,'A',1,2) FROM MISTEXTOS;

AUTOR                  INSTR(AUTOR,'A',1,2)                                                                                                           
---------------------- --------------------                                                                                                           
ALCALDE GARC?A                            4                                                                                                           
GARC?A GARCER?N                           6                                                                                                           
GARC?A STRUCH                             6                                                                                                           
RU?Z LOPEZ                                0                                                                                                           
RU?Z LOPEZ                                0                                                                                                           

SQL> SELECT TITULO, LENGTH (TITULO), AUTOR, LENGTH(AUTOR) FROM MISTEXTOS;

TITULO                           LENGTH(TITULO) AUTOR                  LENGTH(AUTOR)                                                                  
-------------------------------- -------------- ---------------------- -------------                                                                  
METODOLOG?A DE LA PROGRAMACI?N.              31 ALCALDE GARC?A                    14                                                                  
"INFORM?TICA B?SICA."                        21 GARC?A GARCER?N                   15                                                                  
SISTEMAS OPERATIVOS                          19 GARC?A STRUCH                     13                                                                  
SISTEMAS DIGITALES.                          19 RU?Z LOPEZ                        10                                                                  
"MANUAL DE C."                               14 RU?Z LOPEZ                        10                                                                  

SQL> SPOOL OFF
