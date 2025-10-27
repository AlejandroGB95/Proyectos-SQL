SQL> desc asignaturas
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 COD                                                                                 NOT NULL NUMBER(2)
 NOMBRE                                                                                       VARCHAR2(25)

SQL> desc notas
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 DNI                                                                                 NOT NULL VARCHAR2(10)
 COD                                                                                 NOT NULL NUMBER(2)
 NOTA                                                                                         NUMBER(2)

SQL> desc alumnos
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 DNI                                                                                 NOT NULL VARCHAR2(10)
 APENOM                                                                                       VARCHAR2(30)
 DIREC                                                                                        VARCHAR2(30)
 POBLA                                                                                        VARCHAR2(15)
 TELEF                                                                                        VARCHAR2(10)
                                                                                                                         



SQL> select apenom from alumnos where exists (select dni from notas where notas.dni=alumnos.dni and cod=1);

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Alcalde Garc¡a, Elena                                                                                                                                 

SQL> select apenom from alumnos where dni in (select dni from notas where cod=1);

APENOM                                                                                                                                                
------------------------------                                                                                                                        
Alcalde Garc¡a, Elena                                                                                                                                 

SQL> spool off
