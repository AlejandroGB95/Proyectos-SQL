SQL> DESC PROFES
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 DNI                                                                                 NOT NULL VARCHAR2(10)
 APELLIDOS                                                                                    VARCHAR2(30)
 NOMBRE                                                                                       VARCHAR2(20)
 FECHAN                                                                                       DATE
 ESPECIALIDAD                                                                                 VARCHAR2(40)

SQL> DESC DATOSPROFES
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 DNIPROF                                                                             NOT NULL VARCHAR2(10)
 DIRECCION                                                                                    VARCHAR2(30)
 TELEFONO                                                                                     VARCHAR2(9)
 ESTADOCIVIL                                                                                  CHAR(1)
 SUELDO                                                                                       NUMBER(5,2)

SQL> DESC RESERVAS
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 DIA                                                                                 NOT NULL NUMBER(2)
 MES                                                                                 NOT NULL NUMBER(2)
 HORA                                                                                NOT NULL NUMBER(1)
 CODAULA                                                                             NOT NULL NUMBER(4)
 CODGRUPO                                                                                     VARCHAR2(15)
 DNIPROF                                                                                      VARCHAR2(10)

SQL> SELECT NOMBRE,APELLIDOS,TELEFONO FROM PROFES,DATOSPROFES WHERE PROFES.DNI=DATOSPROFES.DNIPRO(+) AND DNI IN
  2  (SELECT DNIPROF FROM RESERVAS GROUP BY DNIPROF HAVING COUNT(DNIPROV) IN (
  3  SELECT MIN(COUNT(DNIPROF)) FROM RESERVAR GROUP BY DNIPROF));
SELECT NOMBRE,APELLIDOS,TELEFONO FROM PROFES,DATOSPROFES WHERE PROFES.DNI=DATOSPROFES.DNIPRO(+) AND DNI IN
                                                                          *
ERROR at line 1:
ORA-00904: "DATOSPROFES"."DNIPRO": invalid identifier 


SQL> SELECT NOMBRE,APELLIDOS,TELEFONO FROM PROFES,DATOSPROFES WHERE PROFES.DNI=DATOSPROFES.DNIPROF(+) AND DNI IN
  2  (SELECT DNIPROF FROM RESERVAS GROUP BY DNIPROF HAVING COUNT(DNIPROF) IN (
  3  SELECT MIN(COUNT(DNIPROF)) FROM RESERVAR GROUP BY DNIPROF));
SELECT MIN(COUNT(DNIPROF)) FROM RESERVAR GROUP BY DNIPROF))
                                *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> SELECT NOMBRE,APELLIDOS,TELEFONO FROM PROFES,DATOSPROFES WHERE PROFES.DNI=DATOSPROFES.DNIPROF(+) AND DNI IN
  2  (SELECT DNIPROF FROM RESERVAS GROUP BY DNIPROF HAVING COUNT(DNIPROF) IN (
  3  SELECT MIN(COUNT(DNIPROF)) FROM RESERVAS GROUP BY DNIPROF));

NOMBRE               APELLIDOS                      TELEFONO                                                                                          
-------------------- ------------------------------ ---------                                                                                         
ANA                  CORDOBA MENA                                                                                                                     
EDUARDO              ARROYO LARA                                                                                                                      
LUISA                SOTO LOPEZ                     667648656                                                                                         

SQL> SPOOL OFF
