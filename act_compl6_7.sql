SQL> inset into pedidos
SP2-0734: unknown command beginning "inset into..." - rest of line ignored.
SQL> insert into pedidos
  2  select distinct '1111-A',articulo,cod_fabricante,peso,categoria,sysdate,20 from ventas where
  3  (articulo,cod_fabricante,peso,categoria) =
  4  (select articulo,cod_fabricante, peso, categoria from ventas group by articulo, cod_fabricante,peso, categoria
  5  having count(*) =(select max(count(*)) from ventas group by articulo,cod_fabricante,peso, categoria));

0 rows created.

no sale porque no es count, sino la suma

SQL> insert into pedidos
  2  select distinct '1111-A',articulo,cod_fabricante,peso,categoria,sysdate,20 from ventas where
  3  (articulo,cod_fabricante,peso,categoria) =
  4  (select articulo,cod_fabricante, peso, categoria from ventas group by articulo, cod_fabricante,peso, categoria
  5  having sum(unidades_vendidas) =(select max(sum(unidades_vendidas)) from ventas group by articulo,cod_fabricante,peso, categoria));



SQL> spool off
