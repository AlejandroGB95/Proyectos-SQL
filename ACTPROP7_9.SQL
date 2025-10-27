SQL> CREATE OR REPLACE VIEW DEP30
  2  AS SELECT * FROM EMPLE WHERE DEPT_NO=30 WITH READ ONLY;

View created.

SQL> SELECT * FROM DEP30;

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO                                                                 
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------                                                                 
      7499 ARROYO     VENDEDOR         7698 20/02/90       1500        390         30                                                                 
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650         30                                                                 
      7654 MARTIN     VENDEDOR         7698 29/09/91       1600       1020         30                                                                 
      7698 NEGRO      DIRECTOR         7839 01/05/91       3005                    30                                                                 
      7844 TOVAR      VENDEDOR         7698 08/09/91       1350          0         30                                                                 
      7900 JIMENO     EMPLEADO         7698 03/12/91       1335                    30                                                                 

6 rows selected.

SQL> INSERT INTO DEP30 VALUES (9090,'GARCIA','EMPLEADO',7698,SYSDATE,1000,NULL,30);
INSERT INTO DEP30 VALUES (9090,'GARCIA','EMPLEADO',7698,SYSDATE,1000,NULL,30)
*
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view 


SQL> UPDATE DEP30 SET APELLIDO='JIMENEZ' WHERE APELLIDO='JIMENO';
UPDATE DEP30 SET APELLIDO='JIMENEZ' WHERE APELLIDO='JIMENO'
                                          *
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view 


SQL> DELETE FROM DEP30 WHERE EMP_NO=7900;
DELETE FROM DEP30 WHERE EMP_NO=7900
            *
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view 


SQL> SPOOL OFF
