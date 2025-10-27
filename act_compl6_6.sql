SQL> select * from fabricantes;

COD_FABRICANTE NOMBRE          PAIS                                                                                                                   
-------------- --------------- ---------------                                                                                                        
            10 CALVO           ESPA?A                                                                                                                 
            15 LU              BELGICA                                                                                                                
            20 BARILLA         ITALIA                                                                                                                 
            25 GALLO           ESPA?A                                                                                                                 
            30 PRESIDENT       FRANCIA                                                                                                                

SQL> select * from pedidos;

NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PEDI UNIDADES_PEDIDAS                                                      
---------- -------------------- -------------- ---------- ---------- ---------- ----------------                                                      
5555-B     Macarrones                       20          1 Primera    18/02/2006               30                                                      
5555-B     At?n                             10          3 Primera    21/02/2006               10                                                      
5555-B     At?n                             10          3 Segunda    11/03/2006                4                                                      
5555-B     Sardinillas                      10          1 Segunda    11/03/2006               10                                                      
5555-B     Macarrones                       25          1 Primera    14/04/2006               12                                                      
5555-B     Fideos                           25          1 Segunda    18/05/2006               24                                                      
5555-B     Fideos                           25          1 Segunda    19/05/2006               20                                                      
5555-B     Galletas Cuadradas               15          1 Segunda    20/06/2006               15                                                      
1111-A     Barquillos                       15          1 Primera    20/02/2006               10                                                      
1111-A     Canutillos                       15          2 Segunda    10/04/2006               12                                                      
1111-A     Leche semi.                      30          1 Primera    24/06/2006                5                                                      
1111-A     Leche semi.                      30          2 Primera    04/07/2006               11                                                      
1111-A     Mantequilla                      30          1 Primera    10/07/2006               10                                                      
4141-B     Macarrones                       20          1 Primera    16/04/2006               30                                                      
4141-B     At?n                             10          3 Primera    21/06/2006               10                                                      
4141-B     At?n                             10          3 Segunda    12/08/2006                9                                                      
2222-A     Sardinillas                      10          1 Segunda    12/08/2006               20                                                      
2222-A     Sardinillas                      10          1 Tercera    12/08/2006               22                                                      
2222-A     Mejillones                       10          1 Primera    23/02/2022             1000                                                      
3333-A     Macarrones                       25          1 Primera    10/11/2006                8                                                      
3333-A     Tallarines                       25          1 Primera    12/11/2006                9                                                      
3333-A     Fideos                           25          1 Primera    15/11/2006               11                                                      
3333-A     Galletas Cuadradas               15          1 Primera    20/11/2006                6                                                      
3333-A     Barquillos                       15          1 Segunda    20/11/2006               40                                                      
3333-A     Canutillos                       15          2 Segunda    20/11/2006               10                                                      

25 rows selected.

SQL> select * from fabricantes;

COD_FABRICANTE NOMBRE          PAIS                                                                                                                   
-------------- --------------- ---------------                                                                                                        
            10 CALVO           ESPA?A                                                                                                                 
            15 LU              BELGICA                                                                                                                
            20 BARILLA         ITALIA                                                                                                                 
            25 GALLO           ESPA?A                                                                                                                 
            30 PRESIDENT       FRANCIA                                                                                                                

SQL> select * from tiendas;

NIF        NOMBRE               DIRECCION            POBLACION            PROVINCIA             CODPOSTAL                                             
---------- -------------------- -------------------- -------------------- -------------------- ----------                                             
1111-A     Almacenes P?rez      C/Toledo, 20         Siguenza             GUADALAJARA               19104                                             
5555-B     La gacela            C/Santander Rios, 45 Azuqueca             GUADALAJARA               19209                                             
2222-A     Comestibles Rodolfo  C/ del Val s/n       Alcal? de Henares    MADRID                    28804                                             
4444-A     La Pasta Gansa       C/Alcal?, 2          Ajalvir              MADRID                    28765                                             
3333-N     Ultramarinos Montse  Avda. Pio 10         Toledo               TOLEDO                    45100                                             
4141-B     Todo Toledo          C/Avila 24           Talavera             TOLEDO                    45199                                             

6 rows selected.

SQL> select * from articulos;

