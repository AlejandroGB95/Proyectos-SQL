SQL> DESC INCIDENCIAS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUM_INC                                   NOT NULL NUMBER(6)
 DIA                                                NUMBER(2)
 MES                                                NUMBER(2)
 HORA                                               NUMBER(1)
 DNI_PROF                                           VARCHAR2(10)
 COD_GRUPO                                          VARCHAR2(15)
 ZONA                                               NUMBER(1)
 AULA                                               NUMBER(2)
 ORDENADOR_NUM                                      NUMBER(2)
 COD_FALLO                                          NUMBER(2)
 GRAVE                                              VARCHAR2(1)

SQL> DESC DATOSPROFES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNIPROF                                   NOT NULL VARCHAR2(10)
 DIRECCION                                          VARCHAR2(30)
 TELEFONO                                           VARCHAR2(9)
 ESTADOCIVIL                                        CHAR(1)
 SUELDO                                             NUMBER(5,2)

SQL> SELECT * FROM INCIDENCIAS WHERE DNI_PROF IN (SELECT DNIPROF FROM DATOSPROFES WHERE ESTADOCIVIL='C');

no rows selected

SQL> SELECT * FROM DATOSPROFES;

no rows selected

SQL> INSERT INTO DATOSPROFES
  2  SELECT DNI,'CALLE SEVILLA','667666555','D',100 FROM PROFES WHERE DNI =
  3  (SELECT DNI FROM PROFES WHERE DNI='24398202-B');

1 row created.

SQL> INSERT INTO DATOSPROFES
  2  SELECT DNI,'CALLE MALAGA','667668555','C',900 FROM PROFES WHERE DNI =
  3  (SELECT DNI FROM PROFES WHERE DNI='25123890-A');

1 row created.

SQL> INSERT INTO DATOSPROFES
  2  SELECT DNI,'CALLE RONDA','667668556','S',800 FROM PROFES WHERE DNI =
  3  (SELECT DNI FROM PROFES WHERE DNI='25345890-C');

1 row created.

SQL> INSERT INTO DATOSPROFES
  2  SELECT DNI,'CALLE GRANADA','667668576','V',700 FROM PROFES WHERE DNI =
  3  (SELECT DNI FROM PROFES WHERE DNI='12367890-A');

1 row created.

SQL> INSERT INTO DATOSPROFES
  2  SELECT DNI,'CALLE JAEN','667648656','C',500 FROM PROFES WHERE DNI =
  3  (SELECT DNI FROM PROFES WHERE DNI='55267890-A');

1 row created.

SQL>  SELECT * FROM INCIDENCIAS WHERE DNI_PROF IN (SELECT DNIPROF FROM DATOSPROFES WHERE ESTADOCIVIL='C');

   NUM_INC        DIA        MES       HORA DNI_PROF   COD_GRUPO                
---------- ---------- ---------- ---------- ---------- ---------------          
      ZONA       AULA ORDENADOR_NUM  COD_FALLO G                                
---------- ---------- ------------- ---------- -                                
         3          8          6          2 25123890-A 1ESOC                    
         1          3             4          6 S                                
                                                                                
         8         14          6          3 25123890-A 1ESOA                    
         1          1             6          1 S                                
                                                                                
        12         16          6          6 25123890-A 1ESOB                    
         1          3             2          1 S                                
                                                                                

SQL> SET LINEZISE 150
SP2-0158: unknown SET option "LINEZISE"
SQL> SET LINESIZE 150
SQL> SET PAGESIZE 150
SQL> SPOOL OFF
