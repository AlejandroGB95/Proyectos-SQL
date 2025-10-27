SQL> CREATE OR REPLACE PROCEDURE suma_dos (num_1 NUMBER, num_2 NUMBER)
  2  AS
  3  v_suma NUMBER;
  4  BEGIN
  5  v_suma := num_1+num_2;
  6  DBMS_OUTPUT.PUT_LINE('La suma de '||num_1||' y '||num_2||' es: '||v_suma);
  7  END;
  8  /

Procedure created.

SQL> EXECUTE suma_dos(4,5)
La suma de 4 y 5 es: 9                                                          

PL/SQL procedure successfully completed.

SQL> spool off
