SQL> CREATE OR REPLACE PROCEDURE sube_salario (
  2  num_dept_elegido NUMBER,
  3  subida NUMBER)
  4  AS
  5    /* Bienve, 19/04/2022
  6    Programa que se le pasen el departamento y la subida y actualice los salarios*/
  7    CURSOR c_emple is SELECT EMP_NO, SALARIO, ROWID FROM EMPLE WHERE DEPT_NO=NUM_DEPT_ELEGIDO;
  8    vc_emple c_emple%ROWTYPE;
  9  BEGIN
 10    OPEN C_EMPLE;
 11    FETCH C_EMPLE INTO VC_EMPLE;
 12    WHILE C_EMPLE%FOUND LOOP
 13      UPDATE EMPLE SET SALARIO = SALARIO + SUBIDA
 14      WHERE ROWID = VC_EMPLE.ROWID;
 15      FETCH C_EMPLE INTO VC_EMPLE;
 16    END LOOP;
 17    DBMS_OUTPUT.PUT_LINE('SE HAN ACTUALIZADO '|| C_EMPLE%ROWCOUNT||' EMPLEADOS');
 18    CLOSE C_EMPLE;
 19  END SUBE_SALARIO;
 20  /

Procedure created.

SQL> SELECT * FROM EMPLE;

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

SQL> EXECUTE SUBE_SALARIO (10,10)
SE HAN ACTUALIZADO 3 EMPLEADOS                                                                                                                        

PL/SQL procedure successfully completed.

SQL> SELECT * FROM EMPLE;

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO                                                                 
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------                                                                 
      7369 SANCHEZ    EMPLEADO         7902 17/12/90       1040                    20                                                                 
      7499 ARROYO     VENDEDOR         7698 20/02/90       1500        390         30                                                                 
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650         30                                                                 
      7566 JIMENEZ    DIRECTOR         7839 02/04/91       2900                    20                                                                 
      7654 MARTIN     VENDEDOR         7698 29/09/91       1600       1020         30                                                                 
      7698 NEGRO      DIRECTOR         7839 01/05/91       3005                    30                                                                 
      7782 CEREZO     DIRECTOR         7839 09/06/91       2895                    10                                                                 
      7788 GIL        ANALISTA         7566 09/11/91       3000                    20                                                                 
      7839 REY        PRESIDENTE            17/11/91       4110                    10                                                                 
      7844 TOVAR      VENDEDOR         7698 08/09/91       1350          0         30                                                                 
      7876 ALONSO     EMPLEADO         7788 23/09/91       1430                    20                                                                 
      7900 JIMENO     EMPLEADO         7698 03/12/91       1335                    30                                                                 
      7902 FERNANDEZ  ANALISTA         7566 03/12/91       3000                    20                                                                 
      7934 MU¥OZ      EMPLEADO         7782 23/01/92       1700                    10                                                                 

14 rows selected.

SQL> SPOOL OFF
