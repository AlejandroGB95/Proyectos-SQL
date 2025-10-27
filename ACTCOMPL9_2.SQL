SQL> CREATE OR REPLACE PROCEDURE reverso_cadena (cadena VARCHAR2)
  2  AS
  3  vr_cadena cadena%TYPE;
  4  BEGIN
  5  FOR i IN REVERSER 1..LENGTH(cadena) LOOP
  6  vr_cadena := vr_cadena|| substr(cadena,i,1);
  7  END LOOP;
  8  DBMS_OUTPUT.PUT_LINE(vr_cadena);
  9  END;
 10  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE REVERSO_CADENA:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
5/19     PLS-00103: Encountered the symbol "1" when expecting one of the        
         following:                                                             
         . ( * @ % & - + / at loop mod remainder rem ..                         
         <an exponent (**)> || multiset                                         
                                                                                
SQL> CREATE OR REPLACE PROCEDURE reverso_cadena (cadena VARCHAR2)
  2  AS
  3  vr_cadena cadena%TYPE;
  4  BEGIN
  5  FOR i IN REVERSE 1..LENGTH(cadena) LOOP
  6  vr_cadena := vr_cadena|| substr(cadena,i,1);
  7  END LOOP;
  8  DBMS_OUTPUT.PUT_LINE(vr_cadena);
  9  END;
 10  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE REVERSO_CADENA:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/11     PL/SQL: Item ignored                                                   
3/11     PLS-00206: %TYPE must be applied to a variable, column, field or       
         attribute, not to "CADENA"                                             
                                                                                
6/1      PL/SQL: Statement ignored                                              
6/1      PLS-00320: the declaration of the type of this expression is           
         incomplete or malformed                                                
                                                                                
8/1      PL/SQL: Statement ignored                                              
8/22     PLS-00320: the declaration of the type of this expression is           
         incomplete or malformed                                                

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
                                                                                
SQL> CREATE OR REPLACE PROCEDURE reverso_cadena (cadena_original VARCHAR2)
  2  AS
  3  vr_cadena cadena_original%TYPE;
  4  BEGIN
  5  FOR i IN REVERSE 1..LENGTH(cadena) LOOP
  6  vr_cadena := vr_cadena|| substr(cadena_original,i,1);
  7  END LOOP;
  8  DBMS_OUTPUT.PUT_LINE(vr_cadena);
  9  END;
 10  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE REVERSO_CADENA:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/11     PL/SQL: Item ignored                                                   
3/11     PLS-00206: %TYPE must be applied to a variable, column, field or       
         attribute, not to "CADENA_ORIGINAL"                                    
                                                                                
5/1      PL/SQL: Statement ignored                                              
5/28     PLS-00201: identifier 'CADENA' must be declared                        
8/1      PL/SQL: Statement ignored                                              
8/22     PLS-00320: the declaration of the type of this expression is           
         incomplete or malformed                                                
                                                                                
SQL> CREATE OR REPLACE PROCEDURE reverso_cadena (cadena_original VARCHAR2)
  2  AS
  3  vr_cadena VARCHAR2;
  4  BEGIN
  5  FOR i IN REVERSE 1..LENGTH(cadena) LOOP
  6  vr_cadena := vr_cadena|| substr(cadena_original,i,1);
  7  END LOOP;
  8  DBMS_OUTPUT.PUT_LINE(vr_cadena);
  9  END;
 10  /

Warning: Procedure created with compilation errors.

SQL> SHOW ERRORS
Errors for PROCEDURE REVERSO_CADENA:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/11     PLS-00215: String length constraints must be in range (1 ..            
         32767)                                                                 
                                                                                
5/1      PL/SQL: Statement ignored                                              
5/28     PLS-00201: identifier 'CADENA' must be declared                        
SQL> CREATE OR REPLACE PROCEDURE reverso_cadena (cadena_original VARCHAR2)
  2  AS
  3  vr_cadena VARCHAR2;
  4  BEGIN
  5  FOR i IN REVERSE 1..LENGTH(cadena_original) LOOP
  6  vr_cadena := vr_cadena|| substr(cadena_original,i,1);
  7  END LOOP;
  8  DBMS_OUTPUT.PUT_LINE(vr_cadena);
  9  END;
 10  /

Warning: Procedure created with compilation errors.

SQL> show errors
Errors for PROCEDURE REVERSO_CADENA:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/11     PLS-00215: String length constraints must be in range (1 ..            
         32767)                                                                 
                                                                                
SQL> execute reverso_cadena('hola')
BEGIN reverso_cadena('hola'); END;

      *
ERROR at line 1:
ORA-06550: line 1, column 7: 
PLS-00905: object DATOS.REVERSO_CADENA is invalid 
ORA-06550: line 1, column 7: 
PL/SQL: Statement ignored 


SQL> spool off
