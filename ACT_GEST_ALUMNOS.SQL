SQL> DESC ASIGNATURAS
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 COD                                                                                 NOT NULL NUMBER(2)
 NOMBRE                                                                                       VARCHAR2(25)

SQL> ALTER TABLE ASIGNATURAS
  2  ADD CONSTRAINT C_PRIMARIA_ASIG PRIMARY KEY(COD),
  3  ADD CONSTRAINT NOMBRE_UNICO UNIQUE(NOMBRE)
  4  ALTER TABLE NOTAS
  5  ADD CONSTRAINT C_P_NOTASDNI PRIMARY KEY (DNI),
  6  ADD CONSTRAINT C_P_NOTASASIG PRIMARY KEY (COD),
  7  ADD CONSTRAINT C_AJENA_AL FOREIGN KEY (DNI) REFERENCES  ALUMNOS,
  8  ADD CONSTRAINT C_AJENA_ASIG FOREIGN KEY (COD) REFERENCES  ASIGNATURAS
  9  ;
ADD CONSTRAINT C_PRIMARIA_ASIG PRIMARY KEY(COD),
                                               *
ERROR at line 2:
ORA-01735: invalid ALTER TABLE option 


SQL> ALTER TABLE ASIGNATURAS
  2  ADD CONSTRAINT C_PRIMARIA_ASIG PRIMARY KEY(COD)
  3  ADD CONSTRAINT NOMBRE_UNICO UNIQUE(NOMBRE)
  4  ALTER TABLE NOTAS
  5  ADD CONSTRAINT C_P_NOTASDNI PRIMARY KEY (DNI)
  6  ADD CONSTRAINT C_P_NOTASASIG PRIMARY KEY (COD)
  7  ADD CONSTRAINT C_AJENA_AL FOREIGN KEY (DNI) REFERENCES  ALUMNOS
  8  ADD CONSTRAINT C_AJENA_ASIG FOREIGN KEY (COD) REFERENCES  ASIGNATURAS
  9  ;
ALTER TABLE NOTAS
*
ERROR at line 4:
ORA-01735: invalid ALTER TABLE option 


SQL> ALTER TABLE ASIGNATURAS
  2  ADD CONSTRAINT C_PRIMARIA_ASIG PRIMARY KEY(COD)
  3  ADD CONSTRAINT NOMBRE_UNICO UNIQUE(NOMBRE)
  4  ;

Table altered.

SQL> ALTER TABLE NOTAS
  2  ADD CONSTRAINT C_P_NOTASDNI PRIMARY KEY (DNI)
  3  ADD CONSTRAINT C_P_NOTASASIG PRIMARY KEY (COD)
  4  ADD CONSTRAINT C_AJENA_AL FOREIGN KEY (DNI) REFERENCES  ALUMNOS
  5  ADD CONSTRAINT C_AJENA_ASIG FOREIGN KEY (COD) REFERENCES  ASIGNATURAS
  6  ;
ADD CONSTRAINT C_P_NOTASASIG PRIMARY KEY (COD)
                             *
ERROR at line 3:
ORA-02260: table can have only one primary key 


SQL> ALTER TABLE NOTAS
  2  ADD CONSTRAINT C_P_NOTASDNI PRIMARY KEY (DNI,COD)
  3  ADD CONSTRAINT C_AJENA_AL FOREIGN KEY (DNI) REFERENCES  ALUMNOS
  4  ADD CONSTRAINT C_AJENA_ASIG FOREIGN KEY (COD) REFERENCES  ASIGNATURAS
  5  ;

Table altered.

SQL> CREATE OR REPLACE PACKAGE gest_alumnos
  2  AS
  3  
  4     PROCEDURE insertar_nuevo_alumno(DNI_ALUM ALUMNOS.DNI%TYPE, NOMBRE ALUMNOS.APENOM%TYPE, DIREC ALUMNOS.DIREC%TYPE, POBLACION ALUMNOS.POBLA%TYPE, TELEFONO ALUMNOS.TELEF%TYPE);
  5     PROCEDURE modificar_poblacion (DNI_ALUM  ALUMNOS.DNI%TYPE,POBLACION_NUEVA ALUMNOS.POBLA%TYPE);
  6     PROCEDURE borrar_alumno(DNI_ALUM  ALUMNOS.DNI%TYPE);
  7     PROCEDURE visualizar_datos_alumno (DNI_ALUM  ALUMNOS.DNI%TYPE);
  8     PROCEDURE visualizar_notas_alumno (DNI_ALUM  ALUMNOS.DNI%TYPE);
  9  END gest_alumnos;
 10  /

