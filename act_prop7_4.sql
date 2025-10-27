SQL> CREATE TABLE EJEMPLO2 (
  2  DNI VARCHAR2(10) NOT NULL,
  3  NOMBRE VARCHAR2(30) DEFAULT 'No definido',
  4  USUARIO VARCHAR2(30) DEFAULT UID);

Table created.

SQL> INSERT INTO EJEMPLO2 (DNI) VALUES ('22333444B');

1 row created.

SQL> select * from ejemplo2;

DNI        NOMBRE                         USUARIO                                                                                                     
---------- ------------------------------ ------------------------------                                                                              
22333444B  No definido                    50                                                                                                          

SQL> spool off
