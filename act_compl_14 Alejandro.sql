SQL> select * from asignaturas where cod not in (select distinct cod from notas);

       COD NOMBRE                                                                                                                                     
---------- -------------------------                                                                                                                  
         8 Idioma                                                                                                                                     

SQL> select * from asignaturas;

       COD NOMBRE                                                                                                                                     
---------- -------------------------                                                                                                                  
         1 Prog. Leng. Estr.                                                                                                                          
         2 Sist. Inform ticos                                                                                                                         
         3 An lisis                                                                                                                                   
         4 FOL                                                                                                                                        
         5 RET                                                                                                                                        
         6 Entornos Gr ficos                                                                                                                          
         7 Aplic. Entornos 4¦Gen                                                                                                                      
         8 Idioma                                                                                                                                     

8 rows selected.

SQL> select * from notas;

DNI               COD       NOTA                                                                                                                      
---------- ---------- ----------                                                                                                                      
12344345            1          6                                                                                                                      
12344345            2          5                                                                                                                      
12344345            3          6                                                                                                                      
4448242             4          6                                                                                                                      
4448242             5          8                                                                                                                      
4448242             6          4                                                                                                                      
4448242             7          5                                                                                                                      
56882942            4          8                                                                                                                      
56882942            5          7                                                                                                                      
56882942            6          8                                                                                                                      
56882942            7          9                                                                                                                      

11 rows selected.

SQL> spool off
