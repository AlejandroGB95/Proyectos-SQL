SQL> SELECT * FROM CENTROS;

COD_CENTRO T NOMBRE                         DIRECCION                  TELEFONO   NUM_PLAZAS                                                          
---------- - ------------------------------ -------------------------- ---------- ----------                                                          
        10 S IES El Quijote                 Avda. Los Molinos 25       965-887654        538                                                          
        15 P CP Los Danzantes               C/Las Musas s/n            985-112322        250                                                          
        22 S IES Planeta Tierra             C/Mina 45                  925-443400        300                                                          
        45 P CP Manuel Hidalgo              C/Granada 5                926-202310        220                                                          
        50 S IES Anto?ete                   C/Los Toreros 21           989-406090        310                                                          


SQL> SELECT CENTROS.NOMBRE, COUNT(PROFESORES.DNI) FROM CENTROS, PROFESORES
  2  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  3  GROUP BY CENTROS.NOMBRE;

NOMBRE                         COUNT(PROFESORES.DNI)                                                                                                  
------------------------------ ---------------------                                                                                                  
CP Los Danzantes                                   3                                                                                                  
IES El Quijote                                     3                                                                                                  
IES Planeta Tierra                                 1                                                                                                  
CP Manuel Hidalgo                                  1                                                                                                  
IES Anto?ete                                       0                                                                                                  




SQL> SELECT COUNT(PROFESORES.DNI) FROM CENTROS, PROFESORES
  2  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  3  GROUP BY CENTROS.NOMBRE;

COUNT(PROFESORES.DNI)                                                                                                                                 
---------------------                                                                                                                                 
                    3                                                                                                                                 
                    3                                                                                                                                 
                    1                                                                                                                                 
                    1                                                                                                                                 
                    0                                                                                                                                 





SQL> SELECT COD_CENTRO FROM CENTROS GROUP BY COD_CENTRO HAVING COUNT(*) IN
  2  (SELECT COUNT(PROFESORES.DNI) FROM CENTROS, PROFESORES
  3  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  4  GROUP BY CENTROS.NOMBRE);

COD_CENTRO                                                                                                                                            
----------                                                                                                                                            
        22                                                                                                                                            
        45                                                                                                                                            
        50                                                                                                                                            
        10                                                                                                                                            
        15                                                                                                                                            

SQL> SELECT COUNT(PROFESORES.DNI) FROM CENTROS, PROFESORES
  2  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  3  GROUP BY CENTROS.NOMBRE HAVING COUNT(PROFESORES.DNI)<2;

COUNT(PROFESORES.DNI)                                                                                                                                 
---------------------                                                                                                                                 
                    1                                                                                                                                 
                    1                                                                                                                                 
                    0                                                                                                                                 



SQL> SELECT CENTROS.COD_CENTRO FROM CENTROS, PROFESORES
  2  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  3  GROUP BY CENTROS.COD_CENTRO HAVING COUNT(PROFESORES.DNI)<2;

COD_CENTRO                                                                                                                                            
----------                                                                                                                                            
        22                                                                                                                                            
        45                                                                                                                                            
        50                                                                                                                                            

SQL> UPDATE CENTROS SET NUM_PLAZAS=NUM_PLAZAS/2 WHERE COD_CENTRO IN
  2  (SELECT CENTROS.COD_CENTRO FROM CENTROS, PROFESORES
  3  WHERE CENTROS.COD_CENTRO=PROFESORES.COD_CENTRO(+)
  4  GROUP BY CENTROS.COD_CENTRO HAVING COUNT(PROFESORES.DNI)<2);

3 rows updated.

SQL> SELECT * FROM CENTROS;

COD_CENTRO T NOMBRE                         DIRECCION                  TELEFONO   NUM_PLAZAS                                                          
---------- - ------------------------------ -------------------------- ---------- ----------                                                          
        10 S IES El Quijote                 Avda. Los Molinos 25       965-887654        538                                                          
        15 P CP Los Danzantes               C/Las Musas s/n            985-112322        250                                                          
        22 S IES Planeta Tierra             C/Mina 45                  925-443400        150                                                          
        45 P CP Manuel Hidalgo              C/Granada 5                926-202310        110                                                          
        50 S IES Anto?ete                   C/Los Toreros 21           989-406090        155                                                          

SQL> SPOOL OFF