Package created.

SQL> CREATE OR REPLACE PACKAGE BODY gest_alumnos
  2  AS
  3  /****************************************************************************************/
  4  PROCEDURE insertar_nuevo_alumno(DNI_ALUM ALUMNOS.DNI%TYPE, NOMBRE ALUMNOS.APENOM%TYPE, DIREC ALUMNOS.DIREC%TYPE, POBLACION ALUMNOS.POBLA%TYPE, TELEFONO ALUMNOS.TELEF%TYPE)
  5  AS
  6           v_dni ALUMNOS.DNI%TYPE;
  7  BEGIN
  8          select dni INTO V_DNI from alumnos where dni=dni_alum;
  9          DBMS_OUTPUT.PUT_LINE('El dni ya existe');
 10  EXCEPTION
 11         WHEN NO_DATA_FOUND THEN
 12            INSERT INTO ALUMNOS VALUES (DNI, NOMBRE, DIREC, POBLACION,TELEFONO);
 13  END insertar_nuevo_alumno;
 14  /****************************************************************************************/
 15  PROCEDURE modificar_poblacion (DNI_ALUM ALUMNOS.DNI%TYPE,POBLACION_NUEVA ALUMNOS.POBLA%TYPE)
 16  AS
 17       BEGIN
 18           UPDATE alumnos SET POBLA = POBLACION_NUEVA WHERE DNI=DNI_ALUM;
 19  END modificar_poblacion;
 20  /****************************************************************************************/
 21  PROCEDURE borrar_alumno(DNI_ALUM ALUMNOS.DNI%TYPE)
 22  AS
 23      BEGIN
 24           DELETE FROM ALUMNOS WHERE DNI= DNI_ALUM;
 25  END borrar_alumno;
 26  /****************************************************************************************/
 27  PROCEDURE visualizar_datos_alumno (DNI_ALUM ALUMNOS.DNI%TYPE)
 28  AS
 29      vr_ALUM ALUMNOS%ROWTYPE;
 30    BEGIN
 31        SELECT * INTO vr_alum FROM ALUMNOS WHERE DNI=DNI_ALUM;
 32        DBMS_OUTPUT.PUT_LINE ('DNI: '||vr_alum.dni);
 33        DBMS_OUTPUT.PUT_LINE ('APELLIDOS Y NOMBRE: '||vr_alum.apenom);
 34        DBMS_OUTPUT.PUT_LINE ('DIRECCIàN: '||vr_alum.direc);
 35        DBMS_OUTPUT.PUT_LINE ('POBLACIàN '||vr_alum.pobla);
 36        DBMS_OUTPUT.PUT_LINE ('TELEFONO '||vr_alum.telef);
 37    EXCEPTION
 38       WHEN NO_DATA_FOUND THEN
 39          DBMS_OUTPUT.PUT_LINE('ERROR, NO EXISTE EL ALUMNO CON DNI '||DNI_ALUM);
 40  END visualizar_datos_alumno;
 41  /****************************************************************************************/
 42  PROCEDURE visualizar_notas_alumno (DNI_alum ALUMNOS.DNI%TYPE)
 43    AS
 44      CURSOR c1 is select * from notas where dni=dni_alum;
 45    BEGIN
 46      FOR vr_al in c1 loop
 47         DBMS_OUTPUT.PUT_LINE ('COD_ASIG: '|| vr_al.cod ||' NOTA: '||VR_AL.NOTA);
 48      end loop;
 49  
 50  END visualizar_notas_alumno;
 51  /****************************************************************************************/
 52  
 53  
 54  END gest_alumnos;
 55  /

Warning: Package Body created with compilation errors.