ARTICULO             COD_FABRICANTE       PESO CATEGORIA  PRECIO_VENTA PRECIO_COSTO EXISTENCIAS                                                       
-------------------- -------------- ---------- ---------- ------------ ------------ -----------                                                       
Macarrones                       20          1 Primera               1          ,98         120                                                       
Tallarines                       20          2 Primera             1,2            1         100                                                       
Tallarines                       20          1 Segunda             ,99           ,5         100                                                       
Macarrones                       20          1 Tercera              ,8           ,5         100                                                       
At?n                             10          3 Primera               2          1,5         220                                                       
At?n                             10          3 Segunda             1,5            1         220                                                       
At?n                             10          3 Tercera               1           ,5         220                                                       
Sardinillas                      10          1 Primera             2,5            2         200                                                       
Sardinillas                      10          1 Segunda               2          1,6         200                                                       
Sardinillas                      10          1 Tercera               1          1,5         220                                                       
Mejillones                       10          1 Tercera               1           ,9         200                                                       
Mejillones                       10          1 Primera               3            2         300                                                       
Macarrones                       25          1 Primera             1,5            1         150                                                       
Tallarines                       25          1 Primera               1           ,9         100                                                       
Fideos                           25          1 Segunda             ,75           ,5         100                                                       
Fideos                           25          1 Primera               1           ,8         100                                                       
Galletas Cuadradas               15          1 Primera               2          1,8         100                                                       
Galletas Cuadradas               15          1 Segunda               1           ,8         100                                                       
Galletas Cuadradas               15          1 Tercera              ,5           ,4         100                                                       
Barquillos                       15          1 Primera               1           ,8         100                                                       
Barquillos                       15          1 Segunda               1           ,8         100                                                       
Canutillos                       15          2 Primera             1,7          1,5         110                                                       
Canutillos                       15          2 Segunda             1,2          1,5         110                                                       
Leche entera                     30          1 Primera             1,1            1         300                                                       
Leche desnat.                    30          1 Primera             1,2            1         300                                                       
Leche semi.                      30          1 Primera             1,3          1,1         300                                                       
Leche entera                     30          2 Primera             2,1            2         300                                                       
Leche desnat.                    30          2 Primera             2,2            2         300                                                       
Leche semi.                      30          2 Primera             2,3          2,1         300                                                       
Mantequilla                      30          1 Primera             1,8            2         200                                                       
Mantequilla                      30          1 Segunda             1,4            2         200                                                       

31 rows selected.

SQL> insert into articulos (articulo, cod_fabricante,categoria)
  2  select 'Donut',cod_fabricante,'primera'from fabricantes
  3  where pais='FRANCIA';
insert into articulos (articulo, cod_fabricante,categoria)
*
ERROR at line 1:
ORA-01400: cannot insert NULL into ("DATOS"."ARTICULOS"."PESO") 


SQL> desc articulos
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ARTICULO                                                                            NOT NULL VARCHAR2(20)
 COD_FABRICANTE                                                                      NOT NULL NUMBER(3)
 PESO                                                                                NOT NULL NUMBER(3)
 CATEGORIA                                                                           NOT NULL VARCHAR2(10)
 PRECIO_VENTA                                                                                 NUMBER(6,2)
 PRECIO_COSTO                                                                                 NUMBER(6,2)
 EXISTENCIAS                                                                                  NUMBER(5)

SQL> insert into articulos (articulo, cod_fabricante,peso,categoria)
  2  select 'Donut',cod_fabricante,1,'Primera'from fabricantes
  3  where pais='FRANCIA';

1 row created.

SQL> select * from articulos;

