SQL> CREATE OR REPLACE PROCEDURE listar_emple
  2  AS
  3    CURSOR c1 IS
  4        select apellido, salario, dept_no from emple
  5        order by dept_no, apellido;
  6    vr_emp c1%rowtype
  7    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
  8    cont_emple NUMBER(4) DEFAULT 0;
  9    sum_sal NUMBER(9,2) DEFAULT 0;
 10    tot_emple NUMBER(4) DEFAULT 0;
 11    tot_sal NUMBER(10,2) DEFAULT 0;
 12  BEGIN
 13    OPEN c1;
 14     LOOP
 15          FETCH c1 INTO vr_emp;
 16     /* Si es el primer Fetch inicializamos dep_ant */
 17        IF c1%ROWCOUNT = 1 THEN
 18           dep_ant := vr_emp.dept_no;
 19        END IF;
 20      /* Comprobaci¢n nuevo departamento (o finalizaci¢n) y resumen del anterior e inicializaci¢n
 21      de contadores y acumuladores parciales */
 22     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 23        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 24        ' NUM. EMPLEADOS: ' || cont_emple ||
 25        ' SUM. SALARIOS: ' || sum_sal);
 26     dep_ant := vr_emp.dept_no;
 27                 tot_emple := tot_emple + cont_emple;
 28        tot_sal := tot_sal + sum_sal;
 29        cont_emple := 0;
 30        sum_sal := 0;
 31        END IF;
 32     EXIT WHEN c1%NOTFOUND; /* Condici¢n de salida del bucle */
 33     /* Escribir L¡neas de detalle incrementar y acumular */
 34            DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 35            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 36         cont_emple := cont_emple + 1;
 37            sum_sal := sum_sal + vr_emp.salario;
 38      END LOOP;
 39      CLOSE c1;
 40      /* Escribir totales informe */
 41      DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 42      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 43  END listar_emple;
 44  /

Warning: Procedure created with compilation errors.

SQL> 
SQL> show errors
Errors for PROCEDURE LISTAR_EMPLE:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
7/3      PLS-00103: Encountered the symbol "DEP_ANT" when expecting one of                                                                            
         the following:                                                                                                                               
         := ( ; not null range default character                                                                                                      
         The symbol ";" was substituted for "DEP_ANT" to continue.                                                                                    
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE listar_emple
  2  AS
  3    CURSOR c1 IS
  4        select apellido, salario, dept_no from emple
  5        order by dept_no, apellido;
  6    vr_emp c1%rowtype;
  7    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
  8    cont_emple NUMBER(4) DEFAULT 0;
  9    sum_sal NUMBER(9,2) DEFAULT 0;
 10    tot_emple NUMBER(4) DEFAULT 0;
 11    tot_sal NUMBER(10,2) DEFAULT 0;
 12  BEGIN
 13    OPEN c1;
 14     LOOP
 15          FETCH c1 INTO vr_emp;
 16     /* Si es el primer Fetch inicializamos dep_ant */
 17        IF c1%ROWCOUNT = 1 THEN
 18           dep_ant := vr_emp.dept_no;
 19        END IF;
 20      /* Comprobaci¢n nuevo departamento (o finalizaci¢n) y resumen del anterior e inicializaci¢n
 21      de contadores y acumuladores parciales */
 22     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 23        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 24        ' NUM. EMPLEADOS: ' || cont_emple ||
 25        ' SUM. SALARIOS: ' || sum_sal);
 26     dep_ant := vr_emp.dept_no;
 27                 tot_emple := tot_emple + cont_emple;
 28        tot_sal := tot_sal + sum_sal;
 29        cont_emple := 0;
 30        sum_sal := 0;
 31        END IF;
 32     EXIT WHEN c1%NOTFOUND; /* Condici¢n de salida del bucle */
 33     /* Escribir L¡neas de detalle incrementar y acumular */
 34            DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 35            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 36         cont_emple := cont_emple + 1;
 37            sum_sal := sum_sal + vr_emp.salario;
 38      END LOOP;
 39      CLOSE c1;
 40      /* Escribir totales informe */
 41      DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 42      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 43  END listar_emple;
 44  /

Procedure created.

SQL> execute listar_emple
CEREZO     *        2,885                                                                                                                             
MU¥OZ      *        1,690                                                                                                                             
REY        *        4,100                                                                                                                             
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
ALONSO     *        1,430                                                                                                                             
FERNANDEZ  *        3,000                                                                                                                             
GIL        *        3,000                                                                                                                             
JIMENEZ    *        2,900                                                                                                                             
SANCHEZ    *        1,040                                                                                                                             
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
ARROYO     *        1,500                                                                                                                             
JIMENO     *        1,335                                                                                                                             
MARTIN     *        1,600                                                                                                                             
NEGRO      *        3,005                                                                                                                             
SALA       *        1,625                                                                                                                             
TOVAR      *        1,350                                                                                                                             
*** DEPTO: 30 NUM. EMPLEADOS: 6 SUM. SALARIOS: 10415                                                                                                  
****** NUMERO TOTAL EMPLEADOS: 14 TOTAL SALARIOS: 30460                                                                                               

PL/SQL procedure successfully completed.

SQL> spool off
