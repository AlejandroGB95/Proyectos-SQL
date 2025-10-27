SQL> SELECT NOMBRE, SUBSTR(APELLIDOS,INSTR(APELLIDOS,' ')+1)"SEGUNDO APELLIDO", TRUNC (MONTHS_BETWEEN(SYSDATE,FECHAN)/12) "EDAD",TO_CHAR(SUELDO,'99G999D99')"SUELDO" FROM PROFES,DATOSPROFES WHERE NOMBRE LIKE '%A%'AND PROFES.DNI=DATOSPROFES.DNIPROF(+) ORDER BY TRUNC (MONTHS_BETWEEN(SYSDATE,FECHAN)/12) DESC;

NOMBRE               SEGUNDO APELLIDO                                                                                                                 
-------------------- ------------------------------------------------------------------------------------------------------------------------         
      EDAD SUELDO                                                                                                                                     
---------- ----------                                                                                                                                 
MARIA                LOPEZ                                                                                                                            
        71                                                                                                                                            
                                                                                                                                                      
EUGENIA              SOTO                                                                                                                             
        65                                                                                                                                            
                                                                                                                                                      
ANTONIO              LOPEZ                                                                                                                            
        61     100,00                                                                                                                                 
                                                                                                                                                      
JUAN                 SANCHEZ                                                                                                                          
        59     800,00                                                                                                                                 
                                                                                                                                                      
ANA                  LOPEZ                                                                                                                            
        58     700,00                                                                                                                                 
                                                                                                                                                      
LUISA                LOPEZ                                                                                                                            
        57     500,00                                                                                                                                 
                                                                                                                                                      
FERNANDO             FERNANDEZ                                                                                                                        
        56                                                                                                                                            
                                                                                                                                                      
ANA                  MENA                                                                                                                             
        56                                                                                                                                            
                                                                                                                                                      
ALBERTO              MENA                                                                                                                             
        51                                                                                                                                            
                                                                                                                                                      
ADRIANA              GONZALEZ                                                                                                                         
        41                                                                                                                                            
                                                                                                                                                      
EDUARDO              LARA                                                                                                                             
        36                                                                                                                                            
                                                                                                                                                      

11 rows selected.

SQL> SPOOL OFF