SQL> SHOW ERRORS
Errors for PACKAGE BODY GEST_ALUMNOS:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
12/11    PL/SQL: SQL Statement ignored                                                                                                                
12/39    PL/SQL: ORA-00984: column not allowed here                                                                                                   
SQL> CREATE OR REPLACE PACKAGE BODY gest_alumnos
  2  AS
  3  /****************************************************************************************/
  4  PROCEDURE insertar_nuevo_alumno(DNI_ALUM ALUMNOS.DNI%TYPE, NOMBRE ALUMNOS.APENOM%TYPE, DIREC ALUMNOS.DIREC%TYPE, POBLACION ALUMNOS.POBLA%TYPE, TELEFONO ALUMNOS.TELEF%TYPE)
  5  AS
  6           v_dni ALUMNOS.DNI%TYPE;
  7           dni_repetido EXCEPTION;
  8  BEGIN
  9          DECLARE
 10          BEGIN
 11      select dni INTO V_DNI from alumnos where dni=dni_alum;
 12              RAISE insertar_nuevo_alumno.dni_repetido;
 13          EXCEPTION
 14          WHEN NO_DATA_FOUND THEN
 15                 NULL;
 16          END;
 17          INSERT INTO ALUMNOS VALUES (DNI, NOMBRE, DIREC, POBLACION,TELEFONO);
 18  
 19  EXCEPTION
 20         WHEN dni_repetido THEN
 21             DBMS_OUTPUT.PUT_LINE('ERROR, El dni ya existe');
 22   END insertar_nuevo_alumno;
 23  /****************************************************************************************/
 24  PROCEDURE modificar_poblacion (DNI_ALUM ALUMNOS.DNI%TYPE,POBLACION_NUEVA ALUMNOS.POBLA%TYPE)
 25  AS
 26       BEGIN
 27           UPDATE alumnos SET POBLA = POBLACION_NUEVA WHERE DNI=DNI_ALUM;
 28  END modificar_poblacion;
 29  /****************************************************************************************/
 30  PROCEDURE borrar_alumno(DNI_ALUM ALUMNOS.DNI%TYPE)
 31  AS
 32      BEGIN
 33           DELETE FROM ALUMNOS WHERE DNI= DNI_ALUM;
 34  END borrar_alumno;
 35  /****************************************************************************************/
 36  PROCEDURE visualizar_datos_alumno (DNI_ALUM ALUMNOS.DNI%TYPE)
 37  AS
 38      vr_ALUM ALUMNOS%ROWTYPE;
 39    BEGIN
 40        SELECT * INTO vr_alum FROM ALUMNOS WHERE DNI=DNI_ALUM;
 41        DBMS_OUTPUT.PUT_LINE ('DNI: '||vr_alum.dni);
 42        DBMS_OUTPUT.PUT_LINE ('APELLIDOS Y NOMBRE: '||vr_alum.apenom);
 43        DBMS_OUTPUT.PUT_LINE ('DIRECCIàN: '||vr_alum.direc);
 44        DBMS_OUTPUT.PUT_LINE ('POBLACIàN '||vr_alum.pobla);
 45        DBMS_OUTPUT.PUT_LINE ('TELEFONO '||vr_alum.telef);
 46    EXCEPTION
 47       WHEN NO_DATA_FOUND THEN
 48          DBMS_OUTPUT.PUT_LINE('ERROR, NO EXISTE EL ALUMNO CON DNI '||DNI_ALUM);
 49  END visualizar_datos_alumno;
 50  /****************************************************************************************/
 51  PROCEDURE visualizar_notas_alumno (DNI_alum ALUMNOS.DNI%TYPE)
 52    AS
 53      CURSOR c1 is select * from notas where dni=dni_alum;
 54    BEGIN
 55      FOR vr_al in c1 loop
 56         DBMS_OUTPUT.PUT_LINE ('COD_ASIG: '|| vr_al.cod ||' NOTA: '||VR_AL.NOTA);
 57      end loop;
 58  
 59  END visualizar_notas_alumno;
 60  /****************************************************************************************/
 61  
 62  
 63  END gest_alumnos;
 64  /

Warning: Package Body created with compilation errors.

