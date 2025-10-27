SQL> set linesize 150
SQL> set pagesize 150
SQL> select * from articulos
  2  ;

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
2222-A     Mejillones                       10          1 Primera    24/02/2022             1000                                                      
3333-A     Macarrones                       25          1 Primera    10/11/2006                8                                                      
3333-A     Tallarines                       25          1 Primera    12/11/2006                9                                                      
3333-A     Fideos                           25          1 Primera    15/11/2006               11                                                      
3333-A     Galletas Cuadradas               15          1 Primera    20/11/2006                6                                                      
3333-A     Barquillos                       15          1 Segunda    20/11/2006               40                                                      
3333-A     Canutillos                       15          2 Segunda    20/11/2006               10                                                      

25 rows selected.

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

SQL> insert into articulos
  2  select 'Donuts',cod_fabricante,1,'Primera' from fabricantes
  3  where pais='FRANCIA';
insert into articulos
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> insert into articulos
  2  select 'Donuts',cod_fabricante,1,'Primera' from fabricantes
  3  where pais='FRANCIA';
insert into articulos
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> select * from fabricantes;

COD_FABRICANTE NOMBRE          PAIS                                                                                                                   
-------------- --------------- ---------------                                                                                                        
            10 CALVO           ESPA?A                                                                                                                 
            15 LU              BELGICA                                                                                                                
            20 BARILLA         ITALIA                                                                                                                 
            25 GALLO           ESPA?A                                                                                                                 
            30 PRESIDENT       FRANCIA                                                                                                                

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

SQL> insert into articulos
  2  select 'Donuts',cod_fabricante,1,'Primera' from fabricantes
  3  where pais='FRANCIA';
insert into articulos
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> insert into articulos
  2  select 'Donuts',cod_fabricante,1,'Primera',2,1,100 from fabricantes
  3  where pais='FRANCIA';

1 row created.

SQL> insert into pedidos
  2  select nif, articulo, cod_fabricante,peso,categoria,sysdate,5
  3  from tiendas,fabricantes,articulos
  4  where fabricantes.pais='FRANCIA' AND articulos.articulo='Donuts';
select nif, articulo, cod_fabricante,peso,categoria,sysdate,5
                      *
ERROR at line 2:
ORA-00918: column ambiguously defined 


SQL> insert into pedidos
  2  select nif, articulo, cod_fabricante,peso,categoria,sysdate,5
  3  from tiendas,articuloses
  4  where articulo='Donuts';
from tiendas,articuloses
             *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> insert into pedidos
  2  select nif, articulo, cod_fabricante,peso,categoria,sysdate,5
  3  from tiendas,articulos
  4  where articulo='Donuts';

6 rows created.

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
2222-A     Mejillones                       10          1 Primera    24/02/2022             1000                                                      
3333-A     Macarrones                       25          1 Primera    10/11/2006                8                                                      
3333-A     Tallarines                       25          1 Primera    12/11/2006                9                                                      
3333-A     Fideos                           25          1 Primera    15/11/2006               11                                                      
3333-A     Galletas Cuadradas               15          1 Primera    20/11/2006                6                                                      
3333-A     Barquillos                       15          1 Segunda    20/11/2006               40                                                      
3333-A     Canutillos                       15          2 Segunda    20/11/2006               10                                                      
1111-A     Donuts                           30          1 Primera    24/02/2022                5                                                      
5555-B     Donuts                           30          1 Primera    24/02/2022                5                                                      
2222-A     Donuts                           30          1 Primera    24/02/2022                5                                                      
4444-A     Donuts                           30          1 Primera    24/02/2022                5                                                      
3333-N     Donuts                           30          1 Primera    24/02/2022                5                                                      
4141-B     Donuts                           30          1 Primera    24/02/2022                5                                                      

31 rows selected.

SQL> spool off
