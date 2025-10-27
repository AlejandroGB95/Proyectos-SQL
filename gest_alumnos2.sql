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
 11              select dni INTO V_DNI from alumnos where dni=dni_alum;
 12              RAISE insertar_nuevo_alumno.dni_repetido;
 13          EXCEPTION
 14          WHEN NO_DATA_FOUND THEN
 15                 NULL;
 16          END;
 17  
 18          INSERT INTO ALUMNOS VALUES (DNI_ALUM, NOMBRE, DIREC, POBLACION,TELEFONO);
 19  
 20  EXCEPTION
 21         WHEN dni_repetido THEN
 22             DBMS_OUTPUT.PUT_LINE('ERROR, El dni ya existe');
 23   END insertar_nuevo_alumno;
 24  /****************************************************************************************/
 25  PROCEDURE modificar_poblacion (DNI_ALUM ALUMNOS.DNI%TYPE,POBLACION_NUEVA ALUMNOS.POBLA%TYPE)
 26  AS
 27       BEGIN
 28           UPDATE alumnos SET POBLA = POBLACION_NUEVA WHERE DNI=DNI_ALUM;
 29  END modificar_poblacion;
 30  /****************************************************************************************/
 31  PROCEDURE borrar_alumno(DNI_ALUM ALUMNOS.DNI%TYPE)
 32  AS
 33      BEGIN
 34           DELETE FROM ALUMNOS WHERE DNI= DNI_ALUM;
 35  END borrar_alumno;
 36  /****************************************************************************************/
 37  PROCEDURE visualizar_datos_alumno (DNI_ALUM ALUMNOS.DNI%TYPE)
 38  AS
 39      vr_ALUM ALUMNOS%ROWTYPE;
 40    BEGIN
 41        SELECT * INTO vr_alum FROM ALUMNOS WHERE DNI=DNI_ALUM;
 42        DBMS_OUTPUT.PUT_LINE ('DNI: '||vr_alum.dni);
 43        DBMS_OUTPUT.PUT_LINE ('APELLIDOS Y NOMBRE: '||vr_alum.apenom);
 44        DBMS_OUTPUT.PUT_LINE ('DIRECCI‡N: '||vr_alum.direc);
 45        DBMS_OUTPUT.PUT_LINE ('POBLACI‡N '||vr_alum.pobla);
 46        DBMS_OUTPUT.PUT_LINE ('TELEFONO '||vr_alum.telef);
 47    EXCEPTION
 48       WHEN NO_DATA_FOUND THEN
 49          DBMS_OUTPUT.PUT_LINE('ERROR, NO EXISTE EL ALUMNO CON DNI '||DNI_ALUM);
 50  END visualizar_datos_alumno;
 51  /****************************************************************************************/
 52  PROCEDURE visualizar_notas_alumno (DNI_alum ALUMNOS.DNI%TYPE)
 53    AS
 54      CURSOR c1 is select * from notas where dni=dni_alum;
 55    BEGIN
 56      FOR vr_al in c1 loop
 57         DBMS_OUTPUT.PUT_LINE ('COD_ASIG: '|| vr_al.cod ||' NOTA: '||VR_AL.NOTA);
 58      end loop;
 59  
 60  END visualizar_notas_alumno;
 61  /****************************************************************************************/
 62  PROCEDURE modificar_nota_alumno (
 63  dni_alum notas.dni%TYPE,
 64  cod_asig notas.cod%TYPE,
 65  nota_nueva notas.nota%TYPE)
 66  as
 67     v_ALUM notas%ROWTYPE;
 68  
 69  begin
 70     select dni,COD into v_ALUM from notas where dni=dni_alum AND cod=cod_asig;
 71     update notas set nota=nota_nueva where dni=dni_alum and cod=cod_asig;
 72  exception
 73     when no_data_found then
 74         RAISE_APPLICATION_ERROR(-20000, 'ERROR, NO HAY DATOS');
 75  end modificar_nota_alumno;
 76  /****************************************************************************************/
 77  PROCEDURE listar_alumnos
 78  as
 79     CURSOR C1 IS select alumnos.apenom, alumnos.dni,asignaturas.nombre,notas.nota from alumnos,asignaturas,notas where asignaturas.cod=notas.cod and alumnos.dni=notas.dni order by alumnos.apenom;
 80     VR_ALUM C1%ROWTYPE;
 81     V_DNI NOTAS.DNI%TYPE;
 82  begin
 83    OPEN c1;
 84    LOOP
 85      FETCH C1 INTO VR_ALUM;
 86        IF c1%ROWCOUNT = 1 THEN
 87           V_DNI := VR_ALUM.DNI;
 88        END IF;
 89  
 90        IF V_DNI <> VR_ALUM.DNI OR c1%NOTFOUND THEN
 91          DBMS_OUTPUT.PUT_LINE('ASIGNATURAS');
 92          DBMS_OUTPUT.PUT_LINE(VR_ALUM.NOMBRE||' NOTA:'||VR_ALUM.NOTA);
 93          V_DNI := VR_ALUM.DNI;
 94        END IF;
 95       EXIT WHEN C1%NOTFOUND;
 96       DBMS_OUTPUT.PUT_LINE(vr_alum.dni);
 97          DBMS_OUTPUT.PUT_LINE(vr_alum.apenom);
 98    END LOOP;
 99    CLOSE C1;
100  END listar_alumnos;
101  END gest_alumnos;
102  /

Warning: Package Body created with compilation errors.

SQL> spool off;
