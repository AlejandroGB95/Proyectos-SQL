SQL> insert into ventas
  2  salect nif, articulo, cod_fabricante,peso,categoria,sysdate,10
  3  from articulos,tiendas
  4  where categoria='Primera' and provincia='TOLEDO';
salect nif, articulo, cod_fabricante,peso,categoria,sysdate,10
       *
ERROR at line 2:
ORA-00926: missing VALUES keyword 


SQL> insert into ventas
  2  select nif, articulo, cod_fabricante,peso,categoria,sysdate,10
  3  from articulos,tiendas
  4  where categoria='Primera' and provincia='TOLEDO';

38 rows created.

SQL> spool off
