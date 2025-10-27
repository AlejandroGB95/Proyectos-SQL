SQL> CREATE OR REPLACE PACKAGE gest_depart
  2  AS
  3    TYPE t_reg_depart is RECORD
  4    (num_depart depart.dept_no%TYPE,
  5     nombre_depart depart.dnombre%TYPE,
  6     localidad depart.loc%TYPE);
  7  
  8     PROCEDURE insertar_nuevo_depart(v_nombre depart.dnombre%TYPE, v_loc depart.loc%TYPE);
  9     PROCEDURE borrar_depart (v_dept_borrar depart.dept_no%TYPE, v_dept_destino depart.dept_no%TYPE);
 10     PROCEDURE modificar_loc_depart(v_loc_cambiar depart.loc%TYPE,v_num_dept depart.dept_no%TYPE);
 11     PROCEDURE visualizar_datos_depart (v_dept depart.dept_no%TYPE);
 12     PROCEDURE visualizar_datos_depart (v_nombre depart.dnombre%TYPE);
 13  END gest_depart;
 14  /

Package created.

SQL> 
SQL> 
SQL> CREATE OR REPLACE PACKAGE BODY gest_depart AS
  2  -- Funcion privada para buscar departamento por nombre
  3  FUNCTION buscar_depart_por_nombre
  4  (v_nom_dep VARCHAR2)
  5  RETURN NUMBER;
  6  
  7  
  8  PROCEDURE insertar_nuevo_depart(
  9      v_nombre depart.dnombre%TYPE,
 10      v_loc depart.loc%TYPE)
 11  AS
 12     ultimo_dept depart.dept_no%TYPE;
 13     nombre_repetido EXCEPTION;
 14  BEGIN
 15  
 16      DECLARE
 17           nom_dep depart.DNOMBRE%TYPE;
 18           nombre_repetido EXCEPTION;
 19      BEGIN
 20           SELECT dnombre INTO nom_dep FROM depart
 21           WHERE dnombre = v_nombre;
 22           RAISE nombre_repetido;
 23      EXCEPTION
 24           WHEN NO_DATA_FOUND THEN
 25              NULL;
 26      END;
 27  
 28      SELECT MAX(DEPT_NO) INTO ultimo_dept FROM DEPART;
 29         INSERT INTO DEPART VALUES ((ultimo_dept +10), v_nombre, v_loc);
 30  EXCEPTION
 31        WHEN nombre_repetido THEN
 32          DBMS_OUTPUT.PUT_LINE
 33             ('Error, el nombre del departamento ya existe');
 34        WHEN NO_DATA_FOUND THEN
 35             INSERT INTO DEPART VALUES (10, v_nombre, v_loc);
 36   END insert_nuevo_depart;
 37  
 38  
 39  PROCEDURE borrar_depart
 40      (v_dept_borrar depart.dept_no%TYPE,
 41       v_dept_destino depart.dept_no%TYPE)
 42  AS
 43  BEGIN
 44      UPDATE emple SET dept_no = v_dept_destino
 45      WHERE DEPT_NO=v_dept_borrar;
 46      DELETE FROM depart WHERE dept_no = v_dept_borrar;
 47  END borrar_depart;
 48  
 49  PROCEDURE modificar_loc_depart(
 50        v_loc_cambiar depart.loc%TYPE,
 51        v_num_dept depart.dept_no%TYPE)
 52  AS
 53  BEGIN
 54      UPDATE depart SET LOC=v_loc_cambiar
 55      WHERE dept_no=v_num_dept;
 56  EXCEPTION
 57      WHEN NO_DATA_FOUND THEN
 58            DBMS_OUTPUT.PUT_LINE('Err departamento no encontrado');
 59  END modificar_loc_depart;
 60  
 61  
 62  
 63  PROCEDURE visualizar_datos_depart
 64  (v_dept depart.dept_no%TYPE)
 65  AS
 66      vr_dep depart%ROWTYPE;
 67      v_num_empleados NUMBER(4);
 68  BEGIN
 69      SELECT * INTO vr_dep FROM depart
 70       WHERE DEPT_NO=v_dept;
 71      SELECT COUNT(*) INTO v_num_empleados FROM
 72       EMPLE WHERE DEPT_NO=v_dept;
 73      DBMS_OUTPUT.PUT_LINE ('N£mero de departamento: '||vr_dep.dept_no);
 74      DBMS_OUTPUT.PUT_LINE ('Nombre del departamento: '||vr_dep.dnombre);
 75      DBMS_OUTPUT.PUT_LINE ('Localidad : '||vr_dep.loc);
 76      DBMS_OUTPUT.PUT_LINE ('Numero de empleados : '||v_num_empleados);
 77  EXCEPTION
 78      WHEN NO_DATA_FOUND THEN
 79           DBMS_OUTPUT.PUT_LINE('Error, el departamento no existe');
 80  END visualizar_datos_depart;
 81  
 82  PROCEDURE visualizar_datos_depart
 83  (v_nombre depart.dnombre%TYPE)
 84  AS
 85     v_num_dept depart.dept_no%TYPE;
 86     vr_dep depart%ROWTYPE;
 87     v_num_empleados NUMBER(4);
 88  BEGIN
 89      v_num_dept:=buscar_depart_por_nombre(v_nombre);
 90      SELECT * INTO vr_dep FROM depart
 91      WHERE dept_no=v_num_dept;
 92      SELECT COUNT(*) INTO v_num_empleados FROM EMPLE
 93      WHERE dept_no=v_num_dept;
 94      DBMS_OUTPUT.PUT_LINE ('N£mero de departamento: '||vr_dep.dept_no);
 95      DBMS_OUTPUT.PUT_LINE ('Nombre del departamento: '||vr_dep.dnombre);
 96      DBMS_OUTPUT.PUT_LINE ('Localidad : '||vr_dep.loc);
 97      DBMS_OUTPUT.PUT_LINE ('Numero de empleados : '||v_num_empleados);
 98  EXCEPTION
 99     WHEN NO_DATA_FOUND THEN
100          DBMS_OUTPUT.PUT_LINE('Error, el departamento no existe');
101  END visualizar_datos_depart;
102  
103  FUNCTION buscar_depart_por_nombre
104  (v_nom_dep depart.dnombre%TYPE)
105  RETURN NUMBER
106  AS
107     v_num_dep depart.dept_no%TYPE;
108  BEGIN
109     SELECT dept_no INTO v_num_dep FROM depart
110     WHERE DNOMBRE = v_nom_dep;
111   RETURN v_num_dep;
112  EXCEPTION
113      WHEN NO_DATA_FOUND THEN
114          DBMS_OUTPUT.PUT_LINE('Error,  el departamento no existe');
115  END buscar_depart_por_nombre;
116  END;
117  /

Warning: Package Body created with compilation errors.

SQL> show errors
Errors for PACKAGE BODY GEST_DEPART:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
3/10     PLS-00328: A subprogram body must be defined for the forward                                                                                 
         declaration of BUSCAR_DEPART_POR_NOMBRE.                                                                                                     
                                                                                                                                                      
8/14     PLS-00323: subprogram or cursor 'INSERTAR_NUEVO_DEPART' is                                                                                   
         declared in a package specification and must be defined in the                                                                               
         package body                                                                                                                                 
                                                                                                                                                      
SQL> spool off
