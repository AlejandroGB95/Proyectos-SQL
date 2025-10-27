SQL> CREATE OR REPLACE PROCEDURE sube_salario
  2  AS
  3    /* Bienve, 6/04/2022
  4    Programa que muestra el departamento y el numero de empleados por departamento*/
  5    CURSOR c1 IS
  6        SELECT dnombre, count(*)suma FROM emple, depart where emple.dept_no=depart.dept_no group by dnombre, emple.dept_no order by emple.dept_no;
  7    vc_dept c1%ROWTYPE;
  8  BEGIN
  9    OPEN c1;
 10    FETCH c1 INTO vc_dept;
 11    WHILE c1%FOUND LOOP
 12       DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO DE '||vc_dept.dnombre||' NUM. EMPLEADOS: '||vc_dept.suma);
 13    FETCH c1 INTO vc_dept;
 14    END LOOP;
 15   CLOSE c1;
 16  END;
 17  /

Procedure created.

SQL> CREATE OR REPLACE PROCEDURE lista_dept
  2  AS
  3    /* Bienve, 6/04/2022
  4    Programa que muestra el departamento y el numero de empleados por departamento*/
  5    CURSOR c1 IS
  6        SELECT dnombre, count(*)suma FROM emple, depart where emple.dept_no=depart.dept_no group by dnombre, emple.dept_no order by emple.dept_no;
  7    vc_dept c1%ROWTYPE;
  8  BEGIN
  9    OPEN c1;
 10    FETCH c1 INTO vc_dept;
 11    WHILE c1%FOUND LOOP
 12       DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO DE '||vc_dept.dnombre||' NUM. EMPLEADOS: '||vc_dept.suma);
 13    FETCH c1 INTO vc_dept;
 14    END LOOP;
 15   CLOSE c1;
 16  END;
 17  /

Procedure created.

SQL> execute lista_dept
DEPARTAMENTO DE CONTABILIDAD NUM. EMPLEADOS: 3                                                                                                        
DEPARTAMENTO DE INVESTIGACION NUM. EMPLEADOS: 5                                                                                                       
DEPARTAMENTO DE VENTAS NUM. EMPLEADOS: 6                                                                                                              

PL/SQL procedure successfully completed.

SQL> spool off
