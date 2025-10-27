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

SQL> insert into tiendas
  2  values ('5151-A','Ultramarinos Gran V¡a','C/Gran V¡a,41','Madrid','MADRID',28001);
values ('5151-A','Ultramarinos Gran V¡a','C/Gran V¡a,41','Madrid','MADRID',28001)
                 *
ERROR at line 2:
ORA-12899: value too large for column "DATOS"."TIENDAS"."NOMBRE" (actual: 22, maximum: 20) 


SQL> insert into tiendas
  2  values ('5151-A','Ultramarinos Torres','C/Gran V¡a,41','Madrid','MADRID',28001);

1 row created.

SQL> insert into pedidos
  2  select '5151-A',articulo,cod_fabricante,peso,categoria,sysdate,20 from articulos;

32 rows created.

SQL> select * from pedidos where nif='5151-A';

NIF        ARTICULO             COD_FABRICANTE       PESO CATEGORIA  FECHA_PEDI UNIDADES_PEDIDAS                                                      
---------- -------------------- -------------- ---------- ---------- ---------- ----------------                                                      
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

32 rows selected.

SQL> spool off
