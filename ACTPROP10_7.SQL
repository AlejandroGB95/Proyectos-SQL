SQL> CREATE TABLE TEMP (Col1 VARCHAR2(40))
  2  ;

Table created.

SQL> DESC TEMP
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 COL1                                                                                         VARCHAR2(40)

SQL> CREATE OR REPLACE PROCEDURE prueba_savepoint (
  2  numfilas POSITIVE)
  3  AS
  4  BEGIN
  5  SAVEPOINT NINGUNA;
  6  INSERT INTO temp1 (col1) VALUES ('PRIMERA FILA');
  7  SAVEPOINT UNA;
  8  INSERT INTO temp1 (col1) VALUES ('SEGUNDA FILA');
  9  SAVEPOINT DOS;
 10  IF numfilas = 1 THEN
 11  ROLLBACK TO UNA;
 12  ELSIF numfilas = 2 THEN
 13  ROLLBACK TO DOS;
 14  ELSE
 15  ROLLBACK TO NINGUNA;
 16  END IF;
 17  COMMIT;
 18  EXCEPTION
 19  WHEN OTHERS THEN
 20  ROLLBACK;
 21  END;
 22  /

Warning: Procedure created with compilation errors.

SQL> SHOW ERRORS
Errors for PROCEDURE PRUEBA_SAVEPOINT:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
6/1      PL/SQL: SQL Statement ignored                                                                                                                
6/13     PL/SQL: ORA-00942: table or view does not exist                                                                                              
8/1      PL/SQL: SQL Statement ignored                                                                                                                
8/13     PL/SQL: ORA-00942: table or view does not exist                                                                                              
SQL> CREATE OR REPLACE PROCEDURE prueba_savepoint (
  2  numfilas POSITIVE)
  3  AS
  4  BEGIN
  5  SAVEPOINT NINGUNA;
  6  INSERT INTO temp (col1) VALUES ('PRIMERA FILA');
  7  SAVEPOINT UNA;
  8  INSERT INTO temp (col1) VALUES ('SEGUNDA FILA');
  9  SAVEPOINT DOS;
 10  IF numfilas = 1 THEN
 11  ROLLBACK TO UNA;
 12  ELSIF numfilas = 2 THEN
 13  ROLLBACK TO DOS;
 14  ELSE
 15  ROLLBACK TO NINGUNA;
 16  END IF;
 17  COMMIT;
 18  EXCEPTION
 19  WHEN OTHERS THEN
 20  ROLLBACK;
 21  END;
 22  /

Procedure created.

SQL> EXECUTE PRUEBA_SAVEPOINT (0)
BEGIN PRUEBA_SAVEPOINT (0); END;

*
ERROR at line 1:
ORA-06502: PL/SQL: numeric or value error 
ORA-06512: at line 1 


SQL> EXECUTE PRUEBA_SAVEPOINT (1)

PL/SQL procedure successfully completed.

SQL> SELECT * FROM TEMP;

COL1                                                                                                                                                  
----------------------------------------                                                                                                              
PRIMERA FILA                                                                                                                                          

SQL> EXECUTE PRUEBA_SAVEPOINT (2)

PL/SQL procedure successfully completed.

SQL> SELECT * FROM TEMP;

COL1                                                                                                                                                  
----------------------------------------                                                                                                              
PRIMERA FILA                                                                                                                                          
PRIMERA FILA                                                                                                                                          
SEGUNDA FILA                                                                                                                                          

SQL> EXECUTE PRUEBA_SAVEPOINT (3)

PL/SQL procedure successfully completed.

SQL> SELECT * FROM TEMP;

COL1                                                                                                                                                  
----------------------------------------                                                                                                              
PRIMERA FILA                                                                                                                                          
PRIMERA FILA                                                                                                                                          
SEGUNDA FILA                                                                                                                                          

SQL> SPOOL OFF
