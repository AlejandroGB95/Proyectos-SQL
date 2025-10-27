SQL> CREATE OR REPLACE PROCEDURE listar_emple_for
  2  AS
  3  // Bienve, 19/04/2022
  4  // listar empleados con bucle for
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no from emple
  7        order by dept_no, apellido;
  8    vr_emp c1%rowtype;
  9    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 10    cont_emple NUMBER(4) DEFAULT 0;
 11    sum_sal NUMBER(9,2) DEFAULT 0;
 12    tot_emple NUMBER(4) DEFAULT 0;
 13    tot_sal NUMBER(10,2) DEFAULT 0;
 14  BEGIN
 15    FOR vr_emp in c1 LOOP
 16        //Primera lectura
 17           IF c1%ROWCOUNT = 1 THEN
 18             dep_ant := vr_emp.dept_no;
 19           END IF;
 20     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 21        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 22        ' NUM. EMPLEADOS: ' || cont_emple ||
 23        ' SUM. SALARIOS: ' || sum_sal);
 24     dep_ant := vr_emp.dept_no;
 25                 tot_emple := tot_emple + cont_emple;
 26        tot_sal := tot_sal + sum_sal;
 27        cont_emple := 0;
 28        sum_sal := 0;
 29     END IF;
 30     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 31            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 32         cont_emple := cont_emple + 1;
 33            sum_sal := sum_sal + vr_emp.salario;
 34     END LOOP;
 35     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 36      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 37  END listar_emple_for;
 38  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE LISTAR_EMPLE_FOR:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
3/1      PLS-00103: Encountered the symbol "/" when expecting one of the                                                                              
         following:                                                                                                                                   
         begin function pragma procedure subtype type <an identifier>                                                                                 
         <a double-quoted delimited-identifier> current cursor delete                                                                                 
         exists prior external language                                                                                                               
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE listar_emple_for
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no from emple
  7        order by dept_no, apellido;
  8    vr_emp c1%rowtype;
  9    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 10    cont_emple NUMBER(4) DEFAULT 0;
 11    sum_sal NUMBER(9,2) DEFAULT 0;
 12    tot_emple NUMBER(4) DEFAULT 0;
 13    tot_sal NUMBER(10,2) DEFAULT 0;
 14  BEGIN
 15    FOR vr_emp in c1 LOOP
 16        //Primera lectura
 17           IF c1%ROWCOUNT = 1 THEN
 18             dep_ant := vr_emp.dept_no;
 19           END IF;
 20     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 21        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 22        ' NUM. EMPLEADOS: ' || cont_emple ||
 23        ' SUM. SALARIOS: ' || sum_sal);
 24     dep_ant := vr_emp.dept_no;
 25                 tot_emple := tot_emple + cont_emple;
 26        tot_sal := tot_sal + sum_sal;
 27        cont_emple := 0;
 28        sum_sal := 0;
 29     END IF;
 30     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 31            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 32         cont_emple := cont_emple + 1;
 33            sum_sal := sum_sal + vr_emp.salario;
 34     END LOOP;
 35     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 36      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 37  END listar_emple_for;
 38  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE LISTAR_EMPLE_FOR:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
16/7     PLS-00103: Encountered the symbol "/" when expecting one of the                                                                              
         following:                                                                                                                                   
         ( begin case declare exit for goto if loop mod null pragma                                                                                   
         raise return select update while with <an identifier>                                                                                        
         <a double-quoted delimited-identifier> <a bind variable> <<                                                                                  
         continue close current delete fetch lock insert open rollback                                                                                
         savepoint set sql execute commit forall merge pipe purge                                                                                     
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE listar_emple_for
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no from emple
  7        order by dept_no, apellido;
  8    vr_emp c1%rowtype;
  9    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 10    cont_emple NUMBER(4) DEFAULT 0;
 11    sum_sal NUMBER(9,2) DEFAULT 0;
 12    tot_emple NUMBER(4) DEFAULT 0;
 13    tot_sal NUMBER(10,2) DEFAULT 0;
 14  BEGIN
 15    FOR vr_emp in c1 LOOP
 16        /*Primera lectura*/
 17           IF c1%ROWCOUNT = 1 THEN
 18             dep_ant := vr_emp.dept_no;
 19           END IF;
 20     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 21        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 22        ' NUM. EMPLEADOS: ' || cont_emple ||
 23        ' SUM. SALARIOS: ' || sum_sal);
 24     dep_ant := vr_emp.dept_no;
 25                 tot_emple := tot_emple + cont_emple;
 26        tot_sal := tot_sal + sum_sal;
 27        cont_emple := 0;
 28        sum_sal := 0;
 29     END IF;
 30     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 31            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 32         cont_emple := cont_emple + 1;
 33            sum_sal := sum_sal + vr_emp.salario;
 34     END LOOP;
 35     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 36      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 37  END listar_emple_for;
 38  /