SQL> show errors
Errors for PACKAGE BODY GEST_ALUMNOS:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
17/9     PL/SQL: SQL Statement ignored                                                                                                                
17/37    PL/SQL: ORA-00984: column not allowed here                                                                                                   
SQL> CREATE OR REPLACE PACKAGE BODY gest_alumnos
  2  AS
  3  /****************************************************************************************/
  4  PROCEDURE insertar_nuevo_alumno(DNI_ALUM ALUMNOS.DNI%TYPE, NOMBRE ALUMNOS.APENOM%TYPE, DIREC ALUMNOS.DIREC%TYPE, POBLACION ALUMNOS.POBLA%TYPE, TELEFONO ALUMNOS.TELEF%TYPE)
  5  AS
  6           v_dni ALUMNOS.DNI%TYPE;
  7           dni_repetido EXCEPTION;
  8  BEGIN
  9          DECLARE
 10          BEGIN
 11      select dni INTO V_DNI from alumnos where dni=dni_alum;
 12              RAISE insertar_nuevo_alumno.dni_repetido;
 13          EXCEPTION
 14          WHEN NO_DATA_FOUND THEN
 15                 NULL;
 16          END;
 17          INSERT INTO ALUMNOS VALUES (DNI_ALUM, NOMBRE, DIREC, POBLACION,TELEFONO);
 18  
 19  EXCEPTION
 20         WHEN dni_repetido THEN
 21             DBMS_OUTPUT.PUT_LINE('ERROR, El dni ya existe');
 22   END insertar_nuevo_alumno;
 23  /****************************************************************************************/
 24  PROCEDURE modificar_poblacion (DNI_ALUM ALUMNOS.DNI%TYPE,POBLACION_NUEVA ALUMNOS.POBLA%TYPE)
 25  AS
 26       BEGIN
 27           UPDATE alumnos SET POBLA = POBLACION_NUEVA WHERE DNI=DNI_ALUM;
 28  END modificar_poblacion;
 29  /****************************************************************************************/
 30  PROCEDURE borrar_alumno(DNI_ALUM ALUMNOS.DNI%TYPE)
 31  AS
 32      BEGIN
 33           DELETE FROM ALUMNOS WHERE DNI= DNI_ALUM;
 34  END borrar_alumno;
 35  /****************************************************************************************/
 36  PROCEDURE visualizar_datos_alumno (DNI_ALUM ALUMNOS.DNI%TYPE)
 37  AS
 38      vr_ALUM ALUMNOS%ROWTYPE;
 39    BEGIN
 40        SELECT * INTO vr_alum FROM ALUMNOS WHERE DNI=DNI_ALUM;
 41        DBMS_OUTPUT.PUT_LINE ('DNI: '||vr_alum.dni);
 42        DBMS_OUTPUT.PUT_LINE ('APELLIDOS Y NOMBRE: '||vr_alum.apenom);
 43        DBMS_OUTPUT.PUT_LINE ('DIRECCIàN: '||vr_alum.direc);
 44        DBMS_OUTPUT.PUT_LINE ('POBLACIàN '||vr_alum.pobla);
 45        DBMS_OUTPUT.PUT_LINE ('TELEFONO '||vr_alum.telef);
 46    EXCEPTION
 47       WHEN NO_DATA_FOUND THEN
 48          DBMS_OUTPUT.PUT_LINE('ERROR, NO EXISTE EL ALUMNO CON DNI '||DNI_ALUM);
 49  END visualizar_datos_alumno;
 50  /****************************************************************************************/
 51  PROCEDURE visualizar_notas_alumno (DNI_alum ALUMNOS.DNI%TYPE)
 52    AS
 53      CURSOR c1 is select * from notas where dni=dni_alum;
 54    BEGIN
 55      FOR vr_al in c1 loop
 56         DBMS_OUTPUT.PUT_LINE ('COD_ASIG: '|| vr_al.cod ||' NOTA: '||VR_AL.NOTA);
 57      end loop;
 58  
 59  END visualizar_notas_alumno;
 60  /****************************************************************************************/
 61  
 62  
 63  END gest_alumnos;
 64  /

Package body created.

SQL> SELECT * FROM ALUMNOS;

DNI        APENOM                         DIREC                          POBLA           TELEF                                                        
---------- ------------------------------ ------------------------------ --------------- ----------                                                   
12344345   Alcalde Garc¡a, Elena          C/Las Matas, 24                Madrid          917766545                                                    
4448242    Cerrato Vela, Luis             C/Mina 28 - 3A                 Madrid          916566545                                                    
56882942   D¡az Fern ndez, Mar¡a          C/Luis Vives 25                M¢stoles        915577545                                                    

