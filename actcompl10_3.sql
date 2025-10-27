SQL> 
SQL> CREATE OR REPLACE PROCEDURE salarios_altos
  2  AS
  3    CURSOR c1 IS
  4    SELECT apellido, salario FROM emple order by salario desc;
  5    v_apellido emple.apellido%type;
  6    salario emple.fecha_alt%type;
  7  
  8  BEGIN
  9     OPEN c1;
 10    FETCH c1 INTO v_apellido,v_fecha_alta;
 11    WHILE c1%ROWCOUNT<=5 LOOP
 12       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||salario);
 13      FETCH c1 INTO v_apellido,v_fecha_alta;
 14   END LOOP;
 15  CLOSE c1;
 16  END;
 17  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE SALARIOS_ALTOS:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
10/3     PL/SQL: SQL Statement ignored                                                                                                                
10/28    PLS-00201: identifier 'V_FECHA_ALTA' must be declared                                                                                        
13/5     PL/SQL: SQL Statement ignored                                                                                                                
13/30    PLS-00201: identifier 'V_FECHA_ALTA' must be declared                                                                                        
SQL> CREATE OR REPLACE PROCEDURE salarios_altos
  2  AS
  3    CURSOR c1 IS
  4    SELECT apellido, salario FROM emple order by salario desc;
  5    v_apellido emple.apellido%type;
  6    salario emple.fecha_alt%type;
  7  
  8  BEGIN
  9     OPEN c1;
 10    FETCH c1 INTO v_apellido,salario;
 11    WHILE c1%ROWCOUNT<=5 LOOP
 12       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||salario);
 13      FETCH c1 INTO v_apellido,salario;
 14   END LOOP;
 15  CLOSE c1;
 16  END;
 17  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE SALARIOS_ALTOS:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
10/3     PL/SQL: SQL Statement ignored                                                                                                                
10/28    PLS-00386: type mismatch found at 'SALARIO' between FETCH cursor                                                                             
         and INTO variables                                                                                                                           
                                                                                                                                                      
13/5     PL/SQL: SQL Statement ignored                                                                                                                
13/30    PLS-00386: type mismatch found at 'SALARIO' between FETCH cursor                                                                             
         and INTO variables                                                                                                                           
                                                                                                                                                      
SQL> 
SQL> CREATE OR REPLACE PROCEDURE salarios_altos
  2  AS
  3    CURSOR c1 IS
  4    SELECT apellido, salario FROM emple order by salario desc;
  5    v_apellido emple.apellido%type;
  6    salario emple.salario%type;
  7  
  8  BEGIN
  9     OPEN c1;
 10    FETCH c1 INTO v_apellido,salario;
 11    WHILE c1%ROWCOUNT<=5 LOOP
 12       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||salario);
 13      FETCH c1 INTO v_apellido,salario;
 14   END LOOP;
 15  CLOSE c1;
 16  END;
 17  /

Procedure created.

SQL> execute salarios_altos
REY*4100                                                                                                                                              
NEGRO*3005                                                                                                                                            
FERNANDEZ*3000                                                                                                                                        
GIL*3000                                                                                                                                              
JIMENEZ*2900                                                                                                                                          

PL/SQL procedure successfully completed.

SQL> spool off