Procedure created.

SQL> execute listar_emple_for
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
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

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

SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_empl.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 25        ' NUM. EMPLEADOS: ' || cont_emple ||
 26        ' SUM. SALARIOS: ' || sum_sal);
 27     dep_ant := vr_emp.dept_no;
 28                 tot_emple := tot_emple + cont_emple;
 29        tot_sal := tot_sal + sum_sal;
 30        cont_emple := 0;
 31        sum_sal := 0;
 32        SUM_OFICIO:=0;
 33     END IF;
 34     IF oficio_anterior <> vr_emp.oficio then
 35        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 36        'NUM. EMPLEADOS: '||SUM_OFICIO);
 37         SUM_OFICIO:=0;
 38     END IF;
 39     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 40            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 41         cont_emple := cont_emple + 1;
 42            sum_sal := sum_sal + vr_emp.salario;
 43     END LOOP;
 44     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 45      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 46  END listar_emple_for_oficio;
 47  /

Warning: Procedure created with compilation errors.

SQL> SHOW ERRORS
Errors for PROCEDURE LISTAR_EMPLE_FOR_OFICIO:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
21/12    PL/SQL: Statement ignored                                                                                                                    
21/31    PLS-00201: identifier 'VR_EMPL.OFICIO' must be declared                                                                                      
SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_emp.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 25        ' NUM. EMPLEADOS: ' || cont_emple ||
 26        ' SUM. SALARIOS: ' || sum_sal);
 27     dep_ant := vr_emp.dept_no;
 28                 tot_emple := tot_emple + cont_emple;
 29        tot_sal := tot_sal + sum_sal;
 30        cont_emple := 0;
 31        sum_sal := 0;
 32        SUM_OFICIO:=0;
 33     END IF;
 34     IF oficio_anterior <> vr_emp.oficio then
 35        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 36        'NUM. EMPLEADOS: '||SUM_OFICIO);
 37         SUM_OFICIO:=0;
 38     END IF;
 39     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 40            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 41         cont_emple := cont_emple + 1;
 42            sum_sal := sum_sal + vr_emp.salario;
 43     END LOOP;
 44     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 45      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 46  END listar_emple_for_oficio;
 47  /

Procedure created.

SQL> EXECUTE LISTAR_EMPLE_FOR_OFICIO
CEREZO     *        2,885                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
MU¥OZ      *        1,690                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
REY        *        4,100                                                                                                                             
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
ALONSO     *        1,430                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
FERNANDEZ  *        3,000                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
GIL        *        3,000                                                                                                                             
JIMENEZ    *        2,900                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
SANCHEZ    *        1,040                                                                                                                             
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
ARROYO     *        1,500                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
JIMENO     *        1,335                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
MARTIN     *        1,600                                                                                                                             
NEGRO      *        3,005                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
SALA       *        1,625                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
TOVAR      *        1,350                                                                                                                             
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for CORTANDO POR OFICIO*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_emp.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 25        ' NUM. EMPLEADOS: ' || cont_emple ||
 26        ' SUM. SALARIOS: ' || sum_sal);
 27     dep_ant := vr_emp.dept_no;
 28                 tot_emple := tot_emple + cont_emple;
 29        tot_sal := tot_sal + sum_sal;
 30        cont_emple := 0;
 31        sum_sal := 0;
 32        SUM_OFICIO:=0;
 33     END IF;
 34     IF oficio_anterior <> vr_emp.oficio then
 35        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 36        'NUM. EMPLEADOS: '||SUM_OFICIO);
 37         oficio_anterior := vr_emp.oficio;
 38         SUM_OFICIO:=0;
 39     END IF;
 40     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 41            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 42         cont_emple := cont_emple + 1;
 43            sum_sal := sum_sal + vr_emp.salario;
 44     END LOOP;
 45     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 46      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 47  END listar_emple_for_oficio;
 48  /

Procedure created.

