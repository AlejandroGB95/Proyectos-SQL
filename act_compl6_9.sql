SQL> insert into tiendas
  2  values ('5151-B','La Tienda','C/ Clavel,14','La Rinconada','SEVILLA',26034);

1 row created.

SQL> insert into tiendas
  2  values ('5151-C','La Rinconada SL','C/ Clavel,16','La Rinconada','SEVILLA',26034);

1 row created.

SQL> insert into pedidos
  2  select nif, articulo,articulos.cod_fabricante,peso,categoria,sysdate,30 from tiendas,articulos,fabricantes
  3  where provincia='SEVILLA' and fabricantes.nombre='GALLO' and articulos.cod_fabricante = fabricantes.cod_fabricante;

8 rows created.

otra forma

INSERT INTO PEDIDOS
  2  SELECT NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA, SYSDATE, 20 FROM TIENDAS, ARTICULOS
  3  WHERE (PROVINCIA='SEVILLA') AND
  4  COD_FABRICANTE = (SELECT COD_FABRICANTE FROM FABRICANTES WHERE NOMBRE='GALLO');

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
5151-A     Macarrones                       20          1 Primera    24/02/2022               20                                                      
5151-A     Tallarines                       20          2 Primera    24/02/2022               20                                                      
5151-A     Tallarines                       20          1 Segunda    24/02/2022               20                                                      
5151-A     Macarrones                       20          1 Tercera    24/02/2022               20                                                      
5151-A     At?n                             10          3 Primera    24/02/2022               20                                                      
5151-A     At?n                             10          3 Segunda    24/02/2022               20                                                      
5151-A     At?n                             10          3 Tercera    24/02/2022               20                                                      
5151-A     Sardinillas                      10          1 Primera    24/02/2022               20                                                      
5151-A     Sardinillas                      10          1 Segunda    24/02/2022               20                                                      
5151-A     Sardinillas                      10          1 Tercera    24/02/2022               20                                                      
5151-A     Mejillones                       10          1 Tercera    24/02/2022               20                                                      
5151-A     Mejillones                       10          1 Primera    24/02/2022               20                                                      
5151-A     Macarrones                       25          1 Primera    24/02/2022               20                                                      
5151-A     Tallarines                       25          1 Primera    24/02/2022               20                                                      
5151-A     Fideos                           25          1 Segunda    24/02/2022               20                                                      
5151-A     Fideos                           25          1 Primera    24/02/2022               20                                                      
5151-A     Galletas Cuadradas               15          1 Primera    24/02/2022               20                                                      
5151-A     Galletas Cuadradas               15          1 Segunda    24/02/2022               20                                                      
5151-A     Galletas Cuadradas               15          1 Tercera    24/02/2022               20                                                      
5151-A     Barquillos                       15          1 Primera    24/02/2022               20                                                      
5151-A     Barquillos                       15          1 Segunda    24/02/2022               20                                                      
5151-A     Canutillos                       15          2 Primera    24/02/2022               20                                                      
5151-A     Canutillos                       15          2 Segunda    24/02/2022               20                                                      
5151-A     Leche entera                     30          1 Primera    24/02/2022               20                                                      
5151-A     Leche desnat.                    30          1 Primera    24/02/2022               20                                                      
5151-A     Leche semi.                      30          1 Primera    24/02/2022               20                                                      
5151-A     Leche entera                     30          2 Primera    24/02/2022               20                                                      
5151-A     Leche desnat.                    30          2 Primera    24/02/2022               20                                                      
5151-A     Leche semi.                      30          2 Primera    24/02/2022               20                                                      
5151-A     Mantequilla                      30          1 Primera    24/02/2022               20                                                      
5151-A     Mantequilla                      30          1 Segunda    24/02/2022               20                                                      
5151-A     Donuts                           30          1 Primera    24/02/2022               20                                                      
5151-C     Macarrones                       25          1 Primera    24/02/2022               30                                                      
5151-B     Macarrones                       25          1 Primera    24/02/2022               30                                                      
5151-C     Tallarines                       25          1 Primera    24/02/2022               30                                                      
5151-B     Tallarines                       25          1 Primera    24/02/2022               30                                                      
5151-C     Fideos                           25          1 Segunda    24/02/2022               30                                                      
5151-B     Fideos                           25          1 Segunda    24/02/2022               30                                                      
5151-C     Fideos                           25          1 Primera    24/02/2022               30                                                      
5151-B     Fideos                           25          1 Primera    24/02/2022               30                                                      

71 rows selected.

SQL> spool off
