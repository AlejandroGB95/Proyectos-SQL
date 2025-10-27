SQL> CREATE TABLE TIENDAS (
  2  NIF VARCHAR(2),
  3  
SQL> 
SQL> CREATE TABLE TIENDAS (
  2  NIF VARCHAR(10),
  3  NOMBRE VARCHAR2(20),
  4  DIRECCION VARCHAR2(20),
  5  POBLACION VARCHAR2(20),
  6  PROVINCIA VARCHAR2(20),
  7  CODPOSTAL NUMBER(5)
  8  );
CREATE TABLE TIENDAS (
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> CREATE TABLE TIENDAS1 (
  2  NIF VARCHAR(10),
  3  NOMBRE VARCHAR2(20),
  4  DIRECCION VARCHAR2(20),
  5  POBLACION VARCHAR2(20),
  6  PROVINCIA VARCHAR2(20),
  7  CODPOSTAL NUMBER(5)
  8  );

Table created.

SQL> DROP TABLE TIENDAS;

Table dropped.

SQL> CREATE TABLE TIENDAS (
  2  NIF VARCHAR(10),
  3  NOMBRE VARCHAR2(20),
  4  DIRECCION VARCHAR2(20),
  5  POBLACION VARCHAR2(20),
  6  PROVINCIA VARCHAR2(20),
  7  CODPOSTAL NUMBER(5)
  8  );

Table created.

SQL> ALTER TABLE TIENDAS {ADD CONSTRAINT CLAVE_PR PRIMARY KEY (DNI)};
ALTER TABLE TIENDAS {ADD CONSTRAINT CLAVE_PR PRIMARY KEY (DNI)}
                    *
ERROR at line 1:
ORA-00911: invalid character 


SQL> ALTER TABLE TIENDAS ADD CONSTRAINT CLAVE_PR PRIMARY KEY (DNI);
ALTER TABLE TIENDAS ADD CONSTRAINT CLAVE_PR PRIMARY KEY (DNI)
                                                         *
ERROR at line 1:
ORA-00904: "DNI": invalid identifier 


SQL> ALTER TABLE TIENDAS ADD CONSTRAINT CLAVE_PR PRIMARY KEY (NIF);

Table altered.

SQL> ALTER TABLE TIENDAS ADD CONSTRAINT PROVINMAYUS CHECK (PROVINCIA=UPPER(PROVINCIA);
ALTER TABLE TIENDAS ADD CONSTRAINT PROVINMAYUS CHECK (PROVINCIA=UPPER(PROVINCIA)
                                                                               *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> ALTER TABLE TIENDAS ADD CONSTRAINT PROVINMAYUS CHECK (PROVINCIA=UPPER(PROVINCIA));

Table altered.

SQL> ALTER TABLE TIENDAS MODIFY NOMBRE VARCHAR2(30) NOT NULL;

Table altered.

SQL> DESC TIENDAS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NIF                                       NOT NULL VARCHAR2(10)
 NOMBRE                                    NOT NULL VARCHAR2(30)
 DIRECCION                                          VARCHAR2(20)
 POBLACION                                          VARCHAR2(20)
 PROVINCIA                                          VARCHAR2(20)
 CODPOSTAL                                          NUMBER(5)

SQL> SPOOLOFF
SP2-0042: unknown command "SPOOLOFF" - rest of line ignored.
SQL> SPOOL OF
