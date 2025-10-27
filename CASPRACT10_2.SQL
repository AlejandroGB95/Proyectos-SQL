SQL> CREATE OR REPLACE PROCEDURE ver_emple_por_dept (
  2  dep VARCHAR2)
  3  AS
  4    v_dept NUMBER(2);
  5    CURSOR c1 IS
  6    SELECT apellido FROM emple WHERE dept_no = v_dept;
  7    v_apellido VARCHAR2(10);
  8  BEGIN
  9    v_dept := dep;
 10    OPEN c1;
 11    FETCH c1 INTO v_apellido;
 12    WHILE c1%FOUND LOOP
 13       DBMS_OUTPUT.PUT_LINE(v_apellido);
 14       FETCH c1 INTO v_apellido;
 15    END LOOP;
 16    CLOSE c1;
 17  END;
 18  /

Procedure created.

SQL> EXECUTE VER_EMPLE_POR_DEPT(30);
ARROYO                                                                                                                                                
SALA                                                                                                                                                  
MARTIN                                                                                                                                                
NEGRO                                                                                                                                                 
TOVAR                                                                                                                                                 
JIMENO                                                                                                                                                

PL/SQL procedure successfully completed.

SQL> SPOOL OFF
