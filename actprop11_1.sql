SQL> CREATE OR REPLACE TRIGGER salario_mas5_emple
  2  AFTER UPDATE
  3  ON emple
  4  FOR EACH ROW
  5  WHEN new.salario > (old.salario+(old.salario*0.05))
  6  BEGIN
  7  insert INTO auditaremple
  8  VALUES ('FECHA '|| SYSDATE || '  ' ||:old.emp_no ||'*'
  9  ||:old.apellido || 'SALARIO ANTIGUO '||:old.salario ||'NUEVO SALARIO '||:new.salario);
 10  END;
 11  /
WHEN new.salario > (old.salario+(old.salario*0.05))
     *
ERROR at line 5:
ORA-00906: missing left parenthesis 


SQL> CREATE OR REPLACE TRIGGER salario_mas5_emple
  2  AFTER UPDATE
  3  ON emple
  4  FOR EACH ROW
  5  WHEN new.salario > (old.salario+(old.salario*0.05)).
  6  BEGIN
  7  insert INTO auditaremple
  8  VALUES ('FECHA '|| SYSDATE || '  ' ||:old.emp_no ||' '
  9  ||:old.apellido || 'SALARIO ANTIGUO '||:old.salario ||'NUEVO SALARIO '||:new.salario);
 10  END;
 11  /
WHEN new.salario > (old.salario+(old.salario*0.05)).
     *
ERROR at line 5:
ORA-00906: missing left parenthesis 


SQL> CREATE OR REPLACE TRIGGER salario_mas5_emple
  2  AFTER UPDATE
  3  ON emple
  4  FOR EACH ROW
  5  WHEN (new.salario > (old.salario+(old.salario*0.05)))
  6  BEGIN
  7  insert INTO auditaremple
  8  VALUES ('FECHA '|| SYSDATE || '  ' ||:old.emp_no ||' '
  9  ||:old.apellido || 'SALARIO ANTIGUO '||:old.salario ||'NUEVO SALARIO '||:new.salario);
 10  END;
 11  /

Trigger created.

SQL> select * from emple;

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO                                                                 
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------                                                                 
      7369 SANCHEZ    EMPLEADO         7902 17/12/90       1040                    20                                                                 
      7499 ARROYO     VENDEDOR         7698 20/02/90       1500        390         30                                                                 
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650         30                                                                 
      7566 JIMENEZ    DIRECTOR         7839 02/04/91       2900                    20                                                                 
      7654 MARTIN     VENDEDOR         7698 29/09/91       1600       1020         30                                                                 
      7698 NEGRO      DIRECTOR         7839 01/05/91       3005                    30                                                                 
      7782 CEREZO     DIRECTOR         7839 09/06/91       2885                    10                                                                 
      7788 GIL        ANALISTA         7566 09/11/91       3000                    20                                                                 
      7839 REY        PRESIDENTE            17/11/91       4100                    10                                                                 
      7844 TOVAR      VENDEDOR         7698 08/09/91       1350          0         30                                                                 
      7876 ALONSO     EMPLEADO         7788 23/09/91       1430                    20                                                                 
      7900 JIMENO     EMPLEADO         7698 03/12/91       1335                    30                                                                 
      7902 FERNANDEZ  ANALISTA         7566 03/12/91       3000                    20                                                                 
      7934 MU¥OZ      EMPLEADO         7782 23/01/92       1690                    10                                                                 

14 rows selected.

SQL> spool off
CREATE OR REPLACE TRIGGER salario_mas5_emple
AFTER UPDATE
ON emple
FOR EACH ROW
WHEN (new.salario > (old.salario+(old.salario*0.05))) 
BEGIN
insert INTO auditaremple
VALUES ('FECHA '|| to_char(SYSDATE,'dd/mm/yyyy hh:mm:ss') || '  ' ||:old.emp_no ||' '
||:old.apellido || 'SALARIO ANTIGUO '||:old.salario ||'NUEVO SALARIO '||:new.salario);
END;
/

update emple set salario= 1100 where emp_no=7369;

1 row updated.

SQL> select * from auditaremple;

COL1
------------------------------------------------------------------------------------------------------------------------------------------------------
FECHA 27/04/2022 10:04:54  7369 SANCHEZSALARIO ANTIGUO 1040NUEVO SALARIO 1100
FECHA 27/04/2022 11:04:54  7369 SANCHEZSALARIO ANTIGUO 1040NUEVO SALARIO 1100

SQL> SELECT * FROM EMPLE;

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------
      7369 SANCHEZ    EMPLEADO         7902 17/12/90       1100                    20
      7499 ARROYO     VENDEDOR         7698 20/02/90       1500        390         30
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650         30
      7566 JIMENEZ    DIRECTOR         7839 02/04/91       2900                    20
      7654 MARTIN     VENDEDOR         7698 29/09/91       1600       1020         30
      7698 NEGRO      DIRECTOR         7839 01/05/91       3005                    30
      7782 CEREZO     DIRECTOR         7839 09/06/91       2885                    10
      7788 GIL        ANALISTA         7566 09/11/91       3000                    20
      7839 REY        PRESIDENTE            17/11/91       4100                    10
      7844 TOVAR      VENDEDOR         7698 08/09/91       1350          0         30
      7876 ALONSO     EMPLEADO         7788 23/09/91       1430                    20
      7900 JIMENO     EMPLEADO         7698 03/12/91       1335                    30
      7902 FERNANDEZ  ANALISTA         7566 03/12/91       3000                    20
      7934 MUÑOZ      EMPLEADO         7782 23/01/92       1690                    10

14 rows selected.

SQL>