ARTICULO             COD_FABRICANTE       PESO CATEGORIA  PRECIO_VENTA PRECIO_COSTO EXISTENCIAS                                                       
-------------------- -------------- ---------- ---------- ------------ ------------ -----------                                                       
Macarrones                       20          1 Primera               1          ,98         120                                                       
Tallarines                       20          2 Primera             1,2            1         100                                                       
Tallarines                       20          1 Segunda             ,99           ,5         100                                                       
Macarrones                       20          1 Tercera              ,8           ,5         100                                                       
At?n                             10          3 Primera               2          1,5         220                                                       
At?n                             10          3 Segunda             1,5            1         220                                                       
At?n                             10          3 Tercera               1           ,5         220                                                       
Sardinillas                      10          1 Primera             2,5            2         200                                                       
Sardinillas                      10          1 Segunda               2          1,6         200                                                       
Sardinillas                      10          1 Tercera               1          1,5         220                                                       
Mejillones                       10          1 Tercera               1           ,9         200                                                       
Mejillones                       10          1 Primera               3            2         300                                                       
Macarrones                       25          1 Primera             1,5            1         150                                                       
Tallarines                       25          1 Primera               1           ,9         100                                                       
Fideos                           25          1 Segunda             ,75           ,5         100                                                       
Fideos                           25          1 Primera               1           ,8         100                                                       
Galletas Cuadradas               15          1 Primera               2          1,8         100                                                       
Galletas Cuadradas               15          1 Segunda               1           ,8         100                                                       
Galletas Cuadradas               15          1 Tercera              ,5           ,4         100                                                       
Barquillos                       15          1 Primera               1           ,8         100                                                       
Barquillos                       15          1 Segunda               1           ,8         100                                                       
Canutillos                       15          2 Primera             1,7          1,5         110                                                       
Canutillos                       15          2 Segunda             1,2          1,5         110                                                       
Leche entera                     30          1 Primera             1,1            1         300                                                       
Leche desnat.                    30          1 Primera             1,2            1         300                                                       
Leche semi.                      30          1 Primera             1,3          1,1         300                                                       
Leche entera                     30          2 Primera             2,1            2         300                                                       
Leche desnat.                    30          2 Primera             2,2            2         300                                                       
Leche semi.                      30          2 Primera             2,3          2,1         300                                                       
Mantequilla                      30          1 Primera             1,8            2         200                                                       
Mantequilla                      30          1 Segunda             1,4            2         200                                                       
Donut                            30          1 Primera                                                                                                

32 rows selected.

SQL> select * from pedidos;

NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PEDI UNIDADES_PEDIDAS                                                      
---------- -------------------- -------------- ---------- ---------- ---------- ----------------                                                      
5555-B     Macarrones                       20          1 Primera    18/02/2006               30                                                      
5555-B     At?n                             10          3 Primera    21/02/2006               10                                                      
5555-B     At?n                             10          3 Segunda    11/03/2006                4                                                      
5555-B     Sardinillas                      10          1 Segunda    11/03/2006               10                                                      
5555-B     Macarrones                       25          1 Primera    14/04/2006               12                                                      
5555-B     Fideos                           25          1 Segunda    18/05/2006               24                                                      
5555-B     Fideos                           25          1 Segunda    19/05/2006               20                                                      
5555-B     Galletas Cuadradas               15          1 Segunda    20/06/2006               15                                                      
1111-A     Barquillos                       15          1 Primera    20/02/2006               10                                                      
1111-A     Canutillos                       15          2 Segunda    10/04/2006               12                                                      
1111-A     Leche semi.                      30          1 Primera    24/06/2006                5                                                      
1111-A     Leche semi.                      30          2 Primera    04/07/2006               11                                                      
1111-A     Mantequilla                      30          1 Primera    10/07/2006               10                                                      
4141-B     Macarrones                       20          1 Primera    16/04/2006               30                                                      
4141-B     At?n                             10          3 Primera    21/06/2006               10                                                      
4141-B     At?n                             10          3 Segunda    12/08/2006                9                                                      
2222-A     Sardinillas                      10          1 Segunda    12/08/2006               20                                                      
2222-A     Sardinillas                      10          1 Tercera    12/08/2006               22                                                      
2222-A     Mejillones                       10          1 Primera    23/02/2022             1000                                                      
3333-A     Macarrones                       25          1 Primera    10/11/2006                8                                                      
3333-A     Tallarines                       25          1 Primera    12/11/2006                9                                                      
3333-A     Fideos                           25          1 Primera    15/11/2006               11                                                      
3333-A     Galletas Cuadradas               15          1 Primera    20/11/2006                6                                                      
3333-A     Barquillos                       15          1 Segunda    20/11/2006               40                                                      
3333-A     Canutillos                       15          2 Segunda    20/11/2006               10                                                      

25 rows selected.

SQL> insert into pedidos
  2  select nif, articulo,cod_fabricante, peso, categoria, sysdate,5
  3  from tiendas,articulos where dni (select dni from tiendas) and articulo,cod_fabricante,peso,categoria =
  4  (select articulo, cod_fabricante,peso,categoria from articulos where articulo='Donut');
from tiendas,articulos where dni (select dni from tiendas) and articulo,cod_fabricante,peso,categoria =
                                  *
ERROR at line 3:
ORA-00936: missing expression 


SQL> spool off