SQL> execute listar_emple_for_oficio
CEREZO     *        2,885                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
MU¥OZ      *        1,690                                                                                                                             
OFICIO: EMPLEADONUM. EMPLEADOS: 0                                                                                                                     
REY        *        4,100                                                                                                                             
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
OFICIO: PRESIDENTENUM. EMPLEADOS: 0                                                                                                                   
ALONSO     *        1,430                                                                                                                             
OFICIO: EMPLEADONUM. EMPLEADOS: 0                                                                                                                     
FERNANDEZ  *        3,000                                                                                                                             
GIL        *        3,000                                                                                                                             
OFICIO: ANALISTANUM. EMPLEADOS: 0                                                                                                                     
JIMENEZ    *        2,900                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
SANCHEZ    *        1,040                                                                                                                             
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
OFICIO: EMPLEADONUM. EMPLEADOS: 0                                                                                                                     
ARROYO     *        1,500                                                                                                                             
OFICIO: VENDEDORNUM. EMPLEADOS: 0                                                                                                                     
JIMENO     *        1,335                                                                                                                             
OFICIO: EMPLEADONUM. EMPLEADOS: 0                                                                                                                     
MARTIN     *        1,600                                                                                                                             
OFICIO: VENDEDORNUM. EMPLEADOS: 0                                                                                                                     
NEGRO      *        3,005                                                                                                                             
OFICIO: DIRECTORNUM. EMPLEADOS: 0                                                                                                                     
SALA       *        1,625                                                                                                                             
TOVAR      *        1,350                                                                                                                             
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for CORTANDO POR OFICIO*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_emp.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 25        ' NUM. EMPLEADOS: ' || cont_emple ||
 26        ' SUM. SALARIOS: ' || sum_sal);
 27     dep_ant := vr_emp.dept_no;
 28                 tot_emple := tot_emple + cont_emple;
 29        tot_sal := tot_sal + sum_sal;
 30        cont_emple := 0;
 31        sum_sal := 0;
 32        SUM_OFICIO:=0;
 33     END IF;
 34     IF oficio_anterior <> vr_emp.oficio then
 35        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 36        '  NUM. EMPLEADOS: '||SUM_OFICIO);
 37         oficio_anterior := vr_emp.oficio;
 38         SUM_OFICIO:=0;
 39     END IF;
 40     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 41            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 42         cont_emple := cont_emple + 1;
 43            sum_sal := sum_sal + vr_emp.salario;
 44            sum_oficio:= sum_oficio + 1;
 45     END LOOP;
 46     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 47      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 48  END listar_emple_for_oficio;
 49  /

Procedure created.

SQL> execute listar_emple_for_oficio
CEREZO     *        2,885                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
MU¥OZ      *        1,690                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
REY        *        4,100                                                                                                                             
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
OFICIO: PRESIDENTE  NUM. EMPLEADOS: 0                                                                                                                 
ALONSO     *        1,430                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
FERNANDEZ  *        3,000                                                                                                                             
GIL        *        3,000                                                                                                                             
OFICIO: ANALISTA  NUM. EMPLEADOS: 2                                                                                                                   
JIMENEZ    *        2,900                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SANCHEZ    *        1,040                                                                                                                             
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
OFICIO: EMPLEADO  NUM. EMPLEADOS: 0                                                                                                                   
ARROYO     *        1,500                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
JIMENO     *        1,335                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
MARTIN     *        1,600                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
NEGRO      *        3,005                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SALA       *        1,625                                                                                                                             
TOVAR      *        1,350                                                                                                                             
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for CORTANDO POR OFICIO*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_emp.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 25        ' NUM. EMPLEADOS: ' || cont_emple ||
 26        ' SUM. SALARIOS: ' || sum_sal);
 27     dep_ant := vr_emp.dept_no;
 28                 tot_emple := tot_emple + cont_emple;
 29        tot_sal := tot_sal + sum_sal;
 30        cont_emple := 0;
 31        sum_sal := 0;
 32        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 33        '  NUM. EMPLEADOS: '||SUM_OFICIO);
 34         oficio_anterior := vr_emp.oficio;
 35        SUM_OFICIO:=0;
 36     END IF;
 37     IF oficio_anterior <> vr_emp.oficio then
 38        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 39        '  NUM. EMPLEADOS: '||SUM_OFICIO);
 40         oficio_anterior := vr_emp.oficio;
 41         SUM_OFICIO:=0;
 42     END IF;
 43     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 44            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 45         cont_emple := cont_emple + 1;
 46            sum_sal := sum_sal + vr_emp.salario;
 47            sum_oficio:= sum_oficio + 1;
 48     END LOOP;
 49     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 50      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 51  END listar_emple_for_oficio;
 52  /

Procedure created.