SQL> EXECUTE gest_alumnos.insertar_nuevo_alumno('2444444', 'Mart¡n Jim‚nez,Fernando', 'Real, 28', 'M laga', '987654273');

PL/SQL procedure successfully completed.

SQL> SELECT * FROM ALUMNOS;

DNI        APENOM                         DIREC                          POBLA           TELEF                                                        
---------- ------------------------------ ------------------------------ --------------- ----------                                                   
12344345   Alcalde Garc¡a, Elena          C/Las Matas, 24                Madrid          917766545                                                    
4448242    Cerrato Vela, Luis             C/Mina 28 - 3A                 Madrid          916566545                                                    
56882942   D¡az Fern ndez, Mar¡a          C/Luis Vives 25                M¢stoles        915577545                                                    
2444444    Mart¡n Jim‚nez,Fernando        Real, 28                       M laga          987654273                                                    

SQL> EXECUTE gest_alumnos.modificar_poblacion ('2444444','Ronda');

PL/SQL procedure successfully completed.

SQL> SELECT * FROM ALUMNOS;

DNI        APENOM                         DIREC                          POBLA           TELEF                                                        
---------- ------------------------------ ------------------------------ --------------- ----------                                                   
12344345   Alcalde Garc¡a, Elena          C/Las Matas, 24                Madrid          917766545                                                    
4448242    Cerrato Vela, Luis             C/Mina 28 - 3A                 Madrid          916566545                                                    
56882942   D¡az Fern ndez, Mar¡a          C/Luis Vives 25                M¢stoles        915577545                                                    
2444444    Mart¡n Jim‚nez,Fernando        Real, 28                       Ronda           987654273                                                    

SQL> EXECUTE gest_alumnos.visualizar_datos_alumno('2444444');
DNI: 2444444                                                                                                                                          
APELLIDOS Y NOMBRE: Mart¡n Jim‚nez,Fernando                                                                                                           
DIRECCIàN: Real, 28                                                                                                                                   
POBLACIàN Ronda                                                                                                                                       
TELEFONO 987654273                                                                                                                                    

PL/SQL procedure successfully completed.

SQL> EXECUTE gest_alumnos.visualizar_notas_alumno('4448242');
COD_ASIG: 4 NOTA: 6                                                                                                                                   
COD_ASIG: 5 NOTA: 8                                                                                                                                   
COD_ASIG: 6 NOTA: 4                                                                                                                                   
COD_ASIG: 7 NOTA: 5                                                                                                                                   

PL/SQL procedure successfully completed.

SQL> SELECT * FROM NOTAS;

DNI               COD       NOTA                                                                                                                      
---------- ---------- ----------                                                                                                                      
12344345            1          6                                                                                                                      
12344345            2          5                                                                                                                      
12344345            3          6                                                                                                                      
4448242             4          6                                                                                                                      
4448242             5          8                                                                                                                      
4448242             6          4                                                                                                                      
4448242             7          5                                                                                                                      
56882942            4          8                                                                                                                      
56882942            5          7                                                                                                                      
56882942            6          8                                                                                                                      
56882942            7          9                                                                                                                      

11 rows selected.

SQL> EXECUTE gest_alumnos.borrar_alumno ('2444444');

PL/SQL procedure successfully completed.

SQL> SELECT * FROM ALUMNOS;

DNI        APENOM                         DIREC                          POBLA           TELEF                                                        
---------- ------------------------------ ------------------------------ --------------- ----------                                                   
12344345   Alcalde Garc¡a, Elena          C/Las Matas, 24                Madrid          917766545                                                    
4448242    Cerrato Vela, Luis             C/Mina 28 - 3A                 Madrid          916566545                                                    
56882942   D¡az Fern ndez, Mar¡a          C/Luis Vives 25                M¢stoles        915577545                                                    

SQL> EXECUTE gest_alumnos.insertar_nuevo_alumno('4448242', 'Martín Jiménez,Fernando', 'Real, 28', 'Málaga', '987654273');
ERROR, El dni ya existe

PL/SQL procedure successfully completed.



SQL> SPOOL OFF


