SQL> SELECT * FROM MISTEXTOS;

TITULO                           AUTOR                  EDITORIAL           PAGINA                                                                    
-------------------------------- ---------------------- --------------- ----------                                                                    
METODOLOG?A DE LA PROGRAMACI?N.  ALCALDE GARC?A         MCGRAWHILL             140                                                                    
"INFORM?TICA B?SICA."            GARC?A GARCER?N        PARANINFO              130                                                                    
SISTEMAS OPERATIVOS              GARC?A STRUCH          OBSBORNE               300                                                                    
SISTEMAS DIGITALES.              RU?Z LOPEZ             PRENTICE HALL          190                                                                    
"MANUAL DE C."                   RU?Z LOPEZ             MCGRAWHILL             340                                                                    

SQL> SELECT RPAD(RTRIM(LTRIM(TITULO,'"'),'."'),40,'-^')"RESULTADO"FROM MISTEXTOS;

RESULTADO                                                                                                                                             
------------------------------------------------------------------------------------------------------------------------------------------------------
METODOLOG?A DE LA PROGRAMACI?N-^-^-^-^-^                                                                                                              
INFORM?TICA B?SICA-^-^-^-^-^-^-^-^-^-^-^                                                                                                              
SISTEMAS OPERATIVOS-^-^-^-^-^-^-^-^-^-^-                                                                                                              
SISTEMAS DIGITALES-^-^-^-^-^-^-^-^-^-^-^                                                                                                              
MANUAL DE C-^-^-^-^-^-^-^-^-^-^-^-^-^-^-                                                                                                              

SQL> SPOOL OFF