SQL> execute listar_emple_for_oficio
CEREZO     *        2,885                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
MU¥OZ      *        1,690                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
REY        *        4,100                                                                                                                             
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
OFICIO: PRESIDENTE  NUM. EMPLEADOS: 1                                                                                                                 
ALONSO     *        1,430                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
FERNANDEZ  *        3,000                                                                                                                             
GIL        *        3,000                                                                                                                             
OFICIO: ANALISTA  NUM. EMPLEADOS: 2                                                                                                                   
JIMENEZ    *        2,900                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SANCHEZ    *        1,040                                                                                                                             
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
ARROYO     *        1,500                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
JIMENO     *        1,335                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
MARTIN     *        1,600                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
NEGRO      *        3,005                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SALA       *        1,625                                                                                                                             
TOVAR      *        1,350                                                                                                                             
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE listar_emple_for_oficio
  2  AS
  3  /*Bienve, 19/04/2022
  4  listar empleados con bucle for CORTANDO POR OFICIO*/
  5    CURSOR c1 IS
  6        select apellido, salario, dept_no, oficio from emple
  7        order by dept_no, apellido, oficio;
  8    vr_emp c1%rowtype;
  9    oficio_anterior EMPLE.OFICIO%TYPE;
 10    dep_ant EMPLE.DEPT_NO%TYPE DEFAULT 0;
 11    cont_emple NUMBER(4) DEFAULT 0;
 12    sum_oficio NUMBER (4) DEFAULT 0;
 13    sum_sal NUMBER(9,2) DEFAULT 0;
 14    tot_emple NUMBER(4) DEFAULT 0;
 15    tot_sal NUMBER(10,2) DEFAULT 0;
 16  BEGIN
 17    FOR vr_emp in c1 LOOP
 18        /*Primera lectura*/
 19           IF c1%ROWCOUNT = 1 THEN
 20             dep_ant := vr_emp.dept_no;
 21             oficio_anterior := vr_emp.oficio;
 22           END IF;
 23     IF dep_ant <> vr_emp.dept_no OR c1%NOTFOUND THEN
 24        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 25        '  NUM. EMPLEADOS: '||SUM_OFICIO);
 26         oficio_anterior := vr_emp.oficio;
 27        SUM_OFICIO:=0;
 28        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dep_ant ||
 29        ' NUM. EMPLEADOS: ' || cont_emple ||
 30        ' SUM. SALARIOS: ' || sum_sal);
 31     dep_ant := vr_emp.dept_no;
 32                 tot_emple := tot_emple + cont_emple;
 33        tot_sal := tot_sal + sum_sal;
 34        cont_emple := 0;
 35        sum_sal := 0;
 36     END IF;
 37     IF oficio_anterior <> vr_emp.oficio then
 38        DBMS_OUTPUT.PUT_LINE('OFICIO: '|| oficio_anterior ||
 39        '  NUM. EMPLEADOS: '||SUM_OFICIO);
 40         oficio_anterior := vr_emp.oficio;
 41         SUM_OFICIO:=0;
 42     END IF;
 43     DBMS_OUTPUT.PUT_LINE(RPAD(vr_emp.apellido,10) || ' * '
 44            ||LPAD(TO_CHAR(vr_emp.salario,'999,999'),12));
 45         cont_emple := cont_emple + 1;
 46            sum_sal := sum_sal + vr_emp.salario;
 47            sum_oficio:= sum_oficio + 1;
 48     END LOOP;
 49     DBMS_OUTPUT.PUT_LINE(' ****** NUMERO TOTAL EMPLEADOS: '
 50      || tot_emple || ' TOTAL SALARIOS: ' || tot_sal);
 51  END listar_emple_for_oficio;
 52  /

Procedure created.

SQL> execute listar_emple_for_oficio
CEREZO     *        2,885                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
MU¥OZ      *        1,690                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
REY        *        4,100                                                                                                                             
OFICIO: PRESIDENTE  NUM. EMPLEADOS: 1                                                                                                                 
*** DEPTO: 10 NUM. EMPLEADOS: 3 SUM. SALARIOS: 8675                                                                                                   
ALONSO     *        1,430                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
FERNANDEZ  *        3,000                                                                                                                             
GIL        *        3,000                                                                                                                             
OFICIO: ANALISTA  NUM. EMPLEADOS: 2                                                                                                                   
JIMENEZ    *        2,900                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SANCHEZ    *        1,040                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
*** DEPTO: 20 NUM. EMPLEADOS: 5 SUM. SALARIOS: 11370                                                                                                  
ARROYO     *        1,500                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
JIMENO     *        1,335                                                                                                                             
OFICIO: EMPLEADO  NUM. EMPLEADOS: 1                                                                                                                   
MARTIN     *        1,600                                                                                                                             
OFICIO: VENDEDOR  NUM. EMPLEADOS: 1                                                                                                                   
NEGRO      *        3,005                                                                                                                             
OFICIO: DIRECTOR  NUM. EMPLEADOS: 1                                                                                                                   
SALA       *        1,625                                                                                                                             
TOVAR      *        1,350                                                                                                                             
****** NUMERO TOTAL EMPLEADOS: 8 TOTAL SALARIOS: 20045                                                                                                

PL/SQL procedure successfully completed.

SQL> spool off
