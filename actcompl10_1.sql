SQL> desc emple
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

SQL> CREATE OR REPLACE PROCEDURE apellido_afin ()
  2  AS
  3    v_apellido_parcial emple.apellido%type;
  4    CURSOR c1 IS
  5    SELECT apellido, fecha_alt FROM emple order by apellido;
  6    v_apellido emple.apellido%type;
  7    v_fecha_alta emple.fecha_alt%type;
  8  
  9  BEGIN
 10  
 11    OPEN c1;
 12    FETCH c1 INTO v_apellido,v_fecha_alta;
 13    WHILE c1%FOUND LOOP
 14       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||v_fecha_alta);
 15       FETCH c1 INTO v_apellido,v_fecha_alta;
 16    END LOOP;
 17    CLOSE c1;
 18  END;
 19  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE APELLIDO_AFIN:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
1/26     PLS-00103: Encountered the symbol ")" when expecting one of the                                                                              
         following:                                                                                                                                   
         <an identifier> <a double-quoted delimited-identifier>                                                                                       
         current delete exists prior                                                                                                                  
                                                                                                                                                      
SQL> CREATE OR REPLACE PROCEDURE apellido_alta
  2  AS
        -- Bienve, 5/04/2022
        -- Procedimiento para listar los apellidos y la fecha de alta en orden alfabetico por apellido
  3    v_apellido_parcial emple.apellido%type;
  4    CURSOR c1 IS
  5    SELECT apellido, fecha_alt FROM emple order by apellido;
  6    v_apellido emple.apellido%type;
  7    v_fecha_alta emple.fecha_alt%type;
  8  
  9  BEGIN
 10  
 11    OPEN c1;
 12    FETCH c1 INTO v_apellido,v_fecha_alta;
 13    WHILE c1%FOUND LOOP
 14       DBMS_OUTPUT.PUT_LINE(v_apellido||'*'||v_fecha_alta);
 15       FETCH c1 INTO v_apellido,v_fecha_alta;
 16    END LOOP;
 17    CLOSE c1;
 18  END;
 19  /

Procedure created.

SQL> execute apellido_alta
ALONSO*23/09/91                                                                                                                                       
ARROYO*20/02/90                                                                                                                                       
CEREZO*09/06/91                                                                                                                                       
FERNANDEZ*03/12/91                                                                                                                                    
GIL*09/11/91                                                                                                                                          
JIMENEZ*02/04/91                                                                                                                                      
JIMENO*03/12/91                                                                                                                                       
MARTIN*29/09/91                                                                                                                                       
MU¥OZ*23/01/92                                                                                                                                        
NEGRO*01/05/91                                                                                                                                        
REY*17/11/91                                                                                                                                          
SALA*22/02/91                                                                                                                                         
SANCHEZ*17/12/90                                                                                                                                      
TOVAR*08/09/91                                                                                                                                        

PL/SQL procedure successfully completed.

SQL> spool off
