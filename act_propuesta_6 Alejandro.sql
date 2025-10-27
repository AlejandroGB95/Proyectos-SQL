SQL> desc alumnos
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNI                                       NOT NULL VARCHAR2(10)
 APENOM                                             VARCHAR2(30)
 DIREC                                              VARCHAR2(30)
 POBLA                                              VARCHAR2(15)
 TELEF                                              VARCHAR2(10)

SQL> desc asignaturas
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COD                                       NOT NULL NUMBER(2)
 NOMBRE                                             VARCHAR2(25)

SQL> desc notas
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNI                                       NOT NULL VARCHAR2(10)
 COD                                       NOT NULL NUMBER(2)
 NOTA                                               NUMBER(2)

SQL> select apenom from alumnos, asignaturas, notas where
  2  alumnos.dni=notas.dni and notas.cod=asignaturas.cod and nombre='FOL' and nota between 7 and 8;

APENOM                                                                          
------------------------------                                                  
D¡az Fern ndez, Mar¡a                                                           

SQL> select apenom, nombre, nota from alumnos, asignaturas, notas where
  2  alumnos.dni=notas.dni and notas.cod=asignaturas.cod and nombre='FOL';

APENOM                         NOMBRE                          NOTA             
------------------------------ ------------------------- ----------             
Cerrato Vela, Luis             FOL                                6             
D¡az Fern ndez, Mar¡a          FOL                                8             



SQL> select nombre from asignaturas, notas where notas.cod=asignaturas.cod and nota<5;

NOMBRE                                                                          
-------------------------                                                       
Entornos Gr ficos                                                               



SQL> select distinct nombre from asignaturas, notas where notas.cod=asignaturas.cod and nombre not in
  2  (select nombre from asignaturas, notas where notas.cod=asignaturas.cod and nota<5);

NOMBRE                                                                          
-------------------------                                                       
Prog. Leng. Estr.                                                               
Aplic. Entornos 4¦Gen                                                           
FOL                                                                             
An lisis                                                                        
Sist. Inform ticos                                                              
RET                                                                             

6 rows selected.

SQL> spool off
