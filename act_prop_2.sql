SQL> select * from emple;

    EMP_NO APELLIDO   OFICIO            DIR FECHA_ALT     SALARIO   COMISION    DEPT_NO                                                               
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                                               
      7369 SANCHEZ    EMPLEADO         7902 17/12/1990       1040                    20                                                               
      7499 ARROYO     VENDEDOR         7698 20/02/1990       1500        390         30                                                               
      7521 SALA       VENDEDOR         7698 22/02/1991       1625        650         30                                                               
      7566 JIMENEZ    DIRECTOR         7839 02/04/1991       2900                    20                                                               
      7654 MARTIN     VENDEDOR         7698 29/09/1991       1600       1020         30                                                               
      7698 NEGRO      DIRECTOR         7839 01/05/1991       3005                    30                                                               
      7782 CEREZO     DIRECTOR         7839 09/06/1991       2885                    10                                                               
      7788 GIL        ANALISTA         7566 09/11/1991       3000                    20                                                               
      7839 REY        PRESIDENTE            17/11/1991       4100                    10                                                               
      7844 TOVAR      VENDEDOR         7698 08/09/1991       1350          0         30                                                               
      7876 ALONSO     EMPLEADO         7788 23/09/1991       1430                    20                                                               

    EMP_NO APELLIDO   OFICIO            DIR FECHA_ALT     SALARIO   COMISION    DEPT_NO                                                               
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                                               
      7900 JIMENO     EMPLEADO         7698 03/12/1991       1335                    30                                                               
      7902 FERNANDEZ  ANALISTA         7566 03/12/1991       3000                    20                                                               
      7934 MU¥OZ      EMPLEADO         7782 23/01/1992       1690                    10                                                               

14 rows selected.

SQL> select count(apellido) from emple where apellido like 'a%';

COUNT(APELLIDO)                                                                                                                                       
---------------                                                                                                                                       
              0                                                                                                                                       

SQL> select count(apellido) from emple where apellido like 'A%';

COUNT(APELLIDO)                                                                                                                                       
---------------                                                                                                                                       
              2                                                                                                                                       

SQL> select apellido from emple where apellido like 'A%' and salario =
  2  (select salario from emple where apellido like 'A%' and max(salario));
(select salario from emple where apellido like 'A%' and max(salario))
                                                        *
ERROR at line 2:
ORA-00934: group function is not allowed here 


SQL> select apellido from emple where apellido like 'A%' and salario =
  2  (select salario from emple where apellido like 'A%' and salario=max(salario));
(select salario from emple where apellido like 'A%' and salario=max(salario))
                                                                *
ERROR at line 2:
ORA-00934: group function is not allowed here 


SQL> select apellido from emple where apellido like 'A%' and salario =
  2  (select max(salario) from emple where apellido like 'A%');

APELLIDO                                                                                                                                              
----------                                                                                                                                            
ARROYO                                                                                                                                                

SQL> spool off
