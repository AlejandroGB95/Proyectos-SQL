SQL> SELECT * FROM CENTROS;

COD_CENTRO T NOMBRE                         DIRECCION                  TELEFONO   NUM_PLAZAS                                                          
---------- - ------------------------------ -------------------------- ---------- ----------                                                          
        10 S IES El Quijote                 Avda. Los Molinos 25       965-887654        538                                                          
        15 P CP Los Danzantes               C/Las Musas s/n            985-112322        250                                                          
        22 S IES Planeta Tierra             C/Mina 45                  925-443400        150                                                          
        45 P CP Manuel Hidalgo              C/Granada 5                926-202310        110                                                          
        50 S IES Anto?ete                   C/Los Toreros 21           989-406090        155                                                          

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

SQL> DELETE FROM CENTROS WHERE COD_CENTRO NOT IN
  2  (SELECT COD_CENTRO FROM PERSONAL WHERE CENTROS.COD_CENTRO=PERSONAL.COD_CENTRO);

1 row deleted.

SQL> SELECT * FROM CENTROS;

COD_CENTRO T NOMBRE                         DIRECCION                  TELEFONO   NUM_PLAZAS                                                          
---------- - ------------------------------ -------------------------- ---------- ----------                                                          
        10 S IES El Quijote                 Avda. Los Molinos 25       965-887654        538                                                          
        15 P CP Los Danzantes               C/Las Musas s/n            985-112322        250                                                          
        22 S IES Planeta Tierra             C/Mina 45                  925-443400        150                                                          
        45 P CP Manuel Hidalgo              C/Granada 5                926-202310        110                                                          

SQL> SPOOL OFF
