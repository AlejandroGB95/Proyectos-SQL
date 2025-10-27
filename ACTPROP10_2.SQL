SQL> DESC EMPLE
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 EMP_NO                                                                              NOT NULL NUMBER(4)
 APELLIDO                                                                                     VARCHAR2(10)
 OFICIO                                                                                       VARCHAR2(10)
 DIR                                                                                          NUMBER(4)
 FECHA_ALT                                                                                    DATE
 SALARIO                                                                                      NUMBER(7)
 COMISION                                                                                     NUMBER(7)
 DEPT_NO                                                                             NOT NULL NUMBER(2)

SQL> CREATE OR REPLACE PROCEDURE apellido_afin (
  2  cadena_Apellido VARCHAR2)
  3  AS
  4    v_apellido_parcial emple.apellido%rowtype;
  5    CURSOR c1 IS
  6    SELECT apellido, dept_no FROM emple WHERE apellido LIKE v_apellido_parcial;
  7    v_apellido emple.apellido%type;
  8    v_dept_no emple.dept_no%type;
  9  
 10  BEGIN
 11    v_apellido_parcial := cadena_Apellido;
 12    OPEN c1;
 13    FETCH c1 INTO v_apellido,v_dept_no;
 14    WHILE c1%FOUND LOOP
 15       DBMS_OUTPUT.PUT_LINE(v_apellido||*||v_dept_no);
 16       FETCH c1 INTO v_apellido,v_dept_no;
 17    END LOOP;
 18    CLOSE c1;
 19  END;
 20  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE APELLIDO_AFIN:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
15/39    PLS-00103: Encountered the symbol "*" when expecting one of the                                                                              
         following:                                                                                                                                   
         ( - + case mod new null <an identifier>                                                                                                      
         <a double-quoted delimited-identifier> <a bind variable>                                                                                     
         continue avg count current max min prior sql stddev sum                                                                                      
         variance execute forall merge time timestamp interval date                                                                                   
         <a string literal with character set specification>                                                                                          
         <a number> <a single-quoted SQL string> pipe                                                                                                 
         <an alternatively-quoted string literal with character set                                                                                   
         specification>                                                                                                                               
         <an alternatively-quoted SQL                                                                                                                 
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE apellido_afin (
  2  cadena_Apellido VARCHAR2)
  3  AS
  4    v_apellido_parcial emple.apellido%rowtype;
  5    CURSOR c1 IS
  6    SELECT apellido, dept_no FROM emple WHERE apellido LIKE v_apellido_parcial;
  7    v_apellido emple.apellido%type;
  8    v_dept_no emple.dept_no%type;
  9  
 10  BEGIN
 11    v_apellido_parcial := cadena_Apellido;
 12    OPEN c1;
 13    FETCH c1 INTO v_apellido,v_dept_no;
 14    WHILE c1%FOUND LOOP
 15       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||v_dept_no);
 16       FETCH c1 INTO v_apellido,v_dept_no;
 17    END LOOP;
 18    CLOSE c1;
 19  END;
 20  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE APELLIDO_AFIN:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
4/22     PL/SQL: Item ignored                                                                                                                         
4/22     PLS-00310: with %ROWTYPE attribute, 'EMPLE.APELLIDO' must name a                                                                             
         table, cursor or cursor-variable                                                                                                             
                                                                                                                                                      
6/3      PL/SQL: SQL Statement ignored                                                                                                                
6/59     PL/SQL: ORA-00904: "V_APELLIDO_PARCIAL": invalid identifier                                                                                  
6/59     PLS-00320: the declaration of the type of this expression is                                                                                 
         incomplete or malformed                                                                                                                      
                                                                                                                                                      
11/3     PL/SQL: Statement ignored                                                                                                                    
11/3     PLS-00320: the declaration of the type of this expression is                                                                                 
         incomplete or malformed                                                                                                                      
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE apellido_afin (
  2  cadena_Apellido VARCHAR2)
  3  AS
  4    v_apellido_parcial emple.apellido%type;
  5    CURSOR c1 IS
  6    SELECT apellido, dept_no FROM emple WHERE apellido LIKE v_apellido_parcial;
  7    v_apellido emple.apellido%type;
  8    v_dept_no emple.dept_no%type;
  9  
 10  BEGIN
 11    v_apellido_parcial := cadena_Apellido;
 12    OPEN c1;
 13    FETCH c1 INTO v_apellido,v_dept_no;
 14    WHILE c1%FOUND LOOP
 15       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||v_dept_no);
 16       FETCH c1 INTO v_apellido,v_dept_no;
 17    END LOOP;
 18    CLOSE c1;
 19  END;
 20  /

Procedure created.

SQL> execute apellido_afin('ar')

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE apellido_afin (
 cadena_Apellido VARCHAR2)
 AS
       -- Bienve 5/04/2022
       -- Procedimiento para sacar los empleados que tienen un apellido que coincide con una cadena que se pase por parámetros.
   v_apellido_parcial emple.apellido%type;
   CURSOR c1 IS
   SELECT apellido, emp_no FROM emple WHERE apellido LIKE '%'||v_apellido_parcial||'%';
   v_apellido emple.apellido%type;
   v_emp_no emple.emp_no%type;

 BEGIN
   v_apellido_parcial := cadena_Apellido;
   OPEN c1;
   FETCH c1 INTO v_apellido,v_emp_no;
   WHILE c1%FOUND LOOP
     DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||v_emp_no);
    FETCH c1 INTO v_apellido,v_emp_no;
  END LOOP;
  CLOSE c1;
END;
/

Procedure created.

SQL> execute apellido_afin('ar')

PL/SQL procedure successfully completed.

SQL> execute apellido_afin('AR')
ARROYO*7499                                                                                                                                           
MARTIN*7654                                                                                                                                           
TOVAR*7844                                                                                                                                            

PL/SQL procedure successfully completed.

SQL> spool off
