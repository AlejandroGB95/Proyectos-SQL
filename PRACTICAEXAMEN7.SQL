SQL> SELECT * FROM INCIDENCIAS;

   NUM_INC        DIA        MES       HORA DNI_PROF   COD_GRUPO             ZONA       AULA ORDENADOR_NUM  COD_FALLO G                               
---------- ---------- ---------- ---------- ---------- --------------- ---------- ---------- ------------- ---------- -                               
         1          6          6          1 24398202-B 1ESOB                    1          1             4          7 S                               
         2          7          6          1 24398202-B 1ESOB                    1          1             5          3 S                               
         3          8          6          2 25123890-A 1ESOC                    1          3             4          6 S                               
         4          8          6          3 24398202-B 1ESOB                    1          1            14          5 S                               
         5          8          6          5 12367890-A 1ESOA                    1          2             9          1 N                               
         6          9          6          1 24398202-B 1ESOB                    1          1             2          2 S                               
         7         10          6          1 24398202-B 1ESOB                    1          2             8          4 S                               
         8         14          6          3 25123890-A 1ESOA                    1          1             6          1 S                               
         9         15          6          4 24398202-B 1ESOB                    1          3             5          1 S                               
        10         15          6          5 24398202-B 1ESOC                    1          1             4          1 S                               
        11         16          6          5 24398202-B 1ESOA                    1          2             3          1 S                               
        12         16          6          6 25123890-A 1ESOB                    1          3             2          1 S                               
        13         26          6          1 24398202-B 1ESOC                    1          3             4          1 S                               
        14         26          6          1 12367890-A 1ESOC                    1          1             4          1 S                               
        15         26          6          2 24398202-B 1ESOB                    1          1             4          1 S                               
        16         27          6          2 24398202-B 1ESOB                    1          1             4          1 S                               
        17         28          6          1 12367890-A 1ESOA                    1          1             4          1 S                               

17 rows selected.

SQL> SELECT * FROM FALLOS;

 COD_FALLO DESCRIPCION                                                                                                                                
---------- ------------------------------                                                                                                             
         1 FALLA TECLADO                                                                                                                              
         2 TECLADO ROTO                                                                                                                               
         3 FALLA RATON                                                                                                                                
         4 NO ENCIENDE PANTALLA                                                                                                                       
         5 TECLADO PINTADO                                                                                                                            
         6 NO ARRANCA                                                                                                                                 
         7 ROTURA TECLADO                                                                                                                             
         8 SIN RATON                                                                                                                                  
         9 SIN INTERNET                                                                                                                               
        10 FALLO IMPRESORA                                                                                                                            

10 rows selected.

SQL> SELECT * FROM INCIDENCIAS WHERE COD_FALLO = (SELECT COD_FALLO FROM FALLOS WHERE DESCRIPCION='TECLADO ROTO');

   NUM_INC        DIA        MES       HORA DNI_PROF   COD_GRUPO             ZONA       AULA ORDENADOR_NUM  COD_FALLO G                               
---------- ---------- ---------- ---------- ---------- --------------- ---------- ---------- ------------- ---------- -                               
         6          9          6          1 24398202-B 1ESOB                    1          1             2          2 S                               

SQL> SELECT * FROM INCIDENCIAS WHERE COD_FALLO = (SELECT COD_FALLO FROM FALLOS WHERE DESCRIPCION='TECLADO ROTO') AND GRAVE='N';

no rows selected

SQL> DELETE FROM INCIDENCIAS WHERE NUM_INC IN (
  2  SELECT * FROM INCIDENCIAS WHERE COD_FALLO = (SELECT COD_FALLO FROM FALLOS WHERE DESCRIPCION='TECLADO ROTO') AND GRAVE='N');
SELECT * FROM INCIDENCIAS WHERE COD_FALLO = (SELECT COD_FALLO FROM FALLOS WHERE DESCRIPCION='TECLADO ROTO') AND GRAVE='N')
*
ERROR at line 2:
ORA-00913: too many values 


SQL> DELETE FROM INCIDENCIAS WHERE NUM_INC IN (
  2  SELECT NUM_INC FROM INCIDENCIAS WHERE COD_FALLO = (SELECT COD_FALLO FROM FALLOS WHERE DESCRIPCION='TECLADO ROTO') AND GRAVE='N');

0 rows deleted.

SQL> SPOOL OFF
