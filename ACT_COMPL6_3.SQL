SQL> SET LINESIZE 150
SQL> SET PAGESIZE 150
SQL> SELECT * FROM PERSONAL;

COD_CENTRO        DNI APELLIDOS                      FUNCION            SALARIO                                                                       
---------- ---------- ------------------------------ --------------- ----------                                                                       
        10    1112345 Mart?nez Salas, Fernando       PROFESOR            220000                                                                       
        10    4123005 Bueno Zarco, Elisa             PROFESOR            220000                                                                       
        10    4122025 Montes Garc?a, M.Pilar         PROFESOR            220000                                                                       
        15    1112345 Rivera Silvestre, Ana          PROFESOR            205000                                                                       
        15    9800990 Ramos Ruiz, Luis               PROFESOR            205000                                                                       
        15    8660990 De Lucas Fdez, M.Angel         PROFESOR            205000                                                                       
        22    7650000 Ruiz Lafuente, Manuel          PROFESOR            220000                                                                       
        45   43526789 Serrano Lagu?a, Mar?a          PROFESOR            205000                                                                       
        10    4480099 Ruano Cerezo, Manuel           ADMINISTRATIVO      180000                                                                       
        15    1002345 Albarr?n Serrano, Alicia       ADMINISTRATIVO      180000                                                                       
        15    7002660 Mu?oz Rey, Felicia             ADMINISTRATIVO      180000                                                                       
        22    5502678 Mar?n Mar?n, Pedro             ADMINISTRATIVO      180000                                                                       
        22    6600980 Peinado Gil, Elena             CONSERJE            175000                                                                       
        45    4163222 Sarro Molina, Carmen           CONSERJE            175000                                                                       

14 rows selected.

SQL> SELECT COD_CENTRO FROM PERSONAL GROUP BY COD_CENTRO HAVING COUNT(*) =
  2  (SELECT COUNT(PERSONAL.DNI) FROM PERSONAL GROUP BY COD_CENTRO HAVING COUNT(PERSONAL.DNI)=1);

no rows selected

SQL> SELECT COD_CENTRO FROM PERSONAL WHERE FUNCION='ADMINISTRATIVO' GROUP BY COD_CENTRO
  2  HAVING COUNT(PERSONAL.DNI)=1;

COD_CENTRO                                                                                                                                            
----------                                                                                                                                            
        22                                                                                                                                            
        10                                                                                                                                            

SQL> SELECT * FROM PROFESORES;

COD_CENTRO        DNI APELLIDOS                      ESPECIALIDAD                                                                                     
---------- ---------- ------------------------------ ----------------                                                                                 
        10    1112345 Mart?nez Salas, Fernando       INFORM?TICA                                                                                      
        10    4123005 Bueno Zarco, Elisa             MATEM?TICAS                                                                                      
        10    4122025 Montes Garc?a, M.Pilar         MATEM?TICAS                                                                                      
        15    9800990 Ramos Ruiz, Luis               LENGUA                                                                                           
        15    1112345 Rivera Silvestre, Ana          DIBUJO                                                                                           
        15    8660990 De Lucas Fdez, M.Angel         LENGUA                                                                                           
        22    7650000 Ruiz Lafuente, Manuel          MATEM?TICAS                                                                                      
        45   43526789 Serrano Lagu?a, Mar?a          INFORM?TICA                                                                                      

8 rows selected.

SQL> INSERT INTO PROFESORES
  2  SELECT COD_CENTRO,'8790055','Clara Salas','IDIOMA'
  3  FROM CENTROS WHERE COD_CENTRO IN
  4  (SELECT COD_CENTRO FROM PERSONAL WHERE FUNCION='ADMINISTRATIVO' GROUP BY COD_CENTRO
  5  HAVING COUNT(PERSONAL.DNI)=1);

2 rows created.

SQL> SELECT * FROM PROFESORES;

COD_CENTRO        DNI APELLIDOS                      ESPECIALIDAD                                                                                     
---------- ---------- ------------------------------ ----------------                                                                                 
        10    8790055 Clara Salas                    IDIOMA                                                                                           
        22    8790055 Clara Salas                    IDIOMA                                                                                           
        10    1112345 Mart?nez Salas, Fernando       INFORM?TICA                                                                                      
        10    4123005 Bueno Zarco, Elisa             MATEM?TICAS                                                                                      
        10    4122025 Montes Garc?a, M.Pilar         MATEM?TICAS                                                                                      
        15    9800990 Ramos Ruiz, Luis               LENGUA                                                                                           
        15    1112345 Rivera Silvestre, Ana          DIBUJO                                                                                           
        15    8660990 De Lucas Fdez, M.Angel         LENGUA                                                                                           
        22    7650000 Ruiz Lafuente, Manuel          MATEM?TICAS                                                                                      
        45   43526789 Serrano Lagu?a, Mar?a          INFORM?TICA                                                                                      

10 rows selected.

SQL> SPOOL OFF
