SQL> select centros.cod_centro from centros, profesores
  2  where centros.cod_centro=profesores.cod_centro(+)
  3  group by centros.cod_centro having count (profesores.dni)<2 and
  4  centros.num_plazas<300;
centros.num_plazas<300
*
ERROR at line 4:
ORA-00979: not a GROUP BY expression 


SQL> select centros.cod_centro from centros, profesores
  2  where centros.cod_centro=profesores.cod_centro(+) and centros.num_plaza>300
  3  group by centros.cod_centro having count (profesores.dni)<2;
where centros.cod_centro=profesores.cod_centro(+) and centros.num_plaza>300
                                                      *
ERROR at line 2:
ORA-00904: "CENTROS"."NUM_PLAZA": invalid identifier 


SQL> select * from centros;

COD_CENTRO T NOMBRE                         DIRECCION                  TELEFONO   NUM_PLAZAS                                                          
---------- - ------------------------------ -------------------------- ---------- ----------                                                          
        10 S IES El Quijote                 Avda. Los Molinos 25       965-887654        538                                                          
        15 P CP Los Danzantes               C/Las Musas s/n            985-112322        250                                                          
        22 S IES Planeta Tierra             C/Mina 45                  925-443400        300                                                          
        45 P CP Manuel Hidalgo              C/Granada 5                926-202310        220                                                          
        50 S IES Anto?ete                   C/Los Toreros 21           989-406090        310                                                          

SQL> select centros.cod_centro from centros, profesores
  2  where centros.cod_centro=profesores.cod_centro(+) and centros.num_plazas>300
  3  group by centros.cod_centro having count (profesores.dni)<2;

COD_CENTRO                                                                                                                                            
----------                                                                                                                                            
        50                                                                                                                                            

SQL> select centros.cod_centro from centros, profesores
  2  where centros.cod_centro=profesores.cod_centro and centros.num_plaza<300
  3  group by centros.cod_centro having count (profesores.dni)<2;
where centros.cod_centro=profesores.cod_centro and centros.num_plaza<300
                                                   *
ERROR at line 2:
ORA-00904: "CENTROS"."NUM_PLAZA": invalid identifier 


SQL> select centros.cod_centro from centros, profesores
  2  where centros.cod_centro=profesores.cod_centro and centros.num_plazas<300
  3  group by centros.cod_centro having count (profesores.dni)<2;

COD_CENTRO                                                                                                                                            
----------                                                                                                                                            
        45                                                                                                                                            

SQL> delete from personal where cod_centro in
  2  (select centros.cod_centro from centros, profesores
  3  where centros.cod_centro=profesores.cod_centro and centros.num_plazas<300
  4  group by centros.cod_centro having count (profesores.dni)<2);

2 rows deleted.

SQL> select * from personal;

COD_CENTRO        DNI APELLIDOS                      FUNCION            SALARIO                                                                       
---------- ---------- ------------------------------ --------------- ----------                                                                       
        10    1112345 Mart?nez Salas, Fernando       PROFESOR            220000                                                                       
        10    4123005 Bueno Zarco, Elisa             PROFESOR            220000                                                                       
        10    4122025 Montes Garc?a, M.Pilar         PROFESOR            220000                                                                       
        15    1112345 Rivera Silvestre, Ana          PROFESOR            205000                                                                       
        15    9800990 Ramos Ruiz, Luis               PROFESOR            205000                                                                       
        15    8660990 De Lucas Fdez, M.Angel         PROFESOR            205000                                                                       
        22    7650000 Ruiz Lafuente, Manuel          PROFESOR            220000                                                                       
        10    4480099 Ruano Cerezo, Manuel           ADMINISTRATIVO      180000                                                                       
        15    1002345 Albarr?n Serrano, Alicia       ADMINISTRATIVO      180000                                                                       
        15    7002660 Mu?oz Rey, Felicia             ADMINISTRATIVO      180000                                                                       
        22    5502678 Mar?n Mar?n, Pedro             ADMINISTRATIVO      180000                                                                       
        22    6600980 Peinado Gil, Elena             CONSERJE            175000                                                                       

12 rows selected.

SQL> rollback;

Rollback complete.

SQL> select * from personal minus select * from profesores;
select * from personal minus select * from profesores
*
ERROR at line 1:
ORA-01789: query block has incorrect number of result columns 


SQL> select dni from personal minus select dni from profesores;

       DNI                                                                                                                                            
----------                                                                                                                                            
   1002345                                                                                                                                            
   4163222                                                                                                                                            
   4480099                                                                                                                                            
   5502678                                                                                                                                            
   6600980                                                                                                                                            
   7002660                                                                                                                                            

6 rows selected.

SQL> select dni from profesores minus select dni from personal;

no rows selected

SQL> spool act_compl6_5.sql
