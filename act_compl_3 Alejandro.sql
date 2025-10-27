SQL> set linesize 150;
SQL> set pagesize 50;
SQL> select * from emple where dept_no = (select dept_no from depart where dnombre = 'VENTAS');

    EMP_NO APELLIDO   OFICIO            DIR FECHA_AL    SALARIO   COMISION    DEPT_NO                                                                 
---------- ---------- ---------- ---------- -------- ---------- ---------- ----------                                                                 
      7499 ARROYO     VENDEDOR         7698 20/02/90       1500        390         30                                                                 
      7521 SALA       VENDEDOR         7698 22/02/91       1625        650         30                                                                 
      7654 MARTIN     VENDEDOR         7698 29/09/91       1600       1020         30                                                                 
      7698 NEGRO      DIRECTOR         7839 01/05/91       3005                    30                                                                 
      7844 TOVAR      VENDEDOR         7698 08/09/91       1350          0         30                                                                 
      7900 JIMENO     EMPLEADO         7698 03/12/91       1335                    30                                                                 

6 rows selected.

SQL> SPOOL OFF
