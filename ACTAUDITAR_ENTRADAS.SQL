SQL> 
SQL> 
SQL> create table control_entradas (usuario VARCHAR2 (40), FECHA TIMESTAMP);

Table created.

SQL> CREATE OR REPLACE TRIGGER AUDITAR_ENTRADAS
AFTER LOGON
ON DATABASE
  -- Bienve, 2 Mayo
  -- Un trigger para llevar un control de las entradas, con el nombre de usuario y la fecha y hora.
BEGIN
    INSERT INTO CONTROL_ENTRADAS VALUES (ORA_LOGIN_USER, SYSTIMESTAMP)
END;
 /

Warning: Trigger created with compilation errors.

SQL> SHOW ERRORS
Errors for TRIGGER AUDITAR_ENTRADAS:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
2/5      PL/SQL: SQL Statement ignored                                                                                                                
2/72     PL/SQL: ORA-00933: SQL command not properly ended                                                                                            
3/4      PLS-00103: Encountered the symbol "end-of-file" when expecting                                                                               
         one of the following:                                                                                                                        
         ( begin case declare end exception exit for goto if loop mod                                                                                 
         null pragma raise return select update while with                                                                                            
         <an identifier> <a double-quoted delimited-identifier>                                                                                       
         <a bind variable> << continue close current delete fetch lock                                                                                
         insert open rollback savepoint set sql execute commit forall                                                                                 
         merge pipe purge                                                                                                                             
                                                                                                                                                      
SQL> CREATE OR REPLACE TRIGGER AUDITAR_ENTRADAS
AFTER LOGON
ON DATABASE
 BEGIN
    INSERT INTO CONTROL_ENTRADAS VALUES (ORA_LOGIN_USER, SYSTIMESTAMP);
END;
/

Trigger created.

SQL> SELECT * FROM CONTROL_ENTRADAS;

no rows selected

SQL> SPOOL OFF
          
SEGUNDA ENTRADA
          
          SQL> CONN datos/datos
Connected.
SQL> select * from control_entradas;

USUARIO
----------------------------------------
FECHA
---------------------------------------------------------------------------
DATOS
02/05/22 20:36:42,282000


SQL>create table control_entradas (usuario VARCHAR2 (40), FECHA TIMESTAMP);

Table created.

SQL> CREATE OR REPLACE TRIGGER AUDITAR_ENTRADAS
 AFTER LOGON
 ON DATABASE
 BEGIN
    INSERT INTO CONTROL_ENTRADAS VALUES (ORA_LOGIN_USER, SYSTIMESTAMP);
END;
/

Trigger created.

SQL>
          
